-- Simulates the Stormworks environment
-- Currently made to use lua 5.4 because I can't figure out how to use 5.3 with MoonGL


local gl = require("moongl")
local glfw = require("moonglfw")
local mi = require("moonimage")

local SCR_SCALE = 4
local SCR_WIDTH, SCR_HEIGHT = 288*SCR_SCALE, 160*SCR_SCALE
local SCR_WIDTH_SW = SCR_WIDTH/SCR_SCALE
local SCR_HEIGHT_SW = SCR_HEIGHT/SCR_SCALE

local vertex_shader_source1 = [[
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec4 aColor;
layout (location = 2) in vec2 aTexCoord;

out vec4 ourColor;
out vec2 TexCoord;

void main()
{
	gl_Position = vec4(aPos, 1.0);
	ourColor = aColor;
	TexCoord = vec2(aTexCoord.x, aTexCoord.y);
}
]]

local fragment_shader_source1 = [[
#version 330 core
out vec4 FragColor;

in vec4 ourColor;
in vec2 TexCoord;

// texture sampler
uniform sampler2D texture1;

void main()
{
	FragColor = texture(texture1, TexCoord) * ourColor;
	if(FragColor.a == 0.0)
        discard;
}]]



local vertex_shader_source2 = [[
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec4 aColor;
layout (location = 2) in vec2 aTexCoord;

out vec4 ourColor;
out vec2 TexCoord;

void main()
{
	gl_Position = vec4(aPos, 1.0);
	ourColor = aColor;
	TexCoord = vec2(aTexCoord.x, aTexCoord.y);
}
]]

local fragment_shader_source2 = [[
#version 330 core
out vec4 FragColor;

in vec4 ourColor;
in vec2 TexCoord;

// texture sampler
uniform sampler2D texture1;

void main()
{
	FragColor = texture(texture1, TexCoord);
	FragColor[0] = pow(FragColor[0],1.0/2.2);
	FragColor[1] = pow(FragColor[1],1.0/2.2);
	FragColor[2] = pow(FragColor[2],1.0/2.2);
	FragColor[3] = pow(FragColor[3],1.0/2.2);
	if(FragColor.a == 0.0)
        discard;
}]]



-- glfw inits and window creation ---------------------------------------------
glfw.version_hint(3, 3, 'core')
local window = glfw.create_window(SCR_WIDTH, SCR_HEIGHT, "SW External Environment")
glfw.make_context_current(window)
gl.init() -- this loads all OpenGL function pointers
glfw.set_framebuffer_size_callback(window, function (window, width, height)
    gl.viewport(0, 0, width, height)
	SCR_WIDTH = width
	SCR_HEIGHT = height
	SCR_WIDTH_SW = SCR_WIDTH/SCR_SCALE
	SCR_HEIGHT_SW = SCR_HEIGHT/SCR_SCALE
end)

local framebuffer = gl.new_framebuffer("draw read")
gl.bind_framebuffer("draw read",framebuffer)

framebufferTex = gl.new_texture("2d")
gl.texture_parameter('2d', 'wrap s', 'repeat')
gl.texture_parameter('2d', 'wrap t', 'repeat')
gl.texture_parameter('2d', 'min filter', 'nearest')
gl.texture_parameter('2d', 'mag filter', 'nearest')
gl.texture_image('2d', 0, 'rgba', 'rgba', 'ubyte', nil, SCR_WIDTH, SCR_HEIGHT)

gl.framebuffer_texture_2d("draw read",'color attachment 0','2d',framebufferTex,0)
gl.unbind_texture('2d')


