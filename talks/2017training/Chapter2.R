###################################################
### Loading the Data into R
###################################################


algae <- read.table('Analysis.txt',
          header=F,
          dec='.',
          col.names=c('season','size','speed','mxPH','mnO2','Cl',
          'NO3','NH4','oPO4','PO4','Chla','a1','a2','a3','a4',
          'a5','a6','a7'),
          na.strings=c('XXXXXXX'))


###################################################
### Data Visualization and Summarization
###################################################
summary(algae)

hist(algae$mxPH, prob=T)


library(car)
par(mfrow=c(1,2))
hist(algae$mxPH, prob=T, xlab='',
      main='Histogram of maximum pH value',ylim=0:1)
lines(density(algae$mxPH,na.rm=T))
rug(jitter(algae$mxPH))
qq.plot(algae$mxPH,main='Normal QQ plot of maximum pH')
par(mfrow=c(1,1))




boxplot(algae$oPO4,ylab='Orthophosphate (oPO4)')
rug(jitter(algae$oPO4),side=2)
abline(h=mean(algae$oPO4,na.rm=T),lty=2)




plot(algae$NH4,xlab='')
abline(h=mean(algae$NH4,na.rm=T),lty=1)
abline(h=mean(algae$NH4,na.rm=T)+sd(algae$NH4,na.rm=T),lty=2)
abline(h=median(algae$NH4,na.rm=T),lty=3)
identify(algae$NH4)


plot(algae$NH4,xlab='')
clicked.lines <- identify(algae$NH4)
algae[clicked.lines,]


algae[algae$NH4 > 19000,]


library(lattice)
print(bwplot(size ~ a1, data=algae,ylab='River Size',xlab='Algal A1'))

