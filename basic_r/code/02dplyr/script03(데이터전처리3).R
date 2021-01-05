'''
그룹핑과 요약하기
summarise(데이터세트, 요약컬럼=요약함수)
'''

data <- read.csv("data/excel_exam.csv")
data

summarise(data, sum_math = sum(math)) #수학에 대한 합계를 요약정보로 출력


d1<- summarise(data, sum_math = sum(math), #합계계
                avg_math = mean(math), #평균
                count = n()) #빈도수

class(d1)
is.data.frame(d1) #데이터 프레임 입니까? ##as.data.frame는 형변환
is.list(d1) #리스트 입니까? ##summarise는 요약정보를 list 형태로 반환합니다

mean(data$math)

# 사용방법 -> 그룹핑할 컬럼을 group_by() 그룹핑 시키고 요약정보를 출력합니다
d2 <- group_by(data, class)
summarise(d2, math_sum = sum(math))

#클래스별, 수학, 영어, 과학의 합계를 요약
summarise(d2, math_sum = sum(math),
              eng_sum = sum(english),
              sci_sum = sum(science),
              total = n())
#클래스별, 수학, 영어, 과학의 평균를 요약
summarise(d2, math_avg = mean(math),
          eng_avg = mean(english),
          sci_avg = mean(science),
          math_medi = median(math),
          eng_medi = median(english),
          sci_medi = median(science))

#파이프라인으로 한번에 작성
data %>% 
  group_by(class) %>% 
  summarise( math_sum = sum(math),
             math_avg = mean(math),
             total = n())
#여러개를 그룹핑 시키려면 group_by() 에 순서대로 적으면 됩니다
library(ggplot2)
mpg <- as.data.frame(mpg)

table(mpg$manufacturer)
table(mpg$drv)


result <- mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty),
            mean_hwy = mean(hwy))

result
class(result)
as.data.frame(result) #결과가 list 의 형태이기에 df형태로 다시 변환

mpg
#제조사병, 모델의 개수
result2 <- mpg %>% 
    group_by(manufacturer, model) %>% 
    summarise(total = n())

as.data.frame(result2)
