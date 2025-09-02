-- main lua code, it's what's compressed and put into the sw vehicle
-- if something seems missing, it's probably done by sscript


m=math
mx=m.max
mn=m.min
sqrt=math.sqrt
flr=m.floor
pi=m.pi
gN=input.getNumber
gB=input.getBool
trueVar=true
falseVar=false
ipairsVar=ipairs
abs=m.abs
str=string
sin=m.sin
cos=m.cos
tan=m.tan
atan=m.atan
asin=m.asin
unpack=table.unpack
remove=table.remove
move=table.move
bigNum=m.huge

function add2(a,b)return{(a[1]+b[1]),(a[2]+b[2])}end
function sub2(a,b)return{(a[1]-b[1]),(a[2]-b[2])}end
function mul2(a,b)return{a[1]*b,a[2]*b}end
function clmp(a,b,c)return mn(mx(b,a),c)end
--function rnd(a)return flr(a+0.5)end
--function dist(a,b)return sqrt(((a[1]-b[1])^2)+((a[2]-b[2])^2)+((a[3]-b[3])^2))end
function add3(a,b)return{a[1]+b[1],a[2]+b[2],a[3]+b[3]}end
function sub3(a,b)return{a[1]-b[1],a[2]-b[2],a[3]-b[3]}end
function mul3(a,b)return{a[1]*b,a[2]*b,a[3]*b}end
--function stringRound3(a)return string.format("%.3f", a or 0)end
function crossPoints(a,b,c)return cross(sub3(b,a),sub3(c,a))end
function norm3(a)return mul3(a,1/sqrt(a[1]^2+a[2]^2+a[3]^2))end
function dist3(a,b)return sqrt((a[1]-b[1])^2 + (a[2]-b[2])^2 + (a[3]-b[3])^2)end

M={}
romCr=1
levelCr=3
stg=1
--loaded=falseVar
init=trueVar
httpTk=0
tick=0
camPos={0,5,-10}
camRot={0,0,0}
tickRate=62.5
turn=0
angleConvert=pi/180
moveSpeed=5/tickRate
rotateSpeed=90*angleConvert/tickRate
fov=90*angleConvert
screenScale=1
deltaTime=1/tickRate

function executeScript(line,opcode) -- do not input anything for opcode
	_ENVvar = _ENV
	while opcode ~= 0 do
		opcode,arg1,arg2,arg3 = unpack(M[5][line])
		arg2var,arg3var = _ENVvar[arg2],_ENVvar[arg3]
		--print(line,opcode,arg1,arg2,arg3,arg2var,arg3var)
		
		if opcode == 1 then -- simple set
			_ENVvar[arg1] = arg2
		elseif opcode == 2 then -- copy to table
			_ENVvar[arg1][arg2var] = arg3var
		elseif opcode == 3 then -- copy from table
			_ENVvar[arg1] = arg2var[arg3var]
		elseif opcode == 4 then -- make table
			_ENVvar[arg1] = {} -- can't be done with simple set
		elseif opcode == 5 then -- sub
			_ENVvar[arg1] = arg2var-arg3var
		elseif opcode == 6 then -- div
			_ENVvar[arg1] = arg2var/arg3var
		elseif opcode == 7 then -- function call
			_ENVvar[arg1] = arg2var(unpack(arg3var))
		elseif opcode == 8 then -- array length
			_ENVvar[arg1] = #arg2var
		elseif opcode == 9 then -- conditional jump
			if _ENVvar[arg1] then
				line = arg2var-1
			end
		elseif opcode == 10 then -- greater than
			_ENVvar[arg1] = arg2var>arg3var
		end
		
		line = line + 1
	end
end

function getMovementPerUnitForce(object,position,direction)
	trueContactPoint1 = sub3(position,object[1])
	return dot3(cross(mul3(cross(trueContactPoint1,direction),object[11]),trueContactPoint1),direction) + object[10]
end

function applyInstantMovement(object,position,force)
	collPointObjectRelative=sub3(position,object[1])
	object[4]=updateQuaternionByVector(object[4],mul3(cross(collPointObjectRelative,force),-object[11]))
	object[1]=add3(object[1],mul3(force,object[10]))
