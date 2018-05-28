
  #################################################
  ## [Data Handling] Useful utility func (plyr)  ##
  #################################################
  
  # trasnfrom(), mutate(), summarise()
  
  data(baseball)
  str(baseball) 
  head(baseball)

  ## base::transfrom() : �������� df�� ���ο� ���� ����
  # Ex. �������� �� ���� ����(id)�� �� �� �� ��������� ���ϴ� 'cyear' �÷� �߰�
  tr <- ddply(baseball, .(id), transform, cyear = year - min(year)+1)
  head(tr)
  
  
  ## plyr::mutate() : base::transfrom() ����
  ## ���� �÷��� df�� �߰��� �� �ٷ� �ռ� �߰��� �÷� �ٷ� ���� ����
  mu <- ddply(baseball, .(id), mutate, cyear = year - min(year)+1, log_cyear = log(cyear))
  head(mu)  
  
  
  ## summarize() : ��� ������� ���� ���ο� df�� ��ȯ cf)transform
  # Ex. ������(id) min year�� max year�� ����� ���
  su <- ddply(baseball, .(id), summarize, minyear = min(year), maxyear = max(year))
  head(su)
  
  su2 <- ddply(baseball, .(id), function(x)
  {data.frame(minyear = min(x$year), maxyear = max(x$year))})
  head(su2)      
  
  
  