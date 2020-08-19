# target distribution: standard normal (first get folded normal, then randomly reverse sign)
# proposal distribution: Exp(1)

# visualize their respective density in (0, 6)
x <- seq(0, 6, by = 0.02)
plot(x, dexp(x), type = "l")
lines(x, 2 * dnorm(x), col = "red", type = "l") #  2 * dnorm(x) because we want folded normal distribution

# scale Exp(1) so that its density is always greater than folded normal
s <- max(2 * dnorm(x) / dexp(x, rate = 1))

scaled_dexp <- function(x) {
  dexp(x) * s
}

rejection_sampling <- function(n = 5000) {
  proposal <- rexp(n)
  accept_prob <-  2 * dnorm(proposal) / scaled_dexp(proposal)
  u <- runif(n)
  samp <- proposal[accept_prob > u]
  
  # randomly reverse sign of x
  for (i in 1:length(samp)) {
    p <- runif(1)
    if (p > 0.5) {
      samp[[i]] <- -1 * samp[[i]]
    }
  }
  
  samp
}

samp <- rejection_sampling()
hist(samp, breaks = 50, xlim = c(-3, 3))

shapiro.test(samp)
