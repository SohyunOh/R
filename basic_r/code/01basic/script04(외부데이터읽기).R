#외부데이터 불러오기
getwd()
#setwd("D:\R\basic_r\data")

# read.table() - text 파일을 읽음
#첫번떄 행이 컬럼명인 경우는  header = T 옵션을 사용합니다
d1 <- read.table("data/excel_exam.txt", header = T)
class(d1)
d1


# 데이터가 tap으로 구분된 파일을 읽을 떄 사용
d2 <- read.delim("data/excel_exam.txt")
d2

# read.csv() - csv 파일을 일고, 
# 문자 데이터를 읽어 들어올 때 컬럼이 factor 변경되는 문제가 있응게,
# factor 로 변경되는 것을 막는 옵션
d3 <- read.csv("data/excel_exam.csv")
d3 <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
d3
class(d3)
str(d3) #스트럭쳐는 구조를 알려줌 


# excel 파일을 읽기 위해서 패키지 설치
install.packages("readxl")
library(readxl) #라리브러이 로드

# excel파일이 첫행이 데이터인 경우 에는 col_names로 F로 선언해서 가지고 옵니다
d4 <- read_excel("data/excel_exam.xlsx", col_names = T)
d4 <- as.data.frame(d4)
class(d4) #데이터 프레임으로 변경이 필요
d4


##======================================================
# file  -> import daraset 선택하고 마우스로 제이터를 import 도 가능

##데이터 저장하기
name  <-  c("park", "kim","lee", "choi", "hong")
kor <-  c(10,20,30,40,50)
eng <- c(23,45,64,34,23)

d5 <- data.frame(name, kor , eng)

write.csv(d5, file="data/export.csv") # getwd()기준 상대경로(/슬래시) 
write.csv(d5, file="D:\\R\\basic_r\\data\\export.csv") #절대경로 #(\)백슬레시는 탈출문자여서 2개로 표시


















