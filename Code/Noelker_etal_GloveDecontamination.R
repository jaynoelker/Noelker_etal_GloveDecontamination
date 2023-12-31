#Library
library(Hmisc)
library(effsize)

########################
### Experiment 1 JEN ###
########################

#Open file: "Experiment1.2023.Culture.Decontamination.Test - CSV - 08.25.2023 edits"
GloveTest<-read.csv(file.choose(), header=TRUE)
head(GloveTest)

GloveMn<-tapply(GloveTest$LnBdLoad,list(GloveTest$GloveType,GloveTest$Treatment),mean)
GloveSD<-tapply(GloveTest$LnBdLoad,list(GloveTest$GloveType,GloveTest$Treatment),sd)
GloveCounts<-tapply(GloveTest$LnBdLoad,list(GloveTest$GloveType,GloveTest$Treatment),length)
GloveSE<-GloveSD/sqrt(GloveCounts)

#dev.new()
par(mar = c(4,4,1.5,0.5) + 0.5)
plot(c(1:6),ylab=expression(paste("Ln(Bd Z"["e"]*" + 1)",sep="")), xlab=NA, cex.lab=1.2, xaxt="n", col="white",ylim=c(0,15))
errbar(x=c(.9:5.9),y=GloveMn[1,1:6],yplus=GloveMn[1,1:6]+GloveSE[1,1:6],yminus=GloveMn[1,1:6]-GloveSE[1,1:6],col="black",errbar.col="black",pch=1,lwd=1.2,cex=c(1.5),add=TRUE)
errbar(x=c(1.1:6.1),y=GloveMn[2,1:6],yplus=GloveMn[2,1:6]+GloveSE[2,1:6],yminus=GloveMn[2,1:6]-GloveSE[2,1:6],col="blue",errbar.col="blue",pch=0,lwd=1.2,cex=c(1.5),add=TRUE)

axis(side=1, at=c(1,2,3,4),tick=TRUE,labels=FALSE)
mtext(side=1,line=1,at=c(1), paste("Autoclave"))
mtext(side=1,line=1,at=c(2), paste("Bd"))
mtext(side=1,line=1,at=c(3), paste("Bleach:AmQuel:Rinse"))
mtext(side=1,line=1,at=c(4), paste("Control"))
mtext(side=1,line=1,at=c(5), paste("Ethanol"))
mtext(side=1,line=1,at=c(6), paste("Wash"))
legend(x=5,y=14,title="Glove Type",c("Cotton","Nitrile"),pch=c(1,0),pt.cex=1.2,lty=c(1,4),lwd=1.2,col=c("black","blue"),cex=0.75,box.lty=0)
# mtext(side=3,line=1,at=c(1), paste("(B)"))

bars<-c("Autoclave","Bd","BlAmRn","Control","Ethanol","Wash")

#dev.new()
par(mar = c(4,4,1.5,0.5) + 0.5)
barplot(GloveMn[1:2,1:6],beside=TRUE,names.arg=bars,col=c("black","blue"),ylab=expression(paste("Ln(Bd Z"["e"]*" + 1)",sep="")),cex.lab=1.2,width=.5,density=c(50,10),angle=c(45,135),ylim=c(0,12))
arrows(x0=c(1.25:6.25),y0=GloveMn[1,1:6],x1=c(1.25:6.25),y1=GloveMn[1,1:6]-GloveSE[1,1:6],angle=90,length=0.1,col="black",lwd=2)
arrows(x0=c(1.25:6.25),y0=GloveMn[1,1:6],x1=c(1.25:6.25),y1=GloveMn[1,1:6]+GloveSE[1,1:6],angle=90,length=0.1,col="black",lwd=2)
arrows(x0=2.75,y0=GloveMn[2,2],x1=2.75,y1=GloveMn[2,2]-GloveSE[2,2],angle=90,length=0.1,col="blue",lwd=2)
arrows(x0=2.75,y0=GloveMn[2,2],x1=2.75,y1=GloveMn[2,2]+GloveSE[2,2],angle=90,length=0.1,col="blue",lwd=2)
arrows(x0=7.25,y0=GloveMn[2,5],x1=7.25,y1=GloveMn[2,5]-GloveSE[2,5],angle=90,length=0.1,col="blue",lwd=2)
arrows(x0=7.25,y0=GloveMn[2,5],x1=7.25,y1=GloveMn[2,5]+GloveSE[2,5],angle=90,length=0.1,col="blue",lwd=2)
#arrows(x0=c(1.75:6.75),y0=GloveMn[2,1:6],x1=c(1.75:6.75),y1=GloveMn[2,1:6]+GloveSE[2,1:6],angle=90,length=0.1,col="blue",lwd=2)
#arrows(x0=c(1.75:6.75),y0=GloveMn[2,1:6],x1=c(1.75:6.75),y1=GloveMn[2,1:6]-GloveSE[2,1:6],angle=90,length=0.1,col="blue",lwd=2)

