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
H=table.unpack
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
aa=1

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

function av(aP,D)G=_ENV
while D~=0 do
D,P,cc,cH=H(u[5][aP])Z,ap=G[cc],G[cH]

if D==1 then
G[P]=cc
elseif D==2 then
G[P][Z]=ap
elseif D==3 then
G[P]=Z[ap]elseif D==4 then
G[P]={}elseif D==5 then
G[P]=Z-ap
elseif D==6 then
G[P]=Z/ap
elseif D==7 then
G[P]=Z(H(ap))elseif D==8 then
G[P]=#Z
elseif D==9 then
if G[P]then
aP=Z-1
end
elseif D==10 then
G[P]=Z>ap
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

function cC(bO,bN)k={1,0,0}A={}for db=1,32 do
e=h(an(bO,k),an(bN,g(k,-1)))
if l(e,k)<=0 then
return
end

A={e,A[1],A[2],A[3]}
a,c,E,ag=H(A)
if ag then
K=h(c,a)aj=h(E,a)cg=h(ag,a)B=g(a,-1)
_=j(K,aj)ch=j(aj,cg)cf=j(cg,K)
if l(_,B)>0 then
A={a,c,E}k=_
elseif l(ch,B)>0 then
A={a,E,ag}k=ch
elseif l(cf,B)>0 then
A={a,ag,c}k=cf
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
K=h(c,a)aj=h(E,a)B=g(a,-1)
_=j(K,aj)
if l(j(_,aj),B)>0 then
A={a,E}k=j(j(aj,B),aj)elseif l(j(K,_),B)>0 then
A={a,c}k=j(j(K,B),K)else
if l(_,B)>0 then

k=_;
else
A={a,E,c}k=g(_,-1)end
end
elseif c then
K=h(c,a)B=g(a,-1)
if l(K,B)>0 then
k=j(j(K,B),K)else
A={a}k=B
end
else
A={a}k=g(a,-1)end
end

end

function cT(w,J)J=J or{}bS={}f=1
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

