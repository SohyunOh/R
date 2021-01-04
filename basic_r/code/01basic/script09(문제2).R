remove(temp)

# Q1. ggplot2 패키지의 mpg데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요.
library(ggplot2)
temp<- as.data.frame(mpg)

# • Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요.
colnames(temp)[8] <-  "city"
colnames(temp)[9] <-  "highway"
head(temp)
# • Q3. 복사본 데이터를 이용해서 cty + hwy / 2의 total컬럼을만드세요.
temp$total<- (temp$city+temp$highway)/2
head(temp)
# • Q4. 컬럼 total의 평균을 출력하세요.
temp$avg <- mean(temp$total) #연비의 전체 평균균
head(temp)
# • Q5. total에 따른 파생변수 test를 생성합니다. (조건: total >= 20 이상 PASS 나머지 FAIL )
temp$grade <- ifelse(temp$total >=20, "PASS" ,"FAIL")
# • Q6. total에 따른 파생변수 grade를 생성합니다. (24이상 A, 20이상 B, 나머지는 C )
temp$grade <- ifelse(temp$total >=24 ,"A",
                    ifelse(temp$total >=20, "B" ,"C"))
# • Q7. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요. 아래와 같은 결과물이 출력되어야 합니다.

temp
head(temp,6)






                    
              