-- Creating the texture:
tex_id = gl.new_texture('2d')
-- configure it:
gl.texture_parameter('2d', 'wrap s', 'repeat')
gl.texture_parameter('2d', 'wrap t', 'repeat')
gl.texture_parameter('2d', 'min filter', 'nearest')
gl.texture_parameter('2d', 'mag filter', 'nearest')
-- load the texture image using MoonImage:
image, w, h = mi.load('swtext.png', 'rgba')
gl.texture_image('2d', 0, 'rgba', 'rgba', 'ubyte', image, w, h)
fontImageWidth = w
fontImageHeight = h
image, w, h = nil, nil, nil -- let the GC collect them
-- generate the mipmap:
gl.generate_mipmap('2d')
gl.unbind_texture('2d')



-- build and compile our shader program ----------------------------------------
-- vertex shader
local vsh1 = gl.create_shader('vertex')
gl.shader_source(vsh1, vertex_shader_source1)
gl.compile_shader(vsh1)
if not gl.get_shader(vsh1, 'compile status') then
   error(gl.get_shader_info_log(vsh1))
end
-- fragment shader
local fsh1 = gl.create_shader('fragment')
gl.shader_source(fsh1, fragment_shader_source1)
gl.compile_shader(fsh1)
if not gl.get_shader(fsh1, 'compile status') then
   error(gl.get_shader_info_log(fsh1))
end
-- link shaders
local prog1 = gl.create_program()
gl.attach_shader(prog1, vsh1)
gl.attach_shader(prog1, fsh1)
gl.link_program(prog1)
-- check for linking errors
if not gl.get_program(prog1, 'link status') then
   error(gl.get_program_info_log(prog1))
end



local vsh2 = gl.create_shader('vertex')
gl.shader_source(vsh2, vertex_shader_source2)
gl.compile_shader(vsh2)
if not gl.get_shader(vsh2, 'compile status') then
   error(gl.get_shader_info_log(vsh2))
end
-- fragment shader
local fsh2 = gl.create_shader('fragment')
gl.shader_source(fsh2, fragment_shader_source2)
gl.compile_shader(fsh2)
if not gl.get_shader(fsh2, 'compile status') then
   error(gl.get_shader_info_log(fsh2))
end
-- link shaders
local prog2 = gl.create_program()
gl.attach_shader(prog2, vsh2)
gl.attach_shader(prog2, fsh2)
gl.link_program(prog2)
-- check for linking errors
if not gl.get_program(prog2, 'link status') then
   error(gl.get_program_info_log(prog2))
end






-- Using the texture in the game loop:
gl.use_program(prog1)
gl.active_texture(0) -- activate texture unit 0
gl.bind_texture('2d', tex_id)
-- Assuming our program has a sampler2D uniform named mytexture:
--gl.uniform(gl.get_uniform_location(prog1, 'mytexture'), 'int', 0)

gl.delete_shader(vsh1)
gl.delete_shader(fsh1)
gl.delete_shader(vsh2)
gl.delete_shader(fsh2)

local vertices = {
        -- positions           colors            texture coords
         0.5,  0.5, 0.0,   1.0, 1.0, 1.0, 1.0,   0.9, 0.8, -- top right
         0.5, -0.5, 0.0,   1.0, 1.0, 1.0, 1.0,   0.9, 0.9, -- bottom right
        -0.5, 0.5, 0.0,   1.0, 1.0, 1.0, 1.0,   0.8, 0.9, -- bottom left
}

local vao = gl.gen_vertex_arrays()
local vbo = gl.gen_buffers()


--gl.delete_framebuffers(framebufferTex)

--gl.unbind_framebuffer("draw read",framebuffer)



-- print(gl.check_framebuffer_status("draw read",framebuffer))

-- bind the Vertex Array Object first, then bind and set vertex buffer(s), and then
-- configure vertex attributes(s).
gl.bind_vertex_array(vao)
gl.bind_buffer('array', vbo)
gl.buffer_data('array', gl.pack('float', vertices), 'static draw')
gl.vertex_attrib_pointer(0, 3, 'float', false, 9*gl.sizeof('float'), 0)
gl.enable_vertex_attrib_array(0)
gl.vertex_attrib_pointer(1, 4, 'float', false, 9*gl.sizeof('float'), 3*gl.sizeof('float'))
gl.enable_vertex_attrib_array(1)
gl.vertex_attrib_pointer(2, 2, 'float', false, 9*gl.sizeof('float'), 7*gl.sizeof('float'))
gl.enable_vertex_attrib_array(2)
gl.unbind_buffer('array')
gl.unbind_vertex_array() 

