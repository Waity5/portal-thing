O=math
aN=O.max
bl=O.min
aK=math.sqrt
df=O.floor
cu=O.pi
de=input.getNumber
cE=input.getBool
cj=true
dg=false
bn=ipairs
cJ=O.abs
bJ=table.remove
ba=string
cn=O.sin
cH=O.cos
cm=O.tan
dl=O.atan
N=table.unpack
cb=O.huge

function aT(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aJ(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aO(a,c)return{a[1]*c,a[2]*c}end



function F(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end

function bt(a,c,E)return i(h(c,a),h(E,a))end
function bi(a)return g(a,1/aK(a[1]^2+a[2]^2+a[3]^2))end
function bp(a,c)return aK((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end

u={}be=1
da=3
Z=1

cB=cj
dd=0
bI=0
dk={0,-.4,0}aZ=62.5
cT=0
ce=cu/180
c_=5/aZ
cV=90*ce/aZ
cF=90*ce
bb=1
br=1/aZ

function av(aP,C)G=_ENV
while C~=0 do
C,P,cc,cI=N(u[5][aP])X,ap=G[cc],G[cI]

if C==1 then
G[P]=cc
elseif C==2 then
G[P][X]=ap
elseif C==3 then
G[P]=X[ap]elseif C==4 then
G[P]={}elseif C==5 then
G[P]=X-ap
elseif C==6 then
G[P]=X/ap
elseif C==7 then
G[P]=X(N(ap))elseif C==8 then
G[P]=#X
elseif C==9 then
if G[P]then
aP=X-1
end
elseif C==10 then
G[P]=X>ap
end

aP=aP+1
end
end

function aQ(b,ar,bY)bB=h(ar,b[1])return l(i(g(i(bB,bY),b[11]),bB),bY)+b[10]end

function cd(b,ar,au)bv=h(ar,b[1])b[4]=bz(b[4],g(i(bv,au),-b[11]))b[1]=F(b[1],g(au,b[10]))end

function aS(b,ar,au)bv=h(ar,b[1])
b[5]=F(b[5],g(i(bv,au),b[11]))b[2]=F(b[2],g(au,b[10]))end

function an(cs,k)local ag=-cb
for d,v in bn(cs)do
ao=l(v[2],k)if cJ(ao-ag)<.0005 then
aM[#aM+1]=d
elseif ao>ag then
ct=v[2]aM={d}ag=ao
end
end
return ct
end

function cD(bO,bN)k={1,0,0}z={}for dc=1,32 do
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)<=0 then
return
end

z={e,z[1],z[2],z[3]}
a,c,E,af=N(z)
if af then
J=h(c,a)aj=h(E,a)cg=h(af,a)A=g(a,-1)
Y=i(J,aj)ch=i(aj,cg)cf=i(cg,J)
if l(Y,A)>0 then
z={a,c,E}k=Y
elseif l(ch,A)>0 then
z={a,E,af}k=ch
elseif l(cf,A)>0 then
z={a,af,c}k=cf
else


ae={{a,c,E},{a,E,af},{a,af,c},{c,af,E}}for d,v in ipairs(ae)do
v[4]=bi(bt(v[1],v[2],v[3]))end

for db=1,32 do
ag=cb
for d,v in ipairs(ae)do
ao=l(v[1],v[4])if ao<ag then
ag=ao
ca=v
end
end
k=ca[4]
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)-.001<=ag then
return{ca[4],l(e,k)}end

at={}for d=#ae,1,-1 do
aR=ae[d]if l(aR[4],h(e,aR[1]))>0 then
for f=1,3 do
ax={aR[f],aR[(f%3)+1]}for ad,b_ in ipairs(at)do
if b_[1]==ax[2]and b_[2]==ax[1]then
bJ(at,ad)ax=cY
break
end
end

if ax then
at[#at+1]=ax
end
end



bJ(ae,d)end
end



for d,v in ipairs(at)do
as={v[1],v[2],e}as[4]=bi(bt(as[1],as[2],as[3]))




ae[#ae+1]=as
end
end
return
end
elseif E then
J=h(c,a)aj=h(E,a)A=g(a,-1)
Y=i(J,aj)
if l(i(Y,aj),A)>0 then
z={a,E}k=i(i(aj,A),aj)elseif l(i(J,Y),A)>0 then
z={a,c}k=i(i(J,A),J)else
if l(Y,A)>0 then

k=Y;
else
z={a,E,c}k=g(Y,-1)end
end
elseif c then
J=h(c,a)A=g(a,-1)
if l(J,A)>0 then
k=i(i(J,A),J)else
z={a}k=A
end
else
z={a}k=g(a,-1)end
end

end

function cU(D,I)I=I or{}bS={}f=1
for d=u[1][D][1],u[1][D][2]do
o=u[2][d]bS[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bR={}f=1
for d=u[1][D][3],u[1][D][4]do
o=u[3][d]bR[f]=o
f=f+1
end
bT={}f=1
for d=u[1][D][5],u[1][D][6]do
o=u[2][d]bT[f]={{o[1],o[2],o[3]},{}}f=f+1
end

cw={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bS,bR,bT,I[7]or 1,I[8]or 1,I[9]or{0,0,0},u[1][D][7],D,{},{},}ac[#ac+1]=cw
end

function i(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end

function l(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end

function ci(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bx=bp(S,{0,0,0})*.5
bw=g(S,1/bx)a_=cn(bx)return{cH(bx),bw[1]*a_,bw[2]*a_,bw[3]*a_}end
end

function bz(aL,S)local bj=cx(aL,ci(S))for d=1,4 do
bj[d]=aL[d]+bj[d]*.5
end
return cv(bj)end

function cx(cr,cq)local aD,x,w,aA=N(cr)local B,R,Q,az=N(cq)return{aD*B-x*R-w*Q-aA*az,aD*R+x*B+w*az-aA*Q,aD*Q-x*az+w*B+aA*R,aD*az+x*Q-w*R+aA*B}end

function bk(S,cz)local bQ={}for f=1,3 do
o=0
for ad=1,3 do
o=o+S[ad]*cz[f][ad]end
bQ[f]=o
end
return bQ
end













function cv(a,ay)ay=1/aK(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*ay,a[2]*ay,a[3]*ay,a[4]*ay}end

function cp(aL)local U,M,L,K=N(aL)return{{1-(2*L*L+2*K*K),2*M*L+2*K*U,2*M*K-2*L*U},{2*M*L-2*K*U,1-(2*M*M+2*K*K),2*L*K+2*M*U},{2*M*K+2*L*U,2*L*K-2*M*U,1-(2*M*M+2*L*L)},}end






function onTick()for f=1,1 do
if cE(32)and not bm then
bf=property.getText(be)d=1
H=""
o=ba.sub(bf,d,d)while o~=""do
bh=ba.byte(o)if bh<45 then
if bh>33 then
H=(H..bh-35)+0
end

if Z==1 then
bZ=H
u[H]=u[H]or{}elseif Z==2 then
cA=H
aw=0
elseif Z==3 then
bu=H
else
if aw==0 then
aw=cA
bu=bu-1
bs={}u[bZ][#u[bZ]+1]=bs
end
bs[#bs+1]=H
aw=aw-1
Z=aN(aw,bu)>0 and Z-1 or 0
end
Z=Z+1
H=""
else
H=H..o
end
d=d+1
o=ba.sub(bf,d,d)end
be=be+1
bm=bf==""
end
end

if bm then
bI=bI+1
if cB then
av(1)av(42)end

av(273)




aq={}
for D=1,#ac do
b=ac[D]b[4]=bz(b[4],g(b[5],-br))b[1]=F(b[1],g(b[2],br))b[2]=F(b[2],g(b[3],br))b[3]=g(b[12],1)


b[16]=cp(b[4])

for f=1,#b[9]do
e=b[9][f]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])
end
end



av(389)




for d,n in bn(ac)do
for f,r in bn(ac)do
if d~=f and(n[10]>0 or r[10]>0 or n[11]>0 or r[11]>0)and bp(n[1],r[1])<=n[13]+r[13]then

W=n[9]ai=r[9]
y=cD(W,ai)
if y then
cZ=n[15][f]or{}

an(W,y[1])V=aM
an(ai,g(y[1],-1))ah=aM






if#V==1 then
p=W[V[1]][2]elseif#ah==1 then
p=ai[ah[1]][2]elseif#V==2 and#ah==2 then
bq=h(W[V[2]][2],W[V[1]][2])bX=h(ai[ah[2]][2],ai[ah[1]][2])bP=i(bX,i(bq,bX))p=F(W[V[1]][2],g(bq,l(h(ai[ah[1]][2],W[V[1]][2]),bP)/l(bq,bP)))else
p=n[13]>r[13]and ai[ah[1]][2]or W[V[1]][2]end


aX=F(i(n[5],h(p,n[1])),n[2])aW=F(i(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(y[1],aI)if aH>0 then











bU=aQ(n,p,y[1])+aQ(r,p,y[1])

cG=aH
bg=cG/bU

aS(n,p,g(y[1],-bg))aS(r,p,g(y[1],bg))



aX=F(i(n[5],h(p,n[1])),n[2])aW=F(i(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(y[1],aI)
bG=h(aI,g(y[1],aH))
bH=bp(bG,{0,0,0})if bH>.001 then
aG=bi(bG)cy=aQ(n,p,aG)+aQ(r,p,aG)bW=bl(bH/cy,bg)
aS(n,p,g(aG,-bW))aS(r,p,g(aG,bW))end





bM=y[2]/bU

cd(n,p,g(y[1],-bM))cd(r,p,g(y[1],bM))end





end
end
end
end


for co=1,2 do
cW=co
av(1152)

for D=1,#ac do
b=ac[D]



for d=1,#b[7]do
e=b[7][d]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])e[3]=h(e[2],dj)
e[4]=bk(e[3],di)bo=e[3]e[7]=aK(bo[1]^2+bo[2]^2+bo[3]^2)
e[5]={e[4][1]*bb/e[4][3],-e[4][2]*bb/e[4][3]}e[6]=e[4][3]>0 and 1 or 0

end

if b[11]>0 or not b[8][1][8]then

for d=1,#b[8]do
j=b[8][d],1

j[8]=bt(b[7][j[1]][2],b[7][j[2]][2],b[7][j[3]][2])end
end

for d=1,#b[8]do
j=b[8][d]m=b[7][j[1]]q=b[7][j[2]]s=b[7][j[3]]j[7]=aN(m[7],q[7],s[7])a=j[8]c=m[3]if l(a,c)>0 then
ak=m[6]+q[6]+s[6]if ak==3 then

t={m[5],q[5],s[5]}elseif ak>=1 then
if m[6]==2-ak then
ab=m[5]aa=q[5]_=s[5]elseif q[6]==2-ak then
ab=q[5]aa=m[5]_=s[5]else
ab=s[5]aa=q[5]_=m[5]end
if ak==2 then
bd=aT(aO(aJ(aa,ab),1000),aa)bc=aT(aO(aJ(_,ab),1000),_)




t={_,aa,bd,bc}else
bd=aT(aO(aJ(ab,aa),1000),aa)bc=aT(aO(aJ(ab,_),1000),_)

t={ab,bc,bd}end
end

if ak>=1 then
m=t[1]q=t[2]s=t[3]
bE=bl(m[1],q[1],s[1])bD=aN(m[1],q[1],s[1])bC=bl(m[2],q[2],s[2])bF=aN(m[2],q[2],s[2])
if(bD>cM and bE<cL)and(bF>cK and bC<cN)then
if bE<cR or bD>cQ or bC<cP or bF>cS then
for f=1,#by do
x,w=N(by[f])R,Q=N(by[f%cO+1])T={}bL=#t
for ad=1,bL do
aY=t[ad]aC,aB=N(aY)aV,aU=N(t[ad%bL+1])aF=(R-x)*(aB-w)-(Q-w)*(aC-x)aE=(R-x)*(aU-w)-(Q-w)*(aV-x)if aF*aE<0 then
bA=((aV-aC)*(w-aB)-(aU-aB)*(x-aC))/((aU-aB)*(R-x)-(aV-aC)*(Q-w))bV={x+(bA*(R-x)),w+(bA*(Q-w))}end
if aF>0 and aE<0 then
T[#T+1]=aY
T[#T+1]=bV
elseif aF<0 and aE<0 then

elseif aF<0 and aE>0 then
T[#T+1]=bV
else
T[#T+1]=aY
end
end
t=T
end




end

aq[#aq+1]={t,j[4],j[5],j[6],j[7]*dh}end
end
end
end
end
end

table.sort(aq,function(a,c)return a[5]>c[5]end)

end



end

function onDraw()al=screen
local ck,cl,cX,bK=al.drawTriangleF,al.drawTriangle,al.drawRectF,al.setColor
U=al.getWidth()cC=al.getHeight()B=U/2
am=cC/2
bb=cm(cF/2)*B


























if bm then

for d=1,#aq do
j=aq[d]t=j[1]
m=t[1]for f=3,#t do
q=t[f-1]s=t[f]bK(j[2],j[3],j[4])ck(m[1]+B,m[2]+am,q[1]+B,q[2]+am,s[1]+B,s[2]+am)bK(j[2]*.5,j[3]*.5,j[4]*.5)cl(m[1]+B,m[2]+am-.5,q[1]+B,q[2]+am-.5,s[1]+B,s[2]+am-.5)end
end





























































end
end