# Usa a base Car Evaluation # 

# carregar pacotes de Algoritmos Genéticos
library(class)
library(caret)
library(ade4)

# como o algortimo aceita apenas variáveis numérias, é preciso transformar a base
treinoCarDummy <- acm.disjonctif(carEvaluation[,1:6]) # acm.disjonctif transforma as colunas 1 a 6 (a 7 não pq a classe não pode ser binarizada) da base Car Evaluation em variáveis binárias
treinoCarDummy$classe <- carEvaluation$classe # trazer de volta a classe

testeCarDummy <- treinoCarDummy[c(10:20),] # como o Knn lida com novos casos, vamos criar treino e teste retirando algumas linhas da base de treino

treinoCarDummy <- treinoCarDummy[-c(10:20),] # as linhas escolhidas para a base de teste são retiradas da base de treino

carKnn = knn(treinoCarDummy[,1:21], testeCarDummy[,1:21], treinoCarDummy[,22], k=100) # criamos o modelo, indicando quantos vizinhos serão pesquisados (k)
carKnn # classificação

confusionMatrix(carKnn, testeCarDummy$classe) # matriz de confusão
