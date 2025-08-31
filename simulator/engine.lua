H=math
av=H.max
aS=H.min
aN=math.sqrt
du=H.floor
cC=H.pi
dt=input.getNumber
cN=input.getBool
cs=true
dv=false
Y=ipairs
cT=H.abs
bf=string
cu=H.sin
cR=H.cos
ct=H.tan
dE=H.atan
dF=H.asin
x=table.unpack
bR=table.remove
dl=table.move
ck=H.huge
function aY(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aM(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aR(a,c)return{a[1]*c,a[2]*c}end
function dz(a,c,u)return aS(av(c,a),u)end
function E(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end
function bz(a,c,u)return i(h(c,a),h(u,a))end
function bo(a)return g(a,1/aN(a[1]^2+a[2]^2+a[3]^2))end
function bv(a,c)return aN((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end
P={}bj=1
dm=3
ac=1
cK=cs
ds=0
bO=0
dD={0,5,-10}dC={0,0,0}bd=62.5
dc=0
cn=cC/180
dk=5/bd
df=90*cn/bd
cO=90*cn
bg=1
bx=1/bd
function ay(aT,D)F=_ENV
while D~=0 do
D,O,cl,cS=x(P[5][aT])aa,ar=F[cl],F[cS]if D==1 then
F[O]=cl
elseif D==2 then
F[O][aa]=ar
elseif D==3 then
F[O]=aa[ar]elseif D==4 then
F[O]={}elseif D==5 then
F[O]=aa-ar
elseif D==6 then
F[O]=aa/ar
elseif D==7 then
F[O]=aa(x(ar))elseif D==8 then
F[O]=#aa
elseif D==9 then
if F[O]then
aT=aa-1
end
elseif D==10 then
F[O]=aa>ar
end
aT=aT+1
end
end
function aU(b,at,ce)bG=h(at,b[1])return m(i(g(i(bG,ce),b[11]),bG),ce)+b[10]end
function cm(b,at,ax)bB=h(at,b[1])b[4]=bE(b[4],g(i(bB,ax),-b[11]))b[1]=E(b[1],g(ax,b[10]))end
function aX(b,at,ax)bB=h(at,b[1])b[5]=E(b[5],g(i(bB,ax),b[11]))b[2]=E(b[2],g(ax,b[10]))end
function ap(cA,j)local aj=-ck
for d,t in Y(cA)do
aq=m(t[2],j)if cT(aq-aj)<.0005 then
aQ[#aQ+1]=d
elseif aq>aj then
cB=t[2]aQ={d}aj=aq
end
end
return cB
end
function cM(bU,bT)j={1,0,0}A={}for dq=1,32 do
e=h(ap(bU,j),ap(bT,g(j,-1)))if m(e,j)<=0 then
return
end
A={e,A[1],A[2],A[3]}a,c,u,ai=x(A)if ai then
K=h(c,a)al=h(u,a)cp=h(ai,a)B=g(a,-1)ab=i(K,al)cq=i(al,cp)co=i(cp,K)if m(ab,B)>0 then
A={a,c,u}j=ab
elseif m(cq,B)>0 then
A={a,u,ai}j=cq
elseif m(co,B)>0 then
A={a,ai,c}j=co
else
ah={{a,c,u},{a,u,ai},{a,ai,c},{c,ai,u}}for d,t in ipairs(ah)do
t[4]=bo(bz(t[1],t[2],t[3]))end
for dp=1,32 do
aj=ck
for d,t in ipairs(ah)do
aq=m(t[1],t[4])if aq<aj then
aj=aq
cj=t
end
end
j=cj[4]e=h(ap(bU,j),ap(bT,g(j,-1)))if m(e,j)-.001<=aj then
return{cj[4],m(e,j)}end
aw={}for d=#ah,1,-1 do
aW=ah[d]if m(aW[4],h(e,aW[1]))>0 then
for f=1,3 do
aA={aW[f],aW[(f%3)+1]}for V,ch in ipairs(aw)do
if ch[1]==aA[2]and ch[2]==aA[1]then
bR(aw,V)aA=di
break
end
end
if aA then
aw[#aw+1]=aA
end
end
bR(ah,d)end
end
for d,t in ipairs(aw)do
au={t[1],t[2],e}au[4]=bo(bz(au[1],au[2],au[3]))ah[#ah+1]=au
end
end
return
end
elseif u then
K=h(c,a)al=h(u,a)B=g(a,-1)ab=i(K,al)if m(i(ab,al),B)>0 then
A={a,u}j=i(i(al,B),al)elseif m(i(K,ab),B)>0 then
A={a,c}j=i(i(K,B),K)else
if m(ab,B)>0 then
j=ab;
else
A={a,u,c}j=g(ab,-1)end
end
elseif c then
K=h(c,a)B=g(a,-1)if m(K,B)>0 then
j=i(i(K,B),K)else
A={a}j=B
end
else
A={a}j=g(a,-1)end
end
end
function de(W,I)I=I or{}ad=P[1][W]bZ={}f=1
for d=ad[1],ad[2]do
o=P[2][d]bZ[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bY={}f=1
for d=ad[3],ad[4]do
o=P[3][d]bY[f]={x(o)}f=f+1
end
bq={}for br=6,#ad,2 do
b_={}f=1
for d=ad[br-1],ad[br]do
o=P[2][d]b_[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bq[#bq+1]=b_
end
cE={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bZ,bY,bq,I[7]or 1,I[8]or 1,I[9]or{0,0,0},P[1][W][7],W,{},{},}T[#T+1]=cE
end
function i(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end
function m(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end
function cr(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bD=bv(S,{0,0,0})*.5
bC=g(S,1/bD)be=cu(bD)return{cR(bD),bC[1]*be,bC[2]*be,bC[3]*be}end
end
function bE(aP,S)local bp=cF(aP,cr(S))for d=1,4 do
bp[d]=aP[d]+bp[d]*.5
end
return cD(bp)end
function cF(cz,cy)local aG,w,v,aD=x(cz)local C,R,Q,aC=x(cy)return{aG*C-w*R-v*Q-aD*aC,aG*R+w*C+v*aC-aD*Q,aG*Q-w*aC+v*C+aD*R,aG*aC+w*Q-v*R+aD*C}end
function bs(S,cH)local bX={}for f=1,3 do
o=0
for V=1,3 do
o=o+S[V]*cH[f][V]end
bX[f]=o
end
return bX
end
function cD(a,aB)aB=1/aN(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aB,a[2]*aB,a[3]*aB,a[4]*aB}end
function cx(aP)local X,N,M,L=x(aP)return{{1-(2*M*M+2*L*L),2*N*M+2*L*X,2*N*L-2*M*X},{2*N*M-2*L*X,1-(2*N*N+2*L*L),2*M*L+2*N*X},{2*N*L+2*M*X,2*M*L-2*N*X,1-(2*N*N+2*M*M)},}end
function onTick()for f=1,1 do
if cN(32)and not bt then
bk=property.getText(bj)d=1
G=""
o=bf.sub(bk,d,d)while o~=""do
bn=bf.byte(o)if bn<45 then
if bn<33 then
G=(G..bn-19)+0
end
if ac==1 then
cg=G
P[G]=P[G]or{}elseif ac==2 then
cJ=G
az=0
elseif ac==3 then
bA=G
else
if az==0 then
az=cJ
bA=bA-1
by={}P[cg][#P[cg]+1]=by
end
by[#by+1]=G
az=az-1
ac=av(az,bA)>0 and ac-1 or 0
end
ac=ac+1
G=""
else
G=G..o
end
d=d+1
o=bf.sub(bk,d,d)end
bj=bj+1
bt=bk==""
end
end
if bt then
bO=bO+1
if cK then
ay(1)ay(61)end
ay(192)cQ={}for W=1,#T do
b=T[W]b[4]=bE(b[4],g(b[5],-bx))b[1]=E(b[1],g(b[2],bx))b[2]=E(b[2],g(b[3],bx))b[3]=g(b[12],1)b[16]=cx(b[4])for f,J in Y(b[9])do
for V,e in Y(J)do
e[2]=bs(e[1],b[16])e[2]=E(e[2],b[1])end
end
end
ay(341)for d,l in Y(T)do
if l[10]>0 or l[11]>0 then
for f,r in Y(T)do
if d~=f and bv(l[1],r[1])<=l[13]+r[13]then
for V,J in Y(l[9])do
for br,_ in Y(r[9])do
if#J>0 and#_>0 then
z=cM(J,_)if z then
if l==bV or r==bV then
ci=0
else
ci=1
end
dj=l[15][f]or{}ap(J,z[1])Z=aQ
ap(_,g(z[1],-1))ak=aQ
if#Z==1 then
p=J[Z[1]][2]elseif#ak==1 then
p=_[ak[1]][2]elseif#Z==2 and#ak==2 then
bw=h(J[Z[2]][2],J[Z[1]][2])cd=h(_[ak[2]][2],_[ak[1]][2])bW=i(cd,i(bw,cd))p=E(J[Z[1]][2],g(bw,m(h(_[ak[1]][2],J[Z[1]][2]),bW)/m(bw,bW)))else
p=l[13]>r[13]and _[ak[1]][2]or J[Z[1]][2]end
bb=E(i(l[5],h(p,l[1])),l[2])ba=E(i(r[5],h(p,r[1])),r[2])aL=h(bb,ba)aK=m(z[1],aL)if aK>0 then
ca=aU(l,p,z[1])+aU(r,p,z[1])cP=aK
bm=cP/ca
aX(l,p,g(z[1],-bm))aX(r,p,g(z[1],bm))bb=E(i(l[5],h(p,l[1])),l[2])ba=E(i(r[5],h(p,r[1])),r[2])aL=h(bb,ba)aK=m(z[1],aL)bM=h(aL,g(z[1],aK))bN=bv(bM,{0,0,0})if bN>.001 then
aJ=bo(bM)cG=aU(l,p,aJ)+aU(r,p,aJ)cc=aS(bN/cG,bm*ci)aX(l,p,g(aJ,-cc))aX(r,p,g(aJ,cc))end
bS=z[2]/ca
cm(l,p,g(z[1],-bS))cm(r,p,g(z[1],bS))end
end
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
s=b[8][d]s[8]=bz(b[7][s[1]][2],b[7][s[2]][2],b[7][s[3]][2])end
end
end
ay(738)end
end
function dg()bl={}for W=1,#T do
b=T[W]if b~=bV or dr>1 then
for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dB)e[4]=bs(e[3],dA)bu=e[3]e[7]=aN(bu[1]^2+bu[2]^2+bu[3]^2)e[5]={e[4][1]*bg/e[4][3],-e[4][2]*bg/e[4][3]}e[6]=e[4][3]>0 and 1 or 0
end
for d=1,#b[8]do
s=b[8][d]k=b[7][s[1]]n=b[7][s[2]]q=b[7][s[3]]s[7]=av(k[7],n[7],q[7])c=k[3]if m(s[8],c)>0 and s[7]>dy then
am=k[6]+n[6]+q[6]if am==3 then
y={k[5],n[5],q[5]}elseif am>=1 then
if k[6]==2-am then
ag=k[5]af=n[5]ae=q[5]elseif n[6]==2-am then
ag=n[5]af=k[5]ae=q[5]else
ag=q[5]af=n[5]ae=k[5]end
if am==2 then
bi=aY(aR(aM(af,ag),1000),af)bh=aY(aR(aM(ae,ag),1000),ae)y={ae,af,bi,bh}else
bi=aY(aR(aM(ag,af),1000),af)bh=aY(aR(aM(ag,ae),1000),ae)y={ag,bh,bi}end
end
if am>=1 then
k=y[1]n=y[2]q=y[3]bK=aS(k[1],n[1],q[1])bJ=av(k[1],n[1],q[1])bI=aS(k[2],n[2],q[2])bL=av(k[2],n[2],q[2])if(bJ>cW and bK<cV)and(bL>cU and bI<cX)then
if bK<c_ or bJ>cZ or bI<cY or bL>da then
y=cI(y,db)end
bl[#bl+1]={y,s[4],s[5],s[6],s[7]*dw+dx}end
end
end
end
end
end
table.sort(bl,function(a,c)return a[5]>c[5]end)end
function cI(as,aO)cv=#aO
for f=1,#aO do
w,v=x(aO[f])R,Q=x(aO[f%cv+1])U={}bQ=#as
for V=1,bQ do
bc=as[V]aF,aE=x(bc)a_,aZ=x(as[V%bQ+1])aI=(R-w)*(aE-v)-(Q-v)*(aF-w)aH=(R-w)*(aZ-v)-(Q-v)*(a_-w)if aI*aH<0 then
bF=((a_-aF)*(v-aE)-(aZ-aE)*(w-aF))/((aZ-aE)*(R-w)-(a_-aF)*(Q-v))cb={w+(bF*(R-w)),v+(bF*(Q-v))}end
if aI>0 and aH<0 then
U[#U+1]=bc
U[#U+1]=cb
elseif aI<0 and aH<0 then
elseif aI<0 and aH>0 then
U[#U+1]=cb
else
U[#U+1]=bc
end
end
as=U
end
return as
end
function onDraw()an=screen
local bH,dd,dh,bP=an.drawTriangleF,an.drawTriangle,an.drawRectF,an.setColor
X=an.getWidth()cL=an.getHeight()C=X/2
ao=cL/2
bg=ct(cO/2)*C
if bt then
for d=1,#cw do
aV=cw[d]y=aV[1]k=y[1]for f=3,#y do
n=y[f-1]q=y[f]bP(aV[2],aV[3],aV[4])bH(k[1]+C,k[2]+ao,n[1]+C,n[2]+ao,q[1]+C,q[2]+ao)end
end
for d,cf in Y(cQ)do
k,n,q=x(cf)dn=bP(x(cf[4]))bH(k[1]+C,k[2]+ao,n[1]+C,n[2]+ao,q[1]+C,q[2]+ao)end
end
end