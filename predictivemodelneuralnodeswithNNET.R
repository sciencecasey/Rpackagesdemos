#testing the nnet for neural network prediction 
#from : https://visualstudiomagazine.com/articles/2016/11/01/using-the-r-nnet-package.aspx

####Goal: predict the species of iris flowre (setosa, versicolor, viginica) from 
######four input values: sepal length+width, petal length+width
#note: sepal is a grean leaf-like structure


#install.packages("nnet")
library(nnet)
library(ggplot2)
library(dplyr)
library(tidyr)
library(shiny)
library(lattice)

cat("\nBegin neural network using nnet demo \n\n")
cat("Orginal Fisher's Iris data: \\n");
irisdf=iris

cat("Factor-ized data: \n\n")
(write.table(irisdf[1:2,], col.names = TRUE, sep="\t", quote=FALSE))
cat(" . . . \n")
(write.table(irisdf[51:52,], col.names=FALSE, sep="\t", quote=FALSE))
cat(" . . . \n")
(write.table(irisdf[101:102,], col.names=FALSE, sep="\t", quote=FALSE))
cat("\n")

#configure the training sample
set.seed(1)
sampidx=c(sample(1:50, 10), sample(51:100,10), sample(101:150, 10))
cat("The training sample indices are: \n")
print(sampidx)

#create and train nn
cat("\nCreating and training a neural network . . \n")
mynn=nnet(Species~ ., data=irisdf, subset=sampidx, size=2, decay=1.0e-5, maxit=50)

#evaluate accuracy of nn model with a confusion matrix
##the rownames are the actual values and the ocl names are predicted
cm=table(irisdf$Species[-sampidx], predict(mynn, irisdf[-sampidx, ], type="class"))
cat("\nConfusion matrix for resulting nn model is: \n")
print(cm)
cat("\nThe rownames are the actual values and the ocl names are predicted \n")
cat("\nThis means that where the col and rownames match, the predicted value was correct.\nWhere the col and rownames do not match, the predicted value by the sample given was inaccurate \n")

inacc=sum(cm[1,2]+cm[1,3])+(cm[2,1]+cm[2,3])+(cm[3,1]+cm[3,2])
total=sum(cm[1,1]+cm[2,2]+cm[3,3]+inacc)
cat("\nThe accuracy is:\n")
((total-inacc)/total)

cat("\nEnd neural network demo \n")

