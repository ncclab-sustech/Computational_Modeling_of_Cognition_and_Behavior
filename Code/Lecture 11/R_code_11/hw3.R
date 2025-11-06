library(rjags)
require(mvtnorm)
setwd('/Users/huahua/Documents/ML&NeuroEngineering 2021/11 - Gibbs Sampling & JAGS/R_code_11/')

#generate data z
rho <- .8
mux  <- muy <- 0
sigx <- 1
sigy <- .5
sigma <- matrix(c(sigx^2, rho*sigx*sigy, rho*sigy*sigx, sigy^2),
                nrow=2)  

N = 50
z <- rmvnorm(50, c(mux, muy), sigma)


#define JAGS model
hw3_model <- jags.model("hw3.j", 
                     data = list("z"=z, "N" = N),
                     n.chains=4)  

# burnin
update(hw3_model, n.iter=1000)  

# perform MCMC
parameters <- c("sig1", "sig2", "rho")
mcmcfin<-coda.samples(hw3_model, parameters, 5000) 

summary(mcmcfin)
plot(mcmcfin)