end

function applyForce(object,position,force)
	collPointObjectRelative=sub3(position,object[1])
	--collDirObjectRelative=divVectorByRotationMatrix(cameraRotationVector,curRotationMatrix)
	object[5]=add3(object[5],mul3(cross(collPointObjectRelative,force),object[11]))
	object[2]=add3(object[2],mul3(force,object[10]))
end

function gjkSupport(points,searchDirection)
	local crDist=-bigNum
	for i,v in ipairsVar(points) do
		crDot = dot3(v[2],searchDirection)
		if abs(crDot-crDist)<0.0005 then -- must be more strict than the epa's exit condition to prevent unreachable conditions
			pointList[#pointList+1]=i
		elseif crDot>crDist then
			point=v[2]
			pointList={i}
			crDist=crDot
		end
	end
	return point
end

function gjkCollisionDetection(points1,points2)
	searchDirection={1,0,0}
	collPoints={}
	for itteration1 = 1,32 do
		crPoint = sub3(gjkSupport(points1,searchDirection),gjkSupport(points2,mul3(searchDirection,-1)))
		
		if dot3(crPoint,searchDirection)<=0 then
			return
		end
		
		collPoints = {crPoint, collPoints[1], collPoints[2], collPoints[3]}
		
		a,b,c,d=unpack(collPoints)
		
		if d then
			ab = sub3(b,a)
			ac = sub3(c,a)
			ad = sub3(d,a)
			ao = mul3(a,-1)
			
			abc = cross(ab,ac)
			acd = cross(ac,ad)
			adb = cross(ad,ab)
			
			if dot3(abc, ao)>0 then
				collPoints = {a,b,c}
				searchDirection = abc
			elseif dot3(acd, ao)>0 then
				collPoints = {a,c,d}
				searchDirection = acd
			elseif dot3(adb, ao)>0 then
				collPoints = {a,d,b}
				searchDirection = adb
			else -- expanded polytope algorithm
				-- taken from https://github.com/kevinmoran/GJK/blob/master/GJK.h
				--if trueVar then return "GOOD" end
				faces={
					{a,b,c},
					{a,c,d},
					{a,d,b},
					{b,d,c}
				}
				for i,v in ipairs(faces) do -- gives every face a normal
					v[4]=norm3(crossPoints(v[1],v[2],v[3]))
				end
				
				for itteration2 = 1,32 do
					crDist=bigNum -- zero should work
					for i,v in ipairs(faces) do -- find closest face to origin
						crDot = dot3(v[1],v[4])
						if crDot<crDist then
							crDist = crDot
							closestFace = v
						end
					end
					searchDirection = closestFace[4]
					
					crPoint = sub3(gjkSupport(points1,searchDirection),gjkSupport(points2,mul3(searchDirection,-1)))
					
					if dot3(crPoint,searchDirection)-0.001 <= crDist then
						return {closestFace[4],dot3(crPoint,searchDirection)}
					end
					
					looseEdges={}
					for i=#faces,1,-1 do
						crFace=faces[i]
						if dot3(crFace[4],sub3(crPoint,crFace[1]))>0 then -- triangle faces new point, remove it
							for j=1,3 do
								crEdge = {crFace[j],crFace[(j%3)+1]}
								for k,crLooseEdge in ipairs(looseEdges) do
									if crLooseEdge[1]==crEdge[2] and crLooseEdge[2]==crEdge[1] then -- edge is in list already, delete both
										remove(looseEdges,k)
										crEdge=nilVar
										break
									end
								end
								
								if crEdge then -- if edge wasn't deleted
									looseEdges[#looseEdges+1]=crEdge
								end
							end
							
							-- now that its edges are dealt with, the triangle can be removed from the list
							
							remove(faces,i)
						end
					end
					
					-- now with the edges found and the old triangles deleted, new triangles can be created
					
					for i,v in ipairs(looseEdges) do
						newFace = {v[1],v[2],crPoint}
						newFace[4] = norm3(crossPoints(newFace[1],newFace[2],newFace[3]))
						
						--if dot3(newFace[1], newFace[4]) < 0 then -- I don't think this is needed, the winding should be preserved naturally
						--	newFace[1],newFace[2]=newFace[2],newFace[1]
						--	newFace[4] = mul3(newFace[4],-1)
						--end
						faces[#faces+1]=newFace
					end
				end
				return --TIMEOUT
			end -- expanded polytope algorithm over, now back to the code which will feed it
		elseif c then
			ab = sub3(b,a)
			ac = sub3(c,a)
			ao = mul3(a,-1)
			
			abc = cross(ab,ac)
			
			if dot3(cross(abc, ac), ao)>0 then -- closest to edge AC
				collPoints = {a,c}
				searchDirection = cross(cross(ac, ao), ac)
			elseif dot3(cross(ab, abc), ao)>0 then --closest to edge AB
				collPoints = {a,b}
				searchDirection = cross(cross(ab, ao), ab)
			else
				if dot3(abc, ao)>0 then
					--collPoints = {a,b,c} --above triangle
					searchDirection = abc;
				else
					collPoints = {a,c,b} --below triangle
					searchDirection = mul3(abc,-1)
				end
			end
		elseif b then
			ab = sub3(b,a)
			ao = mul3(a,-1)
			
			if dot3(ab, ao)>0 then
				searchDirection = cross(cross(ab, ao), ab)
			else
				collPoints = {a}
				searchDirection = ao
			end
		else
			collPoints={a}
			searchDirection=mul3(a,-1)
		end
	end
	-- only reaches here when a timeout happens
end

function cross(a,b)
	return {a[2]*b[3] - a[3]*b[2], a[3]*b[1] - a[1]*b[3], a[1]*b[2] - a[2]*b[1]}
end

function dot3(a,b)
	return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]
end

function vectorToQuaternion(vec)
	if vec[1]==0 and vec[2]==0 and vec[3]==0 then
		return {1,0,0,0}
	else
		angle = dist3(vec,{0,0,0})*0.5
		axis = mul3(vec,1/angle)
		strength = sin(angle)
		return {cos(angle),axis[1]*strength,axis[2]*strength,axis[3]*strength}
	end
end

function updateQuaternionByVector(quat,vec)
	local newQuat=multQuaternionByQuaternion(quat,vectorToQuaternion(vec))
	for i=1,4 do
		newQuat[i]=quat[i] + newQuat[i]*0.5
	end
	return norm4(newQuat)
end

function multQuaternionByQuaternion(quat1,quat2)
	local w1,x1,y1,z1=unpack(quat1)
	local w2,x2,y2,z2=unpack(quat2)
	return {
		w1*w2-x1*x2-y1*y2-z1*z2,
		w1*x2+x1*w2+y1*z2-z1*y2,
		w1*y2-x1*z2+y1*w2+z1*x2,
		w1*z2+x1*y2-y1*x2+z1*w2
	}
end

function multVectorByMatrix(vec,matrix)
	local newVec={}
	for j = 1,3 do
		cr=0
		for k = 1,3 do
			cr=cr + vec[k]*matrix[j][k]
		end
		newVec[j]=cr
	end
	return newVec
end

--function divVectorByRotationMatrix(vec,matrix)
--	local newVec={}
--	for j = 1,3 do
--		cr=0
--		for k = 1,3 do
--			cr=cr + vec[k]*matrix[k][j]
--		end
--		newVec[j]=cr
--	end
--	return newVec
--end

function norm4(a,correction)
	correction=1/sqrt(a[1]^2 + a[2]^2 + a[3]^2 + a[4]^2)
	return {a[1]*correction, a[2]*correction, a[3]*correction, a[4]*correction}
end

function quaternionToMatrix(quat)
	local w,x,y,z=unpack(quat)
	return {
		{1-(2*y*y + 2*z*z), 2*x*y + 2*z*w,     2*x*z - 2*y*w},
		{2*x*y - 2*z*w,     1-(2*x*x + 2*z*z), 2*y*z + 2*x*w},
		{2*x*z + 2*y*w,     2*y*z - 2*x*w,     1-(2*x*x + 2*y*y)},
	}
end

--function httpReply(a,b,c)
--	httpTkP=httpTk//2
--	httpTk=0
--end

function onTick()
	for j=1,1 do
		if gB(32) and not loaded then
			rom=property.getText(romCr)
			i=1
			nm=""
			cr=str.sub(rom,i,i)
			while cr~=""do
				pos=str.byte(cr)
				if pos<45 then
					if pos<33 then
						nm=(nm..pos-19)+0
					end
					--print(nm,stg,count,curLength)
					if stg==1 then
						curIndex=nm
						M[nm]=M[nm]or{}
					elseif stg==2 then
						intH=nm
						curLength=0
					elseif stg==3 then
						count=nm
					else
						if curLength==0 then
							curLength=intH
							count=count-1
							curM={}
							M[curIndex][#M[curIndex]+1]=curM
						end
						curM[#curM+1]=nm
						curLength=curLength-1
						stg=mx(curLength,count)>0 and stg-1 or 0
					end
					stg=stg+1
					nm=""
				else
					nm=nm..cr
				end
				i=i+1
				cr=str.sub(rom,i,i)
			end
			romCr=romCr+1
			loaded=rom==""
		end
	end

	if loaded then
		tick = tick+1
		if init then
			executeScript(1)
			executeScript("initFunc")
		end
		
		executeScript("tickFunc")
		
		
		
		--keyboardRotationInput = {-0.01*gN(2),0.01*gN(1),0.01*gN(3)}
		--overalRayHit = falseVar
		
		debugTris = {}
		
		for index = 1,#objects do
			object = objects[index]
			object[4] = updateQuaternionByVector(object[4],mul3(object[5],-deltaTime)) -- apply rotational velocity to orientation, not sure why the minus is needed
			object[1] = add3(object[1],mul3(object[2],deltaTime)) -- apply velocity to position
			object[2] = add3(object[2],mul3(object[3],deltaTime)) -- apply acceleration to velocity
			object[3] = mul3(object[12],1) -- reset acceleration to gravity
			--object[2] = mul3(object[2],0.9995) -- slow down velocity, optional
			--object[5] = mul3(object[5],0.9995) -- slow down rotation, optional
			
			object[16] = quaternionToMatrix(object[4])
			
			for j,collMesh1 in ipairsVar(object[9]) do
				for k,crPoint in ipairsVar(collMesh1) do
					crPoint[2] = multVectorByMatrix(crPoint[1],object[16])
					crPoint[2]=add3(crPoint[2],object[1])
				end
			end
		end
		
		--camPos = multVectorByMatrix({0,1,-5},cameraRotationMatrix)
		
		executeScript("postTransformFunc")
		
		
		
		--collideAtAll = falseVar
		--collCals = 0
		for i,object1 in ipairsVar(objects) do
			if object1[10]>0 or object1[11]>0 then
				for j,object2 in ipairsVar(objects) do
					if i~=j and dist3(object1[1],object2[1])<=object1[13]+object2[13] then
						for k,collMesh1 in ipairsVar(object1[9]) do
							for n,collMesh2 in ipairsVar(object2[9]) do
								--collCals=collCals+1
								
								if #collMesh1>0 and #collMesh2>0 then
									
									isColliding = gjkCollisionDetection(collMesh1,collMesh2)
									--monkeyCollision = gjkCollisionDetection(objects[1][7],objects[2][7])
									if isColliding then
										--if object1 == player or object2 == player then
										--	coefficientOfFriction = 1
										--else
										--	coefficientOfFriction = 1
										--end
										newAndOldCollPoints = object1[15][j] or {}
										
										--collideAtAll = trueVar
										gjkSupport(collMesh1,isColliding[1])
										collPoints1 = pointList
										gjkSupport(collMesh2,mul3(isColliding[1],-1))
										collPoints2 = pointList
										--newAndOldCollPoints[#newAndOldCollPoints+1] = {collPoints1,collPoints2}
										--goodCollPoints = {}
										
										--for k,collPoints in ipairsVar(newAndOldCollPoints) do
										--	collPoints1,collPoints2 = unpack(collPoints)
											
										if #collPoints1==1 then
											trueContactPoint = collMesh1[collPoints1[1]][2]
										elseif #collPoints2==1 then
											trueContactPoint = collMesh2[collPoints2[1]][2]
										elseif #collPoints1==2 and #collPoints2==2 then -- https://en.wikipedia.org/wiki/Skew_lines#Distance
											direction1=sub3(collMesh1[collPoints1[2]][2],collMesh1[collPoints1[1]][2])
											direction2=sub3(collMesh2[collPoints2[2]][2],collMesh2[collPoints2[1]][2])
											normal2 = cross(direction2,cross(direction1,direction2))
											trueContactPoint = add3(collMesh1[collPoints1[1]][2],
											mul3(direction1,
											dot3(sub3(collMesh2[collPoints2[1]][2],collMesh1[collPoints1[1]][2]),normal2) / dot3(direction1,normal2)))
										else
											trueContactPoint = object1[13]>object2[13] and collMesh2[collPoints2[1]][2] or collMesh1[collPoints1[1]][2]
										end
										--velocity1 = object1[2]
										--velocity2 = object2[2]
										velocity1 = add3(cross(object1[5],sub3(trueContactPoint,object1[1])),object1[2])
										velocity2 = add3(cross(object2[5],sub3(trueContactPoint,object2[1])),object2[2])
										totalVelocity = sub3(velocity1,velocity2)
										
										totalVelocityNormal = dot3(isColliding[1],totalVelocity)
										if totalVelocityNormal>0 then
											--goodCollPoints[#goodCollPoints+1] = collPoints
											
											--totalInverseResistance = object1[10]+object2[10]
											--totalForce = mul3(isColliding[1],totalVelocity*(0.5-0.25*(abs(object1[10]-object2[10])/totalInverseResistance))) -- the inverse resistance maths causes a mult of 0.5 between identically weighted objects
											-- and a multiplier of 0.25 between very differently weighted objects
											--applyForce(object1,trueContactPoint,mul3(totalForce,-1))
											--applyForce(object2,trueContactPoint,totalForce)
											
											--object1[1] = add3(object1[1],mul3(isColliding[1],-isColliding[2]*object1[10]/totalInverseResistance))
											--object2[1] = add3(object2[1],mul3(isColliding[1],isColliding[2]*object2[10]/totalInverseResistance))
											
											movementFromPushing = getMovementPerUnitForce(object1,trueContactPoint,isColliding[1]) + getMovementPerUnitForce(object2,trueContactPoint,isColliding[1])
											-- ^ should technically be velocityChangeFromPushing, but that's a bit long for my tastes
											
											desiredChangeInVelocity = totalVelocityNormal
											pushForce = desiredChangeInVelocity/movementFromPushing
											
											applyForce(object1,trueContactPoint,mul3(isColliding[1],-pushForce))
											applyForce(object2,trueContactPoint,mul3(isColliding[1],pushForce))
											
											-- re-calculating velocites since they will have changed
											-- this step bugs me but it produces inaccurate & visibly wrong results otherwise
											
											velocity1 = add3(cross(object1[5],sub3(trueContactPoint,object1[1])),object1[2])
											velocity2 = add3(cross(object2[5],sub3(trueContactPoint,object2[1])),object2[2])
											totalVelocity = sub3(velocity1,velocity2)
											
											totalVelocityNormal = dot3(isColliding[1],totalVelocity)
											
											totalVelocityTangential = sub3(totalVelocity,mul3(isColliding[1],totalVelocityNormal))
											
											totalSpeedTangential = dist3(totalVelocityTangential,{0,0,0})
											if totalSpeedTangential>0.001 then
												unitFriction = norm3(totalVelocityTangential)
												movementFromFriction = getMovementPerUnitForce(object1,trueContactPoint,unitFriction) + getMovementPerUnitForce(object2,trueContactPoint,unitFriction)
												frictionForce = mn(totalSpeedTangential/movementFromFriction, pushForce*coefficientOfFriction)
												
												applyForce(object1,trueContactPoint,mul3(unitFriction,-frictionForce))
												applyForce(object2,trueContactPoint,mul3(unitFriction,frictionForce))
											end
											
											--totalInverseResistance = object1[10]+object2[10]
											--object1[1] = add3(object1[1],mul3(isColliding[1],-isColliding[2]*object1[10]/totalInverseResistance))
											--object2[1] = add3(object2[1],mul3(isColliding[1],isColliding[2]*object2[10]/totalInverseResistance))
											
											pushMovement = isColliding[2]/movementFromPushing
											
											applyInstantMovement(object1,trueContactPoint,mul3(isColliding[1],-pushMovement))
											applyInstantMovement(object2,trueContactPoint,mul3(isColliding[1],pushMovement))
										end
										--end
										--if #goodCollPoints>3 then
										--	remove(goodCollPoints,1)
										--end
										--object1[15][j] = goodCollPoints
									end
								end
							end
						end
					end
				end
			end
		end
		
		
			
		for index = 1,#objects do -- pre-rendering maths
			object = objects[index]
			--object[16] = quaternionToMatrix(object[4])
			
			for i=1,#object[7] do
				crPoint=object[7][i]
				crPoint[2] = multVectorByMatrix(crPoint[1],object[16])
				crPoint[2]=add3(crPoint[2],object[1])
				
			end
			
			if object[11]>0 or not object[8][1][8]then
				--print(#object[7],#object[8],#object[9])
				for i=1,#object[8] do
					curTri = object[8][i]
					--print(curTri[1],curTri[2],curTri[3])
					curTri[8]=crossPoints(object[7][curTri[1]][2], object[7][curTri[2]][2], object[7][curTri[3]][2])
				end
			end
		end
		
		executeScript("renderFunc")
			
			
			
		
		
		
		
	end

	--httpTk=httpTk+1
	--async.httpGet(8,"")
end

function renderView()
	renderShapes = {}
	
	
	for index = 1,#objects do -- triangle position calculation a.k.a. the 3D rendering
		object = objects[index]
		if object~=player or itterLevel>1 then
			--object[16] = quaternionToMatrix(object[4])
			
			for i=1,#object[7] do
				crPoint=object[7][i]
				crPoint[3]=sub3(crPoint[2],cameraPosition)
				
				crPoint[4]=multVectorByMatrix(crPoint[3],cameraRotationMatrix)
				distances=crPoint[3]
				crPoint[7]=sqrt(distances[1]^2 + distances[2]^2 + distances[3]^2)
				
				crPoint[5]={crPoint[4][1]*screenScale/crPoint[4][3],
				-crPoint[4][2]*screenScale/crPoint[4][3]}
				crPoint[6]=crPoint[4][3]>0 and 1 or 0
				
			end
			


			
			
			for i=1,#object[8] do
				curTri = object[8][i]
				p1 = object[7][curTri[1]]
				p2 = object[7][curTri[2]]
				p3 = object[7][curTri[3]]
				curTri[7]=mx(p1[7],p2[7],p3[7])
				b=p1[3]
				if dot3(curTri[8],b)>0 and curTri[7]>depthMinimum then
					sideVal=p1[6]+p2[6]+p3[6]
					if sideVal == 3 then
						--renderShapes[#renderShapes+1] = {p1[5],p2[5],p3[5],curTri[4],curTri[5],curTri[6],curTri[7]}
						shape = {p1[5],p2[5],p3[5]}
					elseif sideVal >= 1 then
						if p1[6]==2-sideVal then
							screenPoint1=p1[5]
							screenPoint2=p2[5]
							screenPoint3=p3[5]
						elseif p2[6]==2-sideVal then
							screenPoint1=p2[5]
							screenPoint2=p1[5]
							screenPoint3=p3[5]
						else
							screenPoint1=p3[5]
							screenPoint2=p2[5]
							screenPoint3=p1[5]
						end
						if sideVal == 2 then
							screenPoint4=add2(mul2(sub2(screenPoint2,screenPoint1),1000),screenPoint2)
							screenPoint5=add2(mul2(sub2(screenPoint3,screenPoint1),1000),screenPoint3)
							--renderShapes[#renderShapes+1] = {{screenPoint3,screenPoint2,screenPoint4},255,0,0,curTri[7]+0.1}
							--renderShapes[#renderShapes+1] = {{screenPoint3,screenPoint4,screenPoint5},0,0,255,curTri[7]+0.1}
							--renderShapes[#renderShapes+1] = {{screenPoint3,screenPoint2,screenPoint4,screenPoint5},0,0,255,curTri[7]+0.1}
							--renderShapes[#renderShapes+1] = {screenPoint2,screenPoint4,screenPoint3,curTri[4],curTri[5],curTri[6],curTri[7]}
							--renderShapes[#renderShapes+1] = {screenPoint3,screenPoint4,screenPoint5,curTri[4],curTri[5],curTri[6],curTri[7]}
							shape = {screenPoint3,screenPoint2,screenPoint4,screenPoint5}
						else
							screenPoint4=add2(mul2(sub2(screenPoint1,screenPoint2),1000),screenPoint2)
							screenPoint5=add2(mul2(sub2(screenPoint1,screenPoint3),1000),screenPoint3)
							--renderShapes[#renderShapes+1] = {screenPoint1,screenPoint4,screenPoint5,255,0,255,curTri[7]}
							--renderShapes[#renderShapes+1] = {screenPoint1,screenPoint4,screenPoint5,curTri[4],curTri[5],curTri[6],curTri[7]}
							shape = {screenPoint1,screenPoint5,screenPoint4}
						end
					end
					
					if sideVal >= 1 then
						p1 = shape[1]
						p2 = shape[2]
						p3 = shape[3]
						
						triBoundingL = mn(p1[1],p2[1],p3[1])
						triBoundingR = mx(p1[1],p2[1],p3[1])
						triBoundingT = mn(p1[2],p2[2],p3[2])
						triBoundingB = mx(p1[2],p2[2],p3[2])
						
						if (triBoundingR>viewBoundingOuterBoxL and triBoundingL<viewBoundingOuterBoxR) and (triBoundingB>viewBoundingOuterBoxT and triBoundingT<viewBoundingOuterBoxB) then
							if triBoundingL<viewBoundingInnerBoxL or triBoundingR>viewBoundingInnerBoxR or triBoundingT<viewBoundingInnerBoxT or triBoundingB>viewBoundingInnerBoxB then
								shape = intersectShapeWithShape(shape,viewBounding)
								--processed = processed+1
								
							--else
							--	accepted = accepted + 1
							end
							
							renderShapes[#renderShapes+1] = {shape,curTri[4],curTri[5],curTri[6],curTri[7]*depthScale+depthOffset}
						end
					end
				end
			end
		end
	end
	
	table.sort(renderShapes,function(a,b)return a[5]>b[5]end)
end

function intersectShapeWithShape(shape1,shape2)
	shape2Len = #shape2
	for j=1,#shape2 do
		x1,y1=unpack(shape2[j])
		x2,y2=unpack(shape2[j%shape2Len+1])
		newShape1 = {}
		shape1Len = #shape1
		for k=1,shape1Len do
			v3 = shape1[k]
			x3,y3=unpack(v3)
			x4,y4=unpack(shape1[k%shape1Len+1])
			v3check = (x2-x1)*(y3-y1) - (y2-y1)*(x3-x1)
			v4check = (x2-x1)*(y4-y1) - (y2-y1)*(x4-x1)
			if v3check*v4check<0 then
				uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1))
				intersection = {x1 + (uA * (x2-x1)),y1 + (uA * (y2-y1))}
			end
			if v3check>0 and v4check<0 then
				newShape1[#newShape1+1] = v3
				newShape1[#newShape1+1] = intersection
			elseif v3check<0 and v4check<0 then
				
			elseif v3check<0 and v4check>0 then
				newShape1[#newShape1+1] = intersection
			else
				newShape1[#newShape1+1] = v3
			end
		end
		shape1 = newShape1
	end
	return shape1
end

function onDraw()
	screenVar=screen
	local triF,tri,rec,stCl=screenVar.drawTriangleF,screenVar.drawTriangle,screenVar.drawRectF,screenVar.setColor --locals are faster because lua
	w = screenVar.getWidth()
	h = screenVar.getHeight()
	w2=w/2
	h2=h/2
	screenScale = tan(fov/2)*w2
	
	
	--stCl(255,255,255)
	--text(1,1,"TPS: ")
	--text(26,1,httpTkP)
	
	
	--for i=1,#allM do
	--	stCl(255,255,255)
	--	text(0,i*6-5,allM[i])
	--	text(20,i*6-5,M[allM[i]])
	--end
	
	--viewBounding = {{-90,-60},{100,-50},{100,50},{-100,50}}
	--viewBoundingInnerBoxL = -90
	--viewBoundingInnerBoxR = 100
	--viewBoundingInnerBoxT = -50
	--viewBoundingInnerBoxB = 50
	--viewBoundingOuterBoxL = -100
	--viewBoundingOuterBoxR = 100
	--viewBoundingOuterBoxT = -60
	--viewBoundingOuterBoxB = 50
	--viewBounding = {{-9,-60},{10,-50},{10,50},{-10,50}}
	--viewBounding = {{0,70},{-40,40},{-40,-40},{0,-70},{40,-40},{40,40}}
	
	
	if loaded then
		
		for i=1,#renderShapesAll do
			curShape = renderShapesAll[i]
			shape = curShape[1]
			
			p1 = shape[1]
			for j=3,#shape do
				p2 = shape[j-1]
				p3 = shape[j]
				stCl(curShape[2],curShape[3],curShape[4])
				triF(p1[1]+w2,p1[2]+h2,p2[1]+w2,p2[2]+h2,p3[1]+w2,p3[2]+h2)
				--stCl(curShape[2]*0.5,curShape[3]*0.5,curShape[4]*0.5)
				--tri(p1[1]+w2,p1[2]+h2-0.5,p2[1]+w2,p2[2]+h2-0.5,p3[1]+w2,p3[2]+h2-0.5)
			end
		end
		
		for i,debugTri in ipairsVar(debugTris) do
			p1,p2,p3 = unpack(debugTri)
			junk =stCl(unpack(debugTri[4]))
			triF(p1[1]+w2,p1[2]+h2,p2[1]+w2,p2[2]+h2,p3[1]+w2,p3[2]+h2)
		end
		--print(processed,accepted,culled)
		
		--if collideAtAll then
		--	stCl(255,255,0)
		--	for i=1,#collPoints1 do
		--		crPoint=multVectorByMatrix(sub3(collPoints1[i],camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--		stCl(0,255,255)
		--	for i=1,#collPoints2 do
		--		crPoint=multVectorByMatrix(sub3(collPoints2[i],camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--	if trueContactPoint then
		--		stCl(255,0,255)
		--		crPoint=multVectorByMatrix(sub3(trueContactPoint,camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--end
		
		
		--if monkeyCollision then
		--	text(1,1,"Collision:")
		--	for i=1,3 do
		--		text(1,i*6+1,stringRound3(monkeyCollision[1][i]))
		--	end
		--	text(1,4*6+1,stringRound3(monkeyCollision[2]))
		--end
		--if trueContactPoint then
		--	for i=1,3 do
		--		text(1,i*6+37,stringRound3(trueContactPoint[i]))
		--	end
		--end
		--text(1,1,"Orientation Quaternion:")
		--for i=1,4 do
		--	text(1,i*6+1,stringRound3(monkeyRotationQuaternion[i]))
		--end
		--text(1,37,"Rotational Velocity:")
		--for i=1,3 do
		--	text(1,i*6+37,stringRound3(monkeyRotationVelocity[i]))
		--end
		--text(1,73,"Ray col pos:")
		--for i=1,3 do
		--	text(1,i*6+73,stringRound3(collPointMonkeyRelative[i]))
		--end
		--text(1,109,"Ray dir:")
		--for i=1,3 do
		--	text(1,i*6+109,stringRound3(collDirMonkeyRelative[i]))
		--end
		
		--text(100,1,monkeyRayHit and "YES" or "NO")
		
		--stCl(unpack(pushColour))
		
		--if overalRayHit then
		--	recSize=30/collPointCamRelative[3]
		--	rec(collPointScreenPos[1]+w2-(recSize//2),collPointScreenPos[2]+h2-(recSize//2),recSize,recSize)
		--end
	end
end