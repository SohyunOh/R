'''
결측치 - 누락된 값
is.na()

결측치를 처리하는 방법
1.결측치 잇는 행 제거
2. 결측치에 값 대입 (ex-평균, 최빈값)

'''

data <- data.frame(id = c(1:5) ,
                   gender = c ("M", "F",NA,"M","M"),
                   score = c(10,20,30,40,NA))

data
#결측치가 포함되 있다면, 결과가 NA로 표기가 됩니다.
mean(data$score)

  
#결측치를 확인 하는 함수 is.na()
  is.na(data) #데이터 확인
  is.na(data$gender)#컬럼확인
  is.na(data$score)
  
#데이터가 많아지면 결측치의 빈도를 확인해거 결측여부를 판별
  table(  is.na(data$gender) )
  table(  is.na(data$score) )

  # 결측치 제거
  data %>% 
    filter(!is.na(score))
  data %>% 
    filter(!is.na(score) & !is.na(gender))

  
  #모든 열에서 결측치가 하나라도 존재한다면 제거 na.omit(data)
  #단 -  분석데이터와 상관 없는 열이  NA 값을 가졌을 때, 데이터 손실이 발생될 수 있으므로, 사용의 주의
  na.omit(data)
  
#함수에서 결측치 제외
  mean(data$score, na.rm = T)
  sum(data$score, na.rm = T)
  median(data$score, na.rm = T)  

  #summarise 요약함수에서 적용
  exam <- read.csv("data/excel_exam.csv")
  exam
  
  # 인덱싱으로 결측치 삽입 exam[행, 열]
  exam[c(1,3,5,8,11), "math"] <- NA
  exam  

  table( is.na(exam$math))  
  
  #1nd
  exam %>% 
    summarise(sum_math = sum(math, na.rm = T),
              mean_math = mean(math, na.rm = T))
  
  #2nd
  exam %>%
    filter(!is.na(math)) %>% 
    summarise(sum_math = sum(math),
              mean_math = mean(math))
  
  
'''
결측치를 처리하는 방법
2. 결측치에 값 대입 (ex- 평균, 최빈값)
'''
table( is.na(exam))
  
#step1 - 결측값이 제거된 math 데이터의 평군을 구합니다.
mean( exam$math , na.rm =  T)

#step2 - 결측값을 iselse() 구문으로치환합니다.
exam$math <- ifelse(is.na(exam$math) , mean( exam$math, na.rm = T), exam$math)

table(is.na(exam)) #결측치 없음


#====================================================
#문제
# ggplot2에 존재하는 mpg데이터를 사용합니다
library(ggplot2)

# mpg데이터를 다음 구문으로 불러와서 결측치를 생성하세요.
mpg <- as.data.frame(mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA


# Q1
# drv(구동방식) 별 hwy(고속도로연비) 평균이 어떻게 다른지 확인하려고 합니다.
# 결측치를 확인하고 drv, hwy 변수에 결측치가 몇 개 있는지 확인하세요.

  table(is.na(mpg$drv))
  table(is.na(mpg$hwy))
  
  #선생님 답안
  table(is.na(mpg))
  table(is.na(mpg$drv))
  table(is.na(mpg$hwy))
  
  
# Q2
# filter() 를 이용해서 결측치를 제거하고 어떤 구동 방식 평균이 높은지 그룹별로 확인하고 차순정렬하세요


  mpg %>% 
    filter(!is.na(mpg$hwy)) %>% 
    group_by(drv) %>% 
    summarise( mean_hwy = mean(hwy)) %>% 
    arrange( desc(mean_hwy))
  















  
  
  
  
  
  
  
  