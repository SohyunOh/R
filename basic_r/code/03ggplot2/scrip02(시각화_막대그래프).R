'''
막대 그래프 - 집단별 평균을 나타낼 때 일반적으로 사용합니다
데이터의 요약정보를 먼저 만들고ㅡ 평균표를 이용합니다
geom_col()
'''

library(ggplot2)
library(dplyr)

mpg <- data.frame(mpg)

#drv별 cty (고속도로)연비 평균

d1 <-  mpg %>% 
   group_by(drv) %>% 
   summarise(mean_hwy  = mean(hwy, na.rm = T))

d1

#시각화 
ggplot(d1, aes(x =drv, y= mean_hwy)) +
  geom_col()


# reorder는 (정렬하고 싶은 변수, 연속형변수)
ggplot(d1, aes(x= reorder(drv, -mean_hwy) , y= mean_hwy )) +
  geom_col()


#제조사별  hwy평균
str(mpg)

d2 <- mpg %>% 
  group_by(manufacturer) %>% 
  summarise( mean_hwy= mean(hwy))

ggplot(d2, aes(x= reorder(manufacturer,-mean_hwy ), y = mean_hwy))+
  geom_col()


'''
누적막대 그래프(빈도) 그래프
geom_bar() 를 사용, 원자료를 이용해서 처리해도 됩니다.
빈도를 표현하기 때문에 x값만 지정합니다
'''
#구동방식 별 빈도
ggplot(mpg, aes(x = drv))+
  geom_bar()

table(mpg$drv)

#모델별 빈도
ggplot(mpg, aes(x = model, fill = 'red'))+
  geom_bar()

#class별 빈도
ggplot(mpg, aes(x = class, fill = drv))+
  geom_bar()


ggplot(mpg, aes(x = class, fill = drv))+
  geom_bar()


ggplot(mpg, aes(x = class, fill = drv))+
  geom_bar()

'''
막대그래프에서 막대 채우기 색상을 구분할 때는 fill=컬럼을 작성하면됩니다
'''

#class 별 막대그래프
 ggplot(mpg, aes(x = class, fill = manufacturer))+
  geom_bar()

 
 # 구동 방식별 model
 ggplot(mpg, aes(x = drv, fill = model))+
   geom_bar()
 

 
 # 구동 방식별  fl 
 ggplot(mpg, aes(x = drv, fill = fl))+
   geom_bar()

 
 
 # 구동 방식별 연료 누적열을 분리 
 ggplot(mpg, aes(x = drv, fill = fl))+
   geom_bar(position = "dodge")
 
 ggplot(mpg, aes(x = drv, fill = fl))+
   geom_bar(position = "fill")
 
 
 
 '''
 막대 그래프의 가독성을 올려주는 coordinate
 누적열을 회전, 원형으로 변경
 '''

 # 그래프 회전시키기  coord_flip()
 # x 축 데이터가 많은 경우 가독성을 위해 사용합니다.
 ggplot(mpg, aes(x=  model, fill = model)) +
   geom_bar() +
   coord_flip()
 
 #그래프를 원형차트로의 변경 coord_polar()
 #제조사별 구동 방식
 ggplot(mpg, aes(x=  manufacturer, fill = drv)) +
   geom_bar() +
   coord_polar()

 # 구동방식별 모델
 ggplot(mpg, aes(x= drv, fill = model)) +
   geom_bar() +
   coord_polar()
 
 # 구동방식별 연료
 ggplot(mpg, aes(x= drv, fill = fl)) +
   geom_bar() +
   coord_polar()
 
 '''
 연속형막대 차트에서 데이터가 없는 경우 빈 영역으로 표시되는데,
 원형챠트를 사용할 때는 축이나 FILL 값을 빈요소가 없도록 처리하는 편이 좋습니다.
 as.factor() or factor() 현태로 변환합니다.
 '''
 #빈자료는 빈공간으로 표시
 ggplot(mpg, aes(x= hwy, fill = drv )) +
   geom_bar() +
   coord_polar()
        
  #빈 공간이 사라짐
 ggplot(mpg, aes(x= factor(hwy), fill = drv )) +
   geom_bar() +
   coord_polar()
 
 
 '''
 원그래프의 비율을 표기 coord_polar(theta = "y")
 '''
 
 ggplot(mpg, aes(x= drv, fill = model )) +
   geom_bar(position = "fill") +
   coord_polar(theta = "y")
 
 '''
 원그래프를 이용한 하나의 비율
 '''
 ggplot(mpg, aes(x= factor(1), fill = drv )) +
   geom_bar(position = "fill") +
   coord_polar(theta = "y")
 
 
 #===============
 
#문제
 str(mpg)
 ggplot(mpg, aes(x = class , fill = drv)) + 
   geom_bar(position ="fill") + #채우기
   coord_flip() #회전
 
 
 
 '''
 r에서는 기본적으로 제공해주는 색상들이 존대하기 때문에
 막대그래프에서 fill 을 이용하면 기본색상이 적용됩니다.
 
 
 '''
 
 #막대그래프의 색상을 직접지정.
 mpg$class
 
 
test <-  mpg %>% 
   group_by(class) %>% 
   summarise( mean_cty=mean(cty)) %>% 
   arrange( desc(mean_cty))

my_color = c("2seater" = "#00B9FF",
             "compact" = "#9AB9FF",
             "midsize" = "#8F7CEE",
             "minivan" = "#7AD7BE",
             "pickup" = "#66EC66",
             "subcompact" = "#FFBEC3",
             "suv" = "#FFA500")


ggplot(test, aes(x=class , y= mean_cty, fill= class)) + # fill은 8개까지의 색상, 제공 그 이후 그라더이션으로 제공
  geom_col() +
  scale_fill_manual(values = my_color)
  #평균 막대
 
 
 
 
 
 

