# interactive_CI
##An app to help with confidence interval interpretation
After reading a few articles (see links below) about the "reproducibility crisis" in scientific journals and the pervasive misinterpretation of p-values and confidence intervals, I had a moment of doubt about my own understanding of what you can and can't say with classical statistics.  The formal definition of a confidence interval -*"Were this procedure to be repeated on multiple samples, the calculated confidence interval (which would differ for each sample) would encompass the true population parameter x% of the time."* was not immediately intuitive.  I figured that repeatedly sampling from simulated data where the true population parameters were known would be a good way of visualizing this definition.  I made a little app using RStudio's manipulate package that pulls 100 random samples from a population with a normal distribution with known mean and variance, and then plots the sample means, individual confidence intervals, and the confidence interval width.  The interactive app allows exploration of the effects of population mean, variance, and sample size on the confidence intervals.  We can see that in fact 95% of the confidence intervals contain the true population mean, on average.  Of course there are other considerations with real world data, but I think this illustrates the fundamental idea behind confidence intervals and hopefully makes the interpretation more clear.

Here are a few articles on the topic:

[An editorial in The Journal of Basic and Applied Social Psychology explaining their p-value ban](http://www.tandfonline.com/doi/pdf/10.1080/01973533.2015.1012991)

[Discussion of the ban on Allen Downey's blog](http://allendowney.blogspot.com/2015/03/statistical-inference-is-only-mostly.html)

[The Wikipedia article detailing the meaning and interpretation of confidence intervals](https://en.wikipedia.org/wiki/Confidence_interval#Meaning_and_interpretation)


