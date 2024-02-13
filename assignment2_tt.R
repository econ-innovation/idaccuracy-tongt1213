getwd()
setwd("D:\\assignment\\assignment_idaccuracy\\Aminer")
getwd()
dir()

library(readr)

#使用for循环
library(readr)
file <- list.files("D:\\assignment\\assignment_idaccuracy\\Aminer")
merge_data <- data.frame()
for (i in file) {
  data <- read.csv(i, header=T, sep=",")
  data <- data[,c("doi","年份","期刊","标题")]
  merge_data <- rbind(merge_data,data)
}

#apply族函数代替for：lapply
list <- lapply(list.files(),function(file){
  data <- read.csv(file,header=T,sep = ",")
  data <- data[,c("doi","年份","期刊","标题")]
})
merge_data2 <- do.call(rbind,list)


#封装一个命令行运行的脚本，唯一参数是文件所在路径

#! /usr/bin/env Rscript

args = commandArgs(T)

#! /usr/bin/env Rscript

args <- commandArgs(T)
path <- args[1]


#使用apply家族函数替代上述步骤中的for循环
library(readr)
getwd()
setwd(path)
getwd()

list <- lapply(list.files(),function(file){
  data <- read.csv(file,header=T,sep = ",")
  data <- data[,c("doi","年份","期刊","标题")]
})
merge_data2 <- do.call(rbind,list)

write.csv(merge_data2,file="merge_data.csv")
