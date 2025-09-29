# sscript compiler
# should be made more object orientedy


import re

class compiler:
    def get_temp_var(self):
        temp_var_name = "temp"+str(self.temp_var_num)
        self.temp_var_num += 1
        return temp_var_name


    def reset_temp_var(self):
        self.temp_var_num = 0


    def add_sub_instruction(self, arg1, arg2, arg3):
        self.code.append([5,arg1,arg2,arg3])


    def add_div_instruction(self, arg1, arg2, arg3):
        self.code.append([6,arg1,arg2,arg3])


    def add_add_instruction(self, arg1, arg2, arg3):
        temp_var_name = self.get_temp_var()
        
        self.add_sub_instruction(temp_var_name, self.const_lookup[0], arg3)
        self.add_sub_instruction(arg1, arg2, temp_var_name)


    def add_mul_instruction(self, arg1, arg2, arg3):
        temp_var_name = self.get_temp_var()
        
        self.add_div_instruction(temp_var_name, self.const_lookup[1], arg3)
        self.add_div_instruction(arg1, arg2, temp_var_name)


    def float_check(self, cur_num):
        rounded_num = round(cur_num, self.precision_limit)
        if rounded_num != cur_num:
            print("ASSEMBLER WARNING: float",cur_num,"will be rounded to",rounded_num,"due to the precision limit of",self.precision_limit)
        
        
    def compile(self, text, precision_limit=3):
        self.text = text
        self.code = []
        self.precision_limit = precision_limit
        script_markers = {}
        instruction_dividers = ",#()[]-/+*=>{}~≡"
        instruction_tokens = ",#()[]-/+*=>{}~≡"

        
        
        self.text = self.text.replace(" ","").replace("\t","")
        self.text = self.text.replace("==","≡") # tokens must be 1 value long, using ≡ prevents confusion with ==

        self.text = self.text.split("\n")

        for i in range(len(self.text)-1,-1,-1):
            if self.text[i].find("--") != -1:
                self.text[i] = self.text[i][:self.text[i].find("--")]
            
            if self.text[i] == "":
                self.text.pop(i)

        for i in range(len(self.text)-1,-1,-1):
            if self.text[i][-1] == "$":
                self.text[i] = self.text[i][:-1] + self.text[i+1]
                self.text.pop(i+1)

        tags = 0
        for i in self.text:
            if "::" in i:
                tags += 1

        
        for i in range(tags):
            self.code.append([])

        self.const_lookup = {}
        for i in range(-1,10+1):
            cr = "const"+str(i).replace("-","_")
            self.const_lookup[i] = cr
            self.code.append([1,cr,i])
            
        self.code.append([0])
        
        
        cur_tag = 0
        for i in range(len(self.text)):
            cur_text = self.text[i]
            if "::" in cur_text: # function lable
                cur_name = cur_text.replace("::","")
                self.code[cur_tag]=[1,cur_name,len(self.code)+1]
                cur_tag += 1
                script_markers[cur_name] = len(self.code)+1
                
            elif ":" in cur_text: # lable
                cur_name = cur_text.replace(":","")
                script_markers[cur_name] = len(self.code)+1
                
            else:
                if "exit" in cur_text: # exit
                    self.code.append([0])
                else: # all else
                    multi_command = []
                    cur = ""
                    last = ""
                    for i in cur_text:
                        if i in instruction_dividers or (cur in instruction_dividers and not (cur == "-" and (len(multi_command) == 0 or multi_command[-1] in "=/*+,{(>"))):
                            if cur != "":
                                multi_command.append(cur)
                            cur = ""
                        cur += i
                    multi_command.append(cur)

                    for i in range(len(multi_command)):
                        cur_token = multi_command[i]
                        if '"' in cur_token:
                            token_type = "S"
                        elif cur_token in instruction_dividers:
                            token_type = cur_token
                        else:                        
                            try:
                                int(cur_token)
                                token_type = "N"
                            except:
                                try:
                                    float(cur_token)
                                    token_type = "F"
                                except:
                                    token_type = "v"
                        
                        multi_command[i] = [token_type,cur_token]

                    processing = True
                    self.reset_temp_var()
                    while processing:
                        token_string = ""
                        for i in multi_command:
                            token_string += i[0]

                        #print(token_string)#,"\t",[i[1] for i in multi_command]

                        if token_string == "v=N":
                            processing = False
                            self.code.append([1,multi_command[0][1],int(multi_command[2][1])])

                        elif token_string == "v=F":
                            processing = False
                            new_num = float(multi_command[2][1])
                            self.float_check(new_num)
                            self.code.append([1,multi_command[0][1],new_num])

                        elif token_string == "v=S":
                            processing = False
                            self.code.append([1,multi_command[0][1],multi_command[2][1].replace('"',"")])

                        elif token_string == "v[v]=v":
                            processing = False
                            self.code.append([2,multi_command[0][1],multi_command[2][1],multi_command[5][1]])

                        elif token_string == "v=v[v]":
                            processing = False
                            self.code.append([3,multi_command[0][1],multi_command[2][1],multi_command[4][1]])

                        elif token_string == "v={}":
                            processing = False
                            self.code.append([4,multi_command[0][1]])

                        elif token_string == "v=v-v":
                            processing = False
                            self.add_sub_instruction(multi_command[0][1],multi_command[2][1],multi_command[4][1])

                        elif token_string == "v=v/v":
                            processing = False
                            self.add_div_instruction(multi_command[0][1],multi_command[2][1],multi_command[4][1])
                        
                        elif token_string == "v=v(v)":
                            processing = False
                            self.code.append([7,multi_command[0][1],multi_command[2][1],multi_command[4][1]])

                        elif token_string == "v=#v":
                            processing = False
                            self.code.append([8,multi_command[0][1],multi_command[3][1]])

                        elif token_string == "v~v":
                            processing = False
                            self.code.append([9,multi_command[0][1],multi_command[2][1]])

                        elif token_string == "v=v>v":
                            processing = False
                            self.code.append([10,multi_command[0][1],multi_command[2][1],multi_command[4][1]])

                        elif token_string == "v=v≡v":
                            processing = False
                            self.code.append([11,multi_command[0][1],multi_command[2][1],multi_command[4][1]])

                        elif token_string == "v=v+v":
                            processing = False
                            self.add_add_instruction(multi_command[0][1],multi_command[2][1],multi_command[4][1])

                        elif token_string == "v=v*v":
                            processing = False
                            self.add_mul_instruction(multi_command[0][1],multi_command[2][1],multi_command[4][1])

                        else:
                            if "=" in token_string:
                                left_side = token_string[:token_string.find("=")]
                                right_side_offset = token_string.find("=")+1
                                right_side = token_string[right_side_offset:]

                                assert  len(right_side)>0, "Invalid command "+cur_text+"\n"+"Got processed to "+token_string
                        
                                if len(right_side) > 1 or right_side[0] != "v":
                                    cur_side = right_side
                                    cur_offset = right_side_offset
                                else:
                                    cur_side = left_side
                                    cur_offset = 0

                            else: # jump statement
                                cur_side = token_string[:token_string.find("~")]
                                cur_offset = 0


                            array_check = re.search(r'{(v,|\[v\]=v,)*(v|\[v\]=v)?}', cur_side)

                            if array_check:
                                index1 = array_check.start() + cur_offset
                                index2 = array_check.end() + cur_offset
                                

                                if token_string[index1:index2] == right_side and left_side == "v":
                                    temp_array_name = multi_command[0][1]
                                    processing = False
                                else:
                                    temp_array_name = self.get_temp_var()

                                self.code.append([4,temp_array_name])
                                array_index = 1
                                temp_var_name = self.get_temp_var()
                                index = index1+1
                                while index < index2:
                                    #print(token_string[index:index+5] )
                                    if token_string[index:index+5] == "[v]=v":
                                        temp_num_name = multi_command[index+1][1]
                                        self.code.append([2,temp_array_name, temp_num_name, multi_command[index+4][1]])
                                        index += 6
                                    else:
                                        if array_index in self.const_lookup:
                                            temp_num_name = self.const_lookup[array_index]
                                        else:
                                            self.code.append([1,temp_var_name,array_index])
                                            temp_num_name = temp_var_name

                                        self.code.append([2,temp_array_name, temp_num_name, multi_command[index][1]])
                                        index += 2
                                        array_index += 1
                                        
                                    

                                multi_command[index1][0] = "v"
                                multi_command[index1][1] = temp_array_name
                                for i in range(index2-1,index1,-1):
                                    multi_command.pop(i)
                            
                            elif "v(v)" in cur_side:
                                index = cur_side.find("v(v)")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([7,temp_var_name,multi_command[index][1],multi_command[index+2][1]])
                                
                                multi_command.pop(index+3)
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name
                            
                            elif "(v)" in cur_side:
                                index = cur_side.find("(v)")+cur_offset
                                multi_command.pop(index+2)
                                multi_command.pop(index)

                            elif "N" in cur_side:
                                index = cur_side.find("N")+cur_offset
                                
                                if int(multi_command[index][1]) in self.const_lookup: # use a constant if possible
                                    multi_command[index][0] = "v"
                                    multi_command[index][1] = self.const_lookup[int(multi_command[index][1])]
                                
                                else:
                                    temp_var_name = self.get_temp_var()

                                    self.code.append([1,temp_var_name,int(multi_command[index][1])])

                                    multi_command[index][0] = "v"
                                    multi_command[index][1] = temp_var_name

                            elif "F" in cur_side:
                                index = cur_side.find("F")+cur_offset
                                temp_var_name = self.get_temp_var()

                                new_num = float(multi_command[index][1])
                                self.float_check(new_num)

                                self.code.append([1,temp_var_name,new_num])

                                multi_command[index][0] = "v"
                                multi_command[index][1] = temp_var_name

                            elif "S" in cur_side:
                                index = cur_side.find("S")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([1,temp_var_name,multi_command[index][1].replace('"',"")])

                                multi_command[index][0] = "v"
                                multi_command[index][1] = temp_var_name
                            
                            elif "v[v]" in cur_side:
                                index = cur_side.find("v[v]")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([3,temp_var_name,multi_command[index][1],multi_command[index+2][1]])
                                
                                multi_command.pop(index+3)
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "#v" in cur_side:
                                index = cur_side.find("#v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([8,temp_var_name,multi_command[index+1][1]])

                                multi_command[index+1][1] = temp_var_name
                                multi_command.pop(index)

                            elif "v/v" in cur_side:
                                index = cur_side.find("v/v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.add_div_instruction(temp_var_name,multi_command[index][1],multi_command[index+2][1])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "v*v" in cur_side:
                                index = cur_side.find("v*v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.add_mul_instruction(temp_var_name,multi_command[index][1],multi_command[index+2][1])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "v-v" in cur_side:
                                index = cur_side.find("v-v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.add_sub_instruction(temp_var_name,multi_command[index][1],multi_command[index+2][1])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "v+v" in cur_side:
                                index = cur_side.find("v+v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.add_add_instruction(temp_var_name,multi_command[index][1],multi_command[index+2][1])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "v>v" in cur_side:
                                index = cur_side.find("v>v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([10,temp_var_name,multi_command[index][1],multi_command[index+2][1]])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name

                            elif "v≡v" in cur_side:
                                index = cur_side.find("v≡v")+cur_offset
                                temp_var_name = self.get_temp_var()

                                self.code.append([11,temp_var_name,multi_command[index][1],multi_command[index+2][1]])
                                
                                multi_command.pop(index+2)
                                multi_command.pop(index+1)
                                multi_command[index][1] = temp_var_name
                            
                            else:
                                assert multi_command==None, "Invalid command "+cur_text+"\n"+"Got processed to "+token_string


        for i in self.code:
            if i[0] == 9:
                i[2] = script_markers[i[2]]-1

        
        return self.code, script_markers


if __name__ == '__main__':
    file = open("script.txt")
    text = file.read()
    file.close()

    code_compiler = compiler()

    code, script_markers = code_compiler.compile(text)
    
    [print(i) for i in code]
    print(len(code),"instructions")
