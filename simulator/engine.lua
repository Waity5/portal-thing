O=math
aN=O.max
bl=O.min
aK=math.sqrt
de=O.floor
ct=O.pi
dd=input.getNumber
cD=input.getBool
cj=true
df=false
bn=ipairs
cI=O.abs
bJ=table.remove
ba=string
cn=O.sin
cG=O.cos
cm=O.tan
dn=O.atan
N=table.unpack
cb=O.huge

function aT(a,c)return{(a[1]+c[1]),(a[2]+c[2])}end
function aJ(a,c)return{(a[1]-c[1]),(a[2]-c[2])}end
function aO(a,c)return{a[1]*c,a[2]*c}end



function F(a,c)return{a[1]+c[1],a[2]+c[2],a[3]+c[3]}end
function h(a,c)return{a[1]-c[1],a[2]-c[2],a[3]-c[3]}end
function g(a,c)return{a[1]*c,a[2]*c,a[3]*c}end

function bt(a,c,E)return j(h(c,a),h(E,a))end
function bi(a)return g(a,1/aK(a[1]^2+a[2]^2+a[3]^2))end
function bp(a,c)return aK((a[1]-c[1])^2+(a[2]-c[2])^2+(a[3]-c[3])^2)end

u={}be=1
c_=3
_=1

cA=cj
dc=0
bI=0
dm={0,5,-10}dl={0,-.4,0}aZ=62.5
cS=0
ce=ct/180
cZ=5/aZ
cU=90*ce/aZ
cE=90*ce
bb=1
br=1/aZ

function av(aP,C)G=_ENV
while C~=0 do
C,P,cc,cH=N(u[5][aP])Y,ap=G[cc],G[cH]

if C==1 then
G[P]=cc
elseif C==2 then
G[P][Y]=ap
elseif C==3 then
G[P]=Y[ap]elseif C==4 then
G[P]={}elseif C==5 then
G[P]=Y-ap
elseif C==6 then
G[P]=Y/ap
elseif C==7 then
G[P]=Y(N(ap))elseif C==8 then
G[P]=#Y
elseif C==9 then
if G[P]then
aP=Y-1
end
elseif C==10 then
G[P]=Y>ap
end

aP=aP+1
end
end

function aQ(b,ar,bY)bB=h(ar,b[1])return l(j(g(j(bB,bY),b[11]),bB),bY)+b[10]end

function cd(b,ar,au)bv=h(ar,b[1])b[4]=bz(b[4],g(j(bv,au),-b[11]))b[1]=F(b[1],g(au,b[10]))end

function aS(b,ar,au)bv=h(ar,b[1])
b[5]=F(b[5],g(j(bv,au),b[11]))b[2]=F(b[2],g(au,b[10]))end

function an(cr,k)local ah=-cb
for d,v in bn(cr)do
ao=l(v[2],k)if cI(ao-ah)<.0005 then
aM[#aM+1]=d
elseif ao>ah then
cs=v[2]aM={d}ah=ao
end
end
return cs
end

function cC(bO,bN)k={1,0,0}z={}for db=1,32 do
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)<=0 then
return
end

z={e,z[1],z[2],z[3]}
a,c,E,ag=N(z)
if ag then
J=h(c,a)aj=h(E,a)cg=h(ag,a)A=g(a,-1)
Z=j(J,aj)ch=j(aj,cg)cf=j(cg,J)
if l(Z,A)>0 then
z={a,c,E}k=Z
elseif l(ch,A)>0 then
z={a,E,ag}k=ch
elseif l(cf,A)>0 then
z={a,ag,c}k=cf
else


af={{a,c,E},{a,E,ag},{a,ag,c},{c,ag,E}}for d,v in ipairs(af)do
v[4]=bi(bt(v[1],v[2],v[3]))end

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

at={}for d=#af,1,-1 do
aR=af[d]if l(aR[4],h(e,aR[1]))>0 then
for f=1,3 do
ax={aR[f],aR[(f%3)+1]}for ae,b_ in ipairs(at)do
if b_[1]==ax[2]and b_[2]==ax[1]then
bJ(at,ae)ax=cX
break
end
end

