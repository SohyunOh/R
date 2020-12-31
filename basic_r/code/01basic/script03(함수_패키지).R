#간단한 함수
#숫자형 함수 sum(), mean(), max(), madian()

x <-  c(1:10)
x

sum(x) #합계
mean(x) #평균
max(x) 
min(x)
median(x) #벡터의 가장 중심값




c(1,2,3,4,5,6)
# 결측값이 있다면 함수의 사용이 불가능.
y <- c(1:10 ,NA, 12:20) # combibe변수의 조합
y

sum(y, na.rm = T ) # 결측값은 제거하고 합계
mean(y, na.rm = T ) 


#문자형 함수 nchar(), pasdte()
str1 <- "hello world"
str2 <- "my name id oh"
str3 <- c("a","b","c","d","e")

#문자열의 길이 확인
nchar(str1)
nchar(str2)
nchar(str3) # 각 원소들의 글자값을 확인

#문자열 붙이기 함수 paste()
paste(str1, str2)


str1 + 10 #문자열과 숫자열은 변환이 안되서 에러

paste(str1, 10, str2) #문자와 숫가의 결합이 가능

#sep는 문자열들의 구분자를 지정
paste(str1,str2, sep=",") 
paste(str1,str2, sep="-")
#복붙 단축키 : alt +shift +방향키
paste(str3, sep=",")

#collapse 는  combine 형 변수를 다룰 때 사용하는 옵션
paste(str3, collapse = ",")

#문자열 자르기 함수 substr (문자값, 시작, 끝)
# R은 인덱스 시작이 1부터 
str1
substr(str1, 1, 2)
substr(str1, 7, nchar(str1))

#str1_substr <- substr(str1, 1, 2)



#패키지 설치
install.packages("ggplot2") #그래프를 그려주는 패기지
.libPaths() #경로 
library(ggplot2) #라이이브러리 로드

X <-c(1,1,1,2,2,3,4,5)
qplot(x)#단순 빈도 그래프


#패키지에는 연습용 데이터가 존재
data(package = .packages(all.available = TRUE))

mpg
mpg <- as.data.frame(mpg)
mpg
class(mpg)

# qplot() 단순한 데이터 형태를 확인할 때 사용
qplot(data = mpg, x = hwy) # 자동차 데이터의 고속도로 연비
qplot(data = mpg, x = cty) # 도시주행거리 연비의 빈도
qplot(data = mpg, x = drv) # 자동차 구동방식의 빈도

qplot(data = mpg, x = drv , y = cty) #(x축) 구동방식 별 (y측) 도심연비
qplot(data = mpg, x = drv , y = class) #(x축) 구동방식 별 (y측) 자동차 종류


qplot(data = mpg, x = drv , y = cty , geom = "line" , color = drv ) #옵션
qplot(data = mpg, x = drv , y = cty , geom = "boxplot" , color = drv ) 


#다섯명의 시험점수를 가지고 있는 변수를 생성하고 80, 54, 75,34, 90
#평균 합계 새로운 변수에 저장해서 확인인

#stut <- c(80, 54, 75,34, 90)
#stut1<- sum(stut)
#stut2<- mean(stut1)

score <- c(80, 54, 75,34, 90)
score
avg <- mean(score)
sum <- sum(score)