#####################################################################################################################

########################
### Experiment 2 JEN ###
########################

#Open file "Experiment2.2020.Frog.Bd.Glove.Decontamination - CSV - 12.06.2023 edits"
GloveDataOrg<-read.csv(file.choose(), header=TRUE)
head(GloveDataOrg)

length(unique(GloveDataOrg$FrogID))

GloveData<-subset(GloveDataOrg, Contam=="Yes")
head(GloveData,10)

ControlData<-subset(GloveDataOrg, Contam=="No")
head(ControlData,10)

Nitrile<-subset(GloveData, GloveType=="Nitrile")
head(Nitrile)
Cotton<-subset(GloveData, GloveType=="Cotton")
head(Cotton)

NBd<-tapply(Nitrile$GloveLnBdLoad,list(Nitrile$DeconType,Nitrile$DeconStatus),mean)
NBdSD<-tapply(Nitrile$GloveLnBdLoad,list(Nitrile$DeconType,Nitrile$DeconStatus),sd)
NBdcounts<-tapply(Nitrile$GloveLnBdLoad,list(Nitrile$DeconType,Nitrile$DeconStatus),length)
NBdSE<-NBdSD/sqrt(NBdcounts)

CBd<-tapply(Cotton$GloveLnBdLoad,list(Cotton$DeconType,Cotton$DeconStatus),mean)
CBdSD<-tapply(Cotton$GloveLnBdLoad,list(Cotton$DeconType,Cotton$DeconStatus),sd)
CBdcounts<-tapply(Cotton$GloveLnBdLoad,list(Cotton$DeconType,Cotton$DeconStatus),length)
CBdSE<-CBdSD/sqrt(CBdcounts)

Ctrl<-tapply(ControlData$GloveLnBdLoad,list(ControlData$GloveType,ControlData$DeconStatus),mean)
CtrlSD<-tapply(ControlData$GloveLnBdLoad,list(ControlData$GloveType,ControlData$DeconStatus),sd)
Ctrlcounts<-tapply(ControlData$GloveLnBdLoad,list(ControlData$GloveType,ControlData$DeconStatus),length)
CtrlSE<-CtrlSD/sqrt(Ctrlcounts)

Ethanol<-c(CBd[2,2],NBd[2,2],NBd[2,1],CBd[2,1])
Bleach<-c(CBd[1,2],NBd[1,2],NBd[1,1],CBd[1,1])
EthanolSE<-c(CBdSE[2,2],NBdSE[2,2],NBdSE[2,1],CBdSE[2,1])
BleachSE<-c(CBdSE[1,2],NBdSE[1,2],NBdSE[1,1],CBdSE[1,1])

#One graph all overlayed

col<-c("black","black")

###################################

FrogSwabs<-GloveDataOrg$FrogLnBdLoad
GloveSwabs<-GloveDataOrg$GloveLnBdLoad