gl.enable("blend")
--gl.blend_equation("add")
gl.blend_func("src alpha", "one minus src alpha");



function getFileText(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

SWinput = {}
function SWinput.getNumber(num)
	return sandboxesComposite[sandboxNum][1][num]
end
function SWinput.getBool(num)
	return sandboxesComposite[sandboxNum][3][num]--num==32 or keyBoolInputs[num]--or (num==31 and tick == 100)
end

SWoutput = {}
function SWoutput.setNumber(num,val)
	sandboxesComposite[sandboxNum][2][num] = val
end
function SWoutput.setBool(num,val)
	sandboxesComposite[sandboxNum][4][num] = val
end

function nilFunction()
end


SWscreen = {}
function SWscreen.getWidth()
	return SCR_WIDTH_SW
end
function SWscreen.getHeight()
	return SCR_HEIGHT_SW
end
function SWscreen.setColor(r,g,b,a)
	local r = r/255.0
	local g = g/255.0
	local b = b/255.0
	local a = (a or 255)/255.0
	vertices[4] = r
	vertices[5] = g
	vertices[6] = b
	vertices[7] = a
	vertices[13] = r
	vertices[14] = g
	vertices[15] = b
	vertices[16] = a
	vertices[22] = r
	vertices[23] = g
	vertices[24] = b
	vertices[25] = a
end
function SWscreen.drawTriangleF(x1,y1,x2,y2,x3,y3)
	local widthConvert = 2/SCR_WIDTH_SW
	local heightConvert = -2/SCR_HEIGHT_SW
	vertices[1]=x1 * widthConvert - 1
	vertices[2]=y1 * heightConvert + 1
	vertices[10]=x2 * widthConvert - 1
	vertices[11]=y2 * heightConvert + 1
	vertices[19]=x3 * widthConvert - 1
	vertices[20]=y3 * heightConvert + 1
	
	gl.bind_vertex_array(vao)
	gl.bind_buffer('array', vbo)
	gl.buffer_sub_data('array',0 , gl.pack('float', vertices), 'static draw')
	--gl.vertex_attrib_pointer(0, 3, 'float', false, 3*gl.sizeof('float'), 0)
	--gl.enable_vertex_attrib_array(0)
	gl.unbind_buffer('array')
	gl.unbind_vertex_array()


	-- draw the triangle
	gl.bind_vertex_array(vao)
	--
	gl.draw_arrays('triangles', 0, 3)
	gl.unbind_vertex_array()
end
function SWscreen.drawTriangle()
end
function SWscreen.drawRectF(x,y,w,h)
	local x2 = x+w
	local y2 = y+h
	SWscreen.drawTriangleF(x,y,x,y2,x2,y2)
	SWscreen.drawTriangleF(x,y,x2,y,x2,y2)
end

function SWscreen.drawLine(x1,y1,x2,y2)
	--SWscreen.drawTriangleF(x1,y1,x1,y1,x2,y2)
end

function SWscreen.drawText(x,y,text)
	local textBytes = {string.byte(text,1,-1)}
	
	local cx1 = x
	local cy1 = y
	local x1,x2,y1,y2
	local tx1,tx2,ty1,ty2
	
	for i = 1, #textBytes do
		local curByte = textBytes[i]
		local characterInfo = fontInfo[curByte]
		if characterInfo then
			x1 = cx1 + characterInfo.xoffset
			y1 = y + characterInfo.yoffset
			y2 = y1 + characterInfo.height
			x2 = x1 + characterInfo.width
			
			tx1 = characterInfo.x
			tx2 = tx1 + characterInfo.width
			ty1 = characterInfo.y
			ty2 = ty1 + characterInfo.height
			
			tx1 = tx1 / fontImageWidth
			tx2 = tx2 / fontImageWidth
			ty1 = ty1 / fontImageHeight
			ty2 = ty2 / fontImageHeight
			
			
			vertices[8] = tx1
			vertices[9] = ty1
			vertices[17] = tx2
			vertices[18] = ty1
			vertices[26] = tx2
			vertices[27] = ty2
			SWscreen.drawTriangleF(x1,y1,x2,y1,x2,y2)
			vertices[17] = tx1
			vertices[18] = ty2
			SWscreen.drawTriangleF(x1,y1,x1,y2,x2,y2)
			cx1 = cx1 + characterInfo.xadvance
		end
	end
	
	vertices[8] = 0.9
	vertices[9] = 0.8
	vertices[17] = 0.9
	vertices[18] = 0.9
	vertices[26] = 0.8
	vertices[27] = 0.9
end


SWproperty = {}
function SWproperty.getText(name)
	local text = getFileText("textboxes/"..name..".txt") or ""
	--print(text)
	--print(name)
	return text
end

SWasync = {}
function SWasync.httpGet()
	if not sandboxesHttpRequests[sandboxNum] then
		sandboxesHttpRequests[sandboxNum] = glfw.get_time()
	end
end


function generateEnv()
	return {
		math=math,
		string=string,
		ipairs=ipairs,
		table=table,
		input=SWinput,
		output=SWoutput,
		screen=SWscreen,
		property=SWproperty,
		async=SWasync,
		print=print,
	}
end

function createComposite(num)
	local cr = {{},{},{},{}}
	sandboxesComposite[num]=cr
	for j=1,32 do
		cr[1][j]=0
		cr[2][j]=0
		cr[3][j]=false
		cr[4][j]=false
	end
end

function createCompositeLink(num1,num2)
	sandboxesCompositeLinks[#sandboxesCompositeLinks+1] = {num1,num2}
end

function updateCompositeLinks()
	for i,link in ipairs(sandboxesCompositeLinks) do
		local source = sandboxesComposite[link[1]]
		local target = sandboxesComposite[link[2]]
		for j = 1,32 do
			target[1][j]=source[2][j]
			target[3][j]=source[4][j]
		end
	end
end

fontInfo = {}
fontInfo[32] = {x="26", y="36", width="3", height="1", xoffset="-1", yoffset="4", xadvance="5", page="0", chnl="15"}
fontInfo[33] = {x="43", y="30", width="1", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[34] = {x="9", y="36", width="3", height="2", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[35] = {x="15", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[36] = {x="20", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[37] = {x="25", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[38] = {x="30", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[39] = {x="19", y="36", width="1", height="2", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[40] = {x="28", y="30", width="2", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[41] = {x="31", y="30", width="2", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[42] = {x="50", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[43] = {x="53", y="30", width="3", height="3", xoffset="0", yoffset="1", xadvance="5", page="0", chnl="15"}
fontInfo[44] = {x="16", y="36", width="2", height="2", xoffset="0", yoffset="3", xadvance="5", page="0", chnl="15"}
fontInfo[45] = {x="30", y="36", width="3", height="1", xoffset="0", yoffset="2", xadvance="5", page="0", chnl="15"}
fontInfo[46] = {x="34", y="36", width="1", height="1", xoffset="1", yoffset="4", xadvance="5", page="0", chnl="15"}
fontInfo[47] = {x="0", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[48] = {x="20", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[49] = {x="34", y="30", width="2", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[50] = {x="30", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[51] = {x="35", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[52] = {x="40", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[53] = {x="45", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[54] = {x="0", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[55] = {x="55", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[56] = {x="0", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[57] = {x="5", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[58] = {x="61", y="30", width="1", height="3", xoffset="1", yoffset="1", xadvance="5", page="0", chnl="15"}
fontInfo[59] = {x="51", y="30", width="1", height="4", xoffset="1", yoffset="1", xadvance="5", page="0", chnl="15"}
fontInfo[60] = {x="12", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[61] = {x="57", y="30", width="3", height="3", xoffset="0", yoffset="1", xadvance="5", page="0", chnl="15"}
fontInfo[62] = {x="16", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[63] = {x="20", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[64] = {x="40", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[65] = {x="45", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[66] = {x="50", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[67] = {x="55", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[68] = {x="0", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[69] = {x="5", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[70] = {x="10", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[71] = {x="15", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[72] = {x="20", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[73] = {x="49", y="30", width="1", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[74] = {x="30", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[75] = {x="35", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[76] = {x="40", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[77] = {x="45", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[78] = {x="50", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[79] = {x="55", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[80] = {x="0", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[81] = {x="5", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[82] = {x="10", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[83] = {x="15", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[84] = {x="60", y="0", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[85] = {x="20", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[86] = {x="55", y="24", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[87] = {x="25", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[88] = {x="30", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[89] = {x="60", y="12", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[90] = {x="35", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[91] = {x="40", y="30", width="2", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[92] = {x="8", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[93] = {x="37", y="30", width="2", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[94] = {x="5", y="36", width="3", height="2", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[95] = {x="21", y="36", width="4", height="1", xoffset="0", yoffset="4", xadvance="5", page="0", chnl="15"}
fontInfo[96] = {x="13", y="36", width="2", height="2", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[97] = {x="40", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[98] = {x="45", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[99] = {x="50", y="24", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[100] = {x="5", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[101] = {x="10", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[102] = {x="35", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[103] = {x="40", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[104] = {x="45", y="0", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[105] = {x="45", y="30", width="1", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[106] = {x="0", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[107] = {x="5", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[108] = {x="10", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[109] = {x="15", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[110] = {x="25", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[111] = {x="50", y="6", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[112] = {x="10", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[113] = {x="15", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[114] = {x="20", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[115] = {x="55", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[116] = {x="4", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[117] = {x="25", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[118] = {x="59", y="24", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[119] = {x="30", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[120] = {x="35", y="12", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[121] = {x="60", y="18", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[122] = {x="25", y="18", width="4", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[123] = {x="60", y="6", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[124] = {x="47", y="30", width="1", height="5", xoffset="1", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[125] = {x="24", y="30", width="3", height="5", xoffset="0", yoffset="0", xadvance="5", page="0", chnl="15"}
fontInfo[126] = {x="0", y="36", width="4", height="2", xoffset="0", yoffset="1", xadvance="5", page="0", chnl="15"}


files = {"engine.lua"}
scriptCount = #files
sandboxes = {}
sandboxesEnv = {}
sandboxesComposite = {}
sandboxesCompositeLinks = {}
sandboxesHttpRequests = {}

for i=1,scriptCount do
	sandboxesEnv[i] = generateEnv()

	file = getFileText(files[i])

	sandboxes[i] = load(file, files[i], "bt", sandboxesEnv[i])
	
	createComposite(i)
end

--createCompositeLink(1,2)
--createCompositeLink(1,3)


--require(".example.lua")

keyNumInputsNames = {
	{"d","a"},
	{"w","s"},
	{"right","left"},
	{"up","down"},
}

keyBoolInputsNames = {"1","2","3","4","5","6",[31]="space"}

keyNumInputs = {}
keyBoolInputs = {}
desiredTickrate = 62.5
desiredTimePass = 1/desiredTickrate

for i=1,scriptCount do
	sandboxes[i]()
end
tick = 0
t1,t2=0,0
timePassed = 0
timeUsed = 0
while not glfw.window_should_close(window) do	
	t1 = glfw.get_time()
	
	-- process input
	if glfw.get_key(window, 'escape') == 'press' then
		glfw.set_window_should_close(window, true)
	end
	
	for i,v in pairs(keyNumInputsNames) do
		cr = 0
		if glfw.get_key(window, v[1]) == 'press' then
			cr = cr+1
		end
		if glfw.get_key(window, v[2]) == 'press' then
			cr = cr-1
		end
		keyNumInputs[i]=cr
	end
	
	for i,v in pairs(keyBoolInputsNames) do
		keyBoolInputs[i]=glfw.get_key(window, v) == 'press'
	end
	
	gl.use_program(prog1)
	gl.bind_texture('2d', tex_id)
	gl.bind_framebuffer("draw read",framebuffer)
	-- render
	gl.clear_color(0.0, 0.0, 0.0, 1.0)
	gl.clear('color')
	-- be sure to activate the shader before any calls to glUniform
	gl.use_program(prog1)
	-- update shader uniform
	
	
	for i,v in pairs(keyNumInputs) do
		sandboxesComposite[1][1][i]=v
	end
	
	for i,v in pairs(keyBoolInputs) do
		sandboxesComposite[1][3][i]=v
	end
	
	
	for i=1,scriptCount do
		sandboxNum = i
		if sandboxesEnv[i].onTick then
			sandboxesEnv[i].onTick()
		end
		if sandboxesEnv[i].onDraw then
			sandboxesEnv[i].onDraw()
		end
		if sandboxesHttpRequests[i] and sandboxesHttpRequests[i]+2 >= glfw.get_time() then
			sandboxesHttpRequests[i] = nil
			if sandboxesEnv[i].httpReply then
				sandboxesEnv[i].httpReply()
			end
		end
	end
	
	gl.use_program(prog2)
	gl.bind_framebuffer("draw read",0)
	gl.bind_texture('2d', framebufferTex)
	
	gl.clear_color(0.0, 0.0, 0.0, 1.0)
	
	vertices[8] = 0.0
	vertices[9] = 1.0
	vertices[17] = 1.0
	vertices[18] = 1.0
	vertices[26] = 0.0
	vertices[27] = 0.0
	
	SWscreen.drawTriangleF(0,0,SCR_WIDTH_SW,0,0,SCR_HEIGHT_SW)
	
	vertices[8] = 1.0
	vertices[9] = 0.0
	vertices[17] = 1.0
	vertices[18] = 1.0
	vertices[26] = 0.0
	vertices[27] = 0.0
	
	SWscreen.drawTriangleF(SCR_WIDTH_SW,SCR_HEIGHT_SW,SCR_WIDTH_SW,0,0,SCR_HEIGHT_SW)
	
	vertices[8] = 0.9
	vertices[9] = 0.8
	vertices[17] = 0.9
	vertices[18] = 0.9
	vertices[26] = 0.8
	vertices[27] = 0.9
	
	gl.texture_image('2d', 0, 'rgba', 'rgba', 'ubyte', nil, SCR_WIDTH, SCR_HEIGHT)
	
	sandboxesComposite[1][3][32]=true
	
	updateCompositeLinks()
	
	glfw.swap_buffers(window)
	glfw.poll_events()
	
	tick = tick+1
	t2 = glfw.get_time()
	while (glfw.get_time()-t1)<desiredTimePass do
	end
	t3 = glfw.get_time()
	timePassed = timePassed + (t3-t1)
	timeUsed = timeUsed + (t2-t1)
	if tick%100 == 0 then
		print(math.floor(1/(timePassed/100)).." tps	"..math.floor(timeUsed/timePassed*100).."% capacity "..(math.floor((timeUsed/100*1000)*10)/10).."ms per tick")
		timePassed = 0
		timeUsed = 0
	end
end

-- optional: de-allocate all resources once they've outlived their purpose:
gl.delete_vertex_arrays(vao)
gl.delete_buffers(vbo)
gl.delete_program(prog1)
