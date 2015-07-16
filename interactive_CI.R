library(manipulate)
library(ggplot2)
library(gridExtra)

manipulate({
    
#initialize data frame    
CIs <- data.frame(run = numeric(), conf_upper = numeric(), mean = numeric(), 
                  conf_lower = numeric(), CI_width = numeric())

#generate CIs for 100 random draws of size n from population ~N(mu, sigma)
for(i in 1:100){
    vec_norm <- rnorm(n, mu, sigma)
    CIs[i, 1] <- i
    CIs[i, 2] <- mean(vec_norm) + qnorm(0.975)*(sd(vec_norm)/sqrt(n))
    CIs[i, 3] <- mean(vec_norm)
    CIs[i, 4] <- mean(vec_norm) - qnorm(0.975)*(sd(vec_norm)/sqrt(n))
    CIs[i, 5] <- CIs[i, 2] - CIs[i, 4]
}

#create CI plot
g <- ggplot(data = CIs, aes(x = run, y = conf_upper)) 
g <- g + geom_point(color = "firebrick")
g <- g + geom_point(aes(x = run, y = mean), color = "steelblue")
g <- g + geom_point(aes(x = run, y = conf_lower), color = "green")
g <- g + geom_segment(aes(x = run, xend = run, y = conf_lower, yend = conf_upper))
g <- g + geom_hline(yintercept = mu, color = "red")
g <- g + ylab("95% Confidence Interval")

if(show_CI_width == TRUE){
#create CI width plot
g2 <- ggplot(data = CIs, aes(x = run, y = CI_width)) + geom_line()
g2 <- g2 + ylab("CI Width")

#panel plot
grid.arrange(g, g2, nrow = 2, heights = c(2, 1.5))
}

else{
    g
}
}, 

#define manipulate objects
n = slider(min = 3, max = 100, initial = 10, label = "Sample Size"),
mu = slider(min = 5, max = 100, initial = 5, label = "Population Mean"),
sigma = slider(min = 1, max = 100, initial = 1, label = "Population Standard Dev"),
show_CI_width = checkbox(initial = TRUE, label = "Show CI Width")
)