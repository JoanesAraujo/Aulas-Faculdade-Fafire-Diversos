# Usa a base Students Performance # 

# carregar pacotes de Algoritmos Genéticos
library(GA)
library(mgcv)
library(Metrics)

# Uma vez que usaremos os algoritmos genéticos para regressão, é necessário deixar apenas as colunas numéricas
studentsPerformanceInt <- studentsPerformance[,c(3,7,8,15:17,24:33,35:37,44:53)]
str(studentsPerformanceInt)
# Para fins didáticos (deixar a função mais simples), faremos um corte na base, selecionando apenas alguns atributos
studentsPerformanceOLS <- studentsPerformanceInt[,c(4:6,10:11,14:16)]

# Criar função objetivo que o algoritmo genético buscará aprender
OLS <- function(data, b0, b1, b2, b3, b4, b5, b6, b7){
  
  attach(data, warn.conflicts=F)
#passar como parâmetros as variáveis que serão usadas na predição  
  Y_hat <- b0  + b1*traveltime.x + b2*studytime.x + b3*failures.x + b4*Dalc.x + b5*Walc.x + b6*G1.x + b7*G2.x
  
  #passar a variável de saída
  SSE = t(G3.x-Y_hat) %*% (G3.x-Y_hat) #matrix formulation for SSE
  
  detach(data)
  
  return(SSE)
  
}

# realizar a regressão com algoritmos genéticos
start_time <- Sys.time()
ga.OLS <- ga(type='real-valued', 
             min=rep(-100, ncol(studentsPerformanceOLS)), #colocar valor mínimo de cada parâmetro (n(x) + 1)
             max=rep(100, ncol(studentsPerformanceOLS)), #colocar valor máximo de cada parâmetro (n(x) + 1)
             popSize=500, 
             maxiter=500, 
             names=c('intercepto', 'traveltime', 'studytime', 'failures', 'Dalc', 'Walc', 'G1', 'G2'), # nomes das variáveis
keepBest=T, fitness = function(b)-OLS(studentsPerformanceOLS, b[1],b[2], b[3], b[4], b[5], b[6], b[7], b[8])) # lembrar de colocar o total de parâmetros n(x)+1
end_time <- Sys.time()
print(total_time <- end_time - start_time)

#### gráficos e sumários da regressão com Algoritmos Genéticos
plot(ga.OLS)
summary(ga.OLS)

predicoesGAOLS <- rep(0, nrow(studentsPerformanceOLS)) # Criar vetor vazio para colocar as predições

# laço para gerar as predições de forma iterativa
for(i in 1:nrow(studentsPerformanceOLS)) { # laço maior = linhas
  for(j in 1:7) { # laço menor = colunas
  predicoesGAOLS[i] <-  predicoesGAOLS[i] + ga.OLS@solution[j+1]*studentsPerformanceOLS[i,j]
  }} # preencher o vetor de predições com o valor dele mesmo mais o peso + valor original da variável
predicoesGAOLS <- predicoesGAOLS+ga.OLS@solution[1] # reduzir o intercepto

rmse(studentsPerformanceOLS$G3.x, predicoesGAOLS) # Raiz quadrada do erro-médio
rrse(studentsPerformanceOLS$G3.x, predicoesGAOLS) # Raiz quadrada do erro relativo

plot(studentsPerformanceOLS$G3.x, predicoesGAOLS)

# código da predição sem laço #
# predicoesGAOLS <-
#   ga.OLS@solution[1]+
#   ga.OLS@solution[2]*studentsPerformanceOLS[,1]+
#   ga.OLS@solution[3]*studentsPerformanceOLS[,2]+
#   ga.OLS@solution[4]*studentsPerformanceOLS[,3]+
#   ga.OLS@solution[5]*studentsPerformanceOLS[,4]+
#   ga.OLS@solution[6]*studentsPerformanceOLS[,5]+
#   ga.OLS@solution[7]*studentsPerformanceOLS[,6]+
#   ga.OLS@solution[8]*studentsPerformanceOLS[,7]