LV<-function(a12, a21){
  num_gen<-30
  generation<-1:num_gen
  N1<-rep(0,num_gen)
  N2<-rep(0,num_gen)
  N1[1]<-5
  N2[1]<-5
  K1<-100
  K2<-120
  growth.rate1<-1.2
  growth.rate2<-1.2
  for (t in 1:(num_gen-1)){
    N1[t+1]=N1[t]+(growth.rate1*N1[t]*((K1-N1[t]-(a12*N2[t]))/K1))
    N2[t+1]=N2[t]+(growth.rate2*N2[t]*((K2-N2[t]-(a21*N1[t]))/K2))
  }
  if(a12==0 & a21!=0)
    {plot(N1~generation, ylim=c(0,120), type='b', ylab="N")
    lines(N2~generation, type='n')
    } 
  if(a12!=0 & a21==0) 
    {plot(N2~generation, ylim=c(0,120), type='b', ylab="N", col="red")
      lines(N1~generation, type='n')
    }
  if(a12!=0 & a21!=0)
    {plot(N1~generation, ylim=c(0,120), type='b', ylab="N")
    lines(N2~generation, type='b', col="red")}
  }
par(mfrow=c(3,1))
LV(0,0.8)
text(2,100, "species 1")

LV(1.2,0)
text(2,100, "species 2")

LV(1.2,0.8)
text(2,100, "competition")



saveGIF({
  for(a12 in seq(0.5, 1.5, by=0.1)){
    LV(0.6, 0.8, a12, 1.0)
  }
}, interval=0.2)