if ax then
at[#at+1]=ax
end
end



bJ(af,d)end
end



for d,v in ipairs(at)do
as={v[1],v[2],e}as[4]=bi(bt(as[1],as[2],as[3]))




af[#af+1]=as
end
end
return
end
elseif E then
J=h(c,a)aj=h(E,a)A=g(a,-1)
Z=j(J,aj)
if l(j(Z,aj),A)>0 then
z={a,E}k=j(j(aj,A),aj)elseif l(j(J,Z),A)>0 then
z={a,c}k=j(j(J,A),J)else
if l(Z,A)>0 then

k=Z;
else
z={a,E,c}k=g(Z,-1)end
end
elseif c then
J=h(c,a)A=g(a,-1)
if l(J,A)>0 then
k=j(j(J,A),J)else
z={a}k=A
end
else
z={a}k=g(a,-1)end
end

end

function cT(D,I)I=I or{}bS={}f=1
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

cv={I[1]or{0,0,0},I[2]or{0,0,0},I[3]or{0,0,0},I[4]or{1,0,0,0},I[5]or{0,0,0},I[6]or{0,0,0},bS,bR,bT,I[7]or 1,I[8]or 1,I[9]or{0,0,0},u[1][D][7],D,{},{},}ad[#ad+1]=cv
end

function j(a,c)return{a[2]*c[3]-a[3]*c[2],a[3]*c[1]-a[1]*c[3],a[1]*c[2]-a[2]*c[1]}end

function l(a,c)return a[1]*c[1]+a[2]*c[2]+a[3]*c[3]end

function ci(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bx=bp(S,{0,0,0})*.5
bw=g(S,1/bx)a_=cn(bx)return{cG(bx),bw[1]*a_,bw[2]*a_,bw[3]*a_}end
end

function bz(aL,S)local bj=cw(aL,ci(S))for d=1,4 do
bj[d]=aL[d]+bj[d]*.5
end
return cu(bj)end

function cw(cq,cp)local aD,x,w,aA=N(cq)local B,R,Q,az=N(cp)return{aD*B-x*R-w*Q-aA*az,aD*R+x*B+w*az-aA*Q,aD*Q-x*az+w*B+aA*R,aD*az+x*Q-w*R+aA*B}end

function bk(S,cy)local bQ={}for f=1,3 do
o=0
for ae=1,3 do
o=o+S[ae]*cy[f][ae]end
bQ[f]=o
end
return bQ
end













function cu(a,ay)ay=1/aK(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*ay,a[2]*ay,a[3]*ay,a[4]*ay}end

function co(aL)local V,M,L,K=N(aL)return{{1-(2*L*L+2*K*K),2*M*L+2*K*V,2*M*K-2*L*V},{2*M*L-2*K*V,1-(2*M*M+2*K*K),2*L*K+2*M*V},{2*M*K+2*L*V,2*L*K-2*M*V,1-(2*M*M+2*L*L)},}end






function onTick()for f=1,1 do
if cD(32)and not bm then
bf=property.getText(be)d=1
H=""
o=ba.sub(bf,d,d)while o~=""do
bh=ba.byte(o)if bh<45 then
if bh>33 then
H=(H..bh-35)+0
end

if _==1 then
bZ=H
u[H]=u[H]or{}elseif _==2 then
cz=H
aw=0
elseif _==3 then
bu=H
else
if aw==0 then
aw=cz
bu=bu-1
bs={}u[bZ][#u[bZ]+1]=bs
end
bs[#bs+1]=H
aw=aw-1
_=aN(aw,bu)>0 and _-1 or 0
end
_=_+1
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
if cA then
av(1)av(48)end

av(188)




aq={}
for D=1,#ad do
b=ad[D]b[4]=bz(b[4],g(b[5],-br))b[1]=F(b[1],g(b[2],br))b[2]=F(b[2],g(b[3],br))b[3]=g(b[12],1)


b[16]=co(b[4])

for f=1,#b[9]do
e=b[9][f]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])
end
end



av(324)




for d,n in bn(ad)do
for f,r in bn(ad)do
if d~=f and(n[10]>0 or r[10]>0 or n[11]>0 or r[11]>0)and bp(n[1],r[1])<=n[13]+r[13]then

U=n[9]X=r[9]
if#U>0 and#X>0 then

y=cC(U,X)
if y then
cY=n[15][f]or{}

an(U,y[1])W=aM
an(X,g(y[1],-1))ai=aM






if#W==1 then
p=U[W[1]][2]elseif#ai==1 then
p=X[ai[1]][2]elseif#W==2 and#ai==2 then
bq=h(U[W[2]][2],U[W[1]][2])bX=h(X[ai[2]][2],X[ai[1]][2])bP=j(bX,j(bq,bX))p=F(U[W[1]][2],g(bq,l(h(X[ai[1]][2],U[W[1]][2]),bP)/l(bq,bP)))else
p=n[13]>r[13]and X[ai[1]][2]or U[W[1]][2]end


aX=F(j(n[5],h(p,n[1])),n[2])aW=F(j(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(y[1],aI)if aH>0 then











bU=aQ(n,p,y[1])+aQ(r,p,y[1])

cF=aH
bg=cF/bU

aS(n,p,g(y[1],-bg))aS(r,p,g(y[1],bg))



aX=F(j(n[5],h(p,n[1])),n[2])aW=F(j(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(y[1],aI)
bG=h(aI,g(y[1],aH))
bH=bp(bG,{0,0,0})if bH>.001 then
aG=bi(bG)cx=aQ(n,p,aG)+aQ(r,p,aG)bW=bl(bH/cx,bg)
aS(n,p,g(aG,-bW))aS(r,p,g(aG,bW))end





bM=y[2]/bU

cd(n,p,g(y[1],-bM))cd(r,p,g(y[1],bM))end





end
end
end
end
end


av(700)



table.sort(aq,function(a,c)return a[5]>c[5]end)

end



end

function cV()for D=1,#ad do
b=ad[D]

for d=1,#b[7]do
e=b[7][d]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])e[3]=h(e[2],dk)
e[4]=bk(e[3],dj)bo=e[3]e[7]=aK(bo[1]^2+bo[2]^2+bo[3]^2)
e[5]={e[4][1]*bb/e[4][3],-e[4][2]*bb/e[4][3]}e[6]=e[4][3]>0 and 1 or 0

end

if b[11]>0 or not b[8][1][8]then

for d=1,#b[8]do
i=b[8][d],1

i[8]=bt(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end

for d=1,#b[8]do
i=b[8][d]m=b[7][i[1]]q=b[7][i[2]]s=b[7][i[3]]i[7]=aN(m[7],q[7],s[7])a=i[8]c=m[3]if l(a,c)>0 and i[7]>di then
ak=m[6]+q[6]+s[6]if ak==3 then

t={m[5],q[5],s[5]}elseif ak>=1 then
if m[6]==2-ak then
ac=m[5]ab=q[5]aa=s[5]elseif q[6]==2-ak then
ac=q[5]ab=m[5]aa=s[5]else
ac=s[5]ab=q[5]aa=m[5]end
if ak==2 then
bd=aT(aO(aJ(ab,ac),1000),ab)bc=aT(aO(aJ(aa,ac),1000),aa)




t={aa,ab,bd,bc}else
bd=aT(aO(aJ(ac,ab),1000),ab)bc=aT(aO(aJ(ac,aa),1000),aa)

t={ac,bc,bd}end
end

if ak>=1 then
m=t[1]q=t[2]s=t[3]
bE=bl(m[1],q[1],s[1])bD=aN(m[1],q[1],s[1])bC=bl(m[2],q[2],s[2])bF=aN(m[2],q[2],s[2])
if(bD>cL and bE<cK)and(bF>cJ and bC<cM)then
if bE<cQ or bD>cP or bC<cO or bF>cR then
for f=1,#by do
x,w=N(by[f])R,Q=N(by[f%cN+1])T={}bL=#t
for ae=1,bL do
aY=t[ae]aC,aB=N(aY)aV,aU=N(t[ae%bL+1])aF=(R-x)*(aB-w)-(Q-w)*(aC-x)aE=(R-x)*(aU-w)-(Q-w)*(aV-x)if aF*aE<0 then
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

aq[#aq+1]={t,i[4],i[5],i[6],i[7]*dg+dh}end
end
end
end
end
end

function onDraw()al=screen
local ck,cl,cW,bK=al.drawTriangleF,al.drawTriangle,al.drawRectF,al.setColor
V=al.getWidth()cB=al.getHeight()B=V/2
am=cB/2
bb=cm(cE/2)*B


























if bm then

for d=1,#aq do
i=aq[d]t=i[1]
m=t[1]for f=3,#t do
q=t[f-1]s=t[f]bK(i[2],i[3],i[4])ck(m[1]+B,m[2]+am,q[1]+B,q[2]+am,s[1]+B,s[2]+am)bK(i[2]*.5,i[3]*.5,i[4]*.5)cl(m[1]+B,m[2]+am-.5,q[1]+B,q[2]+am-.5,s[1]+B,s[2]+am-.5)end
end





























































end
end