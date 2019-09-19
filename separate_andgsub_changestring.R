df=read.csv("ex1.csv")
str(df)
levels(df[,1])
Class1=df[,1]
Class1
#for(i in Class) ifelse(i=="Class:Negative", "Negative", i)
#for(i in Class) ifelse(i=="Class:Negative1", "Negative", i)
#Class
ClassF=as.character(Class)
F=strsplit(ClassF, ":")
Class=sapply(F, `[[`, 2)
Class
Class=sub("Neutral1", "Neutral", x=Class)
(Class=sub("Negative1", "Negative", x=Class))
(Class=sub("Positive1", "Positive", x=Class))
#Class=ifelse(Class=="Neutral1")

Class2=unlist(lapply(strsplit(ClassF, ":"), `[[`, 2), use.names = FALSE)
Class2
Class=gsub("*[1-9]", "", Class2)
Class

df2=cbind(Class, Sensitivity=df[,2], Specificity=df[,3])
df2






##examples below used to figure out above code

string = c("G1:E001", "G2:E002", "G3:E003")
#want substring = c(E001,E002,E003)
gsub('.*:(.*)','\\1',string)
#gsub('.*e(.*)','\\1',Class2) #keeps printing ent, idk how to print beginning
gsub("[A-Z][1-9]:", "", string)
gsub("*[1-9]", "", Class2 )
f <- factor(sample(letters[1:5], 10, replace = TRUE))
for(i in unique(f)) print(i)

(for(i in Class) ifelse(i=="Class:Negative", "Negative", i))
test
df[X1=="*Class:*Negative*"]
df[,1]=="Class: Negative"
for(i in Class) print(i)

Invtime1_time2_all$Subject[Invtime1_time2_all$Subject=="5031"]="50312"
is.na(Invtime1_time2_LONG$Comparison.RT)=is.na(Invtime1_time2_LONG$Comparison.RESP)
(Inv_stats$Subject=ifelse(is.na(Inv_stats$Subject), "Overall", Inv_stats$Subject))


noquote(strsplit("A text I want to display with spaces", NULL)[[1]])

x <- c(as = "asfef", qu = "qwerty", "yuiop[", "b", "stuff.blah.yech")
# split x on the letter e
v=c(strsplit(x, "e"))
v
unlist(strsplit("a.b.c", "."))
## [1] "" "" "" "" ""
## Note that 'split' is a regexp!
## If you really want to split on '.', use
unlist(strsplit("a.b.c", "[.]"))
## [1] "a" "b" "c"
## or
unlist(strsplit("a.b.c", ".", fixed = TRUE))

## a useful function: rev() for strings
strReverse <- function(x)
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse = "")
strReverse(c("abc", "Statistics"))

## get the first names of the members of R-core
a <- readLines(file.path(R.home("doc"),"AUTHORS"))[-(1:8)]
a <- a[(0:2)-length(a)]
(a <- sub(" .*","", a))
# and reverse them
strReverse(a)

## Note that final empty strings are not produced:
strsplit(paste(c("", "a", ""), collapse="#"), split="#")[[1]]
# [1] ""  "a"
## and also an empty string is only produced before a definite match:
strsplit("", " ")[[1]]    # character(0)
strsplit(" ", " ")[[1]]   # [1] ""

