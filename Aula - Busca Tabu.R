# A base de dados é definida na própria função #

# carregar pacote de busca tabu #
library(tabuSearch)

# criar função objetivo
assessoriaJuridica <- function(solucao)
{
  
  #solucao = c(1,0,1,1,1,0,1,0,1,1,1,0)
  
  # maximização
  precoContrato = c(4600, 5400, 4200, 7400, 8300, 7330, 4400, 5200, 5600, 9000, 15000)
  # restrições -> reduzir o espaço de busca
  horasContrato = c(8, 10, 10, 12, 20, 12, 6, 10, 18, 22, 30)
  contrato = c(1,1,1,1,1,1,1,1,1,1,1)
  
  soma1 = 0;
  soma2 = 0;
  qtdContrato = 0;
  
  for (i in 1:length(precoContrato)) {
    if (solucao[i]==1)
    {
      soma1 = soma1 + precoContrato[i];
      soma2 = soma2 + horasContrato[i]; #restrição 1
      qtdContrato = qtdContrato + contrato[i]; #restrição 2
    }
  }
  
  if (soma2 <= 40 & qtdContrato <= 5)
  {
    return(soma1)
    
  }
  else
  {
    return(0)
    
    
  }  
  
}


# realizar busca tabu
# size = total de elementos de busca | iters = iterações | objFunc = função objetivo | listSize = total de tabus | nRestarts = quantidade máxima de reinícios | repeatAll = quantidade de repetições | verbose = print ou não?
z = tabuSearch(size = 11, iters = 1000, objFunc = assessoriaJuridica, 
           listSize = 9, nRestarts = 10, repeatAll = 1, verbose = T) 

plot(z) # gráfico da busca

summary(z) # sumário geral

summary(z, verbose = TRUE) # resposta da busca
