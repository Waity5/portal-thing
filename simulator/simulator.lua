-- Simulates the Stormworks environment
-- Currently made to use lua 5.4 because I can't figure out how to use 5.3 with MoonGL


local gl = require("moongl")
local glfw = require("moonglfw")
local mi = require("moonimage")

local SCR_WIDTH, SCR_HEIGHT = 288*4, 160*4
local SCR_SCALE = 4

local vertex_shader_source = [[
#version 330 core
layout (location = 0) in vec3 aPos;
void main() {
   gl_Position = vec4(aPos, 1.0);
}
]]

local fragment_shader_source = [[
#version 330 core
uniform vec4 ourColor;
out vec4 FragColor;
void main() {
   FragColor = ourColor;
}
]]

-- glfw inits and window creation ---------------------------------------------
glfw.version_hint(3, 3, 'core')
local window = glfw.create_window(SCR_WIDTH, SCR_HEIGHT, "SW External Environment")
glfw.make_context_current(window)
gl.init() -- this loads all OpenGL function pointers
glfw.set_framebuffer_size_callback(window, function (window, width, height)
    gl.viewport(0, 0, width, height)
	SCR_WIDTH = width
	SCR_HEIGHT = height
end)

-- Creating the texture:
tex_id = gl.new_texture('2d')
-- configure it:
gl.texture_parameter('2d', 'wrap s', 'repeat')
gl.texture_parameter('2d', 'wrap t', 'repeat')
gl.texture_parameter('2d', 'min filter', 'linear')
gl.texture_parameter('2d', 'mag filter', 'linear')
-- load the texture image using MoonImage:
image, w, h = mi.load('swtext.png', 'rgb')
gl.texture_image('2d', 0, 'rgb', 'rgb', 'ubyte', image, w, h)
image, w, h = nil, nil, nil -- let the GC collect them
-- generate the mipmap:
gl.generate_mipmap('2d')
gl.unbind_texture('2d')




-- build and compile our shader program ----------------------------------------
-- vertex shader
local vsh = gl.create_shader('vertex')
gl.shader_source(vsh, vertex_shader_source)
gl.compile_shader(vsh)
if not gl.get_shader(vsh, 'compile status') then
   error(gl.get_shader_info_log(vsh))
end
-- fragment shader
local fsh = gl.create_shader('fragment')
gl.shader_source(fsh, fragment_shader_source)
gl.compile_shader(fsh)
if not gl.get_shader(fsh, 'compile status') then
   error(gl.get_shader_info_log(fsh))
end
-- link shaders
local prog = gl.create_program()
gl.attach_shader(prog, vsh)
gl.attach_shader(prog, fsh)
gl.link_program(prog)
-- check for linking errors
if not gl.get_program(prog, 'link status') then
   error(gl.get_program_info_log(prog))
end

-- Using the texture in the game loop:
gl.use_program(prog)
gl.active_texture(0) -- activate texture unit 0
gl.bind_texture('2d', tex_id)
-- Assuming our program has a sampler2D uniform named mytexture:
--gl.uniform(gl.get_uniform_location(prog, 'mytexture'), 'int', 0)

gl.delete_shader(vsh)
gl.delete_shader(fsh)

-- set up vertex data (and buffer(s)) and configure vertex attributes ---------
local vertices = {
   0.1, -0.1, 0.0,  -- bottom right
  -0.1, -0.1, 0.0,  -- bottom left
   0.0,  0.1, 0.0   -- top 
}

local vao = gl.gen_vertex_arrays()
local vbo = gl.gen_buffers()
-- bind the Vertex Array Object first, then bind and set vertex buffer(s), and then
-- configure vertex attributes(s).
gl.bind_vertex_array(vao)
gl.bind_buffer('array', vbo)
gl.buffer_data('array', gl.pack('float', vertices), 'static draw')
gl.vertex_attrib_pointer(0, 3, 'float', false, 3*gl.sizeof('float'), 0)
gl.enable_vertex_attrib_array(0)
gl.unbind_buffer('array')
gl.unbind_vertex_array() 





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

lastCol = {0,0,0,0}

SWscreen = {}
function SWscreen.getWidth()
	return SCR_WIDTH/SCR_SCALE
end
function SWscreen.getHeight()
	return SCR_HEIGHT/SCR_SCALE
end
function SWscreen.setColor(r,g,b,a)
	lastCol = {r,g,b,a or 255}
	local colorCorrection = 1/2.2
	local r = (r/255.0)^colorCorrection
	local g = (g/255.0)^colorCorrection
	local b = (b/255.0)^colorCorrection
	local a = ((a or 255)/255.0)^colorCorrection
	local loc = gl.get_uniform_location(prog, "ourColor")
	gl.uniform(loc, 'float', r, g, b, a)
end
function SWscreen.drawTriangleF(x1,y1,x2,y2,x3,y3)
	local widthConvert = 2/SCR_WIDTH*SCR_SCALE
	local heightConvert = -2/SCR_HEIGHT*SCR_SCALE
	if lastCol[4]>100 then
		vertices[1]=x1 * widthConvert - 1
		vertices[2]=y1 * heightConvert + 1
		vertices[4]=x2 * widthConvert - 1
		vertices[5]=y2 * heightConvert + 1
		vertices[7]=x3 * widthConvert - 1
		vertices[8]=y3 * heightConvert + 1
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
	
	local y1 = y
	local y2 = y+5
	
	for i = 1, #textBytes do
		local curByte = textBytes[i]
		local x1 = (i-1)*5
		local x2 = x1+4
		
		SWscreen.drawTriangleF(x1,y1,x2,y1,x2,y2)
		SWscreen.drawTriangleF(x1,y1,x2,y2,x1,y2)
	end
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
	

	-- render
	gl.clear_color(0.0, 0.0, 0.0, 1.0)
	gl.clear('color')
	-- be sure to activate the shader before any calls to glUniform
	gl.use_program(prog)
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
		print(math.floor(1/(timePassed/100)).." tps	"..math.floor(timeUsed/timePassed*100).."% capacity")
		timePassed = 0
		timeUsed = 0
	end
end

-- optional: de-allocate all resources once they've outlived their purpose:
gl.delete_vertex_arrays(vao)
gl.delete_buffers(vbo)
gl.delete_program(prog)
