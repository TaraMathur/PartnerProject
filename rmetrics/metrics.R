library(readr)
library(ggplot2)
library(plyr)

brandvideo <- read_csv("~/nfl_brand_labels_1_all.txt", col_names = FALSE) #UPDATE PATH#
names(brandvideo) <- c("JPG","X","Y","W","H","BRAND","CONFIDENCE")

#Create column with Frame Number
brandvideo$FRAME <- as.numeric(substring(brandvideo$JPG, 37, 43))

#Height of Screen
max(brandvideo$Y+brandvideo$H) #1080p
#Width of Screen
max(brandvideo$X+brandvideo$W) #1920p

##S - Size of each Panel
CW <- 640    #Width of Center Panel In Pixels
CH <- 360   #Hieght of Center Panel In Pixels
S <- as.data.frame(matrix(c("P1","P2","P3","P4","P5","P6","P7","P8","P9",
                      +     0,((1920-CW)/2),((1920-CW)/2+CW),0,((1920-CW)/2),((1920-CW)/2+CW),0,((1920-CW)/2),((1920-CW)/2+CW),  #Top Left X
                      +     0,0,0,((1080-CH)/2),((1080-CH)/2),((1080-CH)/2),((1080-CH)/2)+CH,((1080-CH)/2)+CH,((1080-CH)/2)+CH,  #Top Left Y
                      +     ((1920-CW)/2),CW,((1920-CW)/2),((1920-CW)/2),CW,((1920-CW)/2),((1920-CW)/2),CW,((1920-CW)/2),  #Width
                      +     ((1080-CH)/2),((1080-CH)/2),((1080-CH)/2),CH,CH,CH,((1080-CH)/2),((1080-CH)/2),((1080-CH)/2)), #Height
                            nrow=9, ncol=5), stringsAsFactors = FALSE) 

names(S) <- c("P","X","Y","W","H")
S$W <- as.numeric(S$W)
S$H <- as.numeric(S$H)
S$X <- as.numeric(S$X)
S$Y <- as.numeric(S$Y)
S$Area <- S$W*S$H
S$Weight <- c(11,11,11,11,12,11,11,11,11) #Weights of each panel

ggplot() + geom_hline(yintercept=(1080-CH)/2) + geom_hline(yintercept=(1080-CH)/2+CH) + geom_vline(xintercept=(1920-CW)/2) + geom_vline(xintercept=(1920-CW)/2+CW) +
  geom_label(data=S,aes(X+W/2, 1080-(Y+H/2), label=paste(P,", Weight: ",Weight/100))) + theme(panel.background = element_rect(fill = 'white', colour = 'red')) +  
  xlab("Width (px)") + ylab("Height (px)") + scale_y_continuous(limits=c(-1,1080),expand = c(0,0)) + scale_x_continuous(limits=c(-2,1920),expand = c(0,0))

##Frame Metrics

#A1 - Area in Top Left
brandvideo$A1X <- ifelse(S$X[1]+S$W[1]-brandvideo$X>0,ifelse(S$X[1]+S$W[1]-brandvideo$X>brandvideo$W,brandvideo$W,S$X[1]+S$W[1]-brandvideo$X),0) #Width of Brand in Panel 2
brandvideo$A1Y <- ifelse(S$Y[1]+S$H[1]-brandvideo$Y>0,ifelse(S$Y[1]+S$H[1]-brandvideo$Y>brandvideo$H,brandvideo$H,S$Y[1]+S$H[1]-brandvideo$Y),0)   #Height of Brand in Panel 1
brandvideo$A1 <- brandvideo$A1X*brandvideo$A1Y

#A2 - Area in Top Middle
brandvideo$A2X <- ifelse(S$X[2]+S$W[2]-brandvideo$X>0,ifelse(S$X[2]+S$W[2]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A1X,S$X[2]+S$W[2]-brandvideo$X-brandvideo$A1X),0) #Width of Brand in Panel 2
brandvideo$A2Y <- ifelse(S$Y[2]+S$H[2]-brandvideo$Y>0,ifelse(S$Y[2]+S$H[2]-brandvideo$Y>brandvideo$H,brandvideo$H,S$Y[2]+S$H[2]-brandvideo$Y),0)   #Height of Brand in Panel 2
brandvideo$A2 <- brandvideo$A2X*brandvideo$A2Y
  
