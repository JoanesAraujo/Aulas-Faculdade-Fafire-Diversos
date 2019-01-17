# Usa a base Car Evaluation # 

# carregar pacotes de Regressão
library(popbio)

# tratar base para valores numéricos
carEvaluationNumeric <- carEvaluation
carEvaluationNumeric$classe <- ifelse(carEvaluationNumeric$classe == 'unacc', 0, 1) # unacc = 0 porque o que queremos prever no fim das contas é se o carro é aceitável ou não
carEvaluationNumeric$mala <- ifelse(carEvaluationNumeric$mala == 'big', 1, 0) # atribuímos 1 a um dos valores possíveis do atributo mala

# para este algoritmo, a partição será criada com a base tratada e não com a original
particaoCar = createDataPartition(1:nrow(carEvaluationNumeric),p=.7)
treinoCarLogReg = carEvaluationNumeric[particaoCar$Resample1,]
testeCarLogReg = carEvaluationNumeric[- particaoCar$Resample1,]

# criar a regressão logística
carLogReg <- glm(classe ~., family = binomial, data = treinoCar)
summary(carLogReg)

# plotar gráfico de probabilidade considerando o atributo mala e a classe
logi.hist.plot(testeCar$mala,testeCar$classe,boxp=FALSE,type="hist",col="gray")

