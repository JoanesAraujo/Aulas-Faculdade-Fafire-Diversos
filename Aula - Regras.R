# Usa a base Car Evaluation # 

# carregar pacotes de Algoritmos Genéticos
library(arules)
library(arulesCBA)
library(arulesViz)
library(caret)

# criar regras
regrasCar = CBA(classe ~ ., treinoCar, supp=0.01, conf=0.01) # mineração de regras
inspect(regrasCar$rules)
plot(regrasCar$rules)


previsaoRegrasCar <- predict(regrasCar, testeCar)

confusionMatrix(previsaoRegrasCar, testeCar$classe) # matriz de confusão

