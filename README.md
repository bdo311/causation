# causation
Exploration of additive noise models for detecting causation from correlation

Finding: for a linear relationship between x and y, where y ~ x + noise, cor(noise,y) > cor(noise,x) at least 60% of the time if cor(x,y) < 0.999, and at least 90% of the time if cor(x,y) < 0.96, approaching 100% as cor(x,y) < 0.94. That means in most real-world datasets where the R^2 value is <0.8, one should almost always be able to calculate causation from correlation. 
