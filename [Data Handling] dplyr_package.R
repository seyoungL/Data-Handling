
  ############################
  ## [Data Handling] dplyr  ##
  ############################
  
  setwd("C:/Users/user/Desktop/R")
  library(dplyr)

  insurance <- read.csv("http://www.sci.csueastbay.edu/~esuess/classes/Statistics_6620/Presentations/ml10/insurance.csv",
                        stringsAsFactors = T)
  str(insurance)
  summary(insurance)


  ## sample_n(), sample_frac(), slic()
  insurance %>% sample_n(10, replace = F)

  insurance %>% sample_frac(0.01)  
  
  insurance %>% slice(10:12)   
  
  ## filter()
  insurance %>% filter(smoker == 'yes', sex == 'male', age<=18)
  insurance %>% filter(region == 'southeast' | age == 19)

  ## arrange()
  insurance %>% arrange(age, desc(expenses)) %>% head(20)
  
  ## rename()
  insurance %>% rename(newAge = age) %>% head()

  ## select()
  insurance %>% select(age, sex, expenses) %>% head()
  
  ## mutate(), transmute()
  insurance %>% mutate(age.group = substr(age,1,1)) %>% head()
  insurance %>% transmute(age.group = substr(age,1,1)) %>% head()
  
  ## summarise(), summarise_each()
  insurance %>% summarise(sex_cnt = n_distinct(sex), expenses_mean = mean(expenses))
  insurance %>% summarise_each(funs(mean,sd), age, expenses)
  
  ## group_by()
  gender <- group_by(insurance, sex)
  gender %>% summarise(avg = mean(expenses), stdev = sd(expenses))
  
  insurance %>% group_by(sex) %>% summarise(avg = mean(expenses), stdev = sd(expenses))
  
  # [ Stratified sampling by group ]
  # Way) group_by, sample_n
  # Ex. 흡연여부에 따라 층화추출 5개
  insurance %>% group_by(smoker) %>% sample_n(5)
  
  # [ Summary statistic by group ]
  # Way) group_by, summarise
  # Ex. 성별에 따라 체질량지수의 평균과 표준편차
  insurance %>% group_by(sex) %>% summarise(BMI.avg = mean(bmi), BMI.sd = sd(bmi))
    