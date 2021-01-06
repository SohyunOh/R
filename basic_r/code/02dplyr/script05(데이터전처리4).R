'''
데이터 프레임을 가로로 합치기 left_join (데이터세트,키)
연결가능한 동일 키가 존재해야 합니다
'''
library(dplyr)

d1 <- data.frame(class= c(1:5),
           teacher =c("park","hong","choi","lee","kim"))



d2 <- data.frame(teacher =c("park","hong","choi","lee","kim"),
                subject = c("math","kor","science","english","society"))

d1
d2

left_join(d1,d2,by = "teacher") #teacher 키로 연결 (키를  "로 묶어줍니다.)


#열이름이 다른경우
#열 이름을 바꾸는 방법 1 
## colnames(d2)[1] <- "ttt"

#열 이름을 바꾸는 방법 2
# rename(데이터세트, 바꿀컬럼명 = 기존컬럼명)
d2 <- rename(d2,"ttt"="teacher")


#열이름이 다른 경우 강제 연결 
d1
d2
left_join(d1,d2, by= c("teacher"= "ttt"))

#행개수가 다르더라도 가능
data <- read.csv("data/excel_exam.csv")
data
d1

new_data <-  left_join(data, d1 , by= "class")
new_data

'''
데이터 프레임을 세로로 합티기 bind_rows (데이터셑,데이터 셋트)
ceiling() - 올림

'''

d3 <-  data.frame(id=c(1:5), test1= seq(60,100, by=10))
d3
#랜덤값 
ceiling( runif(15) *10)

d4 <- data.frame(id =c(6:20), test1 = ceiling( runif(15) *10))
d4

d3
d4

bind_rows(d3,d4)


?dplyr
















