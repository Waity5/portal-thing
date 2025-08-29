H=math
aw=H.max
aT=H.min
aO=math.sqrt
dt=H.floor
cB=H.pi
ds=input.getNumber
cM=input.getBool
cq=true
du=false
Z=ipairs
cS=H.abs
bf=string
ct=H.sin
cQ=H.cos
cs=H.tan
dD=H.atan
dE=H.asin
y=table.unpack
bR=table.remove
dk=table.move
ci=H.huge
function aY(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aN(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aS(a,c)return{a[1]*c,a[2]*c}end
function dy(a,c,v)return aT(aw(c,a),v)end
function E(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bA(a,c,v)return i(h(c,a),h(v,a))end
function bp(a)return g(a,1/aO(a[1]^2+a[2]^2+a[3]^2))end
function bw(a,c)return aO((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
P={}bk=1
dl=3
ad=1
cJ=cq
dr=0
bP=0
dC={0,5,-10}dB={0,0,0}bd=62.5
db=0
cl=cB/180
dj=5/bd
dd=90*cl/bd
cN=90*cl
bh=1
by=1/bd
function az(aU,D)F=_ENV
while D~=0 do
D,O,cj,cR=y(P[5][aU])ab,as=F[cj],F[cR]if D==1 then
F[O]=cj
elseif D==2 then
F[O][ab]=as
elseif D==3 then
F[O]=ab[as]elseif D==4 then
F[O]={}elseif D==5 then
F[O]=ab-as
elseif D==6 then
F[O]=ab/as
elseif D==7 then
F[O]=ab(y(as))elseif D==8 then
F[O]=#ab
elseif D==9 then
if F[O]then
aU=ab-1
end
elseif D==10 then
F[O]=ab>as
end
aU=aU+1
end
end
function aV(b,au,cd)bH=h(au,b[1])return n(i(g(i(bH,cd),b[11]),bH),cd)+b[10]end
function ck(b,au,ay)bC=h(au,b[1])b[4]=bF(b[4],g(i(bC,ay),-b[11]))b[1]=E(b[1],g(ay,b[10]))end
function aX(b,au,ay)bC=h(au,b[1])b[5]=E(b[5],g(i(bC,ay),b[11]))b[2]=E(b[2],g(ay,b[10]))end
function aq(cz,k)local al=-ci
for d,u in Z(cz)do
ar=n(u[2],k)if cS(ar-al)<.0005 then
aR[#aR+1]=d
elseif ar>al then
cA=u[2]aR={d}al=ar
end
end
return cA
end
function cL(bU,bT)k={1,0,0}B={}for dp=1,32 do
e=h(aq(bU,k),aq(bT,g(k,-1)))if n(e,k)<=0 then
return
end
B={e,B[1],B[2],B[3]}a,c,v,aj=y(B)if aj then
K=h(c,a)an=h(v,a)cn=h(aj,a)C=g(a,-1)ac=i(K,an)co=i(an,cn)cm=i(cn,K)if n(ac,C)>0 then
B={a,c,v}k=ac
elseif n(co,C)>0 then
B={a,v,aj}k=co
elseif n(cm,C)>0 then
B={a,aj,c}k=cm
else
ai={{a,c,v},{a,v,aj},{a,aj,c},{c,aj,v}}for d,u in ipairs(ai)do
u[4]=bp(bA(u[1],u[2],u[3]))end
for dn=1,32 do
al=ci
for d,u in ipairs(ai)do
ar=n(u[1],u[4])if ar<al then
al=ar
ch=u
end
end
k=ch[4]e=h(aq(bU,k),aq(bT,g(k,-1)))if n(e,k)-.001<=al then
return{ch[4],n(e,k)}end
ax={}for d=#ai,1,-1 do
aW=ai[d]if n(aW[4],h(e,aW[1]))>0 then
for f=1,3 do
aB={aW[f],aW[(f%3)+1]}for V,cg in ipairs(ax)do
if cg[1]==aB[2]and cg[2]==aB[1]then
bR(ax,V)aB=dh
break
end
end
if aB then
ax[#ax+1]=aB
end
end
bR(ai,d)end
end
for d,u in ipairs(ax)do
av={u[1],u[2],e}av[4]=bp(bA(av[1],av[2],av[3]))ai[#ai+1]=av
end
end
return
end
elseif v then
K=h(c,a)an=h(v,a)C=g(a,-1)ac=i(K,an)if n(i(ac,an),C)>0 then
B={a,v}k=i(i(an,C),an)elseif n(i(K,ac),C)>0 then
B={a,c}k=i(i(K,C),K)else
if n(ac,C)>0 then
k=ac;
else
B={a,v,c}k=g(ac,-1)end
end
elseif c then
K=h(c,a)C=g(a,-1)if n(K,C)>0 then
k=i(i(K,C),K)else
B={a}k=C
end
else
B={a}k=g(a,-1)end
end
end
function dc(W,I)I=I or{}ae=P[1][W]bY={}f=1
for d=ae[1],ae[2]do
p=P[2][d]bY[f]={{p[1],p[2],p[3]},{}}f=f+1
end
bX={}f=1
for d=ae[3],ae[4]do
p=P[3][d]bX[f]={y(p)}f=f+1
end
br={}for bs=6,#ae,2 do
bZ={}f=1
for d=ae[bs-1],ae[bs]do
p=P[2][d]bZ[f]={{p[1],p[2],p[3]},{}}f=f+1
end
br[#br+1]=bZ
end
cD={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bY,bX,br,I[7]or 1,I[8]or 1,I[9]or{0,0,0},P[1][W][7],W,{},{},}T[#T+1]=cD
end
function i(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function n(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function cp(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bE=bw(S,{0,0,0})*.5
bD=g(S,1/bE)be=ct(bE)return{cQ(bE),bD[1]*be,bD[2]*be,bD[3]*be}end
end
function bF(aQ,S)local bq=cE(aQ,cp(S))for d=1,4 do
bq[d]=aQ[d]+bq[d]*.5
end
return cC(bq)end
function cE(cy,cx)local aH,x,w,aE=y(cy)local s,R,Q,aD=y(cx)return{aH*s-x*R-w*Q-aE*aD,aH*R+x*s+w*aD-aE*Q,aH*Q-x*aD+w*s+aE*R,aH*aD+x*Q-w*R+aE*s}end
function bt(S,cG)local bW={}for f=1,3 do
p=0
for V=1,3 do
p=p+S[V]*cG[f][V]end
bW[f]=p
end
return bW
end
function cC(a,aC)aC=1/aO(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aC,a[2]*aC,a[3]*aC,a[4]*aC}end
function cw(aQ)local Y,N,M,L=y(aQ)return{{1-(2*M*M+2*L*L),2*N*M+2*L*Y,2*N*L-2*M*Y},{2*N*M-2*L*Y,1-(2*N*N+2*L*L),2*M*L+2*N*Y},{2*N*L+2*M*Y,2*M*L-2*N*Y,1-(2*N*N+2*M*M)},}end
function onTick()for f=1,1 do
if cM(32)and not bu then
bl=property.getText(bk)d=1
G=""
p=bf.sub(bl,d,d)while p~=""do
bo=bf.byte(p)if bo<45 then
if bo>33 then
G=(G..bo-35)+0
end
if ad==1 then
cf=G
P[G]=P[G]or{}elseif ad==2 then
cI=G
aA=0
elseif ad==3 then
bB=G
else
if aA==0 then
aA=cI
bB=bB-1
bz={}P[cf][#P[cf]+1]=bz
end
bz[#bz+1]=G
aA=aA-1
ad=aw(aA,bB)>0 and ad-1 or 0
end
ad=ad+1
G=""
else
G=G..p
end
d=d+1
p=bf.sub(bl,d,d)end
bk=bk+1
bu=bl==""
end
end
if bu then
bP=bP+1
if cJ then
az(1)az(57)end
az(187)cP={}for W=1,#T do
b=T[W]b[4]=bF(b[4],g(b[5],-by))b[1]=E(b[1],g(b[2],by))b[2]=E(b[2],g(b[3],by))b[3]=g(b[12],1)b[16]=cw(b[4])for f,J in Z(b[9])do
for V,e in Z(J)do
e[2]=bt(e[1],b[16])e[2]=E(e[2],b[1])end
end
end
az(325)for d,o in Z(T)do
for f,r in Z(T)do
if d~=f and(o[10]>0 or r[10]>0 or o[11]>0 or r[11]>0)and bw(o[1],r[1])<=o[13]+r[13]then
for V,J in Z(o[9])do
for bs,aa in Z(r[9])do
if#J>0 and#aa>0 then
A=cL(J,aa)if A then
di=o[15][f]or{}aq(J,A[1])_=aR
aq(aa,g(A[1],-1))am=aR
if#_==1 then
q=J[_[1]][2]elseif#am==1 then
q=aa[am[1]][2]elseif#_==2 and#am==2 then
bx=h(J[_[2]][2],J[_[1]][2])cc=h(aa[am[2]][2],aa[am[1]][2])bV=i(cc,i(bx,cc))q=E(J[_[1]][2],g(bx,n(h(aa[am[1]][2],J[_[1]][2]),bV)/n(bx,bV)))else
q=o[13]>r[13]and aa[am[1]][2]or J[_[1]][2]end
bb=E(i(o[5],h(q,o[1])),o[2])ba=E(i(r[5],h(q,r[1])),r[2])aM=h(bb,ba)aL=n(A[1],aM)if aL>0 then
b_=aV(o,q,A[1])+aV(r,q,A[1])cO=aL
bn=cO/b_
aX(o,q,g(A[1],-bn))aX(r,q,g(A[1],bn))bb=E(i(o[5],h(q,o[1])),o[2])ba=E(i(r[5],h(q,r[1])),r[2])aM=h(bb,ba)aL=n(A[1],aM)bN=h(aM,g(A[1],aL))bO=bw(bN,{0,0,0})if bO>.001 then
aK=bp(bN)cF=aV(o,q,aK)+aV(r,q,aK)cb=aT(bO/cF,bn*.5)aX(o,q,g(aK,-cb))aX(r,q,g(aK,cb))end
bS=A[2]/b_
ck(o,q,g(A[1],-bS))ck(r,q,g(A[1],bS))end
end
end
end
end
end
end
end
for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[2]=bt(e[1],b[16])e[2]=E(e[2],b[1])end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
t=b[8][d]t[8]=bA(b[7][t[1]][2],b[7][t[2]][2],b[7][t[3]][2])end
end
end
az(722)end
end
function de()bm={}for W=1,#T do
b=T[W]if b~=dg or dq>1 then
for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dA)e[4]=bt(e[3],dz)bv=e[3]e[7]=aO(bv[1]^2+bv[2]^2+bv[3]^2)e[5]={e[4][1]*bh/e[4][3],-e[4][2]*bh/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
t=b[8][d]j=b[7][t[1]]l=b[7][t[2]]m=b[7][t[3]]t[7]=aw(j[7],l[7],m[7])c=j[3]if n(t[8],c)>0 and t[7]>dx then
ao=j[6]+l[6]+m[6]if ao==3 then
z={j[5],l[5],m[5]}elseif ao>=1 then
if j[6]==2-ao then
ah=j[5]ag=l[5]af=m[5]elseif l[6]==2-ao then
ah=l[5]ag=j[5]af=m[5]else
ah=m[5]ag=l[5]af=j[5]end
if ao==2 then
bj=aY(aS(aN(ag,ah),1000),ag)bi=aY(aS(aN(af,ah),1000),af)z={af,ag,bj,bi}else
bj=aY(aS(aN(ah,ag),1000),ag)bi=aY(aS(aN(ah,af),1000),af)z={ah,bi,bj}end
end
if ao>=1 then
j=z[1]l=z[2]m=z[3]bL=aT(j[1],l[1],m[1])bK=aw(j[1],l[1],m[1])bJ=aT(j[2],l[2],m[2])bM=aw(j[2],l[2],m[2])if(bK>cV and bL<cU)and(bM>cT and bJ<cW)then
if bL<cZ or bK>cY or bJ<cX or bM>c_ then
z=cH(z,da)end
bm[#bm+1]={z,t[4],t[5],t[6],t[7]*dv+dw}end
end
end
end
end
end
table.sort(bm,function(a,c)return a[5]>c[5]end)end
function cH(at,aP)cu=#aP
for f=1,#aP do
x,w=y(aP[f])R,Q=y(aP[f%cu+1])U={}bQ=#at
for V=1,bQ do
bc=at[V]aG,aF=y(bc)a_,aZ=y(at[V%bQ+1])aJ=(R-x)*(aF-w)-(Q-w)*(aG-x)aI=(R-x)*(aZ-w)-(Q-w)*(a_-x)if aJ*aI<0 then
bG=((a_-aG)*(w-aF)-(aZ-aF)*(x-aG))/((aZ-aF)*(R-x)-(a_-aG)*(Q-w))ca={x+(bG*(R-x)),w+(bG*(Q-w))}end
if aJ>0 and aI<0 then
U[#U+1]=bc
U[#U+1]=ca
elseif aJ<0 and aI<0 then
elseif aJ<0 and aI>0 then
U[#U+1]=ca
else
U[#U+1]=bc
end
end
at=U
end
return at
end
function onDraw()ap=screen
local bI,cr,df,bg=ap.drawTriangleF,ap.drawTriangle,ap.drawRectF,ap.setColor
Y=ap.getWidth()cK=ap.getHeight()s=Y/2
X=cK/2
bh=cs(cN/2)*s
if bu then
for d=1,#cv do
ak=cv[d]z=ak[1]j=z[1]for f=3,#z do
l=z[f-1]m=z[f]bg(ak[2],ak[3],ak[4])bI(j[1]+s,j[2]+X,l[1]+s,l[2]+X,m[1]+s,m[2]+X)bg(ak[2]*.5,ak[3]*.5,ak[4]*.5)cr(j[1]+s,j[2]+X-.5,l[1]+s,l[2]+X-.5,m[1]+s,m[2]+X-.5)end
end
for d,ce in Z(cP)do
j,l,m=y(ce)dm=bg(y(ce[4]))bI(j[1]+s,j[2]+X,l[1]+s,l[2]+X,m[1]+s,m[2]+X)end
end
end