plot(GloveSwabs~FrogSwabs)
abline(lm(GloveSwabs~FrogSwabs),add=TRUE)

##################################
#dev.new(width=81,height=162, unit="mm")
par(mfrow=c(1,1))

par(mar = c(4,4,1,0.7) + 0.5)
plot(GloveSwabs~FrogSwabs,col=col[1],lwd=1.2,ylab=expression(paste("Ln(Glove Bd Z"["e"]*" + 1)",sep="")),xlab=expression(paste("Ln(Frog Bd Z"["e"]*" + 1)",sep="")),cex.lab=1.2)
abline(lm(GloveSwabs~FrogSwabs),col=col[1],lwd=1.2,add=TRUE)
text(x=2,y=7, paste("(A)"),adj=-.3,cex=1.5)

##############
### Fig. 2 ###
##############

par(mar = c(4,4,1,0.7) + 0.5)
plot(Ethanol,ylab=expression(paste("Ln(Bd Z"["e"]*" + 1)",sep="")), xlab=NA, cex.lab=1.2, xaxt="n", col="white",ylim=c(0,8))#,main="Contaminated                         Decontaminated")
errbar(x=c(1.05:4.05),y=Bleach,yplus=Bleach+BleachSE,yminus=Bleach-BleachSE, col=col[1], errbar.col=col[1],pch=1,lwd=1.2, cex=c(1.5), add=TRUE)
errbar(x=c(0.95:3.95),y=Ethanol,yplus=Ethanol+EthanolSE,yminus=Ethanol-EthanolSE, col=col[2], errbar.col=col[2], pch=0,lwd=1.2, cex=c(1.5), add=TRUE)
lines(x=c(1.05:4.05),y=Bleach, lwd=1.2, col=col[1],lty=1)
lines(x=c(0.95:3.95),y=Ethanol, lwd=1.2, col=col[2],lty=4)
#errbar(x=c(1),y=GloveDataOrg$LnBdLoad[1],yplus=GloveDataOrg$LnBdLoad[1]+GloveDataOrg$SE[1], yminus=GloveDataOrg$LnBdLoad[1]-GloveDataOrg$SE[1],col="red",errbar.col="red",pch=1,cex=1.2,lwd=1.2,add=TRUE)
axis(side=1, at=c(1,2,3,4),tick=TRUE,labels=FALSE)
mtext(side=1,line=1,at=c(1,2,3,4), paste(c("Step 1","Step 2","Step 3","Step 4")))
mtext(side=1,line=2,at=c(1,4), paste("(Cotton)"))
mtext(side=1,line=2,at=c(2,3), paste("(Nitrile)"))
mtext(side=3,line=0.5,at=c(1.75),paste("Contaminated"),cex=1)
mtext(side=3,line=0.5,at=c(3.25),paste("Decontaminated"),cex=1)
legend(x=3.25,y=6.75,title="Treatment:",c("Bleach","Ethanol"),pch=c(1,0),pt.cex=1.2,lty=c(1,4),lwd=1.2,col=col,cex=1,box.lty=0,y.intersp=1.3)
abline(v=2.5,lwd=1.2,col="darkgrey",lty=5)
#text(x=1,y=7, paste("(B)"),adj=-.3,cex=1.5)
#text(2.4,3.3,"Decontamination procedure",cex=0.75,srt=90)
lines(x=c(1,1.45),y=c(7.8,7.8),col="darkgrey")
lines(x=c(1.55,2),y=c(7.8,7.8),col="darkgrey")
lines(x=c(1,1),y=c(7.5,7.8),col="darkgrey")
lines(x=c(2,2),y=c(2.2,7.8),col="darkgrey")

lines(x=c(0.95,1.05),y=c(7.5,7.5),col="darkgrey")
lines(x=c(0.95,0.95),y=c(7.3,7.5),col="darkgrey")
lines(x=c(1.05,1.05),y=c(6,7.5),col="darkgrey")

