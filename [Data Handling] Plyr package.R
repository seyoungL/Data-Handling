  
  ###########################
  ## [Data Handling] plyr  ##
  ###########################

  library(plyr)
  data(iris)
  
  ## Adply()
  head(iris)
    
  # �ະ�� Sepal.Length�� 5�̻�, ������ setosa�� ��
  adp <- adply(iris,1,function(row){row$Sepal.Length >= 5.0 & row$Species == "setosa"})
  head(adp)
  table(adp$V1)
  
  adp2 <- adply(iris,1, function(row) 
    { data.frame(SL_5_Setosa = c(row$Sepal.Length >= 5.0 & row$Species == "setosa")) })
  head(adp2)
  
  
  
  ## Ddply()
  
  # ������ Sepal.Width�� ���. ���̸��� SW_mean����
  ddp <- ddply(iris, .(Species), function(x){data.frame(SW_mean = mean(x$Sepal.Width))})
  print(ddp)
  
  # ���� ���� + Sepal.Length > 5 ���� �߰�
  ddp2 <- ddply(iris, .(Species, Sepal.Length>5), function(x)
    {data.frame(SW_mean = mean(x$Sepal.Width))})
  print(ddp2)  
  
  
  ## Mdply()
  df <- data.frame(a=1:5, b =1:5)
  mdply(df, sum)
  
  