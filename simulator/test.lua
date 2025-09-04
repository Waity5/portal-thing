-- Simulates the Stormworks environment
-- Currently made to use lua 5.4 because I can't figure out how to use 5.3 with MoonGL


local gl = require("moongl")
local glfw = require("moonglfw")
local mi = require("moonimage")

local SCR_WIDTH, SCR_HEIGHT = 288*4, 288*4
local SCR_SCALE = 4

--local vertex_shader_source = [[
--#version 330 core
--layout (location = 0) in vec3 aPos;
--void main() {
--   gl_Position = vec4(aPos, 1.0);
--}
--]]

local vertex_shader_source = [[
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;
layout (location = 2) in vec2 aTexCoord;

out vec4 ourColor;
out vec2 TexCoord;

void main()
{
	gl_Position = vec4(aPos, 1.0);
	ourColor = vec4(aColor, 1.0);
	TexCoord = vec2(aTexCoord.x, aTexCoord.y);
}
]]

--local fragment_shader_source = [[
--#version 330 core
--uniform vec4 ourColor;
--out vec4 FragColor;
--void main() {
--   FragColor = ourColor;
--}
--]]

local fragment_shader_source = [[
#version 330 core
out vec4 FragColor;

in vec4 ourColor;
in vec2 TexCoord;

// texture sampler
uniform sampler2D texture1;

void main()
{
	FragColor = texture(texture1, TexCoord) * ourColor;
	if(FragColor.a < 0.1)
        discard;
	//FragColor[0] = ourColor[0];
	//FragColor[1] = ourColor[1];
	//FragColor[2] = ourColor[2];
	//FragColor[3] = ourColor[3];
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
end)

-- Creating the texture:
tex_id = gl.new_texture('2d')
-- configure it:
gl.texture_parameter('2d', 'wrap s', 'repeat')
gl.texture_parameter('2d', 'wrap t', 'repeat')
gl.texture_parameter('2d', 'min filter', 'nearest')
gl.texture_parameter('2d', 'mag filter', 'nearest')
-- load the texture image using MoonImage:
image, w, h = mi.load('swtexttrans.png', 'rgba')
--image, w, h = mi.load('swtext.png', 'rgb')
--image, w, h = mi.load('white.png', 'rgb')
gl.texture_image('2d', 0, 'rgba', 'rgba', 'ubyte', image, w, h)
fontImageWidth = w
fontImageHeight = h
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
--local vertices = {
--   0.1, -0.1, 0.0,  -- bottom right
--  -0.1, -0.1, 0.0,  -- bottom left
--   0.0,  0.1, 0.0   -- top 
--}

local vertices = {
        -- positions           colors            texture coords
         0.5,  0.5, 0.0,   0.0, 1.0, 1.0,   1.0, 0.0, -- top right
         0.5, -0.5, 0.0,   0.0, 1.0, 1.0,   1.0, 1.0, -- bottom right
        -0.5, 0.5, 0.0,   0.0, 1.0, 1.0,   0.0, 0.0, -- bottom left
}

local vao = gl.gen_vertex_arrays()
local vbo = gl.gen_buffers()
-- bind the Vertex Array Object first, then bind and set vertex buffer(s), and then
-- configure vertex attributes(s).
gl.bind_vertex_array(vao)
gl.bind_buffer('array', vbo)
gl.buffer_data('array', gl.pack('float', vertices), 'static draw')
gl.vertex_attrib_pointer(0, 3, 'float', false, 8*gl.sizeof('float'), 0)
gl.enable_vertex_attrib_array(0)
gl.vertex_attrib_pointer(1, 3, 'float', false, 8*gl.sizeof('float'), 3*gl.sizeof('float'))
gl.enable_vertex_attrib_array(1)
gl.vertex_attrib_pointer(2, 2, 'float', false, 8*gl.sizeof('float'), 6*gl.sizeof('float'))
gl.enable_vertex_attrib_array(2)
gl.unbind_buffer('array')
gl.unbind_vertex_array() 

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


--createCompositeLink(1,2)
--createCompositeLink(1,3)

while not glfw.window_should_close(window) do	
	t1 = glfw.get_time()
	
	-- process input
	
	--local loc = gl.get_uniform_location(prog, "ourColor")
	--gl.uniform(loc, 'float', 1, 0, 0, 255)

	-- render
	gl.clear_color(0.2, 0.3, 0.3, 1.0)
	gl.clear('color')
	-- be sure to activate the shader before any calls to glUniform
	gl.use_program(prog)
	-- update shader uniform
	
	
	characterInfo = fontInfo[54]
	characterTL = {characterInfo.x/fontImageWidth, characterInfo.y/fontImageHeight}
	characterBR = {(characterInfo.x + characterInfo.width)/fontImageWidth, (characterInfo.y + characterInfo.height)/fontImageHeight}
	
	for i=0,1 do
		if i == 0 then
			vertices[1] = 0.5
			vertices[2] = 0.5
			vertices[9] = 0.5
			vertices[10] = -0.5
			vertices[17] = -0.5
			vertices[18] = 0.5
			
			vertices[7] = characterBR[1]
			vertices[8] = characterTL[2]
			vertices[15] = characterBR[1]
			vertices[16] = characterBR[2]
			vertices[23] = characterTL[1]
			vertices[24] = characterTL[2]
		else
			vertices[1] = -0.5
			vertices[2] = -0.5
			vertices[9] = 0.5
			vertices[10] = -0.5
			vertices[17] = -0.5
			vertices[18] = 0.5
			
			vertices[7] = characterTL[1]
			vertices[8] = characterBR[2]
			vertices[15] = characterBR[1]
			vertices[16] = characterBR[2]
			vertices[23] = characterTL[1]
			vertices[24] = characterTL[2]
		end
		
		
		vertices[4] = math.abs(((t1+1)%2)-1)
		vertices[12] = vertices[4]
		vertices[20] = vertices[4]
		
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
	
	
	glfw.swap_buffers(window)
	glfw.poll_events()
	
end

-- optional: de-allocate all resources once they've outlived their purpose:
gl.delete_vertex_arrays(vao)
gl.delete_buffers(vbo)
gl.delete_program(prog)
