demo <- seq (1,100,by=2) # sequence  1, 3, ..., 99
n<-length(demo) #  size of the foo sequence
demo.squared = NULL #  empty object

for (i in 1:n) { # our counter
  demo.squared[i] = demo[i]^2 # the task
}

#can shorten into
demo.squared2<-demo^2
plot (demo~demo.squared2)

num_gen<-10  # no. generation
generation<-1:num_gen # create a variable generation
N <- rep (0,num_gen) #  "vector" of 10 zeros (could be `NULL`)
lambda <- 2 # growth rate
N[1] <- 2 # We need to set initial pop size
for (t in 1:(num_gen - 1)) { # the counter
  N[t+1]=lambda*N[t]  # task: double individuals
}
plot(N~generation, type='b', col='blue', main='Discrete exponential growth') # the plot

#make own function
grow <- function (growth.rate) { # argument "growth.rate" of function "grow" 
  num_gen<-10  # no. generation
  generation<-1:num_gen # create a variable generation
  N <- rep (0,num_gen) #  "vector" of 10 zeros (could be `NULL`)
  N[1] <- 2 # We need to set initial pop size
  for (t in 1:(num_gen - 1)) { # the counter
    N[t+1]=growth.rate*N[t]  # task: double individuals
  }
  plot(N~generation,type='b', main=paste("Rate =", growth.rate)) 
}

grow2<-function(growth.rate,number.generation){
  generation<-1:number.generation
  N<-rep(0,number.generation)
  N[1]<-2
  for(t in 1:(number.generation-1)){
    N[t+1]=growth.rate*N[t]
  }
  plot(N~generation,type='b', main=paste("Rate =", growth.rate, ", ", number.generation, "generations"))
}


logistic<-function(growth.rate){
  num_gen<-50
  generation<-1:num_gen
  N<-rep(0,num_gen)
  N[1]<-10
  k<-100
  for(t in 1:(num_gen-1)){
    N[t+1]=N[t]+(growth.rate*N[t]*((k-N[t])/k))
  }
  plot(N~generation,ylim=c(0,120), type='b', main=paste("Rate=",growth.rate))
}
saveGIF({
for(r in seq(0.5, 3, by=0.1)){
  logistic(r)
}},interval=0.1)


