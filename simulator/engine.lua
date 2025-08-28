H=math
av=H.max
aR=H.min
aN=math.sqrt
dk=H.floor
cx=H.pi
dj=input.getNumber
cH=input.getBool
co=true
dl=false
Z=ipairs
cN=H.abs
bO=table.remove
bd=string
cr=H.sin
cL=H.cos
cq=H.tan
dv=H.atan
dw=H.asin
z=table.unpack
cg=H.huge
function aW(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aM(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aQ(a,c)return{a[1]*c,a[2]*c}end
function dq(a,c,w)return aR(av(c,a),w)end
function E(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bx(a,c,w)return j(h(c,a),h(w,a))end
function bm(a)return g(a,1/aN(a[1]^2+a[2]^2+a[3]^2))end
function bt(a,c)return aN((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
P={}bi=1
de=3
ad=1
cE=co
di=0
bN=0
du={0,5,-10}dt={0,0,0}bb=62.5
cX=0
cj=cx/180
dd=5/bb
cZ=90*cj/bb
cI=90*cj
bf=1
bv=1/bb
function ay(aS,D)F=_ENV
while D~=0 do
D,O,ch,cM=z(P[5][aS])ab,ar=F[ch],F[cM]if D==1 then
F[O]=ch
elseif D==2 then
F[O][ab]=ar
elseif D==3 then
F[O]=ab[ar]elseif D==4 then
F[O]={}elseif D==5 then
F[O]=ab-ar
elseif D==6 then
F[O]=ab/ar
elseif D==7 then
F[O]=ab(z(ar))elseif D==8 then
F[O]=#ab
elseif D==9 then
if F[O]then
aS=ab-1
end
elseif D==10 then
F[O]=ab>ar
end
aS=aS+1
end
end
function aT(b,at,cb)bF=h(at,b[1])return o(j(g(j(bF,cb),b[11]),bF),cb)+b[10]end
function ci(b,at,ax)bz=h(at,b[1])b[4]=bD(b[4],g(j(bz,ax),-b[11]))b[1]=E(b[1],g(ax,b[10]))end
function aV(b,at,ax)bz=h(at,b[1])b[5]=E(b[5],g(j(bz,ax),b[11]))b[2]=E(b[2],g(ax,b[10]))end
function ap(cv,l)local ak=-cg
for d,v in Z(cv)do
aq=o(v[2],l)if cN(aq-ak)<.0005 then
aP[#aP+1]=d
elseif aq>ak then
cw=v[2]aP={d}ak=aq
end
end
return cw
end
function cG(bS,bR)l={1,0,0}B={}for dh=1,32 do
e=h(ap(bS,l),ap(bR,g(l,-1)))if o(e,l)<=0 then
return
end
B={e,B[1],B[2],B[3]}a,c,w,aj=z(B)if aj then
K=h(c,a)am=h(w,a)cl=h(aj,a)C=g(a,-1)ac=j(K,am)cm=j(am,cl)ck=j(cl,K)if o(ac,C)>0 then
B={a,c,w}l=ac
elseif o(cm,C)>0 then
B={a,w,aj}l=cm
elseif o(ck,C)>0 then
B={a,aj,c}l=ck
else
ai={{a,c,w},{a,w,aj},{a,aj,c},{c,aj,w}}for d,v in ipairs(ai)do
v[4]=bm(bx(v[1],v[2],v[3]))end
for dg=1,32 do
ak=cg
for d,v in ipairs(ai)do
aq=o(v[1],v[4])if aq<ak then
ak=aq
cf=v
end
end
l=cf[4]e=h(ap(bS,l),ap(bR,g(l,-1)))if o(e,l)-.001<=ak then
return{cf[4],o(e,l)}end
aw={}for d=#ai,1,-1 do
aU=ai[d]if o(aU[4],h(e,aU[1]))>0 then
for f=1,3 do
aA={aU[f],aU[(f%3)+1]}for V,ce in ipairs(aw)do
if ce[1]==aA[2]and ce[2]==aA[1]then
bO(aw,V)aA=db
break
end
end
if aA then
aw[#aw+1]=aA
end
end
bO(ai,d)end
end
for d,v in ipairs(aw)do
au={v[1],v[2],e}au[4]=bm(bx(au[1],au[2],au[3]))ai[#ai+1]=au
end
end
return
end
elseif w then
K=h(c,a)am=h(w,a)C=g(a,-1)ac=j(K,am)if o(j(ac,am),C)>0 then
B={a,w}l=j(j(am,C),am)elseif o(j(K,ac),C)>0 then
B={a,c}l=j(j(K,C),K)else
if o(ac,C)>0 then
l=ac;
else
B={a,w,c}l=g(ac,-1)end
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
function cY(W,I)I=I or{}ae=P[1][W]bW={}f=1
for d=ae[1],ae[2]do
q=P[2][d]bW[f]={{q[1],q[2],q[3]},{}}f=f+1
end
bV={}f=1
for d=ae[3],ae[4]do
q=P[3][d]bV[f]={z(q)}f=f+1
end
bo={}for bp=6,#ae,2 do
bX={}f=1
for d=ae[bp-1],ae[bp]do
q=P[2][d]bX[f]={{q[1],q[2],q[3]},{}}f=f+1
end
bo[#bo+1]=bX
end
cz={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bW,bV,bo,I[7]or 1,I[8]or 1,I[9]or{0,0,0},P[1][W][7],W,{},{},}T[#T+1]=cz
end
function j(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function o(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function cn(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bB=bt(S,{0,0,0})*.5
bA=g(S,1/bB)bc=cr(bB)return{cL(bB),bA[1]*bc,bA[2]*bc,bA[3]*bc}end
end
function bD(aO,S)local bn=cA(aO,cn(S))for d=1,4 do
bn[d]=aO[d]+bn[d]*.5
end
return cy(bn)end
function cA(cu,ct)local aG,y,x,aD=z(cu)local t,R,Q,aC=z(ct)return{aG*t-y*R-x*Q-aD*aC,aG*R+y*t+x*aC-aD*Q,aG*Q-y*aC+x*t+aD*R,aG*aC+y*Q-x*R+aD*t}end
function bq(S,cC)local bU={}for f=1,3 do
q=0
for V=1,3 do
q=q+S[V]*cC[f][V]end
bU[f]=q
end
return bU
end
function cy(a,aB)aB=1/aN(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aB,a[2]*aB,a[3]*aB,a[4]*aB}end
function cs(aO)local Y,N,M,L=z(aO)return{{1-(2*M*M+2*L*L),2*N*M+2*L*Y,2*N*L-2*M*Y},{2*N*M-2*L*Y,1-(2*N*N+2*L*L),2*M*L+2*N*Y},{2*N*L+2*M*Y,2*M*L-2*N*Y,1-(2*N*N+2*M*M)},}end
function onTick()for f=1,1 do
if cH(32)and not br then
bj=property.getText(bi)d=1
G=""
q=bd.sub(bj,d,d)while q~=""do
bl=bd.byte(q)if bl<45 then
if bl>33 then
G=(G..bl-35)+0
end
if ad==1 then
cd=G
P[G]=P[G]or{}elseif ad==2 then
cD=G
az=0
elseif ad==3 then
by=G
else
if az==0 then
az=cD
by=by-1
bw={}P[cd][#P[cd]+1]=bw
end
bw[#bw+1]=G
az=az-1
ad=av(az,by)>0 and ad-1 or 0
end
ad=ad+1
G=""
else
G=G..q
end
d=d+1
q=bd.sub(bj,d,d)end
bi=bi+1
br=bj==""
end
end
if br then
bN=bN+1
if cE then
ay(1)ay(55)end
ay(184)as={}cK={}for W=1,#T do
b=T[W]b[4]=bD(b[4],g(b[5],-bv))b[1]=E(b[1],g(b[2],bv))b[2]=E(b[2],g(b[3],bv))b[3]=g(b[12],1)b[16]=cs(b[4])for f,J in Z(b[9])do
for V,e in Z(J)do
e[2]=bq(e[1],b[16])e[2]=E(e[2],b[1])end
end
end
ay(322)for d,p in Z(T)do
for f,s in Z(T)do
if d~=f and(p[10]>0 or s[10]>0 or p[11]>0 or s[11]>0)and bt(p[1],s[1])<=p[13]+s[13]then
for V,J in Z(p[9])do
for bp,aa in Z(s[9])do
if#J>0 and#aa>0 then
A=cG(J,aa)if A then
dc=p[15][f]or{}ap(J,A[1])_=aP
ap(aa,g(A[1],-1))al=aP
if#_==1 then
r=J[_[1]][2]elseif#al==1 then
r=aa[al[1]][2]elseif#_==2 and#al==2 then
bu=h(J[_[2]][2],J[_[1]][2])ca=h(aa[al[2]][2],aa[al[1]][2])bT=j(ca,j(bu,ca))r=E(J[_[1]][2],g(bu,o(h(aa[al[1]][2],J[_[1]][2]),bT)/o(bu,bT)))else
r=p[13]>s[13]and aa[al[1]][2]or J[_[1]][2]end
a_=E(j(p[5],h(r,p[1])),p[2])aZ=E(j(s[5],h(r,s[1])),s[2])aL=h(a_,aZ)aK=o(A[1],aL)if aK>0 then
bY=aT(p,r,A[1])+aT(s,r,A[1])cJ=aK
bk=cJ/bY
aV(p,r,g(A[1],-bk))aV(s,r,g(A[1],bk))a_=E(j(p[5],h(r,p[1])),p[2])aZ=E(j(s[5],h(r,s[1])),s[2])aL=h(a_,aZ)aK=o(A[1],aL)bL=h(aL,g(A[1],aK))bM=bt(bL,{0,0,0})if bM>.001 then
aJ=bm(bL)cB=aT(p,r,aJ)+aT(s,r,aJ)b_=aR(bM/cB,bk*.5)aV(p,r,g(aJ,-b_))aV(s,r,g(aJ,b_))end
bQ=A[2]/bY
ci(p,r,g(A[1],-bQ))ci(s,r,g(A[1],bQ))end
end
end
end
end
end
end
end
for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[2]=bq(e[1],b[16])e[2]=E(e[2],b[1])end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
i=b[8][d]i[8]=bx(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end
end
ay(719)table.sort(as,function(a,c)return a[5]>c[5]end)end
end
function c_()for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],ds)e[4]=bq(e[3],dr)bs=e[3]e[7]=aN(bs[1]^2+bs[2]^2+bs[3]^2)e[5]={e[4][1]*bf/e[4][3],-e[4][2]*bf/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
i=b[8][d]k=b[7][i[1]]m=b[7][i[2]]n=b[7][i[3]]i[7]=av(k[7],m[7],n[7])c=k[3]if o(i[8],c)>0 and i[7]>dp then
an=k[6]+m[6]+n[6]if an==3 then
u={k[5],m[5],n[5]}elseif an>=1 then
if k[6]==2-an then
ah=k[5]ag=m[5]af=n[5]elseif m[6]==2-an then
ah=m[5]ag=k[5]af=n[5]else
ah=n[5]ag=m[5]af=k[5]end
if an==2 then
bh=aW(aQ(aM(ag,ah),1000),ag)bg=aW(aQ(aM(af,ah),1000),af)u={af,ag,bh,bg}else
bh=aW(aQ(aM(ah,ag),1000),ag)bg=aW(aQ(aM(ah,af),1000),af)u={ah,bg,bh}end
end
if an>=1 then
k=u[1]m=u[2]n=u[3]bJ=aR(k[1],m[1],n[1])bI=av(k[1],m[1],n[1])bH=aR(k[2],m[2],n[2])bK=av(k[2],m[2],n[2])if(bI>cQ and bJ<cP)and(bK>cO and bH<cR)then
if bJ<cV or bI>cU or bH<cT or bK>cW then
for f=1,#bC do
y,x=z(bC[f])R,Q=z(bC[f%cS+1])U={}bP=#u
for V=1,bP do
ba=u[V]aF,aE=z(ba)aY,aX=z(u[V%bP+1])aI=(R-y)*(aE-x)-(Q-x)*(aF-y)aH=(R-y)*(aX-x)-(Q-x)*(aY-y)if aI*aH<0 then
bE=((aY-aF)*(x-aE)-(aX-aE)*(y-aF))/((aX-aE)*(R-y)-(aY-aF)*(Q-x))bZ={y+(bE*(R-y)),x+(bE*(Q-x))}end
if aI>0 and aH<0 then
U[#U+1]=ba
U[#U+1]=bZ
elseif aI<0 and aH<0 then
elseif aI<0 and aH>0 then
U[#U+1]=bZ
else
U[#U+1]=ba
end
end
u=U
end
end
as[#as+1]={u,i[4],i[5],i[6],i[7]*dm+dn}end
end
end
end
end
end
function onDraw()ao=screen
local bG,cp,da,be=ao.drawTriangleF,ao.drawTriangle,ao.drawRectF,ao.setColor
Y=ao.getWidth()cF=ao.getHeight()t=Y/2
X=cF/2
bf=cq(cI/2)*t
if br then
for d=1,#as do
i=as[d]u=i[1]k=u[1]for f=3,#u do
m=u[f-1]n=u[f]be(i[2],i[3],i[4])bG(k[1]+t,k[2]+X,m[1]+t,m[2]+X,n[1]+t,n[2]+X)be(i[2]*.5,i[3]*.5,i[4]*.5)cp(k[1]+t,k[2]+X-.5,m[1]+t,m[2]+X-.5,n[1]+t,n[2]+X-.5)end
end
for d,cc in Z(cK)do
k,m,n=z(cc)df=be(z(cc[4]))bG(k[1]+t,k[2]+X,m[1]+t,m[2]+X,n[1]+t,n[2]+X)end
end
end