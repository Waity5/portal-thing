N=math
aN=N.max
bl=N.min
aJ=math.sqrt
dd=N.floor
cu=N.pi
dc=input.getNumber
cE=input.getBool
ck=true
de=false
bn=ipairs
cJ=N.abs
bI=table.remove
bc=string
co=N.sin
cH=N.cos
cn=N.tan
di=N.atan
M=table.unpack
cb=N.huge

function aU(a,b)return{(a[1]+b[1]),(a[2]+b[2])}end
function aI(a,b)return{(a[1]-b[1]),(a[2]-b[2])}end
function aO(a,b)return{a[1]*b,a[2]*b}end



function H(a,b)return{a[1]+b[1],a[2]+b[2],a[3]+b[3]}end
function h(a,b)return{a[1]-b[1],a[2]-b[2],a[3]-b[3]}end
function g(a,b)return{a[1]*b,a[2]*b,a[3]*b}end

function bt(a,b,C)return j(h(b,a),h(C,a))end
function bj(a)return g(a,1/aJ(a[1]^2+a[2]^2+a[3]^2))end
function bp(a,b)return aJ((a[1]-b[1])^2+(a[2]-b[2])^2+(a[3]-b[3])^2)end

t={}bf=1
cZ=3
aa=1

cB=ck
db=0
bH=0
dg={0,-.4,0}ba=62.5
cS=0
ce=cu/180
cY=5/ba
cU=90*ce/ba
cF=90*ce
bd=1
br=1/ba

function aR(aP,B)D=_ENV
while B~=0 do
B,P,cc,cI=M(t[5][aP])Z,ao=D[cc],D[cI]

if B==1 then
D[P]=cc
elseif B==2 then
D[P][Z]=ao
elseif B==3 then
D[P]=Z[ao]elseif B==4 then
D[P]={}elseif B==5 then
D[P]=Z-ao
elseif B==6 then
D[P]=Z/ao
elseif B==7 then
D[P]=Z(M(ao))elseif B==8 then
D[P]=#Z
elseif B==9 then
if D[P]then
aP=Z-1
end
elseif B==10 then
D[P]=Z>ao
end

aP=aP+1
end
end

function aQ(c,aq,bY)bA=h(aq,c[1])return m(j(g(j(bA,bY),c[11]),bA),bY)+c[10]end

function cd(c,aq,au)bv=h(aq,c[1])c[4]=by(c[4],g(j(bv,au),-c[11]))c[1]=H(c[1],g(au,c[10]))end

function aT(c,aq,au)bv=h(aq,c[1])
c[5]=H(c[5],g(j(bv,au),c[11]))c[2]=H(c[2],g(au,c[10]))end

