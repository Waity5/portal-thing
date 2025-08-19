from math import dist, floor as flr, ceil, sqrt
from code_compressor import compress
import time, json
from copy import deepcopy as dcopy
import os
import numpy
from stl import mesh
from plyfile import PlyData, PlyElement
from scripting.assembler import assembler
from glob import glob as glob


def sq(a):
    factor=2.2
    return tuple([round((i**factor)/(255**(factor-1))) for i in a])

if __name__ == '__main__':
    packets = []
    curmax = 8192
    precision_limit = 4

    
    file = open("scripting/assembly.txt")
    assembly_code = file.read()
    file.close()

    machine_code,script_markers = assembler().assemble(assembly_code,precision_limit=precision_limit)

    

    objects=["monkey","blender_cube","wide_cube","wider_cube","cylinder","utah_teapot","widest_cube","bowling_pin","wheel","island","islandphys1","car","hump","track1","track2","track3"]
    object_colours=[(0,255,0),(255,0,255),(255,255,255),(255,255,255),(0,0,255),(0,255,0),(255,255,255),(255,255,255),(100,100,100),"ply",(0,0,0),(255,0,0),(150,150,150),(200,200,200),(200,200,200),(200,200,200)]
    min_brightness = 0.2

    total_points = 0
    total_render_tris = 0
    
    for index in range(len(objects)):

        cur_object = objects[index]
        colour = object_colours[index]

        path = ".\\stl\\"

        max_dist = 0

        phys_mesh = mesh.Mesh.from_file(path+cur_object+"\\phys.stl")

        phys_points = list(phys_mesh.v0)+list(phys_mesh.v1)+list(phys_mesh.v2)#your_mesh.points
        phys_points = [tuple(i) for i in phys_points]
        phys_points = list(set(phys_points))

        points_phys_start = total_points+1
        for i in phys_points:
            packets.append((2,(i[0],i[2],i[1])))
            total_points += 1
            max_dist = max(max_dist, dist(i,(0,0,0)))
        points_phys_end = total_points

        if colour == "ply":
        
            point_map = {}
            point_map2 = {}
            ply_mesh = PlyData.read(path+cur_object+"\\mesh.ply")
            
            processed_points = []
            raw_points = ply_mesh.elements[0].data
            raw_tris = ply_mesh.elements[1].data

            points_mesh_start = total_points+1
            for index in range(len(raw_points)):
                point = raw_points[index]
                cr_point = (point[0], point[2], point[1])
                if not cr_point in point_map:
                    #processed_points.append(cr_point)
                    packets.append((2,cr_point))
                    total_points += 1
                    point_map[cr_point] = total_points-points_mesh_start+1
                
                point_map2[index] = point_map[cr_point]
            points_mesh_end = total_points


            tris_start = total_render_tris+1
            for tri in raw_tris:
                corner_point1 = raw_points[tri[0][0]]
                corner_point2 = raw_points[tri[0][1]]
                corner_point3 = raw_points[tri[0][2]]
                
                x1,y1,z1=corner_point1[0],corner_point1[1],corner_point1[2]
                x2,y2,z2=corner_point2[0],corner_point2[1],corner_point2[2]
                x3,y3,z3=corner_point3[0],corner_point3[1],corner_point3[2]
                normalx = ((y2-y1)*(z3-z1))-((z2-z1)*(y3-y1))
                normaly = ((z2-z1)*(x3-x1))-((x2-x1)*(z3-z1))
                normalz = ((x2-x1)*(y3-y1))-((y2-y1)*(x3-x1))
                normalDist = sqrt((normalx**2)+(normaly**2)+(normalz**2))
                
                unitNormaly = normaly/normalDist
                if normalDist == 0:
                    print((x1,y1,z1),(x2,y2,z2),(x3,y3,z3))
                shade = max((unitNormaly+1)/2,min_brightness)

                
                total_render_tris += 1
                colour = sq((int(corner_point1[3]), int(corner_point1[4]), int(corner_point1[5])))
                colour = [min(i*3*shade,255) for i in colour]
                cr_tri = (point_map2[tri[0][0]], point_map2[tri[0][2]], point_map2[tri[0][1]], colour[0], colour[1], colour[2])
                packets.append((3,cr_tri))
            tris_end = total_render_tris

            
            #print(ply_mesh.elements[0].data[0].tolist())
            #print(ply_mesh.elements[1].data[0].tolist())
            #for i in ply_mesh.elements:
            #    print(i.name)
            

            
        else:
        

            # Using an existing stl file:
            #your_mesh = mesh.Mesh.from_file(path+'monkey.stl')
            #your_mesh = mesh.Mesh.from_file(path+'buff_monkey.stl')
            #your_mesh = mesh.Mesh.from_file(path+'blender_cube.stl')
            your_mesh = mesh.Mesh.from_file(path+cur_object+"\\mesh.stl")
            

            # Or creating a new mesh (make sure not to overwrite the `mesh` import by
            # naming it `mesh`):

            # The mesh normals (calculated automatically)
            #print(your_mesh.normals)
            # The mesh vectors
            #your_mesh.v0
            your_mesh.v0, your_mesh.v1, your_mesh.v2
            # Accessing individual points (concatenation of v0, v1 and v2 in triplets)
            assert (your_mesh.points[0][0:3] == your_mesh.v0[0]).all()
            assert (your_mesh.points[0][3:6] == your_mesh.v1[0]).all()
            assert (your_mesh.points[0][6:9] == your_mesh.v2[0]).all()
            assert (your_mesh.points[1][0:3] == your_mesh.v0[1]).all()

            scale = 1

            #print(len(your_mesh.v0), "triangles")
            points = list(your_mesh.v0)+list(your_mesh.v1)+list(your_mesh.v2)#your_mesh.points
            points = [tuple(i) for i in points]
            points = list(set(points))
            
            #print(len(phys_points),"phys points")
            
            #print(points)
            #vectors = your_mesh.vectors*scale
            #print(vectors)
            #vectors = [[tuple([j[0],j[1],j[2]]) for j in i] for i in vectors]
            #print(vectors[0][0])
            #vectors_indexed = [[points.index(j)+1 for j in i] for i in vectors]
            #vectors_indexed = [[i[0:2],i[1:3],[i[2],i[0]]] for i in vectors_indexed]
            #for i in range(len(vectors_indexed)-1,-1,-1):
            #    vectors_indexed += vectors_indexed[i]
            #    vectors_indexed.pop(i)

            

            #[i.sort() for i in vectors_indexed]
            #vectors_indexed = [tuple(i) for i in vectors_indexed]

            #vectors_indexed = list(set(vectors_indexed))
            #print(vectors_indexed)

            #print(vectors)
            things = [your_mesh.v0,your_mesh.v1,your_mesh.v2]

            pnt = ""

            

            points_mesh_start = total_points+1
            for i in points:
                packets.append((2,(i[0],i[2],i[1])))
                total_points += 1
                max_dist = max(max_dist, dist(i,(0,0,0)))
            points_mesh_end = total_points

            
            #print(max_dist,"max dist")

            #pnt = ""
            #for i in vectors_indexed:
            #    pnt += (str(i[0])+"\t"+str(i[1])+"\n")
            #SetC(pnt)
            #input("hit enter to go to next thing (from vectors)")

            

            
            #print(your_mesh.v0[0])

            pnts = ["\\left[" for i in range(3)]
            length = len(things[0])
            colours = []


            for i in range(length):
                x1,x2,x3=your_mesh.v0[i][0],your_mesh.v2[i][0],your_mesh.v1[i][0]
                y1,y2,y3=your_mesh.v0[i][2],your_mesh.v2[i][2],your_mesh.v1[i][2]
                z1,z2,z3=your_mesh.v0[i][1],your_mesh.v2[i][1],your_mesh.v1[i][1]
                normalx = ((y2-y1)*(z3-z1))-((z2-z1)*(y3-y1))
                normaly = ((z2-z1)*(x3-x1))-((x2-x1)*(z3-z1))
                normalz = ((x2-x1)*(y3-y1))-((y2-y1)*(x3-x1))
                normalDist = sqrt((normalx**2)+(normaly**2)+(normalz**2))
                if cur_object == "cylinder":
                    unitNormaly = normalx/normalDist
                else:
                    unitNormaly = normaly/normalDist
                if normalDist == 0:
                    print((x1,y1,z1),(x2,y2,z2),(x3,y3,z3))
                shade = max((unitNormaly+1)/2,min_brightness)
                cur_colour = tuple([colour[i]*shade for i in range(3)])
                
                colours.append(cur_colour)

            tris_start = total_render_tris+1
            for i in range(len(your_mesh.v0)):
                cur_colour = colours[i]
                packets.append((3,(points.index(tuple(your_mesh.v0[i]))+1,
                                points.index(tuple(your_mesh.v1[i]))+1,
                                points.index(tuple(your_mesh.v2[i]))+1,
                                cur_colour[0],
                                cur_colour[1],
                                cur_colour[2],
                                )))
                total_render_tris += 1
            tris_end = total_render_tris

        packets.append((1,(
            points_mesh_start,points_mesh_end,
            tris_start,tris_end,
            points_phys_start,points_phys_end,
            max_dist,
            )))
        #print(packets[-1])

        

    obj_name = "Driving Thing"
    base_name = "base_vehicle"

    path_bits = [os.getenv('APPDATA')+"\\Stormworks\\data\\vehicles\\",".xml"]
    path_in = base_name+".xml"
    path_out = path_bits[0]+obj_name+path_bits[1]
    
    file = open(path_in)
    text = file.read()
    file.close()

    
    print()

    
    name = "engine.lua"
    file = open(name)
    code = file.read()
    file.close()
    #print(code)

    for j in range(len(objects)):
        code = code.replace('"'+objects[j]+'"',str(j+1))

    for j in script_markers:
        code = code.replace('"'+j+'"',str(script_markers[j]))

    if False:
        m_var=code[code.find("={}")-1]
        
        for j in range(0,30):
            cur=m_var+"["+str(j)+"]"
            
            if cur in code:
                print(cur,"found",code.count(cur),"times")


    simulator_code,junk,junk = compress(code,print_vars=i==-1,silent=True)

    
    file = open("simulator\engine.lua",mode="w", newline='\n')
    file.write(simulator_code)
    file.close()

    
            
    print(name)
    code, variables, replacements = compress(code,print_vars=i==-1,delete_newlines=True,lua_5_3_only_compression=True)
    print()

    for i in machine_code:
        for j in range(len(i)):
            if i[j] in variables:
                i[j] = replacements[variables.index(i[j])]
            elif i[j] in objects:
                i[j] = objects.index(i[j])+1
            elif i[j] in replacements: # there will almost always be a variable which is compressed to "a", so if you use "a" in sscript this can cause issues
                i[j] = variables[replacements.index(i[j])] # as a janky fix, this maps it in the opposite direction, so the sscript "a" will be replaced with whatever mapped to "a"


    for i in machine_code:
        #print(i)
        packets.append((5,i))
    
    find_start = """<c type="56"><object id="130" script='"""
    find_end = """'>"""

    start = text.find(find_start)
    end = text.find(find_end,start)
    if False:
        None
        print(code.split("\n")[121-1])
        

    assert start>0 and end>0, "Code insertion search terms not in base vehicle file"
    
    text = text[:start+len(find_start)]+code+text[end:]

    #packets = [(1,(1,2)), (1,(1,2)), (1,(1,2))]

    type_map = {20:"colours",21:"wall textures",22:"flat textures",23:"sprites",24:"sky textures",25:"orange"}
    parts = []
    cur=[]
    t=0
    tt=0
    t1=0
    num_packets = len(packets)
    num_packets = len(packets)
    for index in range(num_packets+1):
        if index<num_packets:
            i = packets[index]
            if i[0]==1:
                t1+=1
            #if index>2900:
            #    print(i)
        if len(cur)==0 or len(cur[0][1])!=len(i[1]) or cur[0][0]!=i[0] or index==num_packets:
            if len(cur)>0:
                out_vars = [cur[0][0],len(cur[0][1]),len(cur)]
                for j in cur:
                    for k in j[1]:
                        try:
                            assert type(k)==type(1.0) or type(k)==type(1) or type(k)==type(numpy.float32()) or type(k)==type(numpy.float64()) or type(k)==type("")
                        except:
                            print(k,type(k))
                            halt
                        #k=int(k)

                        out_vars.append(k)

                for j in out_vars:
                    if type(j) == type(""):
                        temp = j + "!"
                    else:
                        temp = str(round(j,precision_limit))
                        temp = temp[:-1]+chr(ord(temp[-1])-13)
                    
                    temp_len = len(temp)
                    if len(parts)==0 or len(parts[-1])+temp_len>curmax:
                        if len(parts)>0:
                            parts[-1]=parts[-1]
                        parts.append(temp)
                    else:
                        parts[-1] = parts[-1]+temp
                    t+=temp_len
                    
                
                if i[0]!=cur[0][0]:
                    tt+=t
                    t=0
            cur=[i]
        else:
            cur.append(i)

    print()
    print(tt//1024,"KiB total")
    #print(t1)

    sizes = [len(i) for i in parts]
    
    print(len(parts),"text boxes total")
    print("hypothetically could be",sum(sizes)/curmax,"text boxes")
    print("largest text box is",max(sizes))
    print("average text box is",sum(sizes)/len(sizes))
    
    
    #[(print(i) if (len(i)==largest) else 0) for i in packets]
    
    

    text_block= ['''<c type="58"><object id="85" n="''',
                 '''" v="''',
                 '''"><pos x="-8.25" y="''',
                 '''"/></object></c>''']
    contents = ""
    

    textbox_location = "simulator/textboxes/"
    for i in range(len(parts)):
        contents += (text_block[0]+str(i+1)+text_block[1]+parts[i]+text_block[2]+str((i+1)*0.5)+text_block[3])

        file = open(textbox_location+str(i+1)+".txt",mode="w", newline='\n')
        file.write(parts[i])
        file.close()

    
    glob_result = glob(textbox_location+"*.txt")
    glob_result = [i.replace("\\","/") for i in glob_result]
    glob_result = [i[i.rfind("/")+1:] for i in glob_result]
    for i in glob_result:
        if int(i[:i.find(".")]) > len(parts):
            os.remove(textbox_location+i)
            #print(i,len(parts))
    

    find_start1 = '''<c type="58"><object id="84" n="text block start"><pos x="-8.25"/></object></c>'''
    find_end1 = '''<c type="57">'''

    
    start1 = text.find(find_start1)
    end1 = text.find(find_end1)
    text = text[:start1+len(find_start1)]+contents+text[end1:]

    
    
    file = open(path_out,mode="w", newline='\n')
    file.write(text)
    file.close()

    print()
    print("actual file is",len(text)//1024,"KiB")
    
    
