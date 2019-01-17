# Usa a base Car Evaluation # 

# carregar pacotes de Algoritmos Genéticos
library(neuralnet)
library(ade4)

# converter fatores em dummies (inclusive a classe)
treinoCarDummyFull <- acm.disjonctif(treinoCar)
testeCarDummyFull <- acm.disjonctif(testeCar)

# criar a rede neural
start_time <- Sys.time()
nnCar = neuralnet(classe.acc + classe.good + classe.unacc + classe.vgood ~ 
preçoCompra.high + preçoCompra.low + preçoCompra.med +
preçoCompra.vhigh + preçoManutenção.high + preçoManutenção.low +
  preçoManutenção.med + preçoManutenção.vhigh + portas.2 + portas.3 +
  portas.4 + portas.5more + ocupantes.2 + ocupantes.4 + ocupantes.more +
  mala.big + mala.med + mala.small + segurança.high + segurança.low +
  segurança.med, treinoCarDummyFull, hidden=c(5,4))
end_time <- Sys.time()
print(total_time <- end_time - start_time)

plot(nnCar) # plotar a rede neural

net.result <- compute(nnCar, testeCarDummyFull[,1:21]) # criar a predição
predicoesRN <- as.data.frame(round(net.result[["net.result"]])) # transformar a predição em data frame
colnames(predicoesRN) <- c('acc', 'good', 'unacc', 'vgood') # mudar os nomes das colunas

# testar o rmse de cada coluna
rmse(testeCarDummyFull[,22], predicoesRN[,1])
rmse(testeCarDummyFull[,23], predicoesRN[,2])
rmse(testeCarDummyFull[,24], predicoesRN[,3])
rmse(testeCarDummyFull[,25], predicoesRN[,4])