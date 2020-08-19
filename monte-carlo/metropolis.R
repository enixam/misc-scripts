# let uniform distribution be the symmetric proposal distribution
propose <- function(x_t) {
  x_star <- runif(1, x_t -1 , x_t + 1)
  x_star
}

# suppose the target distribution is standard normal, and we can only know its kernel  
p <- function(x_star, x_t) {
  exp(-1 * x_star ^ 2 / 2) / exp(-1 * x_t ^ 2 / 2)
}

metropolis <- function(x_0 = sample(-10:10, size = 1), num_iteration) {
  samp <- x_0
  x_t <- x_0
  for (i in 1:num_iteration) {
    x_star <- propose(x_t)
    accept_prob <- min(1, p(x_star = x_star, x_t = x_t))
    u <- runif(1)
    if (accept_prob > u) {
      samp <- append(samp, x_star)
      x_t <- x_star
    }
    else {
      x_t <- x_t
    }
  }
  samp
}

# starting point x_0 = -3, with 5000 iterations 
samp_1 <- metropolis(-10, 5000)
# starting point x_0  = 0, with 1000 iterations 
samp_2 <- metropolis(0, 1000)

boxplot(samp_1, samp_2)
hist(samp_1, breaks = 50, freq = FALSE)
lines(density(samp_2), col = "red")
