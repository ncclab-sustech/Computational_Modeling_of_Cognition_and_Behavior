require(rjags)

# Synthetic data: x
N <- 1000
x <- rnorm(N, 0, 2)     

# Estimate: P(x) ~ N(mu, tau)
myj <- jags.model("mymodel.j", data = list("xx" = x, "N" = N)) 
update(myj,n.iter=1000) 
mcmcfin<-coda.samples(myj,c("mu", "tau"),5000)

summary(mcmcfin)
plot(mcmcfin)