#A3 - Area in Top Right
brandvideo$A3X <- ifelse(S$X[3]+S$W[3]-brandvideo$X>0,ifelse(S$X[3]+S$W[3]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A1X-brandvideo$A2X,S$X[3]+S$W[3]-brandvideo$X-brandvideo$A1X-brandvideo$A2X),0) #Width of Brand in Panel 3
brandvideo$A3Y <- ifelse(S$Y[3]+S$H[3]-brandvideo$Y>0,ifelse(S$Y[3]+S$H[3]-brandvideo$Y>brandvideo$H,brandvideo$H,S$Y[3]+S$H[3]-brandvideo$Y),0)   #Height of Brand in Panel 3
brandvideo$A3 <- brandvideo$A3X*brandvideo$A3Y

#A4 - Area in Middle Left
brandvideo$A4X <- ifelse(S$X[4]+S$W[4]-brandvideo$X>0,ifelse(S$X[4]+S$W[4]-brandvideo$X>brandvideo$W,brandvideo$W,S$X[4]+S$W[4]-brandvideo$X),0) #Width of Brand in Panel 4
brandvideo$A4Y <- ifelse(S$Y[4]+S$H[4]-brandvideo$Y>0,ifelse(S$Y[4]+S$H[4]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A1Y,S$Y[4]+S$H[4]-brandvideo$Y-brandvideo$A1Y),0)   #Height of Brand in Panel 4
brandvideo$A4 <- brandvideo$A4X*brandvideo$A4Y

#A5 - Area in Middle Middle
brandvideo$A5X <- ifelse(S$X[5]+S$W[5]-brandvideo$X>0,ifelse(S$X[5]+S$W[5]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A4X,S$X[5]+S$W[5]-brandvideo$X-brandvideo$A4X),0) #Width of Brand in Panel 5
brandvideo$A5Y <- ifelse(S$Y[5]+S$H[5]-brandvideo$Y>0,ifelse(S$Y[5]+S$H[5]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A2Y,S$Y[5]+S$H[5]-brandvideo$Y-brandvideo$A2Y),0)   #Height of Brand in Panel 5
brandvideo$A5 <- brandvideo$A5X*brandvideo$A5Y

#A6 - Area in Middle Right
brandvideo$A6X <- ifelse(S$X[6]+S$W[6]-brandvideo$X>0,ifelse(S$X[6]+S$W[6]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A4X-brandvideo$A5X,S$X[6]+S$W[6]-brandvideo$X-brandvideo$A4X-brandvideo$A5X),0) #Width of Brand in Panel 6
brandvideo$A6Y <- ifelse(S$Y[6]+S$H[6]-brandvideo$Y>0,ifelse(S$Y[6]+S$H[6]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A3Y,S$Y[6]+S$H[6]-brandvideo$Y-brandvideo$A3Y),0)   #Height of Brand in Panel 6
brandvideo$A6 <- brandvideo$A6X*brandvideo$A6Y

#A7 - Area in Bottom Left
brandvideo$A7X <- ifelse(S$X[7]+S$W[7]-brandvideo$X>0,ifelse(S$X[7]+S$W[7]-brandvideo$X>brandvideo$W,brandvideo$W,S$X[7]+S$W[7]-brandvideo$X),0) #Width of Brand in Panel 7
brandvideo$A7Y <- ifelse(S$Y[7]+S$H[7]-brandvideo$Y>0,ifelse(S$Y[7]+S$H[7]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A1Y-brandvideo$A4Y,S$Y[7]+S$H[7]-brandvideo$Y-brandvideo$A1Y-brandvideo$A4Y),0)   #Height of Brand in Panel 7
brandvideo$A7 <- brandvideo$A7X*brandvideo$A7Y

