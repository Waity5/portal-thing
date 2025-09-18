# makes a stormworks vehicle & sets up the simulator

from math import dist, floor as flr, ceil, sqrt, atan2
from code_compressor import compress
import time, json
from copy import deepcopy as dcopy
import os
import json
import numpy
from stl import mesh
from plyfile import PlyData, PlyElement
from scripting.compiler import compiler
from glob import glob as glob # glob

def sq(a):
    factor=2.2
    return tuple([round((i**factor)/(255**(factor-1))) for i in a])

def process_glob_result(glob_result):
    glob_result = [i.replace("\\","/") for i in glob_result]
    glob_result = [i[i.rfind("/")+1:] for i in glob_result]
    return glob_result

def read_ply_file(path):
    file = open(path,"rb")
    ply_file = PlyData.read(file)
    file.close()
    return ply_file

def get_stl_contents(path,shading_strength = 0,to_shade = False, sorty_thing = False, colour = (255,255,255)):
    your_mesh = mesh.Mesh.from_file(path)

    max_dist = 0
    points = list(your_mesh.v0)+list(your_mesh.v1)+list(your_mesh.v2)#your_mesh.points
    points = [tuple(i) for i in points]
    points = list(set(points))

    for i in points:
        max_dist = max(max_dist, dist(i,(0,0,0)))

    if sorty_thing: #with a better way to edit meshes this wouldn't be needed
        points = [(-atan2(i[2],i[0]),i) for i in points]
        points.sort()
        points = [i[1] for i in points]
        for i in range(len(points)):
            points.append(points[i])
            points[i] = [j*0.9 for j in points[i]]
        #print(points)

    processed_points = [(i[0],i[2],i[1]) for i in points]
    
    things = [your_mesh.v0,your_mesh.v1,your_mesh.v2]


    


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
        unitNormaly = normaly/normalDist
        if normalDist == 0:
            print((x1,y1,z1),(x2,y2,z2),(x3,y3,z3))
        shade = ((unitNormaly-1)/2) * shading_strength + 1
        cur_colour = colour
        if to_shade:
            cur_colour = tuple([cur_colour[i]*shade for i in range(3)])

        cur_colour = sq(cur_colour)
        
        
        colours.append(cur_colour)

    processed_tris = []
    for i in range(len(your_mesh.v0)):
        cur_colour = colours[i]
        
        processed_tris.append((points.index(tuple(your_mesh.v0[i]))+1,
                        points.index(tuple(your_mesh.v1[i]))+1,
                        points.index(tuple(your_mesh.v2[i]))+1,
                        cur_colour[0],
                        cur_colour[1],
                        cur_colour[2],
                        ))

    return processed_points, processed_tris, max_dist

def get_ply_contents(path,shading_strength = 0,to_shade = False):
    point_map = {}
    point_map2 = {}
    ply_mesh = read_ply_file(path)

    max_dist = 0
    
    
    processed_points = []
    raw_points = ply_mesh.elements[0].data
    raw_tris = ply_mesh.elements[1].data

    
    for index in range(len(raw_points)):
        point = raw_points[index]
        cr_point = (point[0], point[2], point[1])
        if not cr_point in point_map:
            processed_points.append(cr_point)
            point_map[cr_point] = True
            max_dist = max(max_dist, dist(point,(0,0,0)))
        point_map2[index] = point_map[cr_point]


    processed_tris = []

    
    
    for tri in raw_tris:
        if type(tri[0]) != type(5) and type(tri[0]) != numpy.int32 and type(tri[0]) != numpy.int64:
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
            shade = ((unitNormaly-1)/2) * shading_strength + 1

            
            total_render_tris += 1
            colour = (int(corner_point1[3]), int(corner_point1[4]), int(corner_point1[5]))
            if to_shade:
                colour = tuple([colour[i]*shade for i in range(3)])
            cr_tri = (point_map2[tri[0][0]], point_map2[tri[0][2]], point_map2[tri[0][1]], colour[0], colour[1], colour[2])
            
    

    return processed_points, processed_tris, max_dist

def get_json_contents(path):
    json_mesh = json.load(open(path))
    points = json_mesh[0]
    triangles = json_mesh[1]

    max_dist = 0

    processed_points = []
    for i in points:
        processed_points.append((i[0],i[1],i[2]))
        max_dist = max(max_dist, dist(i,(0,0,0)))
    
    processed_tris = []
    for i in triangles:
        if len(i[1]) == 3:
            processed_tris.append((i[0][0],
                            i[0][1],
                            i[0][2],
                            i[1][0],
                            i[1][1],
                            i[1][2],
                            ))
        else:
            processed_tris.append((i[0][0],
                            i[0][1],
                            i[0][2],
                            i[1][0],
                            i[1][1],
                            i[1][2],
                            i[1][3],
                            ))
        #print(packets[-1])

    return processed_points, processed_tris, max_dist

