J=math
at=J.max
aP=J.min
aL=math.sqrt
de=J.floor
ct=J.pi
dd=input.getNumber
cD=input.getBool
cj=true
df=false
bn=ipairs
cI=J.abs
bJ=table.remove
bb=string
cn=J.sin
cG=J.cos
cm=J.tan
dp=J.atan
dq=J.asin
H=table.unpack
cb=J.huge

function aU(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aK(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aO(a,c)return{a[1]*c,a[2]*c}end
function dj(a,c,x)return aP(at(c,a),x)end


function F(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end

function bt(a,c,x)return j(h(c,a),h(x,a))end
function bj(a)return g(a,1/aL(a[1]^2+a[2]^2+a[3]^2))end
function bp(a,c)return aL((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end

u={}bf=1
c_=3
aa=1

cA=cj
dc=0
bI=0
dn={0,5,-10}dm={0,0,0}a_=62.5
cS=0
ce=ct/180
cZ=5/a_
cU=90*ce/a_
cE=90*ce
bc=1
br=1/a_

function aw(aQ,E)G=_ENV
while E~=0 do
E,P,cc,cH=H(u[5][aQ])Z,ap=G[cc],G[cH]

if E==1 then
G[P]=cc
elseif E==2 then
G[P][Z]=ap
elseif E==3 then
G[P]=Z[ap]elseif E==4 then
G[P]={}elseif E==5 then
G[P]=Z-ap
elseif E==6 then
G[P]=Z/ap
elseif E==7 then
G[P]=Z(H(ap))elseif E==8 then
G[P]=#Z
elseif E==9 then
if G[P]then
aQ=Z-1
end
elseif E==10 then
G[P]=Z>ap
end

aQ=aQ+1
end
end

function aR(b,ar,bY)bB=h(ar,b[1])return l(j(g(j(bB,bY),b[11]),bB),bY)+b[10]end

function cd(b,ar,av)bv=h(ar,b[1])b[4]=bz(b[4],g(j(bv,av),-b[11]))b[1]=F(b[1],g(av,b[10]))end

function aT(b,ar,av)bv=h(ar,b[1])
b[5]=F(b[5],g(j(bv,av),b[11]))b[2]=F(b[2],g(av,b[10]))end

function an(cr,k)local ah=-cb
for d,v in bn(cr)do
ao=l(v[2],k)if cI(ao-ah)<.0005 then
aN[#aN+1]=d
elseif ao>ah then
cs=v[2]aN={d}ah=ao
end
end
return cs
end

function cC(bO,bN)k={1,0,0}B={}for db=1,32 do
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)<=0 then
return
end

B={e,B[1],B[2],B[3]}
a,c,x,ag=H(B)
if ag then
L=h(c,a)aj=h(x,a)cg=h(ag,a)C=g(a,-1)
_=j(L,aj)ch=j(aj,cg)cf=j(cg,L)
if l(_,C)>0 then
B={a,c,x}k=_
elseif l(ch,C)>0 then
B={a,x,ag}k=ch
elseif l(cf,C)>0 then
B={a,ag,c}k=cf
else


af={{a,c,x},{a,x,ag},{a,ag,c},{c,ag,x}}for d,v in ipairs(af)do
v[4]=bj(bt(v[1],v[2],v[3]))end

for da=1,32 do
ah=cb
for d,v in ipairs(af)do
ao=l(v[1],v[4])if ao<ah then
ah=ao
ca=v
end
end
k=ca[4]
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)-.001<=ah then
return{ca[4],l(e,k)}end

au={}for d=#af,1,-1 do
aS=af[d]if l(aS[4],h(e,aS[1]))>0 then
for f=1,3 do
ay={aS[f],aS[(f%3)+1]}for ae,b_ in ipairs(au)do
if b_[1]==ay[2]and b_[2]==ay[1]then
bJ(au,ae)ay=cX
break
end
end

if ay then
au[#au+1]=ay
end
end



bJ(af,d)end
end



for d,v in ipairs(au)do
as={v[1],v[2],e}as[4]=bj(bt(as[1],as[2],as[3]))




af[#af+1]=as
end
end
return
end
elseif x then
L=h(c,a)aj=h(x,a)C=g(a,-1)
_=j(L,aj)
if l(j(_,aj),C)>0 then
B={a,x}k=j(j(aj,C),aj)elseif l(j(L,_),C)>0 then
B={a,c}k=j(j(L,C),L)else
if l(_,C)>0 then

k=_;
else
B={a,x,c}k=g(_,-1)end
end
elseif c then
L=h(c,a)C=g(a,-1)
if l(L,C)>0 then
k=j(j(L,C),L)else
B={a}k=C
end
else
B={a}k=g(a,-1)end
end

end

function cT(w,K)K=K or{}bS={}f=1
for d=u[1][w][1],u[1][w][2]do
o=u[2][d]bS[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bR={}f=1
for d=u[1][w][3],u[1][w][4]do
o=u[3][d]bR[f]={H(o)}f=f+1
end
bT={}f=1
for d=u[1][w][5],u[1][w][6]do
o=u[2][d]bT[f]={{o[1],o[2],o[3]},{}}f=f+1
end

cv={K[1]or{0,0,0},K[2]or{0,0,0},K[3]or{0,0,0},K[4]or{1,0,0,0},K[5]or{0,0,0},K[6]or{0,0,0},bS,bR,bT,K[7]or 1,K[8]or 1,K[9]or{0,0,0},u[1][w][7],w,{},{},}T[#T+1]=cv
end

function j(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end

function l(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end

function ci(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bx=bp(S,{0,0,0})*.5
bw=g(S,1/bx)ba=cn(bx)return{cG(bx),bw[1]*ba,bw[2]*ba,bw[3]*ba}end
end

function bz(aM,S)local bk=cw(aM,ci(S))for d=1,4 do
bk[d]=aM[d]+bk[d]*.5
end
return cu(bk)end

function cw(cq,cp)local aE,z,y,aB=H(cq)local D,R,Q,aA=H(cp)return{aE*D-z*R-y*Q-aB*aA,aE*R+z*D+y*aA-aB*Q,aE*Q-z*aA+y*D+aB*R,aE*aA+z*Q-y*R+aB*D}end

function bl(S,cy)local bQ={}for f=1,3 do
o=0
for ae=1,3 do
o=o+S[ae]*cy[f][ae]end
bQ[f]=o
end
return bQ
end













function cu(a,az)az=1/aL(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*az,a[2]*az,a[3]*az,a[4]*az}end

function co(aM)local W,O,N,M=H(aM)return{{1-(2*N*N+2*M*M),2*O*N+2*M*W,2*O*M-2*N*W},{2*O*N-2*M*W,1-(2*O*O+2*M*M),2*N*M+2*O*W},{2*O*M+2*N*W,2*N*M-2*O*W,1-(2*O*O+2*N*N)},}end






function onTick()for f=1,1 do
if cD(32)and not bm then
bg=property.getText(bf)d=1
I=""
o=bb.sub(bg,d,d)while o~=""do
bi=bb.byte(o)if bi<45 then
if bi>33 then
I=(I..bi-35)+0
end

if aa==1 then
bZ=I
u[I]=u[I]or{}elseif aa==2 then
cz=I
ax=0
elseif aa==3 then
bu=I
else
if ax==0 then
ax=cz
bu=bu-1
bs={}u[bZ][#u[bZ]+1]=bs
end
bs[#bs+1]=I
ax=ax-1
aa=at(ax,bu)>0 and aa-1 or 0
end
aa=aa+1
I=""
else
I=I..o
end
d=d+1
o=bb.sub(bg,d,d)end
bf=bf+1
bm=bg==""
end
end

if bm then
bI=bI+1
if cA then
aw(1)aw(50)end

aw(179)




aq={}
for w=1,#T do
b=T[w]b[4]=bz(b[4],g(b[5],-br))b[1]=F(b[1],g(b[2],br))b[2]=F(b[2],g(b[3],br))b[3]=g(b[12],1)


b[16]=co(b[4])

for f=1,#b[9]do
e=b[9][f]e[2]=bl(e[1],b[16])e[2]=F(e[2],b[1])
end
end



aw(317)




for d,n in bn(T)do
for f,r in bn(T)do
if d~=f and(n[10]>0 or r[10]>0 or n[11]>0 or r[11]>0)and bp(n[1],r[1])<=n[13]+r[13]then

V=n[9]Y=r[9]
if#V>0 and#Y>0 then

A=cC(V,Y)
if A then
cY=n[15][f]or{}

an(V,A[1])X=aN
an(Y,g(A[1],-1))ai=aN






if#X==1 then
p=V[X[1]][2]elseif#ai==1 then
p=Y[ai[1]][2]elseif#X==2 and#ai==2 then
bq=h(V[X[2]][2],V[X[1]][2])bX=h(Y[ai[2]][2],Y[ai[1]][2])bP=j(bX,j(bq,bX))p=F(V[X[1]][2],g(bq,l(h(Y[ai[1]][2],V[X[1]][2]),bP)/l(bq,bP)))else
p=n[13]>r[13]and Y[ai[1]][2]or V[X[1]][2]end


aY=F(j(n[5],h(p,n[1])),n[2])aX=F(j(r[5],h(p,r[1])),r[2])aJ=h(aY,aX)
aI=l(A[1],aJ)if aI>0 then











bU=aR(n,p,A[1])+aR(r,p,A[1])

cF=aI
bh=cF/bU

aT(n,p,g(A[1],-bh))aT(r,p,g(A[1],bh))



aY=F(j(n[5],h(p,n[1])),n[2])aX=F(j(r[5],h(p,r[1])),r[2])aJ=h(aY,aX)
aI=l(A[1],aJ)
bG=h(aJ,g(A[1],aI))
bH=bp(bG,{0,0,0})if bH>.001 then
aH=bj(bG)cx=aR(n,p,aH)+aR(r,p,aH)bW=aP(bH/cx,bh*.5)
aT(n,p,g(aH,-bW))aT(r,p,g(aH,bW))end





bM=A[2]/bU

cd(n,p,g(A[1],-bM))cd(r,p,g(A[1],bM))end





end
end
end
end
end



for w=1,#T do
b=T[w]

for d=1,#b[7]do
e=b[7][d]e[2]=bl(e[1],b[16])e[2]=F(e[2],b[1])
end

if b[11]>0 or not b[8][1][8]then

for d=1,#b[8]do
i=b[8][d]
i[8]=bt(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end
end

aw(724)



table.sort(aq,function(a,c)return a[5]>c[5]end)

end



end

function cV()


for w=1,#T do
b=T[w]

for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dl)
e[4]=bl(e[3],dk)bo=e[3]e[7]=aL(bo[1]^2+bo[2]^2+bo[3]^2)
e[5]={e[4][1]*bc/e[4][3],-e[4][2]*bc/e[4][3]}e[6]=e[4][3]>0 and 1 or 0

end





for d=1,#b[8]do
i=b[8][d]m=b[7][i[1]]q=b[7][i[2]]s=b[7][i[3]]i[7]=at(m[7],q[7],s[7])c=m[3]if l(i[8],c)>0 and i[7]>di then
ak=m[6]+q[6]+s[6]if ak==3 then

t={m[5],q[5],s[5]}elseif ak>=1 then
if m[6]==2-ak then
ad=m[5]ac=q[5]ab=s[5]elseif q[6]==2-ak then
ad=q[5]ac=m[5]ab=s[5]else
ad=s[5]ac=q[5]ab=m[5]end
if ak==2 then
be=aU(aO(aK(ac,ad),1000),ac)bd=aU(aO(aK(ab,ad),1000),ab)




t={ab,ac,be,bd}else
be=aU(aO(aK(ad,ac),1000),ac)bd=aU(aO(aK(ad,ab),1000),ab)

t={ad,bd,be}end
end

if ak>=1 then
m=t[1]q=t[2]s=t[3]
bE=aP(m[1],q[1],s[1])bD=at(m[1],q[1],s[1])bC=aP(m[2],q[2],s[2])bF=at(m[2],q[2],s[2])
if(bD>cL and bE<cK)and(bF>cJ and bC<cM)then
if bE<cQ or bD>cP or bC<cO or bF>cR then
for f=1,#by do
z,y=H(by[f])R,Q=H(by[f%cN+1])U={}bL=#t
for ae=1,bL do
aZ=t[ae]aD,aC=H(aZ)aW,aV=H(t[ae%bL+1])aG=(R-z)*(aC-y)-(Q-y)*(aD-z)aF=(R-z)*(aV-y)-(Q-y)*(aW-z)if aG*aF<0 then
bA=((aW-aD)*(y-aC)-(aV-aC)*(z-aD))/((aV-aC)*(R-z)-(aW-aD)*(Q-y))bV={z+(bA*(R-z)),y+(bA*(Q-y))}end
if aG>0 and aF<0 then
U[#U+1]=aZ
U[#U+1]=bV
elseif aG<0 and aF<0 then

elseif aG<0 and aF>0 then
U[#U+1]=bV
else
U[#U+1]=aZ
end
end
t=U
end




end

aq[#aq+1]={t,i[4],i[5],i[6],i[7]*dg+dh}end
end
end
end
end
end

function onDraw()al=screen
local ck,cl,cW,bK=al.drawTriangleF,al.drawTriangle,al.drawRectF,al.setColor
W=al.getWidth()cB=al.getHeight()D=W/2
am=cB/2
bc=cm(cE/2)*D


























if bm then

for d=1,#aq do
i=aq[d]t=i[1]
m=t[1]for f=3,#t do
q=t[f-1]s=t[f]bK(i[2],i[3],i[4])ck(m[1]+D,m[2]+am,q[1]+D,q[2]+am,s[1]+D,s[2]+am)bK(i[2]*.5,i[3]*.5,i[4]*.5)cl(m[1]+D,m[2]+am-.5,q[1]+D,q[2]+am-.5,s[1]+D,s[2]+am-.5)end
end





























































end
end