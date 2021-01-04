#데이터 수정하기
exam<- read.csv("data/excel_exam.csv", stringsAsFactors = T)

str(exam)
exam

exam[1,] <- 100 #첫행 변경
exam[c(1,3,5),] <-100 #1,3,5 변경

#데이터 열 수정
exam[,4] <-50
exam[,"english"] <-70

#데이터 부분 수정하기
exam[10,"math"] <- 1000

#데이터 열 추가하기
#열인덱스 or 열이름을 이용해서 추가

exam[,6] <- "hrllo"

exam[,ncol(exam)+1] <- "bye" #컬럼 개수를 구해서 끝행에 추가 

exam[,"XXX"] <- "abc" #열 이름으로 추가

exam$yyy <- "yyy"


#연습용
test <- c(1:5)
test[5]

#컬럼명의 수정 - colnames()
colnames(exam)[6] <-  "zzz"
colnames(exam)[7] <-  "kkk"
#열 삭제 ex ) exam[,-9]
colnames(exam)[6:9] <- c("aaa","bbb","ccc","ddd")
colnames(exam) <- c("a","b","c","d","e","f","g","h","i")

#
colnames(exam)["i"] <- "test"

#주의할점 - 기본형식에서 컬럼수정은 반드시 인덱스로 수정.
test <- c("aaa","bbb","ccc")
test["aaa"] #NA


exam
head(exam)

#ifelse를 이용한 파생변수 생성성
exam<- read.csv("data/excel_exam.csv")
exam

exam$math
exam$english
exam$science

exam$total <- exam$math + exam$english + exam$science
exam$avg <- (exam$math + exam$english + exam$science) /3

# ifelse(exam$avg >=60, TRUE,FALSE)
exam$pass_fail <- ifelse(exam$avg >= 60, "Y","N")
exam

#level 컬럼명을 추가 60이하는 row, 60~80은 middle, 80이상은 high
#힌트 :ifelse의 중첩


exam$level <-  ifelse(exam$avg >= 80, "high",
                                  ifelse(exam$avg >=60,"middle","row"))

exam 