lines(x=c(1.95,2.04),y=c(2.2,2.2),col="darkgrey")
lines(x=c(1.95,1.95),y=c(0.9,2.2),col="darkgrey")
lines(x=c(2.04,2.04),y=c(2,2.2),col="darkgrey")
text(x=1.5,y=7.8,"*",cex=1.5)

lines(x=c(2.06,2.505),y=c(4,4),col="darkgrey")
lines(x=c(2.605,3.05),y=c(4,4),col="darkgrey")
lines(x=c(2.06,2.06),y=c(2,4),col="darkgrey")
lines(x=c(3.05,3.05),y=c(0.4,4),col="darkgrey")
#points(x=2.555,y=4,col="white",pch=15,cex=4)
text(x=2.555,y=4,"*",cex=1.5)

#Export at 650x400

###################################
### Statistics - 12/09/2023 JEN ###
###################################

head(Cotton)
head(Nitrile)

cottonBefore<-subset(Cotton,DeconStatus=="Before")
nitrileBefore<-subset(Nitrile,DeconStatus=="Before")

cottonAfter<-subset(Cotton,DeconStatus=="After")
nitrileAfter<-subset(Nitrile,DeconStatus=="After")

cotBefEth<-subset(cottonBefore,DeconType=="Ethanol")
cotBefBle<-subset(cottonBefore,DeconType=="Bleach")
nitBefEth<-subset(nitrileBefore,DeconType=="Ethanol")
nitBefBle<-subset(nitrileBefore,DeconType=="Bleach")
cotAftEth<-subset(cottonAfter,DeconType=="Ethanol")
cotAftBle<-subset(cottonAfter,DeconType=="Bleach")
nitAftEth<-subset(nitrileAfter,DeconType=="Ethanol")
nitAftBle<-subset(nitrileAfter,DeconType=="Bleach")

max(cotAftEth$GloveBdZooEq)
max(cotAftBle$GloveBdZooEq)
max(nitAftEth$GloveBdZooEq)
max(nitAftBle$GloveBdZooEq)

### Test for differences between gloves for bleach and ethanol treatment at each step of the decontamination procedure.
#Step 1
t.test(cotBefEth$GloveLnBdLoad,cotBefBle$GloveLnBdLoad)

#Step 2
t.test(nitBefEth$GloveLnBdLoad,nitBefBle$GloveLnBdLoad)

#Step 3
t.test(nitAftEth$GloveLnBdLoad,nitAftBle$GloveLnBdLoad)

#Step 4
t.test(cotAftEth$GloveLnBdLoad,cotAftBle$GloveLnBdLoad)

###################################
### Test for differences between steps of the procedure
# Reduction in Bd load between Step 1 and Step 2 - Removal of outer cotton glove worn over nitrile glove.
# Match up each sample from the same frog taken from the cotton glove and the nitrile glove worn underneath for paired t.test
mergeGlovesBefore<-merge(cottonBefore,nitrileBefore,by="FrogID")
#fix(mergeGlovesBefore) # Manually check that this worked as expected

# Paired t.test
t.test(mergeGlovesBefore$GloveLnBdLoad.x,mergeGlovesBefore$GloveLnBdLoad.y,paired=TRUE,var.equal = FALSE)

# Cohen's D effect size
cohen.d(mergeGlovesBefore$GloveLnBdLoad.x,mergeGlovesBefore$GloveLnBdLoad.y)

# Test for normality
shapiro.test(mergeGlovesBefore$GloveLnBdLoad.x-mergeGlovesBefore$GloveLnBdLoad.y)

# Unpaired t.test
length(cottonBefore$FrogID)
length(nitrileBefore$FrogID)

t.test(cottonBefore$GloveLnBdLoad,nitrileBefore$GloveLnBdLoad,paired=FALSE,var.equal=FALSE)

# Cohen's D effect size
cohen.d(cottonBefore$GloveLnBdLoad,nitrileBefore$GloveLnBdLoad)

