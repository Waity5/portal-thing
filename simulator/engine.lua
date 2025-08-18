R=math
bd=R.max
bz=R.min
a_=math.sqrt
dx=R.floor
cK=R.pi
dw=input.getNumber
cU=input.getBool
cz=true
dy=false
aL=ipairs
cZ=R.abs
bV=table.remove
br=string
cF=R.sin
cX=R.cos
cE=R.tan
dC=R.atan
P=table.unpack
cr=R.huge

function bk(a,b)return{(a[1]+b[1]),(a[2]+b[2])}end
function aZ(a,b)return{(a[1]-b[1]),(a[2]-b[2])}end
function be(a,b)return{a[1]*b,a[2]*b}end



function p(a,b)return{a[1]+b[1],a[2]+b[2],a[3]+b[3]}end
function i(a,b)return{a[1]-b[1],a[2]-b[2],a[3]-b[3]}end
function e(a,b)return{a[1]*b,a[2]*b,a[3]*b}end

function bE(a,b,F)return k(i(b,a),i(F,a))end
function ax(a)return e(a,1/a_(a[1]^2+a[2]^2+a[3]^2))end
function aB(a,b)return a_((a[1]-b[1])^2+(a[2]-b[2])^2+(a[3]-b[3])^2)end

v={}bu=1
ds=3
al=1

cR=cz
dv=0
bU=0
dA={0,-.4,0}bp=62.5
dh=0
ct=cK/180
dr=5/bp
dl=90*ct/bp
cV=90*ct
bs=1
bh=1/bp

function bg(bf,E)G=_ENV
while E~=0 do
E,T,cs,cY=P(v[5][bf])ai,aD=G[cs],G[cY]

if E==1 then
G[T]=cs
elseif E==2 then
G[T][ai]=aD
elseif E==3 then
G[T]=ai[aD]elseif E==4 then
G[T]={}elseif E==5 then
G[T]=ai-aD
elseif E==6 then
G[T]=ai/aD
elseif E==7 then
G[T]=ai(P(aD))elseif E==8 then
G[T]=#ai
elseif E==9 then
if G[T]then
bf=ai-1
end
elseif E==10 then
G[T]=ai>aD
end

bf=bf+1
end
end

function af(c,aI,cl)bL=i(aI,c[1])return m(k(e(k(bL,cl),c[11]),bL),cl)+c[10]end

function bj(c,aI,J)bG=i(aI,c[1])c[4]=bJ(c[4],e(k(bG,J),-c[11]))c[1]=p(c[1],e(J,c[10]))end

function U(c,aI,J)bG=i(aI,c[1])
c[5]=p(c[5],e(k(bG,J),c[11]))c[2]=p(c[2],e(J,c[10]))end

