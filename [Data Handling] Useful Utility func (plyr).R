
  #################################################
  ## [Data Handling] Useful utility func (plyr)  ##
  #################################################
  
  # trasnfrom(), mutate(), summarise()
  
  data(baseball)
  str(baseball) 
  head(baseball)

  ## base::transfrom() : 연산결과를 df의 새로운 열에 저장
  # Ex. 데이터의 각 행이 선수(id)의 몇 년 차 통계인지를 뜻하는 'cyear' 컬럼 추가
  tr <- ddply(baseball, .(id), transform, cyear = year - min(year)+1)
  head(tr)
  
  
  ## plyr::mutate() : base::transfrom() 개선
  ## 여러 컬럼을 df에 추가할 때 바로 앞서 추가한 컬럼 바로 참조 가능
  mu <- ddply(baseball, .(id), mutate, cyear = year - min(year)+1, log_cyear = log(cyear))
  head(mu)  
  
  
  ## summarize() : 계산 결과만을 담은 새로운 df를 반환 cf)transform
  # Ex. 선수별(id) min year와 max year의 결과만 출력
  su <- ddply(baseball, .(id), summarize, minyear = min(year), maxyear = max(year))
  head(su)
  
  su2 <- ddply(baseball, .(id), function(x)
  {data.frame(minyear = min(x$year), maxyear = max(x$year))})
  head(su2)      
  
  
  