  
  ###########################
  ## [Data Handling] plyr  ##
  ###########################

  library(plyr)
  data(iris)
  
  ## Adply()
  head(iris)
    
  # 행별로 Sepal.Length가 5이상, 종류가 setosa인 것
  adp <- adply(iris,1,function(row){row$Sepal.Length >= 5.0 & row$Species == "setosa"})
  head(adp)
  table(adp$V1)
  
  adp2 <- adply(iris,1, function(row) 
    { data.frame(SL_5_Setosa = c(row$Sepal.Length >= 5.0 & row$Species == "setosa")) })
  head(adp2)
  
  
  
  ## Ddply()
  
  # 종류별 Sepal.Width의 평균. 열이름은 SW_mean으로
  ddp <- ddply(iris, .(Species), function(x){data.frame(SW_mean = mean(x$Sepal.Width))})
  print(ddp)
  
  # 위의 문제 + Sepal.Length > 5 조건 추가
  ddp2 <- ddply(iris, .(Species, Sepal.Length>5), function(x)
    {data.frame(SW_mean = mean(x$Sepal.Width))})
  print(ddp2)  
  
  
  ## Mdply()
  df <- data.frame(a=1:5, b =1:5)
  mdply(df, sum)
  
  