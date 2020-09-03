# let exponential distribution be the proposal distribution (not symmetric) 
propose <- function(x_t) {
  x_star <- rexp(1, rate = x_t)
  x_star
}

# suppose the target distribution is beta(2, 2), and we can only know its kernel  
p <- function(x_star, x_t) {
  num <- x_star * (1 - x_star) * dexp(x_t, rate = x_star)
  den <- x_t * (1 - x_t) * dexp(x_star, rate = x_t)
  num / den
}

metropolis_hastings <- function(x_0 = sample(0:10, size = 1), num_iteration = 1000) {
  samp <- vector("list", 0)
  x_t <- x_0
  for (i in 1:num_iteration) {
    x_star <- propose(x_t)
    accept_prob <- min(1, p(x_star = x_star, x_t = x_t))
    u <- runif(1)
    if (accept_prob > u) {
      samp[[i]] <- x_star
      x_t <- x_star
    }
    else {
      samp[[i]] <- x_t
    }
  }
  unlist(samp)
}

samp <- metropolis_hastings(x_0 = 0.5, num_iteration = 50000)
hist(samp, breaks = 50, freq = F)
lines(density(rbeta(5000, 2, 2)), col = "red")