function az(cI,n)local ar=-cr
for f,w in aL(cI)do
aC=m(w[2],n)if cZ(aC-ar)<.0005 then
bc[#bc+1]=f
elseif aC>ar then
cJ=w[2]bc={f}ar=aC
end
end
return cJ
end

function cT(b_,bZ)n={1,0,0}A={}for du=1,32 do
l=i(az(b_,n),az(bZ,e(n,-1)))
if m(l,n)<=0 then
return
end

A={l,A[1],A[2],A[3]}
a,b,F,aq=P(A)
if aq then
L=i(b,a)au=i(F,a)cv=i(aq,a)B=e(a,-1)
aj=k(L,au)cw=k(au,cv)cu=k(cv,L)
if m(aj,B)>0 then
A={a,b,F}n=aj
elseif m(cw,B)>0 then
A={a,F,aq}n=cw
elseif m(cu,B)>0 then
A={a,aq,b}n=cu
else


ap={{a,b,F},{a,F,aq},{a,aq,b},{b,aq,F}}for f,w in ipairs(ap)do
w[4]=ax(bE(w[1],w[2],w[3]))end

for dt=1,32 do
ar=cr
for f,w in ipairs(ap)do
aC=m(w[1],w[4])if aC<ar then
ar=aC
cq=w
end
end
n=cq[4]
l=i(az(b_,n),az(bZ,e(n,-1)))
if m(l,n)-.001<=ar then
return{cq[4],m(l,n)}end

aK={}for f=#ap,1,-1 do
bi=ap[f]if m(bi[4],i(l,bi[1]))>0 then
for j=1,3 do
aO={bi[j],bi[(j%3)+1]}for ao,cp in ipairs(aK)do
if cp[1]==aO[2]and cp[2]==aO[1]then
bV(aK,ao)aO=dp
break
end
end

if aO then
aK[#aK+1]=aO
end
end



bV(ap,f)end
end



for f,w in ipairs(aK)do
aJ={w[1],w[2],l}aJ[4]=ax(bE(aJ[1],aJ[2],aJ[3]))




ap[#ap+1]=aJ
end
end
return
end
elseif F then
L=i(b,a)au=i(F,a)B=e(a,-1)
aj=k(L,au)
if m(k(aj,au),B)>0 then
A={a,F}n=k(k(au,B),au)elseif m(k(L,aj),B)>0 then
A={a,b}n=k(k(L,B),L)else
if m(aj,B)>0 then

n=aj;
else
A={a,F,b}n=e(aj,-1)end
end
elseif b then
L=i(b,a)B=e(a,-1)
if m(L,B)>0 then
n=k(k(L,B),L)else
A={a}n=B
end
else
A={a}n=e(a,-1)end
end

end

function dj(S,K)K=K or{}ce={}j=1
for f=v[1][S][1],v[1][S][2]do
r=v[2][f]ce[j]={{r[1],r[2],r[3]},{}}j=j+1
end
cd={}j=1
for f=v[1][S][3],v[1][S][4]do
r=v[3][f]cd[j]=r
j=j+1
end
cf={}j=1
for f=v[1][S][5],v[1][S][6]do
r=v[2][f]cf[j]={{r[1],r[2],r[3]},{}}j=j+1
end

cM={K[1]or{0,0,0},K[2]or{0,0,0},K[3]or{0,0,0},K[4]or{1,0,0,0},K[5]or{0,0,0},K[6]or{0,0,0},ce,cd,cf,K[7]or 1,K[8]or 1,K[9]or{0,0,0},v[1][S][7],S,{},{},}Q[#Q+1]=cM
end

function k(a,b)return{a[2]*b[3]-a[3]*b[2],a[3]*b[1]-a[1]*b[3],a[1]*b[2]-a[2]*b[1]}end

function m(a,b)return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]end

function cy(X)if X[1]==0 and X[2]==0 and X[3]==0 then
return{1,0,0,0}else
bI=aB(X,{0,0,0})*.5
bH=e(X,1/bI)bq=cF(bI)return{cX(bI),bH[1]*bq,bH[2]*bq,bH[3]*bq}end
end

function bJ(bb,X)local by=cN(bb,cy(X))for f=1,4 do
by[f]=bb[f]+by[f]*.5
end
return cL(by)end

function cN(cH,cG)local aU,y,x,aR=P(cH)local C,W,V,aQ=P(cG)return{aU*C-y*W-x*V-aR*aQ,aU*W+y*C+x*aQ-aR*V,aU*V-y*aQ+x*C+aR*W,aU*aQ+y*V-x*W+aR*C}end

function _(X,cP)local cc={}for j=1,3 do
r=0
for ao=1,3 do
r=r+X[ao]*cP[j][ao]end
cc[j]=r
end
return cc
end













function cL(a,aP)aP=1/a_(a[1]^2+a[2]^2+a[3]^2+a[4]^2)return{a[1]*aP,a[2]*aP,a[3]*aP,a[4]*aP}end

function aH(bb)local ab,O,N,M=P(bb)return{{1-(2*N*N+2*M*M),2*O*N+2*M*ab,2*O*M-2*N*ab},{2*O*N-2*M*ab,1-(2*O*O+2*M*M),2*N*M+2*O*ab},{2*O*M+2*N*ab,2*N*M-2*O*ab,1-(2*O*O+2*N*N)},}end






function onTick()for j=1,1 do
if cU(32)and not bA then
bv=property.getText(bu)f=1
I=""
r=br.sub(bv,f,f)while r~=""do
bx=br.byte(r)if bx<45 then
if bx>33 then
I=(I..bx-35)+0
end

if al==1 then
cm=I
v[I]=v[I]or{}elseif al==2 then
cQ=I
aM=0
elseif al==3 then
bF=I
else
if aM==0 then
aM=cQ
bF=bF-1
bD={}v[cm][#v[cm]+1]=bD
end
bD[#bD+1]=I
aM=aM-1
al=bd(aM,bF)>0 and al-1 or 0
end
al=al+1
I=""
else
I=I..r
end
f=f+1
r=br.sub(bv,f,f)end
bu=bu+1
bA=bv==""
end
end

if bA then
bU=bU+1
if cR then
bg(1)bg(29)end

bg(260)




H={}
for S=1,#Q do
c=Q[S]c[4]=bJ(c[4],e(c[5],-bh))c[1]=p(c[1],e(c[2],bh))c[2]=p(c[2],e(c[3],bh))c[3]=e(c[12],1)


c[16]=aH(c[4])

for f=7,9,2 do
for j=1,#c[f]do
l=c[f][j]l[2]=_(l[1],c[16])l[2]=p(l[2],c[1])l[3]=i(l[2],dB)
l[4]=_(l[3],dz)bB=l[3]l[7]=a_(bB[1]^2+bB[2]^2+bB[3]^2)
l[5]={l[4][1]*bs/l[4][3],-l[4][2]*bs/l[4][3]}l[6]=l[4][3]>0 and 1 or-1

end
end

if c[11]>0 or not c[8][1][8]then

for f=1,#c[8]do
h=c[8][f],1
di=h[1]+1

h[8]=bE(c[7][h[1]][2],c[7][h[2]][2],c[7][h[3]][2])end
end

for f=1,#c[8]do
h=c[8][f]o=c[7][h[1]]q=c[7][h[2]]t=c[7][h[3]]h[7]=bd(o[7],q[7],t[7])a=h[8]b=o[3]if m(a,b)>0 then
aG=o[6]+q[6]+t[6]if aG==3 then
H[#H+1]={o[5],q[5],t[5],h[4],h[5],h[6],h[7]}elseif aG>=-1 then
if o[6]==-aG then
an=o[5]am=q[5]ad=t[5]elseif q[6]==-aG then
an=q[5]am=o[5]ad=t[5]else
an=t[5]am=q[5]ad=o[5]end
if aG==1 then
ba=bk(be(aZ(am,an),1000),am)bt=bk(be(aZ(ad,an),1000),ad)

H[#H+1]={am,ba,ad,h[4],h[5],h[6],h[7]}H[#H+1]={ad,ba,bt,h[4],h[5],h[6],h[7]}else
ba=bk(be(aZ(an,am),1000),am)bt=bk(be(aZ(an,ad),1000),ad)
H[#H+1]={an,ba,bt,h[4],h[5],h[6],h[7]}end
end
end
end
end



bg(439)



for f,aw in aL(dn)do
co=aw[4]cn=aw[5]d=Q[aw[1]]g=Q[aw[2]]ca=Q[aw[3]]aa=aw[6]if aa then
aa=ax(_(aa,g[16]))end

u=p(_(co,d[16]),d[1])aN=p(_(cn,g[16]),ca[1])
ak=i(u,aN)if aa then
ak=i(ak,e(aa,m(ak,aa)))end
cD=aB(ak,{0,0,0})if cD>.0001 then
bT=ax(ak)ae=af(d,u,bT)+af(g,u,bT)bj(d,u,e(ak,-1/ae))bj(g,u,e(ak,1/ae))end

d[16]=aH(d[4])g[16]=aH(g[4])
u=p(_(co,d[16]),d[1])aN=p(_(cn,g[16]),ca[1])
aF=p(k(d[5],i(u,d[1])),d[2])aE=p(k(g[5],i(aN,g[1])),g[2])D=i(aF,aE)if aa then
D=i(D,e(aa,m(D,aa)))end
cC=aB(D,{0,0,0})if cC>.0001 then
bR=ax(D)ae=af(d,u,bR)+af(g,u,bR)U(d,u,e(D,-1/ae))U(g,u,e(D,1/ae))end

d[16]=aH(d[4])g[16]=aH(g[4])end



for f,Y in aL(dk)do
d=Q[Y[1]]g=Q[Y[2]]u=p(_(Y[3],d[16]),d[1])aN=p(_(Y[4],g[16]),g[1])
cj=i(aN,u)aA=aB(cj,{0,0,0})ci=e(cj,1/aA)if aA>.0001 then
J=e(ci,(Y[5]-aA)*Y[6]*bh)U(d,u,e(J,-1))U(g,u,J)
J=e(ci,((Y[8]or aA)-aA)*Y[7])U(d,u,e(J,-1))U(g,u,J)end

Y[8]=aA
end





for f,d in aL(Q)do
for j,g in aL(Q)do
if f~=j and(d[10]>0 or g[10]>0 or d[11]>0 or g[11]>0)and aB(d[1],g[1])<=d[13]+g[13]then

ah=d[9]at=g[9]
z=cT(ah,at)
if z then
dq=d[15][j]or{}

az(ah,z[1])ag=bc
az(at,e(z[1],-1))as=bc






if#ag==1 then
s=ah[ag[1]][2]elseif#as==1 then
s=at[as[1]][2]elseif#ag==2 and#as==2 then
bC=i(ah[ag[2]][2],ah[ag[1]][2])ck=i(at[as[2]][2],at[as[1]][2])cb=k(ck,k(bC,ck))s=p(ah[ag[1]][2],e(bC,m(i(at[as[1]][2],ah[ag[1]][2]),cb)/m(bC,cb)))else
s=d[13]>g[13]and at[as[1]][2]or ah[ag[1]][2]end


aF=p(k(d[5],i(s,d[1])),d[2])aE=p(k(g[5],i(s,g[1])),g[2])D=i(aF,aE)
aY=m(z[1],D)if aY>0 then











ae=af(d,s,z[1])+af(g,s,z[1])

cW=aY
bw=cW/ae

U(d,s,e(z[1],-bw))U(g,s,e(z[1],bw))



aF=p(k(d[5],i(s,d[1])),d[2])aE=p(k(g[5],i(s,g[1])),g[2])D=i(aF,aE)
aY=m(z[1],D)
bQ=i(D,e(z[1],aY))
bS=aB(bQ,{0,0,0})if bS>.001 then
aX=ax(bQ)cO=af(d,s,aX)+af(g,s,aX)ch=bz(bS/cO,bw)
U(d,s,e(aX,-ch))U(g,s,e(aX,ch))end





bY=z[2]/ae

bj(d,s,e(z[1],-bY))bj(g,s,e(z[1],bY))end





end
end
end
end


table.sort(H,function(a,b)return a[7]>b[7]end)

end



end

function onDraw()av=screen
local cA,cB,dm,bW=av.drawTriangleF,av.drawTriangle,av.drawRectF,av.setColor
ab=av.getWidth()cS=av.getHeight()C=ab/2
ay=cS/2
bs=cE(cV/2)*C


























if bA then
cx=#bn

for f=1,#H do
h=H[f]o=h[1]q=h[2]t=h[3]
bO=bz(o[1],q[1],t[1])bN=bd(o[1],q[1],t[1])bM=bz(o[2],q[2],t[2])bP=bd(o[2],q[2],t[2])
if(bN>db and bO<da)and(bP>c_ and bM<dc)then
ac={o,q,t}if bO<df or bN>de or bM<dd or bP>dg then
for j=1,#bn do
y,x=P(bn[j])W,V=P(bn[j%cx+1])Z={}bX=#ac
for ao=1,bX do
bo=ac[ao]aT,aS=P(bo)bm,bl=P(ac[ao%bX+1])aW=(W-y)*(aS-x)-(V-x)*(aT-y)aV=(W-y)*(bl-x)-(V-x)*(bm-y)if aW*aV<0 then
bK=((bm-aT)*(x-aS)-(bl-aS)*(y-aT))/((bl-aS)*(W-y)-(bm-aT)*(V-x))cg={y+(bK*(W-y)),x+(bK*(V-x))}end
if aW>0 and aV<0 then
Z[#Z+1]=bo
Z[#Z+1]=cg
elseif aW<0 and aV<0 then

elseif aW<0 and aV>0 then
Z[#Z+1]=cg
else
Z[#Z+1]=bo
end
end
ac=Z
end

o=ac[1]

end

for j=3,#ac do
q=ac[j-1]t=ac[j]bW(h[4],h[5],h[6])cA(o[1]+C,o[2]+ay,q[1]+C,q[2]+ay,t[1]+C,t[2]+ay)bW(h[4]*.5,h[5]*.5,h[6]*.5)cB(o[1]+C,o[2]+ay-.5,q[1]+C,q[2]+ay-.5,t[1]+C,t[2]+ay-.5)end


end
end





























































end
end