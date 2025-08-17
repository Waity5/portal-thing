def compress(text,print_vars=False,delete_newlines=False,lua_5_3_only_compression=False,silent=False):
    text=" "+text

    exclude = ["function","return","end","getNumber","getBool","if","then","for","do","while","local",
               "else","elseif","and","or","not","in","onDraw","onDraw","onTick",
               "math","input","output","true","false","ipairs","httpReply",
               "type","table","nil",
               "screen","async","property","string","break",
               "_ENV","print",
               ]
    include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
    includeNum = "0123456789"
    point_exclude = ".:"
    operations = "+-*/%^~=()[]#{}.<>,"
    is_string = False

    variables = []
    counts = []

    if not silent:
        print("\t",len(text),"initial characters")
    
    while text.count("--")>0:
        start = text.index("--")
        end = text.index("\n",start)
        text = text[:start]+text[end:]

      
    

    text = text.replace("\t","")

    text = text.replace("0.",".")

    valid = not delete_newlines
    while not valid:
        new = text.replace("\n\n","\n")
        valid = new == text
        text = new

    valid = False
    while not valid:
        new = text.replace(" \n","\n")
        valid = new == text
        text = new

    valid = False
    while not valid:
        new = text.replace("  "," ")
        valid = new == text
        text = new

    valid = False
    while not valid:
        new = text.replace("\n ","\n")
        valid = new == text
        text = new
    
    if text[0]==" ":
        text = text[1:]
    if text[0]=="\n":
        text = text[1:]
    #print([text[:25]])  

    bad_var=""
    if text[2:5]=='=""':
        bad_var = text[0:2]
        text = text[5:]
        text = text.replace(bad_var,'""')

    if text[1:4]=='=""':
        bad_var = text[1]
        text = text[4:]
        text = text.replace(bad_var,'""')

    if bad_var != "":
        print("\t"+bad_var)
    
    
    text=" "+text
    cur=""
    valid=True
    for index in range(len(text)):
        i=text[index]
        
        
        if i in include or (i in includeNum and cur!=""):
            cur+=i
        else:
            if cur!="":
                if valid and (not cur in exclude) and (not is_string):
                    if (cur in variables):
                        counts[variables.index(cur)]+=1
                    else:
                        variables.append(cur)
                        counts.append(1)
                    
                cur=""
                valid=((not i in point_exclude) or text[index:index+2]=="..")
                

        if i == '"':
            is_string = not is_string

    #print(variables)
    variables=[(counts[i],variables[i]) for i in range(len(variables))]
    variables.sort(reverse=True)
    if print_vars:
        variables = [variables[i]+(i,) for i in range(len(variables))]
        print(variables)
    variables=[i[1] for i in variables]
    if not silent:
        print("\t",len(variables),"variables")
    replacements = []
    offset = 0

    for i in range(len(variables)):
        valid = False
        
        while not valid:
            pos = i+offset
            cur=""
            if pos>=len(include):
                cur += include[pos//len(include)-1]
            cur += include[pos%len(include)]
            if cur in exclude:
                offset += 1
            else:
                valid = True
            
        replacements.append(cur)

    #print(replacements)

    is_string = False 
    
    cur=""
    for index in range(len(text)-1,-1,-1):
        i=text[index]
        
        
        if i in include or (i in includeNum):
            cur=i+cur
        else:
            if cur!="":
                valid=((not i in point_exclude) or text[index-1:index+1]=="..")
                if valid and (not cur in exclude) and (not cur[0] in includeNum) and (not is_string):
                    text = text[:index+1] + replacements[variables.index(cur)] + text[index+len(cur)+1:]
                cur=""
                valid=True
        
        if i == '"':
            is_string = not is_string

    if lua_5_3_only_compression:
        for i in ["then","or"]:
            cur_index=0
            while text.find(" "+i,cur_index)>-1:
                cur_index = text.find(" "+i,cur_index)
                if text[cur_index-1] in includeNum:
                    text = text[:cur_index] + text[cur_index+1:]
                #print([text[cur_index-1:cur_index+10]])
                cur_index += 1
    text=text[1:]

    for index in range(len(text)-3,-1,-1):
        i=text[index:index+3]
        remove_middle = False
        
        if i[1] in [" ","\n"]:
            if i[0] in operations and (i[2] in include or i[2] in includeNum):
                remove_middle = True
                
            if (i[0] in include or i[0] in includeNum) and i[2] in operations:
                remove_middle = True

            if i[0] in operations or i[2] in operations:
                remove_middle = True

        if remove_middle:
            text = text[:index+1] + text[index+2:]


    if text[-1] == "\n":
        text = text[:-1]
    
    if not silent:
        print("\t",len(text),"end characters")

    return text, variables, replacements

if __name__ == '__main__':
    file = open("main.lua")
    text = file.read()
    file.close()

    text, variables, replacements = compress(text,delete_newlines = True)
    
    file = open("out.txt",mode="w", newline='\n')
    file.write(text)
    file.close()
