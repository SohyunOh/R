'''
텍스트 마이닝 - 문자로된 데이터에서 가치잇는 정보를 얻어오는 분석기법
1. 자바가 설치되어 있어야함
2. rJava, KoNLP 라이브러리가 필요함
3. 기존에 사용하는 방법이 안되므로, git 에서 라이브러리를 받는 형식으로 진행

'''

install.packages("rJava")
install.packages("multilinguer")
library(rJava)
library(multilinguer)

# install_jdk() #자바가 없으면 인스톨

# 의존성 패키지 설치
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

# github 버전 설치
install.packages("remotes")

# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))


#위 설치 모두 완료 후에 확인
library(KoNLP) #확인 -> 없는 패키지, 업데이트가 필요한 패키지를 확인한 다음 재 업로드

useNIADic() #사전 업로드


#분석절차===================
#1. 데이터를 한줄씩 읽습니다

getwd()
setwd("D:\\R\\basic_r")
song <- readLines("data/song.txt")

song


#2.string 패키지를 이용해서 큭수문자를 제거 (\\w는 R정규표현식에서 특수문자를 의미미)
library(stringr)
snog <- str_replace_all(hiphop, "\\W", " ") # R정규표현식 특수문자를 의미

#문자에서 명사를 추출
extractNoun("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세")

#3. 명사 추출
song_list <-extractNoun(song)
song_list
class(song_list)

#4. unlist함수를 이용해서 vertor형으로 형변환
song_vec <- unlist(song_list)
song_vec
class(song_vec)

#5. vector 형에서 분석을 위해 dataframe으로 변경
song_df <- as.data.frame(song_vec)
head(song_df)


#6. 분석을 위한 컬럼명 변경
library(dplyr)
song_df <- rename(song_df, word = song_vec )
head(song_df)

#7. 분석 (딜이가 2 이상의 단어의 자주사용된 빈도를 내림차순 정렬)
result <- song_df %>% 
  filter(nchar(word) >= 2) %>% 
  group_by(word) %>% 
  summarise(feq =n()) %>% 
  arrange(desc(feq))
  
str(result)
View(result)

#8. wordcloud 설치
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

# 색상목록을 추출 pal(이름, 색상명)
?brewer
brewer.pal( 8 , "Accent")
color <- brewer.pal(8, "Set2")

#wordcloud() 는 실행시 매번다른 유형의 클라우드를 만드는데 이 난수를 고정정
set.seed(1234)
wordcloud( words = result$word, #적용시킬 단어
           freq = result$feq, #빈도
           min.freq = 2, #최소단어 빈도
           max.words = 200, #표현할 단어 수 
           random.order = F, #고빈도 단어 중앙배치 (f중앙, t 랜덤)
           rot.per = 0.1, #단어회전 비율
           scale = c(3, 0.3), # 단어 크기 (중앙, 끝)
           colors = color #색상
)






