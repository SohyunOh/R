# 주석은 이렇게 표현 ctrl+shift+c
"Hello world"
'hello'
1
#  <- (화살표)단축키 : alt + - 
# 저장 단축키 : ctrl + s
a <- 1
b <- 20
a <- "hello world"
a <- 10
a <- 3.14

# r의 연산자
a + b
a - b
a / b
a * b
a == b
a != b
a > b
a < b

# r에서는 여러값으로 구성된 변수 combine()
var1 <-  c(1,3,5,7,9)
var1

var2 <-  c(1:100)
var2
  
var3 <- c("a","b","c","d")
var3

#숫자 문자를 동시에 저장하면 문자형으로 변경
var4 <- c(1, "3")
var4

# 여러값으로 구성된 변수 seq()
var5 <- seq(1,10)
var5

var6 <- seq(1,10, by = 2 )#(시작값, 끝값, step값)
var6

var7 = seq(2, 10, by = 2)#2~10까지 2씩 증가
var7


#변수의 연산
var1 #1 3 5 7 9
var7 #2 4 6 8 10

var1 + 10 # var에 모든 값에 10을 더한 값이 나온다
var1 + var7 # 각각 같은 위치의 더한 값이 나온다.

var1 + var2 #연속변수의 개수가 다르면 작은 값을 전부 연산한 결과로 처리됩니다.

var3 +10  # 문자로된 변수는 연상 할 수 없습니다.

#변수의 삭제 (rm() 도 가능능)
remove(a) # a변수 삭제
remove(b) # b 변수 삭제

















