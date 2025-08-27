H=math
av=H.max
aR=H.min
aN=math.sqrt
dh=H.floor
cw=H.pi
dg=input.getNumber
cG=input.getBool
cm=true
di=false
ag=ipairs
cL=H.abs
bM=table.remove
bd=string
cq=H.sin
cJ=H.cos
cp=H.tan
ds=H.atan
dt=H.asin
F=table.unpack
ce=H.huge
function aW(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aM(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aQ(a,c)return{a[1]*c,a[2]*c}end
function dm(a,c,v)return aR(av(c,a),v)end
function D(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bw(a,c,v)return j(h(c,a),h(v,a))end
function bl(a)return g(a,1/aN(a[1]^2+a[2]^2+a[3]^2))end
function bs(a,c)return aN((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
P={}bh=1
dc=3
ab=1
cD=cm
df=0
bL=0
dr={0,5,-10}dq={0,0,0}bb=62.5
cV=0
ch=cw/180
db=5/bb
cX=90*ch/bb
cH=90*ch
be=1
bu=1/bb
function ay(aS,C)E=_ENV
while C~=0 do
C,O,cf,cK=F(P[5][aS])_,ar=E[cf],E[cK]if C==1 then
E[O]=cf
elseif C==2 then
E[O][_]=ar
elseif C==3 then
E[O]=_[ar]elseif C==4 then
E[O]={}elseif C==5 then
E[O]=_-ar
elseif C==6 then
E[O]=_/ar
elseif C==7 then
E[O]=_(F(ar))elseif C==8 then
E[O]=#_
elseif C==9 then
if E[O]then
aS=_-1
end
elseif C==10 then
E[O]=_>ar
end
aS=aS+1
end
end
function aT(b,at,ca)bE=h(at,b[1])return l(j(g(j(bE,ca),b[11]),bE),ca)+b[10]end
function cg(b,at,ax)by=h(at,b[1])b[4]=bC(b[4],g(j(by,ax),-b[11]))b[1]=D(b[1],g(ax,b[10]))end
function aV(b,at,ax)by=h(at,b[1])b[5]=D(b[5],g(j(by,ax),b[11]))b[2]=D(b[2],g(ax,b[10]))end
function ap(cu,k)local aj=-ce
for d,u in ag(cu)do
aq=l(u[2],k)if cL(aq-aj)<.0005 then
aP[#aP+1]=d
elseif aq>aj then
cv=u[2]aP={d}aj=aq
end
end
return cv
end
function cF(bR,bQ)k={1,0,0}z={}for de=1,32 do
e=h(ap(bR,k),ap(bQ,g(k,-1)))if l(e,k)<=0 then
return
end
z={e,z[1],z[2],z[3]}a,c,v,ai=F(z)if ai then
K=h(c,a)al=h(v,a)cj=h(ai,a)A=g(a,-1)aa=j(K,al)ck=j(al,cj)ci=j(cj,K)if l(aa,A)>0 then
z={a,c,v}k=aa
elseif l(ck,A)>0 then
z={a,v,ai}k=ck
elseif l(ci,A)>0 then
z={a,ai,c}k=ci
else
ah={{a,c,v},{a,v,ai},{a,ai,c},{c,ai,v}}for d,u in ipairs(ah)do
u[4]=bl(bw(u[1],u[2],u[3]))end
for dd=1,32 do
aj=ce
for d,u in ipairs(ah)do
aq=l(u[1],u[4])if aq<aj then
aj=aq
cd=u
end
end
k=cd[4]e=h(ap(bR,k),ap(bQ,g(k,-1)))if l(e,k)-.001<=aj then
return{cd[4],l(e,k)}end
aw={}for d=#ah,1,-1 do
aU=ah[d]if l(aU[4],h(e,aU[1]))>0 then
for f=1,3 do
aA={aU[f],aU[(f%3)+1]}for V,cc in ipairs(aw)do
if cc[1]==aA[2]and cc[2]==aA[1]then
bM(aw,V)aA=c_
break
end
end
if aA then
aw[#aw+1]=aA
end
end
bM(ah,d)end
end
for d,u in ipairs(aw)do
au={u[1],u[2],e}au[4]=bl(bw(au[1],au[2],au[3]))ah[#ah+1]=au
end
end
return
end
elseif v then
K=h(c,a)al=h(v,a)A=g(a,-1)aa=j(K,al)if l(j(aa,al),A)>0 then
z={a,v}k=j(j(al,A),al)elseif l(j(K,aa),A)>0 then
z={a,c}k=j(j(K,A),K)else
if l(aa,A)>0 then
k=aa;
else
z={a,v,c}k=g(aa,-1)end
end
elseif c then
K=h(c,a)A=g(a,-1)if l(K,A)>0 then
k=j(j(K,A),K)else
z={a}k=A
end
else
z={a}k=g(a,-1)end
end
end
function cW(W,I)I=I or{}ac=P[1][W]bV={}f=1
for d=ac[1],ac[2]do
o=P[2][d]bV[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bU={}f=1
for d=ac[3],ac[4]do
o=P[3][d]bU[f]={F(o)}f=f+1
end
bn={}for bo=6,#ac,2 do
bW={}f=1
for d=ac[bo-1],ac[bo]do
o=P[2][d]bW[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bn[#bn+1]=bW
end
cy={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bV,bU,bn,I[7]or 1,I[8]or 1,I[9]or{0,0,0},P[1][W][7],W,{},{},}T[#T+1]=cy
end
function j(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function l(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function cl(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bA=bs(S,{0,0,0})*.5
bz=g(S,1/bA)bc=cq(bA)return{cJ(bA),bz[1]*bc,bz[2]*bc,bz[3]*bc}end
end
function bC(aO,S)local bm=cz(aO,cl(S))for d=1,4 do
bm[d]=aO[d]+bm[d]*.5
end
return cx(bm)end
function cz(ct,cs)local aG,x,w,aD=F(ct)local B,R,Q,aC=F(cs)return{aG*B-x*R-w*Q-aD*aC,aG*R+x*B+w*aC-aD*Q,aG*Q-x*aC+w*B+aD*R,aG*aC+x*Q-w*R+aD*B}end
function bp(S,cB)local bT={}for f=1,3 do
o=0
for V=1,3 do
o=o+S[V]*cB[f][V]end
bT[f]=o
end
return bT
end
function cx(a,aB)aB=1/aN(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aB,a[2]*aB,a[3]*aB,a[4]*aB}end
function cr(aO)local X,N,M,L=F(aO)return{{1-(2*M*M+2*L*L),2*N*M+2*L*X,2*N*L-2*M*X},{2*N*M-2*L*X,1-(2*N*N+2*L*L),2*M*L+2*N*X},{2*N*L+2*M*X,2*M*L-2*N*X,1-(2*N*N+2*M*M)},}end
function onTick()for f=1,1 do
if cG(32)and not bq then
bi=property.getText(bh)d=1
G=""
o=bd.sub(bi,d,d)while o~=""do
bk=bd.byte(o)if bk<45 then
if bk>33 then
G=(G..bk-35)+0
end
if ab==1 then
cb=G
P[G]=P[G]or{}elseif ab==2 then
cC=G
az=0
elseif ab==3 then
bx=G
else
if az==0 then
az=cC
bx=bx-1
bv={}P[cb][#P[cb]+1]=bv
end
bv[#bv+1]=G
az=az-1
ab=av(az,bx)>0 and ab-1 or 0
end
ab=ab+1
G=""
else
G=G..o
end
d=d+1
o=bd.sub(bi,d,d)end
bh=bh+1
bq=bi==""
end
end
if bq then
bL=bL+1
if cD then
ay(1)ay(50)end
ay(179)as={}for W=1,#T do
b=T[W]b[4]=bC(b[4],g(b[5],-bu))b[1]=D(b[1],g(b[2],bu))b[2]=D(b[2],g(b[3],bu))b[3]=g(b[12],1)b[16]=cr(b[4])for f,J in ag(b[9])do
for V,e in ag(J)do
e[2]=bp(e[1],b[16])e[2]=D(e[2],b[1])end
end
end
ay(317)for d,n in ag(T)do
for f,r in ag(T)do
if d~=f and(n[10]>0 or r[10]>0 or n[11]>0 or r[11]>0)and bs(n[1],r[1])<=n[13]+r[13]then
for V,J in ag(n[9])do
for bo,Z in ag(r[9])do
if#J>0 and#Z>0 then
y=cF(J,Z)if y then
da=n[15][f]or{}ap(J,y[1])Y=aP
ap(Z,g(y[1],-1))ak=aP
if#Y==1 then
p=J[Y[1]][2]elseif#ak==1 then
p=Z[ak[1]][2]elseif#Y==2 and#ak==2 then
bt=h(J[Y[2]][2],J[Y[1]][2])b_=h(Z[ak[2]][2],Z[ak[1]][2])bS=j(b_,j(bt,b_))p=D(J[Y[1]][2],g(bt,l(h(Z[ak[1]][2],J[Y[1]][2]),bS)/l(bt,bS)))else
p=n[13]>r[13]and Z[ak[1]][2]or J[Y[1]][2]end
a_=D(j(n[5],h(p,n[1])),n[2])aZ=D(j(r[5],h(p,r[1])),r[2])aL=h(a_,aZ)aK=l(y[1],aL)if aK>0 then
bX=aT(n,p,y[1])+aT(r,p,y[1])cI=aK
bj=cI/bX
aV(n,p,g(y[1],-bj))aV(r,p,g(y[1],bj))a_=D(j(n[5],h(p,n[1])),n[2])aZ=D(j(r[5],h(p,r[1])),r[2])aL=h(a_,aZ)aK=l(y[1],aL)bJ=h(aL,g(y[1],aK))bK=bs(bJ,{0,0,0})if bK>.001 then
aJ=bl(bJ)cA=aT(n,p,aJ)+aT(r,p,aJ)bZ=aR(bK/cA,bj*.5)aV(n,p,g(aJ,-bZ))aV(r,p,g(aJ,bZ))end
bP=y[2]/bX
cg(n,p,g(y[1],-bP))cg(r,p,g(y[1],bP))end
end
end
end
end
end
end
end
for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[2]=bp(e[1],b[16])e[2]=D(e[2],b[1])end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
i=b[8][d]i[8]=bw(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end
end
ay(714)table.sort(as,function(a,c)return a[5]>c[5]end)end
end
function cY()for W=1,#T do
b=T[W]for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dp)e[4]=bp(e[3],dn)br=e[3]e[7]=aN(br[1]^2+br[2]^2+br[3]^2)e[5]={e[4][1]*be/e[4][3],-e[4][2]*be/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
i=b[8][d]m=b[7][i[1]]q=b[7][i[2]]s=b[7][i[3]]i[7]=av(m[7],q[7],s[7])c=m[3]if l(i[8],c)>0 and i[7]>dl then
am=m[6]+q[6]+s[6]if am==3 then
t={m[5],q[5],s[5]}elseif am>=1 then
if m[6]==2-am then
af=m[5]ae=q[5]ad=s[5]elseif q[6]==2-am then
af=q[5]ae=m[5]ad=s[5]else
af=s[5]ae=q[5]ad=m[5]end
if am==2 then
bg=aW(aQ(aM(ae,af),1000),ae)bf=aW(aQ(aM(ad,af),1000),ad)t={ad,ae,bg,bf}else
bg=aW(aQ(aM(af,ae),1000),ae)bf=aW(aQ(aM(af,ad),1000),ad)t={af,bf,bg}end
end
if am>=1 then
m=t[1]q=t[2]s=t[3]bH=aR(m[1],q[1],s[1])bG=av(m[1],q[1],s[1])bF=aR(m[2],q[2],s[2])bI=av(m[2],q[2],s[2])if(bG>cO and bH<cN)and(bI>cM and bF<cP)then
if bH<cT or bG>cS or bF<cR or bI>cU then
for f=1,#bB do
x,w=F(bB[f])R,Q=F(bB[f%cQ+1])U={}bO=#t
for V=1,bO do
ba=t[V]aF,aE=F(ba)aY,aX=F(t[V%bO+1])aI=(R-x)*(aE-w)-(Q-w)*(aF-x)aH=(R-x)*(aX-w)-(Q-w)*(aY-x)if aI*aH<0 then
bD=((aY-aF)*(w-aE)-(aX-aE)*(x-aF))/((aX-aE)*(R-x)-(aY-aF)*(Q-w))bY={x+(bD*(R-x)),w+(bD*(Q-w))}end
if aI>0 and aH<0 then
U[#U+1]=ba
U[#U+1]=bY
elseif aI<0 and aH<0 then
elseif aI<0 and aH>0 then
U[#U+1]=bY
else
U[#U+1]=ba
end
end
t=U
end
end
as[#as+1]={t,i[4],i[5],i[6],i[7]*dj+dk}end
end
end
end
end
end
function onDraw()an=screen
local cn,co,cZ,bN=an.drawTriangleF,an.drawTriangle,an.drawRectF,an.setColor
X=an.getWidth()cE=an.getHeight()B=X/2
ao=cE/2
be=cp(cH/2)*B
if bq then
for d=1,#as do
i=as[d]t=i[1]m=t[1]for f=3,#t do
q=t[f-1]s=t[f]bN(i[2],i[3],i[4])cn(m[1]+B,m[2]+ao,q[1]+B,q[2]+ao,s[1]+B,s[2]+ao)bN(i[2]*.5,i[3]*.5,i[4]*.5)co(m[1]+B,m[2]+ao-.5,q[1]+B,q[2]+ao-.5,s[1]+B,s[2]+ao-.5)end
end
end
end