function am(cs,k)local ag=-cb
for d,u in bn(cs)do
an=m(u[2],k)if cJ(an-ag)<.0005 then
aM[#aM+1]=d
elseif an>ag then
ct=u[2]aM={d}ag=an
end
end
return ct
end

function cD(bN,bM)k={1,0,0}y={}for da=1,32 do
i=h(am(bN,k),am(bM,g(k,-1)))
if m(i,k)<=0 then
return
end

y={i,y[1],y[2],y[3]}
a,b,C,af=M(y)
if af then
I=h(b,a)aj=h(C,a)cg=h(af,a)z=g(a,-1)
_=j(I,aj)ch=j(aj,cg)cf=j(cg,I)
if m(_,z)>0 then
y={a,b,C}k=_
elseif m(ch,z)>0 then
y={a,C,af}k=ch
elseif m(cf,z)>0 then
y={a,af,b}k=cf
else


ae={{a,b,C},{a,C,af},{a,af,b},{b,af,C}}for d,u in ipairs(ae)do
u[4]=bj(bt(u[1],u[2],u[3]))end

for c_=1,32 do
ag=cb
for d,u in ipairs(ae)do
an=m(u[1],u[4])if an<ag then
ag=an
ca=u
end
end
k=ca[4]
i=h(am(bN,k),am(bM,g(k,-1)))
if m(i,k)-.001<=ag then
return{ca[4],m(i,k)}end

at={}for d=#ae,1,-1 do
aS=ae[d]if m(aS[4],h(i,aS[1]))>0 then
for f=1,3 do
aw={aS[f],aS[(f%3)+1]}for ad,b_ in ipairs(at)do
if b_[1]==aw[2]and b_[2]==aw[1]then
bI(at,ad)aw=cW
break
end
end

if aw then
at[#at+1]=aw
end
end



bI(ae,d)end
end



for d,u in ipairs(at)do
as={u[1],u[2],i}as[4]=bj(bt(as[1],as[2],as[3]))




ae[#ae+1]=as
end
end
return
end
elseif C then
I=h(b,a)aj=h(C,a)z=g(a,-1)
_=j(I,aj)
if m(j(_,aj),z)>0 then
y={a,C}k=j(j(aj,z),aj)elseif m(j(I,_),z)>0 then
y={a,b}k=j(j(I,z),I)else
if m(_,z)>0 then

k=_;
else
y={a,C,b}k=g(_,-1)end
end
elseif b then
I=h(b,a)z=g(a,-1)
if m(I,z)>0 then
k=j(j(I,z),I)else
y={a}k=z
end
else
y={a}k=g(a,-1)end
end

end

function cT(O,G)G=G or{}bR={}f=1
for d=t[1][O][1],t[1][O][2]do
p=t[2][d]bR[f]={{p[1],p[2],p[3]},{}}f=f+1
end
bQ={}f=1
for d=t[1][O][3],t[1][O][4]do
p=t[3][d]bQ[f]=p
f=f+1
end
bS={}f=1
for d=t[1][O][5],t[1][O][6]do
p=t[2][d]bS[f]={{p[1],p[2],p[3]},{}}f=f+1
end

cw={G[1]or{0,0,0},G[2]or{0,0,0},G[3]or{0,0,0},G[4]or{1,0,0,0},G[5]or{0,0,0},G[6]or{0,0,0},bR,bQ,bS,G[7]or 1,G[8]or 1,G[9]or{0,0,0},t[1][O][7],O,{},{},}ar[#ar+1]=cw
end

function j(a,b)return{a[2]*b[3]-a[3]*b[2],a[3]*b[1]-a[1]*b[3],a[1]*b[2]-a[2]*b[1]}end

function m(a,b)return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]end

function cj(S)if S[1]==0 and S[2]==0 and S[3]==0 then
return{1,0,0,0}else
bx=bp(S,{0,0,0})*.5
bw=g(S,1/bx)bb=co(bx)return{cH(bx),bw[1]*bb,bw[2]*bb,bw[3]*bb}end
end

function by(aL,S)local bk=cx(aL,cj(S))for d=1,4 do
bk[d]=aL[d]+bk[d]*.5
end
return cv(bk)end

function cx(cr,cq)local aC,w,v,az=M(cr)local A,R,Q,ay=M(cq)return{aC*A-w*R-v*Q-az*ay,aC*R+w*A+v*ay-az*Q,aC*Q-w*ay+v*A+az*R,aC*ay+w*Q-v*R+az*A}end

function bT(S,cz)local bP={}for f=1,3 do
p=0
for ad=1,3 do
p=p+S[ad]*cz[f][ad]end
bP[f]=p
end
return bP
end













function cv(a,ax)ax=1/aJ(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*ax,a[2]*ax,a[3]*ax,a[4]*ax}end

function cp(aL)local U,L,K,J=M(aL)return{{1-(2*K*K+2*J*J),2*L*K+2*J*U,2*L*J-2*K*U},{2*L*K-2*J*U,1-(2*L*L+2*J*J),2*K*J+2*L*U},{2*L*J+2*K*U,2*K*J-2*L*U,1-(2*L*L+2*K*K)},}end






function onTick()for f=1,1 do
if cE(32)and not bm then
bg=property.getText(bf)d=1
F=""
p=bc.sub(bg,d,d)while p~=""do
bi=bc.byte(p)if bi<45 then
if bi>33 then
F=(F..bi-35)+0
end

if aa==1 then
bZ=F
t[F]=t[F]or{}elseif aa==2 then
cA=F
av=0
elseif aa==3 then
bu=F
else
if av==0 then
av=cA
bu=bu-1
bs={}t[bZ][#t[bZ]+1]=bs
end
bs[#bs+1]=F
av=av-1
aa=aN(av,bu)>0 and aa-1 or 0
end
aa=aa+1
F=""
else
F=F..p
end
d=d+1
p=bc.sub(bg,d,d)end
bf=bf+1
bm=bg==""
end
end

if bm then
bH=bH+1
if cB then
aR(1)aR(39)end

aR(270)




E={}
for O=1,#ar do
c=ar[O]c[4]=by(c[4],g(c[5],-br))c[1]=H(c[1],g(c[2],br))c[2]=H(c[2],g(c[3],br))c[3]=g(c[12],1)


c[16]=cp(c[4])

for d=7,9,2 do
for f=1,#c[d]do
i=c[d][f]i[2]=bT(i[1],c[16])i[2]=H(i[2],c[1])i[3]=h(i[2],dh)
i[4]=bT(i[3],df)bo=i[3]i[7]=aJ(bo[1]^2+bo[2]^2+bo[3]^2)
i[5]={i[4][1]*bd/i[4][3],-i[4][2]*bd/i[4][3]}i[6]=i[4][3]>0 and 1 or-1

end
end

if c[11]>0 or not c[8][1][8]then

for d=1,#c[8]do
e=c[8][d],1

e[8]=bt(c[7][e[1]][2],c[7][e[2]][2],c[7][e[3]][2])end
end

for d=1,#c[8]do
e=c[8][d]l=c[7][e[1]]n=c[7][e[2]]r=c[7][e[3]]e[7]=aN(l[7],n[7],r[7])a=e[8]b=l[3]if m(a,b)>0 then
ap=l[6]+n[6]+r[6]if ap==3 then
E[#E+1]={l[5],n[5],r[5],e[4],e[5],e[6],e[7]}elseif ap>=-1 then
if l[6]==-ap then
ac=l[5]ab=n[5]W=r[5]elseif n[6]==-ap then
ac=n[5]ab=l[5]W=r[5]else
ac=r[5]ab=n[5]W=l[5]end
if ap==1 then
aK=aU(aO(aI(ab,ac),1000),ab)be=aU(aO(aI(W,ac),1000),W)

E[#E+1]={ab,aK,W,e[4],e[5],e[6],e[7]}E[#E+1]={W,aK,be,e[4],e[5],e[6],e[7]}else
aK=aU(aO(aI(ac,ab),1000),ab)be=aU(aO(aI(ac,W),1000),W)
E[#E+1]={ac,aK,be,e[4],e[5],e[6],e[7]}end
end
end
end
end



aR(459)




for d,o in bn(ar)do
for f,s in bn(ar)do
if d~=f and(o[10]>0 or s[10]>0 or o[11]>0 or s[11]>0)and bp(o[1],s[1])<=o[13]+s[13]then

Y=o[9]ai=s[9]
x=cD(Y,ai)
if x then
cX=o[15][f]or{}

am(Y,x[1])X=aM
am(ai,g(x[1],-1))ah=aM






if#X==1 then
q=Y[X[1]][2]elseif#ah==1 then
q=ai[ah[1]][2]elseif#X==2 and#ah==2 then
bq=h(Y[X[2]][2],Y[X[1]][2])bX=h(ai[ah[2]][2],ai[ah[1]][2])bO=j(bX,j(bq,bX))q=H(Y[X[1]][2],g(bq,m(h(ai[ah[1]][2],Y[X[1]][2]),bO)/m(bq,bO)))else
q=o[13]>s[13]and ai[ah[1]][2]or Y[X[1]][2]end


aZ=H(j(o[5],h(q,o[1])),o[2])aY=H(j(s[5],h(q,s[1])),s[2])aH=h(aZ,aY)
aG=m(x[1],aH)if aG>0 then











bU=aQ(o,q,x[1])+aQ(s,q,x[1])

cG=aG
bh=cG/bU

aT(o,q,g(x[1],-bh))aT(s,q,g(x[1],bh))



aZ=H(j(o[5],h(q,o[1])),o[2])aY=H(j(s[5],h(q,s[1])),s[2])aH=h(aZ,aY)
aG=m(x[1],aH)
bF=h(aH,g(x[1],aG))
bG=bp(bF,{0,0,0})if bG>.001 then
aF=bj(bF)cy=aQ(o,q,aF)+aQ(s,q,aF)bW=bl(bG/cy,bh)
aT(o,q,g(aF,-bW))aT(s,q,g(aF,bW))end





bL=x[2]/bU

cd(o,q,g(x[1],-bL))cd(s,q,g(x[1],bL))end





end
end
end
end


table.sort(E,function(a,b)return a[7]>b[7]end)

end



end

function onDraw()ak=screen
local cl,cm,cV,bJ=ak.drawTriangleF,ak.drawTriangle,ak.drawRectF,ak.setColor
U=ak.getWidth()cC=ak.getHeight()A=U/2
al=cC/2
bd=cn(cF/2)*A


























if bm then
ci=#aX

for d=1,#E do
e=E[d]l=e[1]n=e[2]r=e[3]
bD=bl(l[1],n[1],r[1])bC=aN(l[1],n[1],r[1])bB=bl(l[2],n[2],r[2])bE=aN(l[2],n[2],r[2])
if(bC>cM and bD<cL)and(bE>cK and bB<cN)then
V={l,n,r}if bD<cQ or bC>cP or bB<cO or bE>cR then
for f=1,#aX do
w,v=M(aX[f])R,Q=M(aX[f%ci+1])T={}bK=#V
for ad=1,bK do
a_=V[ad]aB,aA=M(a_)aW,aV=M(V[ad%bK+1])aE=(R-w)*(aA-v)-(Q-v)*(aB-w)aD=(R-w)*(aV-v)-(Q-v)*(aW-w)if aE*aD<0 then
bz=((aW-aB)*(v-aA)-(aV-aA)*(w-aB))/((aV-aA)*(R-w)-(aW-aB)*(Q-v))bV={w+(bz*(R-w)),v+(bz*(Q-v))}end
if aE>0 and aD<0 then
T[#T+1]=a_
T[#T+1]=bV
elseif aE<0 and aD<0 then

elseif aE<0 and aD>0 then
T[#T+1]=bV
else
T[#T+1]=a_
end
end
V=T
end

l=V[1]

end

for f=3,#V do
n=V[f-1]r=V[f]bJ(e[4],e[5],e[6])cl(l[1]+A,l[2]+al,n[1]+A,n[2]+al,r[1]+A,r[2]+al)bJ(e[4]*.5,e[5]*.5,e[6]*.5)cm(l[1]+A,l[2]+al-.5,n[1]+A,n[2]+al-.5,r[1]+A,r[2]+al-.5)end


end
end





























































end
end