# Usa a base Car Evaluation # 

# carregar pacotes de Arules
library(arules)
library(arulesViz)

# Preparar os dados para serem transformados dem transações
carEvaluation$ID <- seq.int(nrow(carEvaluation)) # criar identificador
identificadorCar <- as.character(carEvaluation[["ID"]]) # passar identificador para um objeto
carEvaluation <- carEvaluation[, -c(7,8)] # retirar o identificador e a classe

# transformar colunas em fatores
for(i in 1:ncol(carEvaluation)) carEvaluation[[i]] <- as.factor(carEvaluation[[i]])

# transformar a base de dados em um objeto transações
transacoes <- as(carEvaluation, "transactions")

# passar o identificador de volta para o objeto transações
transactionInfo(transacoes)[["ID"]] <- identificadorCar

# criar regras
regras = apriori(transacoes, parameter=list(supp=0.03,conf=0.30,minlen=2))
regras
summary(regras) # sumarizar
inspect(regras) # inspecionar

plot(regras, method="graph") # plotar regras