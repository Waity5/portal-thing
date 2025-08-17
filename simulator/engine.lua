O=math
bP=O.max
cw=O.min
aT=math.sqrt
cX=O.floor
cr=O.pi
cW=input.getNumber
cC=input.getBool
cg=true
cY=false
aE=ipairs
cH=O.abs
bE=table.remove
bg=string
cm=O.sin
cF=O.cos
cl=O.tan
db=O.atan
ao=table.unpack
b_=O.huge

function bd(a,b)return{(a[1]+b[1]),(a[2]+b[2])}end
function aS(a,b)return{(a[1]-b[1]),(a[2]-b[2])}end
function aX(a,b)return{a[1]*b,a[2]*b}end



function o(a,b)return{a[1]+b[1],a[2]+b[2],a[3]+b[3]}end
function i(a,b)return{a[1]-b[1],a[2]-b[2],a[3]-b[3]}end
function e(a,b)return{a[1]*b,a[2]*b,a[3]*b}end

function bs(a,b,C)return j(i(b,a),i(C,a))end
function ar(a)return e(a,1/aT(a[1]^2+a[2]^2+a[3]^2))end
function ai(a,b)return aT((a[1]-b[1])^2+(a[2]-b[2])^2+(a[3]-b[3])^2)end

t={}bj=1
cS=3
ae=1

cz=cg
cV=0
bD=0
c_={0,-.4,0}be=62.5
cI=0
cb=cr/180
cR=5/be
cM=90*cb/be
cD=90*cb
bh=1
ba=1/be

function a_(aY,B)D=_ENV
while B~=0 do
B,Q,ca,cG=ao(t[5][aY])ab,aw=D[ca],D[cG]

if B==1 then
D[Q]=ca
elseif B==2 then
D[Q][ab]=aw
elseif B==3 then
D[Q]=ab[aw]elseif B==4 then
D[Q]={}elseif B==5 then
D[Q]=ab-aw
elseif B==6 then
D[Q]=ab/aw
elseif B==7 then
D[Q]=ab(ao(aw))elseif B==8 then
D[Q]=#ab
elseif B==9 then
if D[Q]then
aY=ab-1
end
elseif B==10 then
D[Q]=ab>aw
end

aY=aY+1
end
end

function Z(c,aB,bU)by=i(aB,c[1])return m(j(e(j(by,bU),c[11]),by),bU)+c[10]end

function bc(c,aB,H)bu=i(aB,c[1])c[4]=bx(c[4],e(j(bu,H),-c[11]))c[1]=o(c[1],e(H,c[10]))end

function R(c,aB,H)bu=i(aB,c[1])
c[5]=o(c[5],e(j(bu,H),c[11]))c[2]=o(c[2],e(H,c[10]))end

