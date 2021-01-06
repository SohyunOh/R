'''
stringr은 벡터형의 문자열을 자루는 다양한 기능이 들어있습니다.
'''
install.packages("stringr")
library(stringr)

?stringr

emp <- read.csv("data/emp.csv")
str(emp)
emp

# str_detect(벡터형, 정규식) - 패턴검사(논리형(true,false)으로 반환)
str_detect(emp$FIRST_NAME, "a") #a를 포함하는
str_detect(emp$FIRST_NAME, "[aA]") #a or A를 포함하는

str_detect(emp$FIRST_NAME, "^a") #a로 시작하는
str_detect(emp$FIRST_NAME, "^[aA]") #a or A로 시작하는

str_detect(emp$FIRST_NAME, "a$") #a로 끝나는
str_detect(emp$FIRST_NAME, "[aA]$") #a or A로 끝나는

# str_count(벡터형, 정규식) - 출현빈도
str_count(emp$JOB_ID, "A") #A의 출현빈도
str_count(emp$JOB_ID, "PROG")
str_count(emp$JOB_ID, toupper("prop")) #PROP의 출현빈도

#str_length(벡터)
length(emp$FIRST_NAME) #백터의 길이
nchar(emp$FIRST_NAME) #각 원소의 길이
str_length(emp$FIRST_NAME) #결과가 같음


#str_c(벡터, 벡터, 옵션) - paste() 동일
paste(emp$FIRST_NAME, emp$LAST_NAME, sep="-") #각 벡터의 연산 구분자 sep
str_c(emp$FIRST_NAME, emp$LAST_NAME, sep="-")


paste(emp$FIRST_NAME, collapse = ",") #하나의 백터데이터를 연결할 때 는 collapse
str_c(emp$FIRST_NAME, collapse = ",")

#str_sub (벡터, 시작, 끝) - substr()과 동일
emp$HIRE_DATE
substr(emp$HIRE_DATE, 1,2)
str_sub(emp$HIRE_DATE,1,2)

#기본 함수는 끝값을 반드시 저장해야하는 반면에 str_sub는 생략시 끝까지 추출
substr(emp$HIRE_DATE, 4, nchar(emp$HIRE_DATE))
str_sub(emp$HIRE_DATE,4)


#★★
#str_replace(벡터, 패턴, 치환문자) - 처음 매칭되는 값을  변경
emp$PHONE_NUMBER
str_replace(emp$PHONE_NUMBER,"\\.",")") # .은 정규표현식의 표현형식이므로 있는 특수문자 그대로 사용할려면 \\를 붙임


#str_replace_all (백터, 패턴, 치환문자) - 모든  매칭되는 값을 변경
str_replace_all(emp$PHONE_NUMBER, "\\." ,"-") #전부 - 적용
str_replace_all(emp$PHONE_NUMBER, "\\." ,"") #전부 - 삭제

#치환 결과를 저장
emp$PHONE_NUMBER <- str_replace_all(emp$PHONE_NUMBER, "\\.", "-")
emp


# ==========================
# 문제
# HIRE_DATE 의 타입을 확인하고  2020-01-06 형식의 날짜형 데이터로 전부 변경
# as.Date(), str_c(), str_replace_all()
emp$HIRE_DATE
class(emp$HIRE_DATE)


#r에서 날짜형은  yyyy-mm-dd 을 가져야 합니다.
x1<- str_c(20,str_replace_all(emp$HIRE_DATE ,"\\/","-"))
as.Date(x1, "%Y-%m-%d") 

#선생님 답안
emp$HIRE_DATE <-  as.Date(str_c(20,str_replace_all(emp$HIRE_DATE ,"\\/","-")))
str(emp)
emp





