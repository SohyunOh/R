 
# gglplot2에 있는 mpg 데이터를 사용합니다.
library(ggplot2)
mpg <- data.frame(mpg)
str(mpg)

# • Q1. mpg데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만들고 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)만 추출합니다.
# - 파이프라인으로 한번에 처리하세요.

mpg_d1 <- mpg %>% 
  select(class, cty)  %>% 
  filter(class == c("suv","compact") )
  
head(mpg_d1,10)


# Q2. audi에서 생산한 자동차 중에 중 hwy가 1~5위에 해당하는 자동차의 (제조사, 모델, 년도, hwy)데이터만 출력하세요. 

str(mpg)
table(mpg$manufacturer)

mpg_d2 <- 
mpg %>% 
  filter(manufacturer == "audi") %>%
  select(manufacturer,model ,year,hwy) %>% 
  arrange( desc(hwy) ) %>% 
  head(5)
 
mpg_d2

#===================================================================================================
# gglplot2에 있는 mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류로 분리되어 있습니다.

# • Q1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가.
mpg_c <- mpg

mpg_c <- mpg_c %>% 
   mutate(sum = cty+hwy)

# • Q2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가.

mpg_c <- mpg_c %>% 
  mutate(avg = sum /2)

# • Q3. '평균 연비 변수'가 가장 높은 자동차 5순위 데이터를 출력.

mpg_c %>% 
  arrange(desc(avg)) %>% 
  head(5)


# • Q4. 원본 데이터를 이용해서 1~3 번 문제에 더하여 avg가 35이상이면 high, 35미만이면 row를 추가하는 파이프라인 으로 한번에 처리하는 구문을 완성하세요.

mpg <- 
  mpg %>% 
  mutate(sum = cty+hwy) %>% 
  mutate(avg = sum /2) %>% 
  arrange(desc(avg) ) %>% 
  mutate(avg = ifelse(avg >= 35, "high", "row")) %>% 
  head(5)


##선생님 답안
mpg_c2 <- 
  mpg %>% 
  mutate(sum = cty+hwy,
         avg = sum/2, 
         result = ifelse(avg >= 35, "high", "row")) %>% 
  arrange(desc(avg) ) %>% 
  head(5)
mpg_c2




















