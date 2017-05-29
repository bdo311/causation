x = runif(1000,0,10)
val = 5
noise = runif(1000,-val,val)
y=x^3+noise
cor(x,y)
plot(x,y,pch=19,cex=0.2)

cor(noise,y)
cor(noise,x)

plot(noise,y)

get_cor = function(var) {
  x = runif(1000,0,10)
  noise = runif(1000,-var,var)
  y=x+noise
  return(c(cor(noise,y), cor(noise,x))) 
}

range=seq(-5,1,by=0.3)  # noise ranges from 2^-5 to 2^1
logratio = matrix(0, 1000, 20)  # 1000 samples
for (i in 1:20) {
  res = replicate(1000, get_cor(2^range[i]))
  logratio[,i] = log10(abs(res[1,])/abs(res[2,]))   #log ratio between cor(noise,y) and cor(noise,x)
}
colnames(logratio) = range

boxplot.matrix(logratio)  #log10 ratio of cor(noise,y) versus cor(noise,x) for different amounts of noise (2^-10 to 2^0)

logratio_binarized = (logratio>0)
apply(logratio_binarized,2,sum) # number of cases where directionality is predicted correctly

# You can get at least 60% accuracy in predicting directionality by having the range of noise be [-0.08,0.08]
# for x and y values between 0 and 10. R^2 ~ 0.998
# obviously this works best for linear relationships between x and y