function at(cp,n)local ak=-b_
for f,u in aE(cp)do
av=m(u[2],n)if cH(av-ak)<.0005 then
aW[#aW+1]=f
elseif av>ak then
cq=u[2]aW={f}ak=av
end
end
return cq
end

function cB(bI,bH)n={1,0,0}x={}for cU=1,32 do
k=i(at(bI,n),at(bH,e(n,-1)))
if m(k,n)<=0 then
return
end

x={k,x[1],x[2],x[3]}
a,b,C,aj=ao(x)
if aj then
J=i(b,a)an=i(C,a)cd=i(aj,a)y=e(a,-1)
ac=j(J,an)ce=j(an,cd)cc=j(cd,J)
if m(ac,y)>0 then
x={a,b,C}n=ac
elseif m(ce,y)>0 then
x={a,C,aj}n=ce
elseif m(cc,y)>0 then
x={a,aj,b}n=cc
else


ah={{a,b,C},{a,C,aj},{a,aj,b},{b,aj,C}}for f,u in ipairs(ah)do
u[4]=ar(bs(u[1],u[2],u[3]))end

for cT=1,32 do
ak=b_
for f,u in ipairs(ah)do
av=m(u[1],u[4])if av<ak then
ak=av
bZ=u
end
end
n=bZ[4]
k=i(at(bI,n),at(bH,e(n,-1)))
if m(k,n)-.001<=ak then
return{bZ[4],m(k,n)}end

aD={}for f=#ah,1,-1 do
bb=ah[f]if m(bb[4],i(k,bb[1]))>0 then
for l=1,3 do
aH={bb[l],bb[(l%3)+1]}for aZ,bY in ipairs(aD)do
if bY[1]==aH[2]and bY[2]==aH[1]then
bE(aD,aZ)aH=cP
break
end
end

if aH then
aD[#aD+1]=aH
end
end



bE(ah,f)end
end



for f,u in ipairs(aD)do
aC={u[1],u[2],k}aC[4]=ar(bs(aC[1],aC[2],aC[3]))




ah[#ah+1]=aC
end
end
return
end
elseif C then
J=i(b,a)an=i(C,a)y=e(a,-1)
ac=j(J,an)
if m(j(ac,an),y)>0 then
x={a,C}n=j(j(an,y),an)elseif m(j(J,ac),y)>0 then
x={a,b}n=j(j(J,y),J)else
if m(ac,y)>0 then

n=ac;
else
x={a,C,b}n=e(ac,-1)end
end
elseif b then
J=i(b,a)y=e(a,-1)
if m(J,y)>0 then
n=j(j(J,y),J)else
x={a}n=y
end
else
x={a}n=e(a,-1)end
end

end

function cK(P,I)I=I or{}bN={}l=1
for f=t[1][P][1],t[1][P][2]do
p=t[2][f]bN[l]={{p[1],p[2],p[3]},{}}l=l+1
end
bM={}l=1
for f=t[1][P][3],t[1][P][4]do
p=t[3][f]bM[l]=p
l=l+1
end
bO={}l=1
for f=t[1][P][5],t[1][P][6]do
p=t[2][f]bO[l]={{p[1],p[2],p[3]},{}}l=l+1
end

ct={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bN,bM,bO,I[7]or 1,I[8]or 1,I[9]or{0,0,0},t[1][P][7],P,{},{},}N[#N+1]=ct
end

function j(a,b)return{a[2]*b[3]-a[3]*b[2],a[3]*b[1]-a[1]*b[3],a[1]*b[2]-a[2]*b[1]}end

function m(a,b)return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]end

function cf(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bw=ai(S,{0,0,0})*.5
bv=e(S,1/bw)bf=cm(bw)return{cF(bw),bv[1]*bf,bv[2]*bf,bv[3]*bf}end
end

function bx(aV,S)local bn=cu(aV,cf(S))for f=1,4 do
bn[f]=aV[f]+bn[f]*.5
end
return cs(bn)end

function cu(co,cn)local aP,aO,aM,aK=ao(co)local z,aN,aL,aJ=ao(cn)return{aP*z-aO*aN-aM*aL-aK*aJ,aP*aN+aO*z+aM*aJ-aK*aL,aP*aL-aO*aJ+aM*z+aK*aN,aP*aJ+aO*aL-aM*aN+aK*z}end

function U(S,cx)local bL={}for l=1,3 do
p=0
for aZ=1,3 do
p=p+S[aZ]*cx[l][aZ]end
bL[l]=p
end
return bL
end













function cs(a,aI)aI=1/aT(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aI,a[2]*aI,a[3]*aI,a[4]*aI}end

function aA(aV)local W,M,L,K=ao(aV)return{{1-(2*L*L+2*K*K),2*M*L+2*K*W,2*M*K-2*L*W},{2*M*L-2*K*W,1-(2*M*M+2*K*K),2*L*K+2*M*W},{2*M*K+2*L*W,2*L*K-2*M*W,1-(2*M*M+2*L*L)},}end






function onTick()for l=1,1 do
if cC(32)and not bo then
bk=property.getText(bj)f=1
G=""
p=bg.sub(bk,f,f)while p~=""do
bm=bg.byte(p)if bm<45 then
if bm>33 then
G=(G..bm-35)+0
end

if ae==1 then
bV=G
t[G]=t[G]or{}elseif ae==2 then
cy=G
aF=0
elseif ae==3 then
bt=G
else
if aF==0 then
aF=cy
bt=bt-1
br={}t[bV][#t[bV]+1]=br
end
br[#br+1]=G
aF=aF-1
ae=bP(aF,bt)>0 and ae-1 or 0
end
ae=ae+1
G=""
else
G=G..p
end
f=f+1
p=bg.sub(bk,f,f)end
bj=bj+1
bo=bk==""
end
end

if bo then
bD=bD+1
if cz then
a_(1)a_(28)end

a_(290)




E={}
for P=1,#N do
c=N[P]c[4]=bx(c[4],e(c[5],-ba))c[1]=o(c[1],e(c[2],ba))c[2]=o(c[2],e(c[3],ba))c[3]=e(c[12],1)


c[16]=aA(c[4])

for f=7,9,2 do
for l=1,#c[f]do
k=c[f][l]k[2]=U(k[1],c[16])k[2]=o(k[2],c[1])k[3]=i(k[2],da)
k[4]=U(k[3],cZ)bp=k[3]k[7]=aT(bp[1]^2+bp[2]^2+bp[3]^2)
k[5]={k[4][1]*bh/k[4][3],-k[4][2]*bh/k[4][3]}k[6]=k[4][3]>0 and 1 or-1

end
end

if c[11]>0 or not c[8][1][8]then

for f=1,#c[8]do
h=c[8][f],1
cJ=h[1]+1

h[8]=bs(c[7][h[1]][2],c[7][h[2]][2],c[7][h[3]][2])end
end

for f=1,#c[8]do
h=c[8][f]s=c[7][h[1]]v=c[7][h[2]]F=c[7][h[3]]h[7]=bP(s[7],v[7],F[7])a=h[8]b=s[3]if m(a,b)>0 then
az=s[6]+v[6]+F[6]if az==3 then
E[#E+1]={s[5],v[5],F[5],h[4],h[5],h[6],h[7]}elseif az>=-1 then
if s[6]==-az then
ag=s[5]af=v[5]X=F[5]elseif v[6]==-az then
ag=v[5]af=s[5]X=F[5]else
ag=F[5]af=v[5]X=s[5]end
if az==1 then
aU=bd(aX(aS(af,ag),1000),af)bi=bd(aX(aS(X,ag),1000),X)

E[#E+1]={af,aU,X,h[4],h[5],h[6],h[7]}E[#E+1]={X,aU,bi,h[4],h[5],h[6],h[7]}else
aU=bd(aX(aS(ag,af),1000),af)bi=bd(aX(aS(ag,X),1000),X)
E[#E+1]={ag,aU,bi,h[4],h[5],h[6],h[7]}end
end
end
end
end



a_(469)



for f,aq in aE(cO)do
bX=aq[4]bW=aq[5]d=N[aq[1]]g=N[aq[2]]bJ=N[aq[3]]V=aq[6]if V then
V=ar(U(V,g[16]))end

r=o(U(bX,d[16]),d[1])aG=o(U(bW,g[16]),bJ[1])
ad=i(r,aG)if V then
ad=i(ad,e(V,m(ad,V)))end
ck=ai(ad,{0,0,0})if ck>.0001 then
bC=ar(ad)Y=Z(d,r,bC)+Z(g,r,bC)bc(d,r,e(ad,-1/Y))bc(g,r,e(ad,1/Y))end

d[16]=aA(d[4])g[16]=aA(g[4])
r=o(U(bX,d[16]),d[1])aG=o(U(bW,g[16]),bJ[1])
ay=o(j(d[5],i(r,d[1])),d[2])ax=o(j(g[5],i(aG,g[1])),g[2])A=i(ay,ax)if V then
A=i(A,e(V,m(A,V)))end
cj=ai(A,{0,0,0})if cj>.0001 then
bA=ar(A)Y=Z(d,r,bA)+Z(g,r,bA)R(d,r,e(A,-1/Y))R(g,r,e(A,1/Y))end

d[16]=aA(d[4])g[16]=aA(g[4])end



for f,T in aE(cL)do
d=N[T[1]]g=N[T[2]]r=o(U(T[3],d[16]),d[1])aG=o(U(T[4],g[16]),g[1])
bS=i(aG,r)au=ai(bS,{0,0,0})bR=e(bS,1/au)if au>.0001 then
H=e(bR,(T[5]-au)*T[6]*ba)R(d,r,e(H,-1))R(g,r,H)
H=e(bR,((T[8]or au)-au)*T[7])R(d,r,e(H,-1))R(g,r,H)end

T[8]=au
end





for f,d in aE(N)do
for l,g in aE(N)do
if f~=l and(d[10]>0 or g[10]>0 or d[11]>0 or g[11]>0)and ai(d[1],g[1])<=d[13]+g[13]then

aa=d[9]am=g[9]
w=cB(aa,am)
if w then
cQ=d[15][l]or{}

at(aa,w[1])_=aW
at(am,e(w[1],-1))al=aW






if#_==1 then
q=aa[_[1]][2]elseif#al==1 then
q=am[al[1]][2]elseif#_==2 and#al==2 then
bq=i(aa[_[2]][2],aa[_[1]][2])bT=i(am[al[2]][2],am[al[1]][2])bK=j(bT,j(bq,bT))q=o(aa[_[1]][2],e(bq,m(i(am[al[1]][2],aa[_[1]][2]),bK)/m(bq,bK)))else
q=d[13]>g[13]and am[al[1]][2]or aa[_[1]][2]end


ay=o(j(d[5],i(q,d[1])),d[2])ax=o(j(g[5],i(q,g[1])),g[2])A=i(ay,ax)
aR=m(w[1],A)if aR>0 then











Y=Z(d,q,w[1])+Z(g,q,w[1])

cE=aR
bl=cE/Y

R(d,q,e(w[1],-bl))R(g,q,e(w[1],bl))



ay=o(j(d[5],i(q,d[1])),d[2])ax=o(j(g[5],i(q,g[1])),g[2])A=i(ay,ax)
aR=m(w[1],A)
bz=i(A,e(w[1],aR))
bB=ai(bz,{0,0,0})if bB>.001 then
aQ=ar(bz)cv=Z(d,q,aQ)+Z(g,q,aQ)bQ=cw(bB/cv,bl)
R(d,q,e(aQ,-bQ))R(g,q,e(aQ,bQ))end





bG=w[2]/Y

bc(d,q,e(w[1],-bG))bc(g,q,e(w[1],bG))end





end
end
end
end


table.sort(E,function(a,b)return a[7]>b[7]end)

end



end

function onDraw()ap=screen
local ch,ci,cN,bF=ap.drawTriangleF,ap.drawTriangle,ap.drawRectF,ap.setColor
W=ap.getWidth()cA=ap.getHeight()z=W/2
as=cA/2
bh=cl(cD/2)*z













if bo then
for f=1,#E do
h=E[f]s=h[1]v=h[2]F=h[3]ai({s[1],s[2],v[1]},{0,0,0})bF(h[4],h[5],h[6])ch(s[1]+z,s[2]+as,v[1]+z,v[2]+as,F[1]+z,F[2]+as)bF(h[4]*.5,h[5]*.5,h[6]*.5)ci(s[1]+z,s[2]+as-.5,v[1]+z,v[2]+as-.5,F[1]+z,F[2]+as-.5)end




























































end
end