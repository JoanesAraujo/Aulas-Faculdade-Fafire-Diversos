# Usa a base Car Evaluation # 

# carregar pacotes de Algoritmos Genéticos
library(e1071)

# como o algortimo aceita apenas variáveis numérias, é preciso transformar a base
treinoCarDummy <- acm.disjonctif(treinoCar[,1:6])
treinoCarDummy$classe <- treinoCar[,7]

testeCarDummy <- acm.disjonctif(testeCar[,1:6])
testeCarDummy$classe <- testeCar[,7]

# criar a máquina de vetor de suporte
svmCar = svm(classe ~ ., data = treinoCarDummy, cost = 10, scale = FALSE)
svmCar
plot(svmCar, treinoCarDummy, segurança.med ~ preçoCompra.high)

# criar predição
previsaoSVMCar <- predict(svmCar, testeCarDummy) # criar predição

# criar matriz de confusão
confusionMatrix(previsaoSVMCar, testeCarDummy$classe) # matriz de confusão
