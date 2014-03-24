library(reshape2)
library(ggplot2)

dat <- matrix(rnorm(100, 3, 1), ncol=10)
names(dat) <- paste("X", 1:10)
dat2 <- melt(dat, id.var = "X1")

ggplot(dat2, aes(as.factor(Var1), Var2, group=Var2)) +
  geom_tile(aes(fill = value)) + 
  geom_text(aes(fill = dat2$value, label = round(dat2$value, 1))) +
  scale_fill_gradient(low = "white", high = "red") 

library(Hmisc)

data(HairEyeColor)
P <- t(HairEyeColor[,,2])
Pm <- melt(P)
ggfluctuation(Pm) + geom_text(aes(label=Pm$value),
                                             colour="white") + 
  opts(axis.text.x=theme_text(size = 15),axis.text.y=theme_text(size = 15))
