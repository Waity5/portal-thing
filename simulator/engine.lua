G=math
ar=G.max
aQ=G.min
aL=math.sqrt
dk=G.floor
ct=G.pi
dj=input.getNumber
cD=input.getBool
cj=true
dl=false
T=ipairs
cJ=G.abs
bd=string
cl=G.sin
cH=G.cos
ck=G.tan
dw=G.atan
dx=G.asin
B=table.unpack
bN=table.remove
dc=table.move
cb=G.huge
function aW(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aK(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aP(a,c)return{a[1]*c,a[2]*c}end
function dr(a,c,t)return aQ(ar(c,a),t)end
function D(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function g(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function f(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bv(a,c,t)return h(g(c,a),g(t,a))end
function bm(a)return f(a,1/aL(a[1]^2+a[2]^2+a[3]^2))end
function br(a,c)return aL((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
az={}bh=1
dd=3
Z=1
cA=cj
di=0
bK=0
dv={0,5,-10}du={0,0,0}bb=62.5
cT=0
ce=ct/180
db=5/bb
cV=90*ce/bb
cE=90*ce
be=1
bt=1/bb
function av(aR,C)E=_ENV
while C~=0 do
C,M,cc,cI=B(az[5][aR])X,an=E[cc],E[cI]if C==1 then
E[M]=cc
elseif C==2 then
E[M][X]=an
elseif C==3 then
E[M]=X[an]elseif C==4 then
E[M]={}elseif C==5 then
E[M]=X-an
elseif C==6 then
E[M]=X/an
elseif C==7 then
E[M]=X(B(an))elseif C==8 then
E[M]=#X
elseif C==9 then
if E[M]then
aR=X-1
end
elseif C==10 then
E[M]=X>an
end
aR=aR+1
end
end
function aS(b,ap,bX)bC=g(ap,b[1])return k(h(f(h(bC,bX),b[11]),bC),bX)+b[10]end
function cd(b,ap,au)bx=g(ap,b[1])b[4]=bA(b[4],f(h(bx,au),-b[11]))b[1]=D(b[1],f(au,b[10]))end
function aV(b,ap,au)bx=g(ap,b[1])b[5]=D(b[5],f(h(bx,au),b[11]))b[2]=D(b[2],f(au,b[10]))end
function al(cr,i)local af=-cb
for d,s in T(cr)do
am=k(s[2],i)if cJ(am-af)<.0005 then
aO[#aO+1]=d
elseif am>af then
cs=s[2]aO={d}af=am
end
end
return cs
end
function cC(bQ,bP)i={1,0,0}y={}for dg=1,32 do
e=g(al(bQ,i),al(bP,f(i,-1)))if k(e,i)<=0 then
return
end
y={e,y[1],y[2],y[3]}a,c,t,ae=B(y)if ae then
I=g(c,a)ah=g(t,a)cg=g(ae,a)z=f(a,-1)Y=h(I,ah)ch=h(ah,cg)cf=h(cg,I)if k(Y,z)>0 then
y={a,c,t}i=Y
elseif k(ch,z)>0 then
y={a,t,ae}i=ch
elseif k(cf,z)>0 then
y={a,ae,c}i=cf
else
ad={{a,c,t},{a,t,ae},{a,ae,c},{c,ae,t}}for d,s in ipairs(ad)do
s[4]=bm(bv(s[1],s[2],s[3]))end
for df=1,32 do
af=cb
for d,s in ipairs(ad)do
am=k(s[1],s[4])if am<af then
af=am
ca=s
end
end
i=ca[4]e=g(al(bQ,i),al(bP,f(i,-1)))if k(e,i)-.001<=af then
return{ca[4],k(e,i)}end
as={}for d=#ad,1,-1 do
aU=ad[d]if k(aU[4],g(e,aU[1]))>0 then
for p=1,3 do
ax={aU[p],aU[(p%3)+1]}for R,b_ in ipairs(as)do
if b_[1]==ax[2]and b_[2]==ax[1]then
bN(as,R)ax=cZ
break
end
end
if ax then
as[#as+1]=ax
end
end
bN(ad,d)end
end
for d,s in ipairs(as)do
aq={s[1],s[2],e}aq[4]=bm(bv(aq[1],aq[2],aq[3]))ad[#ad+1]=aq
end
end
return
end
elseif t then
I=g(c,a)ah=g(t,a)z=f(a,-1)Y=h(I,ah)if k(h(Y,ah),z)>0 then
y={a,t}i=h(h(ah,z),ah)elseif k(h(I,Y),z)>0 then
y={a,c}i=h(h(I,z),I)else
if k(Y,z)>0 then
i=Y;
else
y={a,t,c}i=f(Y,-1)end
end
elseif c then
I=g(c,a)z=f(a,-1)if k(I,z)>0 then
i=h(h(I,z),I)else
y={a}i=z
end
else
y={a}i=f(a,-1)end
end
end
function h(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function k(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function ci(P)if P[1]==0 and P[2]==0 and P[3]==0 then
return{1,0,0,0}else
bz=br(P,{0,0,0})*.5
by=f(P,1/bz)bc=cl(bz)return{cH(bz),by[1]*bc,by[2]*bc,by[3]*bc}end
end
function bA(aN,P)local bn=cv(aN,ci(P))for d=1,4 do
bn[d]=aN[d]+bn[d]*.5
end
return cu(bn)end
function cv(cq,cp)local aE,v,u,aB=B(cq)local A,O,N,aA=B(cp)return{aE*A-v*O-u*N-aB*aA,aE*O+v*A+u*aA-aB*N,aE*N-v*aA+u*A+aB*O,aE*aA+v*N-u*O+aB*A}end
function bo(P,cx)local bS={}for p=1,3 do
U=0
for R=1,3 do
U=U+P[R]*cx[p][R]end
bS[p]=U
end
return bS
end
function cu(a,ay)ay=1/aL(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*ay,a[2]*ay,a[3]*ay,a[4]*ay}end
function co(aN)local S,L,K,J=B(aN)return{{1-(2*K*K+2*J*J),2*L*K+2*J*S,2*L*J-2*K*S},{2*L*K-2*J*S,1-(2*L*L+2*J*J),2*K*J+2*L*S},{2*L*J+2*K*S,2*K*J-2*L*S,1-(2*L*L+2*K*K)},}end
function onTick()for p=1,1 do
if cD(32)and not bp then
bi=property.getText(bh)d=1
F=""
U=bd.sub(bi,d,d)while U~=""do
bl=bd.byte(U)if bl<45 then
if bl<33 then
F=(F..bl-19)+0
end
if Z==1 then
bZ=F
az[F]=az[F]or{}elseif Z==2 then
cz=F
aw=0
elseif Z==3 then
bw=F
else
if aw==0 then
aw=cz
bw=bw-1
bu={}az[bZ][#az[bZ]+1]=bu
end
bu[#bu+1]=F
aw=aw-1
Z=ar(aw,bw)>0 and Z-1 or 0
end
Z=Z+1
F=""
else
F=F..U
end
d=d+1
U=bd.sub(bi,d,d)end
bh=bh+1
bp=bi==""
end
end
if bp then
bK=bK+1
if cA then
av(1)av(77)end
av(204)cG={}for at=1,#ac do
b=ac[at]b[4]=bA(b[4],f(b[5],-bt))b[1]=D(b[1],f(b[2],bt))b[2]=D(b[2],f(b[3],bt))b[3]=f(b[12],1)b[16]=co(b[4])for p,H in T(b[9])do
for R,e in T(H)do
e[2]=bo(e[1],b[16])e[2]=D(e[2],b[1])end
end
end
av(386)for d,m in T(ac)do
if m[10]>0 or m[11]>0 then
for p,q in T(ac)do
if d~=p and br(m[1],q[1])<=m[13]+q[13]then
for R,H in T(m[9])do
for da,W in T(q[9])do
if#H>0 and#W>0 then
x=cC(H,W)if x then
c_=m[15][p]or{}al(H,x[1])V=aO
al(W,f(x[1],-1))ag=aO
if#V==1 then
n=H[V[1]][2]elseif#ag==1 then
n=W[ag[1]][2]elseif#V==2 and#ag==2 then
bs=g(H[V[2]][2],H[V[1]][2])bW=g(W[ag[2]][2],W[ag[1]][2])bR=h(bW,h(bs,bW))n=D(H[V[1]][2],f(bs,k(g(W[ag[1]][2],H[V[1]][2]),bR)/k(bs,bR)))else
n=m[13]>q[13]and W[ag[1]][2]or H[V[1]][2]end
a_=D(h(m[5],g(n,m[1])),m[2])aZ=D(h(q[5],g(n,q[1])),q[2])aJ=g(a_,aZ)aI=k(x[1],aJ)if aI>0 then
bT=aS(m,n,x[1])+aS(q,n,x[1])cF=aI
bk=cF/bT
aV(m,n,f(x[1],-bk))aV(q,n,f(x[1],bk))a_=D(h(m[5],g(n,m[1])),m[2])aZ=D(h(q[5],g(n,q[1])),q[2])aJ=g(a_,aZ)aI=k(x[1],aJ)bI=g(aJ,f(x[1],aI))bJ=br(bI,{0,0,0})if bJ>.001 then
aH=bm(bI)cw=aS(m,n,aH)+aS(q,n,aH)bV=aQ(bJ/cw,bk*dq)aV(m,n,f(aH,-bV))aV(q,n,f(aH,bV))end
bO=x[2]/bT
cd(m,n,f(x[1],-bO))cd(q,n,f(x[1],bO))end
end
end
end
end
end
end
end
end
for at=1,#ac do
b=ac[at]for d=1,#b[7]do
e=b[7][d]e[2]=bo(e[1],b[16])e[2]=D(e[2],b[1])end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
r=b[8][d]r[8]=bv(b[7][r[1]][2],b[7][r[2]][2],b[7][r[3]][2])end
end
end
av(783)end
end
function cW()bj={}for at=1,#ac do
b=ac[at]if b~=cY or dh>1 then
for d=1,#b[7]do
e=b[7][d]e[3]=g(e[2],dt)e[4]=bo(e[3],ds)bq=e[3]e[7]=aL(bq[1]^2+bq[2]^2+bq[3]^2)e[5]={e[4][1]*be/e[4][3],-e[4][2]*be/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
r=b[8][d]j=b[7][r[1]]l=b[7][r[2]]o=b[7][r[3]]r[7]=ar(j[7],l[7],o[7])c=j[3]if k(r[8],c)>0 and r[7]>dp then
ai=j[6]+l[6]+o[6]if ai==3 then
w={j[5],l[5],o[5]}elseif ai>=1 then
if j[6]==2-ai then
ab=j[5]aa=l[5]_=o[5]elseif l[6]==2-ai then
ab=l[5]aa=j[5]_=o[5]else
ab=o[5]aa=l[5]_=j[5]end
if ai==2 then
bg=aW(aP(aK(aa,ab),1000),aa)bf=aW(aP(aK(_,ab),1000),_)w={_,aa,bg,bf}else
bg=aW(aP(aK(ab,aa),1000),aa)bf=aW(aP(aK(ab,_),1000),_)w={ab,bf,bg}end
end
if ai>=1 then
j=w[1]l=w[2]o=w[3]bG=aQ(j[1],l[1],o[1])bF=ar(j[1],l[1],o[1])bE=aQ(j[2],l[2],o[2])bH=ar(j[2],l[2],o[2])if(bF>cM and bG<cL)and(bH>cK and bE<cN)then
if bG<cQ or bF>cP or bE<cO or bH>cR then
w=cy(w,cS)end
bj[#bj+1]={w,r[4],r[5],r[6],r[7]*dm+dn}end
end
end
end
end
end
table.sort(bj,function(a,c)return a[5]>c[5]end)end
function cy(ao,aM)cm=#aM
for p=1,#aM do
v,u=B(aM[p])O,N=B(aM[p%cm+1])Q={}bM=#ao
for R=1,bM do
ba=ao[R]aD,aC=B(ba)aY,aX=B(ao[R%bM+1])aG=(O-v)*(aC-u)-(N-u)*(aD-v)aF=(O-v)*(aX-u)-(N-u)*(aY-v)if aG*aF<0 then
bB=((aY-aD)*(u-aC)-(aX-aC)*(v-aD))/((aX-aC)*(O-v)-(aY-aD)*(N-u))bU={v+(bB*(O-v)),u+(bB*(N-u))}end
if aG>0 and aF<0 then
Q[#Q+1]=ba
Q[#Q+1]=bU
elseif aG<0 and aF<0 then
elseif aG<0 and aF>0 then
Q[#Q+1]=bU
else
Q[#Q+1]=ba
end
end
ao=Q
end
return ao
end
function onDraw()aj=screen
local bD,cU,cX,bL=aj.drawTriangleF,aj.drawTriangle,aj.drawRectF,aj.setColor
S=aj.getWidth()cB=aj.getHeight()A=S/2
ak=cB/2
be=ck(cE/2)*A
if bp then
for d=1,#cn do
aT=cn[d]w=aT[1]j=w[1]for p=3,#w do
l=w[p-1]o=w[p]bL(aT[2],aT[3],aT[4])bD(j[1]+A,j[2]+ak,l[1]+A,l[2]+ak,o[1]+A,o[2]+ak)end
end
for d,bY in T(cG)do
j,l,o=B(bY)de=bL(B(bY[4]))bD(j[1]+A,j[2]+ak,l[1]+A,l[2]+ak,o[1]+A,o[2]+ak)end
end
end