if __name__ == '__main__':
    packets = []
    curmax = 4096 # 8192
    precision_limit = 4 # number of decimal places used for numbers in property text boxes

    
    file = open("scripting/script.txt")
    sscript_code = file.read()
    file.close()

    machine_code,script_markers = compiler().compile(sscript_code,precision_limit=precision_limit)

    

    objects = {
        "cube": {"colour": "json", "shading": False},
        "cube_large": {"colour": (255,0,255), "shading": True},
        "platform": {"colour": (255,255,255), "shading": True},
        "monkey": {"colour": (0,255,0), "shading": True},
        "utah_teapot": {"colour": (0,255,0), "shading": True},
        "skybox": {"colour": (46,132,200), "shading": False},
        "portal_orange": {"colour": (255,100,0), "shading": False},
        "portal_blue": {"colour": (0,100,255), "shading": False},
        "player_bounding": {"colour": (255,0,0), "shading": True},
        "window": {"colour": "json", "shading": False},
        }

    object_names = [*objects]
    shading_strength = 0.75

    total_points = 0
    total_render_tris = 0
    
    for object_name in objects:

        cur_object = objects[object_name]
        colour = cur_object["colour"]
        to_shade = cur_object["shading"]

        path = "./stl/"


        


            

            


        
        max_dist_phys = 0
        points_phys_starts = []
        points_phys_ends = []

        points_mesh_starts = []
        points_mesh_ends = []

        tris_starts = []
        tris_ends = []

        glob_result = glob(path+object_name+"/phys*") + glob(path+object_name+"/mesh*")
        glob_result = process_glob_result(glob_result)
        searching_for_phys_meshes = True
        searching_for_render_meshes = True
        mesh_number = 1
        while searching_for_phys_meshes or searching_for_render_meshes:
            if searching_for_render_meshes:
                do_render_mesh1 = False
                do_render_mesh1 = do_render_mesh1 or ("mesh"+str(mesh_number)+".stl" in glob_result)
                do_render_mesh1 = do_render_mesh1 or ("mesh"+str(mesh_number)+".ply" in glob_result)
                do_render_mesh1 = do_render_mesh1 or ("mesh"+str(mesh_number)+".json" in glob_result)
                if do_render_mesh1:
                    render_mesh_name = "mesh"+str(mesh_number)

                do_render_mesh2 = False
                do_render_mesh2 = do_render_mesh2 or ("mesh.stl" in glob_result and mesh_number == 1)
                do_render_mesh2 = do_render_mesh2 or ("mesh.ply" in glob_result and mesh_number == 1)
                do_render_mesh2 = do_render_mesh2 or ("mesh.json" in glob_result and mesh_number == 1)
                if do_render_mesh2:
                    render_mesh_name = "mesh"


                searching_for_render_meshes = do_render_mesh1 or do_render_mesh2
                if searching_for_render_meshes:
                    if colour == "ply":
                        cur_points, cur_tris, max_dist_render = get_ply_contents(path+object_name+"/"+render_mesh_name+".ply",shading_strength = shading_strength,to_shade = to_shade)

                    elif colour == "json":
                        cur_points, cur_tris, max_dist_render = get_json_contents(path+object_name+"/"+render_mesh_name+".json")
                        
                    else:
                        cur_points, cur_tris, max_dist_render = get_stl_contents(path+object_name+"/"+render_mesh_name+".stl",shading_strength = shading_strength,to_shade = to_shade, sorty_thing = object_name == "portal_orange" or object_name == "portal_blue", colour = colour)
                        
                    points_mesh_starts.append(total_points+1)
                    for i in cur_points:
                        total_points += 1
                        packets.append((2,i))
                    points_mesh_ends.append(total_points)

                    tris_starts.append(total_render_tris+1)
                    for i in cur_tris:
                        total_render_tris += 1
                        packets.append((3,i))
                    tris_ends.append(total_render_tris)

                    
                    
            
            
            if searching_for_phys_meshes:
                if "phys.stl" in glob_result and mesh_number == 1:
                    phys_points, cur_tris, max_dist_phys = get_stl_contents(path+object_name+"/phys.stl")
                    
                elif "phys"+str(mesh_number)+".stl" in glob_result:
                    phys_points, cur_tris, max_dist_phys = get_stl_contents(path+object_name+"/phys"+str(mesh_number)+".stl")

                elif "phys.ply" in glob_result and mesh_number == 1:
                    phys_points, cur_tris, max_dist_phys = get_ply_contents(path+object_name+"/phys.ply")

                elif "phys"+str(mesh_number)+".ply" in glob_result:
                    phys_points, cur_tris, max_dist_phys = get_ply_contents(path+object_name+"/phys"+str(mesh_number)+".ply")

                elif "phys.json" in glob_result and mesh_number == 1:
                    phys_points, cur_tris, max_dist_phys = get_json_contents(path+object_name+"/phys.json")

                elif "phys"+str(mesh_number)+".json" in glob_result:
                    phys_points, cur_tris, max_dist_phys = get_json_contents(path+object_name+"/phys"+str(mesh_number)+".json")

                else:
                    searching_for_phys_meshes = False

                if searching_for_phys_meshes:
                    points_phys_starts.append(total_points+1)
                    for i in phys_points:
                        total_points += 1
                        packets.append((2,i))

                    points_phys_ends.append(total_points)

            mesh_number += 1

        new_object_packet = (max_dist_phys,max_dist_render)

        #print(object_name,mesh_number-2)
        for i in range(mesh_number-2):
            if len(points_mesh_starts)-1<=i:
                points_mesh_starts.append(2)
                points_mesh_ends.append(1)
                tris_starts.append(2)
                tris_ends.append(1)

            if len(points_phys_starts)-1<=i:
                points_phys_starts.append(2)
                points_phys_ends.append(1)

            new_object_packet += (points_mesh_starts[i],points_mesh_ends[i],
                                  tris_starts[i],tris_ends[i],
                                  points_phys_starts[i],points_phys_ends[i])

        packets.append((1,new_object_packet))

        #print(object_name,max_dist_phys,max_dist_render)
        #print(packets[-1])

        

    obj_name = "Portal Thing"
    base_name = "base_vehicle"

    path_bits = [os.getenv('APPDATA')+"/Stormworks/data/vehicles/",".xml"]
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

    for j in range(len(object_names)):
        code = code.replace('"'+object_names[j]+'"',str(j+1))

    for j in script_markers:
        code = code.replace('"'+j+'"',str(script_markers[j]))

    if False:
        m_var=code[code.find("={}")-1]
        
        for j in range(0,30):
            cur=m_var+"["+str(j)+"]"
            
            if cur in code:
                print(cur,"found",code.count(cur),"times")


    simulator_code,junk,junk = compress(code,print_vars=False,delete_newlines=True,silent=True)

    
    file = open("simulator\engine.lua",mode="w", newline='\n')
    file.write(simulator_code)
    file.close()

    
            
    print(name)
    code, variables, replacements = compress(code,print_vars=False,delete_newlines=True,lua_5_3_only_compression=True)
    print()

    for i in machine_code:
        for j in range(len(i)):
            if i[j] in variables:
                i[j] = replacements[variables.index(i[j])]
            elif i[j] in object_names:
                i[j] = object_names.index(i[j])+1
            elif i[j] in replacements: # there will almost always be a variable which is compressed to "a", so if you use "a" in sscript this can cause issues
                i[j] = variables[replacements.index(i[j])] # as a janky fix, this maps it in the opposite direction, so the sscript "a" will be replaced with whatever mapped to "a"


    
    for i in machine_code:
        None
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

    #packets = [(1,[0,0,0,0])]

    type_map = {2:"vertexes",3:"triangles",5:"sscript"}#1:"object lookups",
    type_names = [*type_map]
    type_counts = {}
    for i in type_names:
        type_counts[i] = 0
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
                        temp = temp[:-1]+chr(ord(temp[-1])-29) #13
                    
                    temp_len = len(temp)
                    if len(parts)==0 or len(parts[-1])+temp_len>curmax:
                        if len(parts)>0:
                            parts[-1]=parts[-1]
                        parts.append(temp)
                    else:
                        parts[-1] = parts[-1]+temp
                    t+=temp_len
                    
                
                if i[0]!=cur[0][0] or index==num_packets:
                    if cur[0][0] in type_names:
                        type_counts[cur[0][0]] += t
                    tt+=t
                    t=0
            cur=[i]
        else:
            cur.append(i)

    print()
    for i in type_names:
        print(type_counts[i]//1024,"KiB of",type_map[i])
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
    glob_result = process_glob_result(glob_result)
    for i in glob_result: # delete extra text box files
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
    
    
