'''
참조사이트 :https://ggplot2.tidyverse.org/reference/index.html
그래프 틀 만들기
ggplot2(데이터 셋, 축)
'''

# install.packages("ggplot2")
library(ggplot2)


mpg <- as.data.frame(mpg)

mpg
ggplot(data = mpg, aes(x = displ, y = hwy)) #1단계
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red" , size = 0.1)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red" , size = 0.1)+ xlim(5,7) #4단계

#시각화함수들의 중첩이 길어져서 줄바꿈할 때는 +가 마지막에 있도록 처리합니다
#scales를 이용한 축설정
ggplot(mpg, aes(x = displ , y = cty)) +
  geom_point() +
  xlim(5,7) +
  ylim(10, 30)


#scales를 이용해서 제목과 축설정
#1st
ggplot(mpg, aes(x = cty , y = hwy)) +
  geom_point() +
  xlab("x축 제목") +
  ylab("y축 제목")+
  ggtitle("이건 제목입니다")

#2nd
ggplot(mpg, aes(x = cty , y = hwy)) +
  geom_point() +
  labs(title = "제목" , x = "x축", y = "y축")


#aes 축에 color값을 고정으로 지정 or data별로 지정
ggplot(mpg, aes(x = cty , y = hwy, color = 'red')) +
  geom_point()

#  "color = cyl" - 실린더 기준으로 색상지정
ggplot(mpg, aes(x = cty , y = hwy, color = cyl)) +
  geom_point()












