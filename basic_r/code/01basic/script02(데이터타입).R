#자료형

#숫자형 변수
a <- 1
class(a)

a <-  3.14
class(a)

b <-  "1"
class(b)

c <-  c(1:10)
class(c)

d <-TRUE
class(d)

#범주형 변수 factor()로 생성
e <-factor(c(1,2,3,2,2,2,1,3))
e

class(e)#factor
levels(e) #어떤 등급으로 나눠지는지 확인 가능함함

f <- factor( c("a","b","b","c"))
f

#타입 변환 함수 as.numeric(), as.character(),as.factor()
as.character(a)
as.character(c)
as.numeric(b)
as.factor(c)
#as.Date("2020") # 문자열 -> 날짜
class( as.Date("2020-01-01")) #반드시 날짜 서식 지켜야함


#객체형 데이터 타입
# vector- 한가지 타입으로 생성된 변수
c(1,2,3,4,5) 
c(1:10)
c(1,2,3,"park", "hogn") # 문자형으로 저장

# dataframe - 여러타입이 합쳐진 2타원 구조
data.frame(a = c(1,2,3),
           b = c("park", "hong", "kim"))

data.frame(a = c(1:3),
           b = c("park", "hong")) #error (길이를 통일시켜야합니다)

# 행렬(matrix) - 한가지 타입으로 만들어진 2차원 구조
matrix(c(1:6), nrow = 3, ncol = 2)#3행2열
matrix(c(1:6), nrow = 2, ncol = 3)#2행3열
matrix(c(1:6), nrow = 3, ncol = 3)#모자란 경우 앞에 원소를 채워줍니다다

as.data.frame( matrix(c(1:6), nrow = 2, ncol = 3) )


#Array - 다차원 구조의 행렬
array( c(1:15), dim=c(3, 4, 3) ) #3행4열 3차원

# list - 모든 요소를 담는 다차원 구조
list( a = c(1:5),
      b = data.frame( a = c(1,2,3), b = c("kim","lee","choi") ),
      c = matrix( c(1:6), nrow = 3, ncol = 2) )