cv={J[1]or{0,0,0},J[2]or{0,0,0},J[3]or{0,0,0},J[4]or{1,0,0,0},J[5]or{0,0,0},J[6]or{0,0,0},bS,bR,bT,J[7]or 1,J[8]or 1,J[9]or{0,0,0},u[1][w][7],w,{},{},}T[#T+1]=cv
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

function cw(cq,cp)local aD,y,x,aA=H(cq)local C,R,Q,az=H(cp)return{aD*C-y*R-x*Q-aA*az,aD*R+y*C+x*az-aA*Q,aD*Q-y*az+x*C+aA*R,aD*az+y*Q-x*R+aA*C}end

function bk(S,cy)local bQ={}for f=1,3 do
o=0
for ae=1,3 do
o=o+S[ae]*cy[f][ae]end
bQ[f]=o
end
return bQ
end













function cu(a,ay)ay=1/aK(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*ay,a[2]*ay,a[3]*ay,a[4]*ay}end

function co(aL)local W,N,M,L=H(aL)return{{1-(2*M*M+2*L*L),2*N*M+2*L*W,2*N*L-2*M*W},{2*N*M-2*L*W,1-(2*N*N+2*L*L),2*M*L+2*N*W},{2*N*L+2*M*W,2*M*L-2*N*W,1-(2*N*N+2*M*M)},}end






function onTick()for f=1,1 do
if cD(32)and not bm then
bf=property.getText(be)d=1
I=""
o=ba.sub(bf,d,d)while o~=""do
bh=ba.byte(o)if bh<45 then
if bh>33 then
I=(I..bh-35)+0
end

if aa==1 then
bZ=I
u[I]=u[I]or{}elseif aa==2 then
cz=I
aw=0
elseif aa==3 then
bu=I
else
if aw==0 then
aw=cz
bu=bu-1
bs={}u[bZ][#u[bZ]+1]=bs
end
bs[#bs+1]=I
aw=aw-1
aa=aN(aw,bu)>0 and aa-1 or 0
end
aa=aa+1
I=""
else
I=I..o
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
av(1)av(49)end

av(170)




aq={}
for w=1,#T do
b=T[w]b[4]=bz(b[4],g(b[5],-br))b[1]=F(b[1],g(b[2],br))b[2]=F(b[2],g(b[3],br))b[3]=g(b[12],1)


b[16]=co(b[4])

for f=1,#b[9]do
e=b[9][f]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])
end
end



av(295)




for d,n in bn(T)do
for f,r in bn(T)do
if d~=f and(n[10]>0 or r[10]>0 or n[11]>0 or r[11]>0)and bp(n[1],r[1])<=n[13]+r[13]then

V=n[9]Y=r[9]
if#V>0 and#Y>0 then

z=cC(V,Y)
if z then
cY=n[15][f]or{}

an(V,z[1])X=aM
an(Y,g(z[1],-1))ai=aM






if#X==1 then
p=V[X[1]][2]elseif#ai==1 then
p=Y[ai[1]][2]elseif#X==2 and#ai==2 then
bq=h(V[X[2]][2],V[X[1]][2])bX=h(Y[ai[2]][2],Y[ai[1]][2])bP=j(bX,j(bq,bX))p=F(V[X[1]][2],g(bq,l(h(Y[ai[1]][2],V[X[1]][2]),bP)/l(bq,bP)))else
p=n[13]>r[13]and Y[ai[1]][2]or V[X[1]][2]end


aX=F(j(n[5],h(p,n[1])),n[2])aW=F(j(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(z[1],aI)if aH>0 then











bU=aQ(n,p,z[1])+aQ(r,p,z[1])

cF=aH
bg=cF/bU

aS(n,p,g(z[1],-bg))aS(r,p,g(z[1],bg))



aX=F(j(n[5],h(p,n[1])),n[2])aW=F(j(r[5],h(p,r[1])),r[2])aI=h(aX,aW)
aH=l(z[1],aI)
bG=h(aI,g(z[1],aH))
bH=bp(bG,{0,0,0})if bH>.001 then
aG=bi(bG)cx=aQ(n,p,aG)+aQ(r,p,aG)bW=bl(bH/cx,bg*.5)
aS(n,p,g(aG,-bW))aS(r,p,g(aG,bW))end





bM=z[2]/bU

cd(n,p,g(z[1],-bM))cd(r,p,g(z[1],bM))end





end
end
end
end
end



for w=1,#T do
b=T[w]

for d=1,#b[7]do
e=b[7][d]e[2]=bk(e[1],b[16])e[2]=F(e[2],b[1])
end

if b[11]>0 or not b[8][1][8]then

for d=1,#b[8]do
i=b[8][d]
i[8]=bt(b[7][i[1]][2],b[7][i[2]][2],b[7][i[3]][2])end
end
end

av(649)



table.sort(aq,function(a,c)return a[5]>c[5]end)

end



end

function cV()


for w=1,#T do
b=T[w]

for d=1,#b[7]do
e=b[7][d]e[3]=h(e[2],dk)
e[4]=bk(e[3],dj)bo=e[3]e[7]=aK(bo[1]^2+bo[2]^2+bo[3]^2)
e[5]={e[4][1]*bb/e[4][3],-e[4][2]*bb/e[4][3]}e[6]=e[4][3]>0 and 1 or 0

end





for d=1,#b[8]do
i=b[8][d]m=b[7][i[1]]q=b[7][i[2]]s=b[7][i[3]]i[7]=aN(m[7],q[7],s[7])c=m[3]if l(i[8],c)>0 and i[7]>di then
ak=m[6]+q[6]+s[6]if ak==3 then

t={m[5],q[5],s[5]}elseif ak>=1 then
if m[6]==2-ak then
ad=m[5]ac=q[5]ab=s[5]elseif q[6]==2-ak then
ad=q[5]ac=m[5]ab=s[5]else
ad=s[5]ac=q[5]ab=m[5]end
if ak==2 then
bd=aT(aO(aJ(ac,ad),1000),ac)bc=aT(aO(aJ(ab,ad),1000),ab)




t={ab,ac,bd,bc}else
bd=aT(aO(aJ(ad,ac),1000),ac)bc=aT(aO(aJ(ad,ab),1000),ab)

t={ad,bc,bd}end
end

if ak>=1 then
m=t[1]q=t[2]s=t[3]
bE=bl(m[1],q[1],s[1])bD=aN(m[1],q[1],s[1])bC=bl(m[2],q[2],s[2])bF=aN(m[2],q[2],s[2])
if(bD>cL and bE<cK)and(bF>cJ and bC<cM)then
if bE<cQ or bD>cP or bC<cO or bF>cR then
for f=1,#by do
y,x=H(by[f])R,Q=H(by[f%cN+1])U={}bL=#t
for ae=1,bL do
aY=t[ae]aC,aB=H(aY)aV,aU=H(t[ae%bL+1])aF=(R-y)*(aB-x)-(Q-x)*(aC-y)aE=(R-y)*(aU-x)-(Q-x)*(aV-y)if aF*aE<0 then
bA=((aV-aC)*(x-aB)-(aU-aB)*(y-aC))/((aU-aB)*(R-y)-(aV-aC)*(Q-x))bV={y+(bA*(R-y)),x+(bA*(Q-x))}end
if aF>0 and aE<0 then
U[#U+1]=aY
U[#U+1]=bV
elseif aF<0 and aE<0 then

elseif aF<0 and aE>0 then
U[#U+1]=bV
else
U[#U+1]=aY
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
W=al.getWidth()cB=al.getHeight()C=W/2
am=cB/2
bb=cm(cE/2)*C


























if bm then

for d=1,#aq do
i=aq[d]t=i[1]
m=t[1]for f=3,#t do
q=t[f-1]s=t[f]bK(i[2],i[3],i[4])ck(m[1]+C,m[2]+am,q[1]+C,q[2]+am,s[1]+C,s[2]+am)bK(i[2]*.5,i[3]*.5,i[4]*.5)cl(m[1]+C,m[2]+am-.5,q[1]+C,q[2]+am-.5,s[1]+C,s[2]+am-.5)end
end





























































end
end