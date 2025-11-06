
model {
  #model the data
  for (i in 1:N) { 
		z[i,1:2] ~ dmnorm(mu, Omega)  #multivariate Gaussian
	}

	#priors for parameters
	mu <- c(0,0)
	sig1 ~ dunif(0, 10)  
	sig2 ~ dunif(0, 10)  
	rho  ~ dunif(0, 1) 

	sigma[1,1:2] <- c(sig1^2, rho*sig1*sig2)
 	sigma[2,1:2] <- c(rho*sig2*sig1, sig2^2)
	Omega <-inverse(sigma)
}

 