# 
wilcox.test(cottonBefore$GloveLnBdLoad,nitrileBefore$GloveLnBdLoad,paired=FALSE)

wilcox.test(mergeGlovesBefore$GloveLnBdLoad.x,mergeGlovesBefore$GloveLnBdLoad.y,paired=TRUE)

###################################

### This is unnecessary as the cotton gloves in Step 4 are fresh cotton gloves, not exposed to Bd from frogs.
#cottonBeforeBleach<-subset(Cotton,DeconStatus=="Before" & DeconType=="Bleach")
#cottonAfterBleach<-subset(Cotton,DeconStatus=="After" & DeconType=="Bleach")

### t.test after bleach decontamination procedures
nitrileBeforeBleach<-subset(GloveData,DeconStatus=="Before" & DeconType=="Bleach")
nitrileAfterBleach<-subset(Nitrile,DeconStatus=="After" & DeconType=="Bleach")
length(nitrileBeforeBleach$FrogID)
length(nitrileAfterBleach$FrogID)

mergeNitrileBleach<-merge(nitrileBeforeBleach,nitrileAfterBleach,by="FrogID")

# Paired t.test with unqual variances
t.test(mergeNitrileBleach$GloveLnBdLoad.x,mergeNitrileBleach$GloveLnBdLoad.y, paired=TRUE,var.equal=FALSE)

# Cohen's D effect size
cohen.d(mergeNitrileBleach$GloveLnBdLoad.x,mergeNitrileBleach$GloveLnBdLoad.y)

hist(mergeNitrileBleach$GloveLnBdLoad.x-mergeNitrileBleach$GloveLnBdLoad.y)
shapiro.test(mergeNitrileBleach$GloveLnBdLoad.x-mergeNitrileBleach$GloveLnBdLoad.y)

# Unpaired t.test with unequal variances
t.test(nitrileBeforeBleach$GloveLnBdLoad,nitrileAfterBleach$GloveLnBdLoad, paired=FALSE,var.equal=FALSE)

# Cohen's D effect size
cohen.d(nitrileBeforeBleach$GloveLnBdLoad,nitrileAfterBleach$GloveLnBdLoad)

# 
wilcox.test(mergeNitrileBleach$GloveLnBdLoad.x,mergeNitrileBleach$GloveLnBdLoad.y, paired=TRUE,var.equal=FALSE)

wilcox.test(nitrileBeforeBleach$GloveLnBdLoad,nitrileAfterBleach$GloveLnBdLoad, paired=FALSE,var.equal=FALSE)

###################################

### This is unnecessary as the cotton gloves in Step 4 are fresh cotton gloves, not exposed to Bd from frogs.
#cottonBeforeEthanol<-subset(Cotton,DeconStatus=="Before" & DeconType=="Ethanol")
#cottonAfterEthanol<-subset(Cotton,DeconStatus=="After" & DeconType=="Ethanol")

### t.test after ethanol decontamination procedures
nitrileBeforeEthanol<-subset(Nitrile,DeconStatus=="Before" & DeconType=="Ethanol")
nitrileAfterEthanol<-subset(Nitrile,DeconStatus=="After" & DeconType=="Ethanol")

mergeNitrileEthanol<-merge(nitrileBeforeEthanol,nitrileAfterEthanol,by="FrogID")

t.test(mergeNitrileEthanol$GloveLnBdLoad.x,mergeNitrileEthanol$GloveLnBdLoad.y,paired=TRUE,var.equal=FALSE)

# Cohen's D effect size
cohen.d(mergeNitrileEthanol$GloveLnBdLoad.x,mergeNitrileEthanol$GloveLnBdLoad.y)

###################################

#Corelation:
cor.test(GloveSwabs,FrogSwabs)
model<-lm(GloveSwabs~FrogSwabs)
summary(model)
shapiro.test(residuals(model))
plot(model)

model<-lm(FrogSwabs~GloveSwabs)
summary(model)
shapiro.test(residuals(model))
plot(model)

#####