#A8 - Area in Bottom Middle
brandvideo$A8X <- ifelse(S$X[8]+S$W[8]-brandvideo$X>0,ifelse(S$X[8]+S$W[8]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A7X,S$X[8]+S$W[8]-brandvideo$X-brandvideo$A7X),0)   #Width of Brand in Panel 8
brandvideo$A8Y <- ifelse(S$Y[8]+S$H[8]-brandvideo$Y>0,ifelse(S$Y[8]+S$H[8]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A2Y-brandvideo$A5Y,S$Y[8]+S$H[8]-brandvideo$Y-brandvideo$A2Y-brandvideo$A5Y),0)   #Height of Brand in Panel 8
brandvideo$A8 <- brandvideo$A8X*brandvideo$A8Y

#A9 - Area in Bottom Right
brandvideo$A9X <- ifelse(S$X[9]+S$W[9]-brandvideo$X>0,ifelse(S$X[9]+S$W[9]-brandvideo$X>brandvideo$W,brandvideo$W-brandvideo$A7X-brandvideo$A8X,S$X[9]+S$W[9]-brandvideo$X-brandvideo$A7X-brandvideo$A8X),0)   #Width of Brand in Panel 9
brandvideo$A9Y <- ifelse(S$Y[9]+S$H[9]-brandvideo$Y>0,ifelse(S$Y[9]+S$H[9]-brandvideo$Y>brandvideo$H,brandvideo$H-brandvideo$A3Y-brandvideo$A6Y,S$Y[9]+S$H[9]-brandvideo$Y-brandvideo$A3Y-brandvideo$A6Y),0)   #Height of Brand in Panel 9
brandvideo$A9 <- brandvideo$A9X*brandvideo$A9Y

#Drop x and y columns
brandvideo <- subset(brandvideo, select=-c(A1X,A1Y,A2X,A2Y,A3X,A3Y,A4X,A4Y,A5X,A5Y,A6X,A6Y,A7X,A7Y,A8X,A8Y,A9X,A9Y))

#P1 - Prominence in Top Left
brandvideo$P1 <- brandvideo$A1*brandvideo$CONFIDENCE/(100*S$A[1])

#P2 - Prominence in Top Middle
brandvideo$P2 <- brandvideo$A2*brandvideo$CONFIDENCE/(100*S$A[2])

#P3 - Prominence in Top Right
brandvideo$P3 <- brandvideo$A3*brandvideo$CONFIDENCE/(100*S$A[3])

#P4 - Prominence in Middle Left
brandvideo$P4 <- brandvideo$A4*brandvideo$CONFIDENCE/(100*S$A[4])

#P5 - Prominence in Middle Middle
brandvideo$P5 <- brandvideo$A5*brandvideo$CONFIDENCE/(100*S$A[5])

#P6 - Prominence in Middle Right
brandvideo$P6 <- brandvideo$A6*brandvideo$CONFIDENCE/(100*S$A[6])

#P7 - Prominence in Bottom Left
brandvideo$P7 <- brandvideo$A7*brandvideo$CONFIDENCE/(100*S$A[7])

#P8 - Prominence in Bottom Middle
brandvideo$P8 <- brandvideo$A8*brandvideo$CONFIDENCE/(100*S$A[8])

#P9 - Prominence in Bottom Right
brandvideo$P9 <- brandvideo$A9*brandvideo$CONFIDENCE/(100*S$A[9])

#A - Total Area, as Percentage
brandvideo$A <- rowSums(brandvideo[,c("A1","A2","A3","A4","A5","A6","A7","A8","A9")])/(1920*1080)

#P - Total Prominence
brandvideo$P <- rowSums(matrix(c(brandvideo$P1*S$Weight[1],brandvideo$P2*S$Weight[2],brandvideo$P3*S$Weight[3],brandvideo$P4*S$Weight[4],brandvideo$P5*S$Weight[5],brandvideo$P6*S$Weight[6],brandvideo$P7*S$Weight[7],brandvideo$P8*S$Weight[8],brandvideo$P9*S$Weight[9]), ncol=9))

write.csv(brandvideo, "brandvideof.csv")

##Program Metrics
brandmetrics <- ddply(brandvideo, .(BRAND), function(x) c(length(x$FRAME)/30, mean(x$A), sum(x$P)/66680))
names(brandmetrics) <- c("Brand","Time","Size","Prominence")
write.csv(brandmetrics, "brandmetrics.csv")
