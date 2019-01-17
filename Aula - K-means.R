d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

studentsPerformance=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(studentsPerformance)) # 382 students

str(studentsPerformance)
studentsPerformanceInt <- studentsPerformance[,c(3,7,8,15:17,24:33,35:37,44:53)]
str(studentsPerformanceInt)

OLS <- function(data, b0, b1, b2){
  
  attach(data, warn.conflicts=F)
  
  Y_hat <- b0  + b1*Wind + b2*Temp
  
  SSE = t(Ozone-Y_hat) %*% (Ozone-Y_hat) #matrix formulation for SSE
  
  detach(data)
  
  return(SSE)
  
}