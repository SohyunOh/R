'''
그래프와 그래프 더하기
중간에 있는 레이어층( 그래프함수)들이 겹쳐서 서로 보이는 형태로 사용함,
여러그래프를 겹쳐 표현할 때는  aes() 을 그래프에 넣습니다.
'''
# 
# eco <- as.data.frame(economics)
# eco
# 
# ggplot(eco, aes(x = date, y = psavert)) +
#   geom_line()
# 
# ggplot(eco ) +
#   geom_line(aes(x = date, y = psavert))


mpg <-  as.data.frame(mpg)
mpg

str(mpg)
ggplot(mpg,  aes(x = displ , y = hwy))+geom_point() 
ggplot(mpg,  aes(x = hwy , y = displ))+ geom_point()

#겹치기
#옵셥을  aes함수 안에 지장하면 범주 나타나고, 밖에 선언애주면 그래프의 색상만 변합니다.
ggplot(mpg)+
  geom_point(aes(x = displ , y = hwy ,color = 'red')) +
  geom_point(aes(x = hwy , y = displ) , color = 'blue') 
# x축 고정 , 서로다른 데이터를 표현
ggplot(mpg)+
  geom_point(aes(x = displ , y = cty),color ='red') +
  geom_point(aes(x = displ , y = hwy),color = 'blue') 

# 하나의 데이털르 참과 라인으로 표현
eco <-  as.data.frame(economics)
str(eco)

# 저축률 vs 실업률
a <- ggplot(eco) +
  geom_line(aes(x= date, y = psavert), color = 'red')+
  geom_line(aes(x= date, y = uempmed ), color = 'blue')

# line과 point
b <- ggplot(eco) +
  geom_line(aes(x= date, y = psavert), color = 'red')+
  geom_point(aes(x= date, y = psavert), size=0.1)
  

# 저축률 vs 실업률
#   geom_hline() - 수평 축 (yintercept 에 축 위치)
#   geom_vline() - 수직 축 (xintercept 에 축 위치)
ggplot(eco) +
  geom_line(aes(x= date, y = psavert), color = 'red')+
  geom_line(aes(x= date, y = uempmed ), color = 'blue')+
  geom_hline(yintercept = c(5,10))

c <- ggplot(eco) +
  geom_line(aes(x= date, y = psavert), color = 'red')+
  geom_line(aes(x= date, y = uempmed ), color = 'blue')+
  geom_hline(yintercept = mean( eco$psavert), color ='green')+ #y축의 값
  geom_vline(xintercept = as.Date("2010-12-31"), color ='green') +#x축의 값
  labs(title = "저출률 vs 실업률", x = '날짜', y = '저축률(실업률)')

mean( eco$psavert) #평균 값 : 8.567247

str(eco)

#동시에 여러 그래프 표현하기 gridExtra 패키지
install.packages("gridExtra")
library(gridExtra)

# step1 - 각각의 그래프를 변수에 저장
a
b
c
# step2 - grid.arrange() 함수 안에 표현
grid.arrange(a,b,c, nrow = 1 , ncol =3 )
grid.arrange(a,b,c, nrow = 3 , ncol =1 )
grid.arrange(a,b,c, nrow = 2, ncol= 2)






































