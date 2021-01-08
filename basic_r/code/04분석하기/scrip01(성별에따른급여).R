'''
SPSS, SAS, STATA, SAV 통계누석 전용파일  파일들을 읽어서 활용하려면
foreign 패키지는 이용하면 됩니다.
'''
install.packages("foreign")
library(foreign) # 통계누석 전용파일 읽기
library(dplyr) # 함수화
library(ggplot2) # 시각화

test <- read.spss("data/koweps_hpc10_2015_Beta5.sav", to.data.frame = T)
test

colnames(test)
str(test)
View(test)

data <- test %>% 
  select(h10_g3, #성별
         h10_g4, #출생일
         h10_g10, #혼인상태
         h10_g11, #종교여부
         p1002_8aq1, #월평균 급여
         h10_eco9, #직종
         h10_reg7) #지역코드드



data


#컬럼명 변경 rename(data, 변경할 컬럼 = 기존 컬럼)
data <- rename(data, gender = h10_g3,
              birth = h10_g4, #출생일
              marriage = h10_g10, #혼인상태
              religion = h10_g11, #종교여부
              income = p1002_8aq1, #월평균 급여
              job_code = h10_eco9, #직종
              region_code = h10_reg7) 

data

#결측측치
table(is.na(data$gender))
table(is.na(data$birth))
table(is.na(data$marriage))
table(is.na(data$income))

#  성별에 따른 급여관계 분석 ####


#1. 데이터를 이해하기 쉽도록 변경 1이라면 male,2라면 female
str(data)
table(data$gender)

data$gender <- ifelse(data$gender == 1 ,"male","female" )

# 2. 급여에서 모름/ 무응답으로 처리 된 경우  9999 데이터로 처리가 되어있으므로 9999를 NA로 변경경
#3. 0인 경우는 급여가 없다는 뜻이므로 제외
table(data$income == 9999 )
data$income <-  ifelse(data$income %in% c(0,9999), NA, data$income )

data$income

#4.분석처리
d1 <- data %>% 
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(mean_income =mean(income))

ggplot(d1, aes(x = gender , y = mean_income, fill= gender)) +
  geom_col()





























