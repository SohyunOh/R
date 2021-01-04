library(ggplot2)
mpg <-as.data.frame(mpg)

mpg

aaa <- mpg[1:3, 1:4]
bbb <- mpg[11:13, 1:4]

aaa
bbb


cbind(aaa,bbb)#컬럼병합합
rbind(aaa,bbb)#행병합

#주의
#cbind()은 행의 개수가 반드시 일치
#rgind()은 행의 개수가 반드시 일치 

ccc <-  mpg[1:2, 1:5]

aaa
ccc

ddd <-  mpg[1:3, 1:5]
aaa
ddd
rbind(aaa,ddd) #에러

#열 데이터의 진도수
table(mpg$model)
table(mpg$year)
table(mpg$manufacturer)

#열 데이터를 여러개 넣으면 다차원 으로 빈도수 확인인
table(mpg$manufacturer, mpg$year)

#빈도수의 간략한 표형태를 표현
#hist(빈도수)
hist(table(mpg$year))
hist(table(mpg$model))
hist(table(mpg$manufacturer))










