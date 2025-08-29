H=math
aw=H.max
aT=H.min
aO=math.sqrt
dq=H.floor
cz=H.pi
dp=input.getNumber
cK=input.getBool
cp=true
dr=false
Z=ipairs
cQ=H.abs
bf=string
cs=H.sin
cO=H.cos
cr=H.tan
dA=H.atan
dB=H.asin
y=table.unpack
bQ=table.remove
ch=H.huge
function aY(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aN(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aS(a,c)return{a[1]*c,a[2]*c}end
function dv(a,c,v)return aT(aw(c,a),v)end
function E(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bz(a,c,v)return j(h(c,a),h(v,a))end
function bo(a)return g(a,1/aO(a[1]^2+a[2]^2+a[3]^2))end
function bv(a,c)return aO((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
P={}bk=1
di=3
ad=1
cH=cp
dn=0
bO=0
dz={0,5,-10}dy={0,0,0}bd=62.5
c_=0
ck=cz/180
dh=5/bd
db=90*ck/bd
cL=90*ck
bh=1
bx=1/bd
function az(aU,D)F=_ENV
while D~=0 do
D,O,ci,cP=y(P[5][aU])ab,ar=F[ci],F[cP]if D==1 then
F[O]=ci
elseif D==2 then
F[O][ab]=ar
elseif D==3 then
F[O]=ab[ar]elseif D==4 then
F[O]={}elseif D==5 then
F[O]=ab-ar
elseif D==6 then
F[O]=ab/ar
elseif D==7 then
F[O]=ab(y(ar))elseif D==8 then
F[O]=#ab
elseif D==9 then
if F[O]then
aU=ab-1
end
elseif D==10 then
F[O]=ab>ar
end
aU=aU+1
end
end
function aV(b,au,cc)bG=h(au,b[1])return o(j(g(j(bG,cc),b[11]),bG),cc)+b[10]end
function cj(b,au,ay)bB=h(au,b[1])b[4]=bE(b[4],g(j(bB,ay),-b[11]))b[1]=E(b[1],g(ay,b[10]))end
function aX(b,au,ay)bB=h(au,b[1])b[5]=E(b[5],g(j(bB,ay),b[11]))b[2]=E(b[2],g(ay,b[10]))end
function ap(cx,l)local ak=-ch
for d,u in Z(cx)do
aq=o(u[2],l)if cQ(aq-ak)<.0005 then
aR[#aR+1]=d
elseif aq>ak then
cy=u[2]aR={d}ak=aq
end
end
return cy
end
function cJ(bT,bS)l={1,0,0}B={}for dl=1,32 do
e=h(ap(bT,l),ap(bS,g(l,-1)))if o(e,l)<=0 then
return
end
B={e,B[1],B[2],B[3]}a,c,v,aj=y(B)if aj then
K=h(c,a)am=h(v,a)cm=h(aj,a)C=g(a,-1)ac=j(K,am)cn=j(am,cm)cl=j(cm,K)if o(ac,C)>0 then
B={a,c,v}l=ac
elseif o(cn,C)>0 then
B={a,v,aj}l=cn
elseif o(cl,C)>0 then
B={a,aj,c}l=cl
else
ai={{a,c,v},{a,v,aj},{a,aj,c},{c,aj,v}}for d,u in ipairs(ai)do
u[4]=bo(bz(u[1],u[2],u[3]))end
for dk=1,32 do
ak=ch
for d,u in ipairs(ai)do
aq=o(u[1],u[4])if aq<ak then
ak=aq
cg=u
end
end
l=cg[4]e=h(ap(bT,l),ap(bS,g(l,-1)))if o(e,l)-.001<=ak then
return{cg[4],o(e,l)}end
ax={}for d=#ai,1,-1 do
aW=ai[d]if o(aW[4],h(e,aW[1]))>0 then
for f=1,3 do
aB={aW[f],aW[(f%3)+1]}for V,cf in ipairs(ax)do
if cf[1]==aB[2]and cf[2]==aB[1]then
bQ(ax,V)aB=df
break
end
end
if aB then
ax[#ax+1]=aB
end
end
bQ(ai,d)end
end
for d,u in ipairs(ax)do
av={u[1],u[2],e}av[4]=bo(bz(av[1],av[2],av[3]))ai[#ai+1]=av
end
end
return
end
elseif v then
K=h(c,a)am=h(v,a)C=g(a,-1)ac=j(K,am)if o(j(ac,am),C)>0 then
B={a,v}l=j(j(am,C),am)elseif o(j(K,ac),C)>0 then
B={a,c}l=j(j(K,C),K)else
if o(ac,C)>0 then
l=ac;
else
B={a,v,c}l=g(ac,-1)end
end
elseif c then
K=h(c,a)C=g(a,-1)if o(K,C)>0 then
l=j(j(K,C),K)else
B={a}l=C
end
else
B={a}l=g(a,-1)end
end
end
function da(W,I)I=I or{}ae=P[1][W]bX={}f=1
for d=ae[1],ae[2]do
q=P[2][d]bX[f]={{q[1],q[2],q[3]},{}}f=f+1
end
bW={}f=1
for d=ae[3],ae[4]do
q=P[3][d]bW[f]={y(q)}f=f+1
end
bq={}for br=6,#ae,2 do
bY={}f=1
for d=ae[br-1],ae[br]do
q=P[2][d]bY[f]={{q[1],q[2],q[3]},{}}f=f+1
end
bq[#bq+1]=bY
end
cB={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bX,bW,bq,I[7]or 1,I[8]or 1,I[9]or{0,0,0},P[1][W][7],W,{},{},}T[#T+1]=cB
end
function j(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function o(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function co(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bD=bv(S,{0,0,0})*.5
bC=g(S,1/bD)be=cs(bD)return{cO(bD),bC[1]*be,bC[2]*be,bC[3]*be}end
end
function bE(aQ,S)local bp=cC(aQ,co(S))for d=1,4 do
bp[d]=aQ[d]+bp[d]*.5
end
return cA(bp)end
function cC(cw,cv)local aH,x,w,aE=y(cw)local t,R,Q,aD=y(cv)return{aH*t-x*R-w*Q-aE*aD,aH*R+x*t+w*aD-aE*Q,aH*Q-x*aD+w*t+aE*R,aH*aD+x*Q-w*R+aE*t}end
function bs(S,cE)local bV={}for f=1,3 do
q=0
for V=1,3 do
q=q+S[V]*cE[f][V]end
bV[f]=q
end
return bV
end
function cA(a,aC)aC=1/aO(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aC,a[2]*aC,a[3]*aC,a[4]*aC}end
function cu(aQ)local Y,N,M,L=y(aQ)return{{1-(2*M*M+2*L*L),2*N*M+2*L*Y,2*N*L-2*M*Y},{2*N*M-2*L*Y,1-(2*N*N+2*L*L),2*M*L+2*N*Y},{2*N*L+2*M*Y,2*M*L-2*N*Y,1-(2*N*N+2*M*M)},}end
function onTick()for f=1,1 do
if cK(32)and not bt then
bl=property.getText(bk)d=1
G=""
q=bf.sub(bl,d,d)while q~=""do
bn=bf.byte(q)if bn<45 then
if bn>33 then
G=(G..bn-35)+0
end
if ad==1 then
ce=G
P[G]=P[G]or{}elseif ad==2 then
cG=G
aA=0
elseif ad==3 then
bA=G
else
if aA==0 then
aA=cG
bA=bA-1
by={}P[ce][#P[ce]+1]=by
end
by[#by+1]=G
aA=aA-1
ad=aw(aA,bA)>0 and ad-1 or 0
end
ad=ad+1
G=""
else
G=G..q
end
d=d+1
q=bf.sub(bl,d,d)end
bk=bk+1
bt=bl==""
end
end
if bt then
bO=bO+1
if cH then
az(1)az(48)end
az(178)at={}cN={}for W=1,#T do
b=T[W]b[4]=bE(b[4],g(b[5],-bx))b[1]=E(b[1],g(b[2],bx))b[2]=E(b[2],g(b[3],bx))b[3]=g(b[12],1)b[16]=cu(b[4])for f,J in Z(b[9])do
for V,e in Z(J)do
e[2]=bs(e[1],b[16])e[2]=E(e[2],b[1])end
end
end
az(316)for d,p in Z(T)do
for f,s in Z(T)do
if d~=f and(p[10]>0 or s[10]>0 or p[11]>0 or s[11]>0)and bv(p[1],s[1])<=p[13]+s[13]then
for V,J in Z(p[9])do
for br,aa in Z(s[9])do
if#J>0 and#aa>0 then
A=cJ(J,aa)if A then
dg=p[15][f]or{}ap(J,A[1])_=aR
ap(aa,g(A[1],-1))al=aR
if#_==1 then
r=J[_[1]][2]elseif#al==1 then
r=aa[al[1]][2]elseif#_==2 and#al==2 then
bw=h(J[_[2]][2],J[_[1]][2])cb=h(aa[al[2]][2],aa[al[1]][2])bU=j(cb,j(bw,cb))r=E(J[_[1]][2],g(bw,o(h(aa[al[1]][2],J[_[1]][2]),bU)/o(bw,bU)))else
r=p[13]>s[13]and aa[al[1]][2]or J[_[1]][2]end
bb=E(j(p[5],h(r,p[1])),p[2])ba=E(j(s[5],h(r,s[1])),s[2])aM=h(bb,ba)aL=o(A[1],aM)if aL>0 then
bZ=aV(p,r,A[1])+aV(s,r,A[1])cM=aL
bm=cM/bZ
aX(p,r,g(A[1],-bm))aX(s,r,g(A[1],bm))bb=E(j(p[5],h(r,p[1])),p[2])ba=E(j(s[5],h(r,s[1])),s[2])aM=h(bb,ba)aL=o(A[1],aM)bM=h(aM,g(A[1],aL))bN=bv(bM,{0,0,0})if bN>.001 then
aK=bo(bM)cD=aV(p,r,aK)+aV(s,r,aK)ca=aT(bN/cD,bm*.5)aX(p,r,g(aK,-ca))aX(s,r,g(aK,ca))end
bR=A[2]/bZ
cj(p,r,g(A[1],-bR))cj(s,r,g(A[1],bR))end
end
end
end
end
end
end
end
for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[2]=bs(e[1],b[16])e[2]=E(e[2],b[1])end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
i=b[8][d]i[8]=bz(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end
end
az(713)table.sort(at,function(a,c)return a[5]>c[5]end)end
end
function dc()for W=1,#T do
b=T[W]if b~=de or dm>1 then
for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dx)e[4]=bs(e[3],dw)bu=e[3]e[7]=aO(bu[1]^2+bu[2]^2+bu[3]^2)e[5]={e[4][1]*bh/e[4][3],-e[4][2]*bh/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
i=b[8][d]k=b[7][i[1]]m=b[7][i[2]]n=b[7][i[3]]i[7]=aw(k[7],m[7],n[7])c=k[3]if o(i[8],c)>0 and i[7]>du then
an=k[6]+m[6]+n[6]if an==3 then
z={k[5],m[5],n[5]}elseif an>=1 then
if k[6]==2-an then
ah=k[5]ag=m[5]af=n[5]elseif m[6]==2-an then
ah=m[5]ag=k[5]af=n[5]else
ah=n[5]ag=m[5]af=k[5]end
if an==2 then
bj=aY(aS(aN(ag,ah),1000),ag)bi=aY(aS(aN(af,ah),1000),af)z={af,ag,bj,bi}else
bj=aY(aS(aN(ah,ag),1000),ag)bi=aY(aS(aN(ah,af),1000),af)z={ah,bi,bj}end
end
if an>=1 then
k=z[1]m=z[2]n=z[3]bK=aT(k[1],m[1],n[1])bJ=aw(k[1],m[1],n[1])bI=aT(k[2],m[2],n[2])bL=aw(k[2],m[2],n[2])if(bJ>cT and bK<cS)and(bL>cR and bI<cU)then
if bK<cX or bJ>cW or bI<cV or bL>cY then
z=cF(z,cZ)end
at[#at+1]={z,i[4],i[5],i[6],i[7]*ds+dt}end
end
end
end
end
end
end
function cF(as,aP)ct=#aP
for f=1,#aP do
x,w=y(aP[f])R,Q=y(aP[f%ct+1])U={}bP=#as
for V=1,bP do
bc=as[V]aG,aF=y(bc)a_,aZ=y(as[V%bP+1])aJ=(R-x)*(aF-w)-(Q-w)*(aG-x)aI=(R-x)*(aZ-w)-(Q-w)*(a_-x)if aJ*aI<0 then
bF=((a_-aG)*(w-aF)-(aZ-aF)*(x-aG))/((aZ-aF)*(R-x)-(a_-aG)*(Q-w))b_={x+(bF*(R-x)),w+(bF*(Q-w))}end
if aJ>0 and aI<0 then
U[#U+1]=bc
U[#U+1]=b_
elseif aJ<0 and aI<0 then
elseif aJ<0 and aI>0 then
U[#U+1]=b_
else
U[#U+1]=bc
end
end
as=U
end
return as
end
function onDraw()ao=screen
local bH,cq,dd,bg=ao.drawTriangleF,ao.drawTriangle,ao.drawRectF,ao.setColor
Y=ao.getWidth()cI=ao.getHeight()t=Y/2
X=cI/2
bh=cr(cL/2)*t
if bt then
for d=1,#at do
i=at[d]z=i[1]k=z[1]for f=3,#z do
m=z[f-1]n=z[f]bg(i[2],i[3],i[4])bH(k[1]+t,k[2]+X,m[1]+t,m[2]+X,n[1]+t,n[2]+X)bg(i[2]*.5,i[3]*.5,i[4]*.5)cq(k[1]+t,k[2]+X-.5,m[1]+t,m[2]+X-.5,n[1]+t,n[2]+X-.5)end
end
for d,cd in Z(cN)do
k,m,n=y(cd)dj=bg(y(cd[4]))bH(k[1]+t,k[2]+X,m[1]+t,m[2]+X,n[1]+t,n[2]+X)end
end
end