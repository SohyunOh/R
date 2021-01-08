
library(dplyr) # 함수화
library(ggplot2) # 시각화

# [문항1]  주택도시보증공사에서 제공하는 민간아파트 분양가격 동향 데이터를 분석하려 합니다.
# 해당 csv파일을 읽어 들어와 예시와 같이 컬럼명을 변경하세요.
# 제출형식 - 이미지

library(readxl)
test <- read.csv("data/test.csv") # 한글이름이 길어서 test로 바꿨습니다.
test
colnames(test)
str(test)
#rename (변경이름 = 원본이름)
test <- rename(test ,
       "region" = "지역명",
       "area" = "규모구분",
       "year" = "연도",
       "month" = "월",
       "price" = "분양가격..." )


# [문항2]  결측치가 있는 컬럼은 어디인가요?
table(is.na(test$region)) # 지역명 FALSE  4505 
table(is.na(test$area)) # 규모구분 FALSE  4505
table(is.na(test$year)) # 연도 FALSE  4505
table(is.na(test$month)) # 월 FALSE  4505
table(is.na(test$price)) # 분양가격 FALSE 4185   TRUE 320 


# [문항3]  area 전체는 제외한 새로운 데이터를 생성합니다.
# 분석의 편의를 위해 area의 전용면적에 따라 A,B,C,D로 구분하는 area_lv컬럼을 생성합니다

    # -집단별로 요약하기 / group_by는 테이블형태로 만들어줌.
    test %>% 
      group_by( test$area ) %>%  
      summarise() #통계요약 
    '''
    1 전용면적 102㎡초과         
    2 전용면적 60㎡이하          
    3 전용면적 60㎡초과 85㎡이하 
    4 전용면적 85㎡초과 102㎡이하
    5 전체 
    '''
  test1 <-  test %>% 
  filter( !area == "전체") %>% 
  mutate( area_lv = ifelse( area == "전용면적 60㎡이하", "A",
                            ifelse( area == "전용면적 60㎡초과 85㎡이하","B",
                                    ifelse( area == "전용면적 85㎡초과 102㎡이하", "C", "D"
                                     )))) %>% 
  head(10)

test1


# [문항4]  지역별 평당 분양가격 전체 평균을 구하고 막대그래프로 시각화하여 제출하세요

d1 <- test %>% 
  filter( !is.na(price)) %>% 
  group_by(region) %>% 
  summarise(mean_price = mean(price))
d1

test4 <- ggplot(d1, aes (x = reorder(region, -mean_price ) , y = mean_price , fill = region )) +
  geom_col() +
  labs(title = "지역별 평양 분양가격" , x= "지역",  y = "평당분양가격평균")

test4


# [문항5]  2016, 2017, 2018, 2019년의 연도별,지역별 분양가격평균을 막대그래프로 시각화하여 제출하세요
  
d5 <- test %>% 
  filter(!is.na(price)) %>% 
  filter(year %in% c(2016, 2017, 2018, 2019)) %>% 
  group_by( year , region) %>% 
  summarise( mean_price =mean(price))
  
d5
head(test)

test5 <- ggplot(d5, aes( x = year , y = mean_price , color = region) ) +
  geom_col(position = "dodge") +
  labs(title = "연도별 지역평균" , x= "연도",  y = "평당분양가격평균")

test5


# [문항6]  2019년 서울지역의 월별 분양가격 평균 변화 추이를 시계열그래프로 시각화하여 제출하세요

d6 <- test %>% 
  filter(!is.na(price)) %>% 
  filter(year == 2019) %>% 
  filter(region == "서울") %>% 
  group_by(month) %>% 
  summarise( mean_price = mean(price))

d6

test6 <- ggplot(d6,aes(x = month ,y =  mean_price )) +
  geom_line() +
  labs( title ="2019년 서울지역 원병 평균변화 " , x ="월", y="평당분양가격평균")

test6

# [문항7]  연도별 아파트 평당분양가 변화동향을 시계열그래프로 시각화하여 제출하세요.

library(stringr)
d7 <- test %>% 
  mutate(date = as.Date(str_c(year, ifelse(month <10, str_c(0,month), month), 01, sep = "-")))

dp7 <- d7 %>% 
  filter(!is.na(price)) %>%
  filter( region == "서울") %>% 
  group_by(date) %>% 
  summarise( mean_price = mean(price))

dp7

test７　<- ggplot(dp7) +
  geom_line( aes( x= date , y = mean_price) , color = "red") +
  geom_hline(yintercept = mean(dp7$mean_price),color = "green") +
  labs( title = "연도별 아파트분양가 변화화동향" , x = "연도", y="평당분양가격평균")


  
  












