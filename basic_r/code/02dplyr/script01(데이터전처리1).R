'''
데이터 전처리 패키지  - 분석전 필요한 부분을 정렬하게나 편집하는 작업
행 추출 - filter(데이터세트, 조건)
'''

.libPaths()
install.packages("dplyr")
library(dplyr)

data <- read.csv("data/excel_exam.csv")
data

# 데이타 명, 조건
d1 <- filter(data, class == 1 )
mean(d1$math) #class가1인 학생들의 수학점수 평균

d2 <-  filter(data, class != 3) # class가 3이 아닌 행
d2

d3 <- filter(data, math >= 50 ) #math 가 50이상인 행행
d3

d4 <- filter(data, class == 2 & english >= 80) #class가 2, english 80 이상
d4

#%in% - 매칭되는 데이터를 찾을 때 사용합니다
d5 <- filter(data, class %in% c(1,3,5))
d5

d6 <- filter(data, math %in% c(30:70))
d6

## 데이터 가공을 순차적으로 실행해주는 파이프 라인
##단축키 ctrl + shift + m
ex1 <- filter(data, class != 1) # 클래스 1이 아닌 
ex1

ex2 <- filter(ex1, math >= 50) #수학점수 50인 이상
ex2

ex3 <- filter (ex2, id %% 2 == 0 ) # id가 짝수인  
ex3


ex4 <-  data %>%
    filter(class != 1) %>% 
  filter(math >= 50) %>% 
  filter(id %% 2 == 0)
  
mean(ex4$science)

# math은 dataframe을 넘기는 함수형태가 아니기 때문에 아래처럼은 사용 불가
  # data %>%
  # filter(class != 1) %>% 
  # filter(math >= 50) %>% 
  # filter(id %% 2 == 0) %>% 
  #   mean(science)

11/ 3 # 실수몫
11 %/% 3 # 정수몫 


   
# ggplot2에 있는 mpg 데이터를 이용해 분석 문제를 해결해 보세요.
library(ggplot2)
mpg <- data.frame(mpg)

# • Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 파이프라인을 이용해서 알아보세요.

displ4 <- mpg %>% 
  filter(displ <= 4)
mean(displ4$hwy)

displ5 <- mpg %>% 
  filter(displ >=5)  
mean(displ5$hwy)

(mean(displ4$hwy) >= mean(displ5$hwy)) == TRUE 

round(mean(displ4$hwy), 2) #반올림림
round(mean(displ5$hwy), 2)


# • Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi“ 제조년월이 2000년 이상인 데이터의 cty 합계, 평균을 구하세요

head(mpg)

audi2000<- mpg %>% 
  filter(manufacturer == "audi" & year >= 2000 )

sum(audi2000$cty)
mean(audi2000$cty)

# • Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.

str(mpg)

x4 <- mpg %>% 
  filter(manufacturer %in%  c("chevrolet", "ford" ,"chevrolet" ))
  
mean(x4$hwy)

