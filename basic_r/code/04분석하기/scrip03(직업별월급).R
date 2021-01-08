data

colnames(data)[6] <-"job_code"

#job_code는 직업번호로 구분이 되어있습니다

table(data$job_code)
library(readxl)
job_list <- read_excel("data/Koweps_Codebook.xlsx", sheet = 2)
job_list

#left_join(기준데이터 ㅡ 조인데이터, by= 키) 
data
job_list
data <- left_join(data, job_list,by = c("job_code"="code_job") )#키가 다른 경우우
data


#2.분석하기
# income and job 이 NA 가아닌 데이터를 가지고 처리
d4 <- data %>% 
  filter( !is.na(income) & !is.na(job)) %>% 
  group_by(job) %>% 
  summarise( mean_income = mean(income) ) %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

d4  
ggplot(d4, aes(x= reorder(job,mean_income), y = mean_income , fill = job))+
  geom_col() +
  coord_flip() +#회전
  labs(title =  "직업별 급여", x = "직업", y = "급여평균")
























