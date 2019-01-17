# instalação
install.packages('ade4', dependencies = T)
install.packages('arules', dependencies = T)
install.packages('arulesCBA', dependencies = T)
install.packages('arulesViz', dependencies = T)
install.packages('bnlearn', dependencies = T)
install.packages('caret', dependencies = T)
install.packages('class', dependencies = T)
install.packages('cluster', dependencies = T)
install.packages('e1071', dependencies = T)
install.packages('GA', dependencies = T)
install.packages("GenSA", dependencies=T)
install.packages('mgcv', dependencies = T)
install.packages('Metrics', dependencies = T)
install.packages('neuralnet', dependencies = T)
install.packages('popbio', dependencies = T)
install.packages('rpart', dependencies = T)
install.packages('rpart.plot', dependencies = T)
install.packages('party', dependencies = T)
install.packages('partykit', dependencies = T)
install.packages("sets", dependencies=T)
install.packages('tabuSearch', dependencies = T)
install.packages('tree', dependencies = T)
install.packages('tabuSearch', dependencies = T)

#### Car Evaluation ####
# Entrada Car Evaluation
carEvaluation <- read.table("car.data", sep=",")
colnames(carEvaluation) <- c('preçoCompra', 'preçoManutenção', 'portas', 'ocupantes', 'mala', 'segurança', 'classe')

# Partição Car Evaluation 
particaoCar = createDataPartition(1:nrow(carEvaluation),p=.7)
treinoCar = carEvaluation[particaoCar$Resample1,]
testeCar = carEvaluation[- particaoCar$Resample1,]

# Saída Car Evaluation
write.csv(carEvaluation, file = "carEvaluation.csv")

#### Student Performance ####
# Entrada Student Performance
d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

studentsPerformance=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

particaoStudents = createDataPartition(1:nrow(studentsPerformance),p=.7)
treinoStudents = studentsPerformance[particaoCar$Resample1,]
testeStudents = studentsPerformance[- particaoCar$Resample1,]

# Saída Student Performance
write.csv(studentsPerformance, file = "studentsPerformance.csv")
