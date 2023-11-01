library(tm)
library(textstem)
library(qdap)
library(dplyr)
library(wordcloud2)

# load dataset
x = readLines("C:/Users/hiten/OneDrive/Desktop/Hiten/Thapar Sem 9/Subjects/SWA/R progs/tata.txt")
x
cls

# data preprocessing pt1: Cleaning the text data
x1 = tolower(x)
head(x1)

a1 = stopwords::stopwords()

x2 = removeWords(x1,c(a1,'i'))

x3 = removePunctuation(x2)
x3

x4 = removeNumbers(x3)
x4

x6 = lemmatize_strings(x4)
x6

# Creating a dataframe of the prominent words
x7 = all_words(x6)
class(x7)
View(x7)

# %>% is "pipe" function
x8 = x7 %>% arrange(-FREQ) %>% top_n(200)
x8
View(x8)

wordcloud2(x8,shuffle = FALSE, minRotation = 0, maxRotation = 0)
