NUMBER_SHOPS <- 10
#основная программа
system2('d:/Розыев Ата/Кр1  создание папок.bat')

setwd('d:/')


goods <- list(
  list(name = 'Молоко', min = 10 , max = 60, price_in = 40, price_out = 80, price_util = 20),
  list(name = 'Хлеб', min = 20 , max = 70, price_in = 20, price_out = 40, price_util = 10),
  list(name = 'Авокадо', min = 20 , max = 26, price_in = 100, price_out = 150, price_util = 50),
  list(name = 'Помидоры', min = 20 , max = 26, price_in = 100, price_out = 150, price_util = 50),
  list(name = 'Орехи', min = 20 , max = 26, price_in = 80, price_out = 150, price_util = 50)
)

generate.data(way='d:/Розыев Ата/Микси/Магазин 1/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 2/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 3/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 4/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 5/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 6/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 7/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 8/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 9/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)
generate.data(way='d:/Розыев Ата/Микси/Магазин 10/',goods = goods, days = 10, file.name = '/Микси', dataType = SALE)

system2('d:/Розыев Ата/Кр1 копирование в анализ.bat')
setwd("D:/Розыев Ата/Микси/Анализ")

in1 = read.table("Магазин 1_ Микси.in", encoding = "65001", header = T)
in2 = read.table("Магазин 2_ Микси.in", encoding = "65001", header = T)
in3 = read.table("Магазин 3_ Микси.in", encoding = "65001", header = T)
in4 = read.table("Магазин 4_ Микси.in", encoding = "65001", header = T)
in5 = read.table("Магазин 5_ Микси.in", encoding = "65001", header = T)
in6 = read.table("Магазин 6_ Микси.in", encoding = "65001", header = T)
in7 = read.table("Магазин 7_ Микси.in", encoding = "65001", header = T)
in8 = read.table("Магазин 8_ Микси.in", encoding = "65001", header = T)
in9 = read.table("Магазин 9_ Микси.in", encoding = "65001", header = T)
in10 = read.table("Магазин 10_ Микси.in", encoding = "65001", header = T)

out1 = read.table("Магазин 1_ Микси.out", encoding = "65001", header = T)
out2 = read.table("Магазин 2_ Микси.out", encoding = "65001", header = T)
out3 = read.table("Магазин 3_ Микси.out", encoding = "65001", header = T)
out4 = read.table("Магазин 4_ Микси.out", encoding = "65001", header = T)
out5 = read.table("Магазин 5_ Микси.out", encoding = "65001", header = T)
out6 = read.table("Магазин 6_ Микси.out", encoding = "65001", header = T)
out7 = read.table("Магазин 7_ Микси.out", encoding = "65001", header = T)
out8 = read.table("Магазин 8_ Микси.out", encoding = "65001", header = T)
out9 = read.table("Магазин 9_ Микси.out", encoding = "65001", header = T)
out10 = read.table("Магазин 10_ Микси.out", encoding = "65001", header = T)

prices <- read.table('d:/Розыев Ата/Микси/Анализ/Цены.txt', encoding = "UTF-8", header = T)

#создание таблицы с нулями

mag = c('Магазин 1','Магазин 2','Магазин 3','Магазин 4','Магазин 5','Магазин 6','Магазин 7','Магазин 8','Магазин 9','Магазин 10','Итого','Среднее')
res.table <- data.frame('Название' = mag)

#Запишем все в вектор:
vec.out <- list(out1,out2,out3,out4,out5,out6,out7,out8,out9,out10)
vec.in <- list(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10)
NUMBER_SHOPS <- length(vec.out)
  
#считывание цен из файла с ценами в векторы:
data.price <- read.table('d:/Розыев Ата/Микси/Анализ/Цены.txt', encoding = "UTF-8", header = T)
postavka <- c()
prodaga <- c()
utilisazia <- c()
for( i in 1:length(goods)){
  postavka <- append(postavka, data.price[1,i+1])
  prodaga <- append(prodaga, data.price[2,i+1])
  utilisazia <- append(utilisazia, data.price[3,i+1])
}
for(i in 1:length(goods)){
  #заполняем нулями
  res.table[,1+1+11*(i-1)] <- 0
  res.table[,1+2+11*(i-1)] <- 0
  res.table[,1+3+11*(i-1)] <- 0
  res.table[,1+4+11*(i-1)] <- 0
  res.table[,1+5+11*(i-1)] <- 0
  res.table[,1+6+11*(i-1)] <- 0
  res.table[,1+7+11*(i-1)] <- 0
  res.table[,1+8+11*(i-1)] <- 0
  res.table[,1+9+11*(i-1)] <- 0
  res.table[,1+10+11*(i-1)] <- 0
  res.table[,1+11+11*(i-1)] <- 0
  
  for(j in 1:NUMBER_SHOPS){
    
    #Выручка
    res.table[j,1+1+11*(i-1)] <- sum(vec.out[[j]][[i+1]]) * prodaga[i]
    names(res.table)[1+1+11*(i-1)]<- paste0('Выручка: ', goods[[i]]$name)
    #Реализация
    res.table[j,1+3+11*(i-1)] <- sum(vec.out[[j]][[i+1]])
    names(res.table)[1+3+11*(i-1)]<- paste0('Реализация: ', goods[[i]]$name)
    #Списание
    res.table[j,1+4+11*(i-1)] <- sum(vec.in[[j]][[i+1]]) - sum(vec.out[[j]][[i+1]])
    names(res.table)[1+4+11*(i-1)]<- paste0('Списание: ', goods[[i]]$name)
    #Прибыль
    res.table[j,1+2+11*(i-1)] <- res.table[j,1+1+11*(i-1)] - sum(vec.in[[j]][[i+1]])*postavka[i] - (res.table[j,1+4+11*(i-1)])*utilisazia[i] 
    names(res.table)[1+2+11*(i-1)]<- paste0('Прибыль: ', goods[[i]]$name)
    #sd
    res.table[j,1+5+11*(i-1)] <- round(sd(vec.out[[j]][[i+1]]),3) 
    names(res.table)[1+5+11*(i-1)]<- paste0('SD: ', goods[[i]]$name)
    #Продажи макс
    res.table[j,1+6+11*(i-1)] <- max(vec.out[[j]][[i+1]])
    names(res.table)[1+6+11*(i-1)]<- paste0('Продажи макс: ', goods[[i]]$name)
    #День
    res.table[j,1+7+11*(i-1)] <- which.max(vec.out[[j]][[i+1]])
    names(res.table)[1+7+11*(i-1)]<- paste0('День: ', goods[[i]]$name)
    #Продажи мин
    res.table[j,1+8+11*(i-1)] <- min(vec.out[[j]][[i+1]])
    names(res.table)[1+8+11*(i-1)]<- paste0('Продажи мин: ', goods[[i]]$name)
    #День
    res.table[j,1+9+11*(i-1)] <- which.min(vec.out[[j]][[i+1]])
    names(res.table)[1+9+11*(i-1)]<- paste0(' День: ', goods[[i]]$name)
    #Списание макс
    res.table[j,1+10+11*(i-1)] <- max(vec.in[[j]][[i+1]]-vec.out[[j]][[i+1]])
    names(res.table)[1+10+11*(i-1)]<- paste0('Списание макс: ', goods[[i]]$name)
    #День
    res.table[j,1+11+11*(i-1)] <- which.max(vec.in[[j]][[i+1]]-vec.out[[j]][[i+1]])
    names(res.table)[1+11+11*(i-1)]<- paste0('  День: ', goods[[i]]$name)
    }
}
#для всех продуктов
#обнуление
res.table[,1+length(res.table)] <- 0
names(res.table)[length(res.table)]<- paste0('Выручка: всего')
res.table[,1+length(res.table)] <- 0
names(res.table)[length(res.table)]<- paste0('Прибыль: всего')
res.table[,1+length(res.table)] <- 0
names(res.table)[length(res.table)]<- paste0('Реализация: всего')
res.table[,1+length(res.table)] <- 0
names(res.table)[length(res.table)]<- paste0('Списание: всего')
res.table[,1+length(res.table)] <- 0
names(res.table)[length(res.table)]<- paste0('SD: всего')

for_sd_1 <- as.numeric(vector())
for_sd_2 <- as.numeric(vector())
for_sd_3 <- as.numeric(vector())
for_sd_4 <- as.numeric(vector())
for_sd_5 <- as.numeric(vector())
for_sd_6 <- as.numeric(vector())
for_sd_7 <- as.numeric(vector())
for_sd_8 <- as.numeric(vector())
for_sd_9 <- as.numeric(vector())
for_sd_10 <- as.numeric(vector())
for_sd <- list(for_sd_1, for_sd_2, for_sd_3, for_sd_4, for_sd_5, for_sd_6, for_sd_7, for_sd_8, for_sd_9, for_sd_10)


for(i in 1:length(goods)){
  for(j in 1:NUMBER_SHOPS){
  #Выручка
  res.table[j,length(res.table)-4] <- res.table[j,length(res.table)-4] + res.table[j,1+1+11*(i-1)]
  
  #Реализация
  res.table[j,length(res.table)-2] <- res.table[j,length(res.table)-2] + res.table[j,1+3+11*(i-1)]
  
  #Списание
  res.table[j,length(res.table)-1] <-res.table[j,length(res.table)-1] + res.table[j,1+4+11*(i-1)]
  
  #Прибыль
  res.table[j,length(res.table)-3] <- res.table[j,length(res.table)-3] + res.table[j,1+2+11*(i-1)]
  
  #sd
  for_sd[[j]] <- c(for_sd[[j]], vec.out[[j]][[i+1]])
  
  }
}
#sd
for(j in 1:10){
  res.table[j,length(res.table)] <- round(sd(for_sd[[j]]),3)
}


#итого и среднее

for(i in 1:(length(goods)+1)){
  
  for(j in 1:5){
    res.table[11,j+1+11*(i-1)] <- sum(res.table[,j+1+11*(i-1)])
    res.table[12,j+1+11*(i-1)] <- res.table[11,j+1+11*(i-1)]/10
  } 
  
}
for(i in 1:(length(goods))){
  
  res.table[11,6+1+11*(i-1)] <- max(res.table[,6+1+11*(i-1)])
  max_1_i <- which.max(res.table[,6+1+11*(i-1)][1:10])
  res.table[11,7+1+11*(i-1)] <- res.table[max_1_i,7+1+11*(i-1)]
  
  res.table[11,8+1+11*(i-1)] <- min(res.table[,8+1+11*(i-1)][1:10])
  min_1_i <- which.min(res.table[,8+1+11*(i-1)][1:10])
  res.table[11,9+1+11*(i-1)] <- res.table[min_1_i,9+1+11*(i-1)]
  
  res.table[11,10+1+11*(i-1)] <- max(res.table[,10+1+11*(i-1)])
  max_2_i <- which.max(res.table[,10+1+11*(i-1)][1:10])
  res.table[11,11+1+11*(i-1)] <- res.table[max_2_i,11+1+11*(i-1)]
}

#Запись в таблицу

write.table(x=res.table, file='D:/Розыев Ата/Результаты.csv',
            col.names = T,
            row.names = F,
            sep = ';',
            dec = ',')

#Графический анализ

#5.1 Динамика продаж одного товара в одном магазине

draw.onepr.onemg <- function(mag = out1, product = 'Хлеб'){
  #выясним номер данного продукта
  prodact_ind <- 0
  for(i in 1:length(mag)){
    prodact_ind <- prodact_ind + 1
    if(names(mag)[i]== product){
      break
    }
  }
  plot(x = 1:length(mag[[prodact_ind]]), y = mag[[prodact_ind]],type = 'l', main = paste0("Динамика продаж в выбранном магазине: \n ", product), xlab= "День", ylab = "Кол-во товара")
  abline(v = seq(1, length(mag[[prodact_ind]]),1), col = ' green')
}
draw.onepr.onemg()
draw.onepr.onemg(out7, product = 'Молоко')


#5.2 Динамика продаж всех товаров одного магазина

draw.allpr.onemag<-function(mag = out1){
  buf_out <- mag
  for(i in 1:length(goods)){
    for(j in 1:length(mag[[1]])){
      buf_out[j,i+1] <- buf_out[j,i+1]*prodaga[i]
    }
    
  }
  #макс для у
  max_y <- 0
  for(i in 2:(length(buf_out))){
    if(max(buf_out[[i]]) > max_y){
      max_y <-max(buf_out[[i]]) 
      vec_with_max_y <- i
    }
  }
  plot(x = 1:length(buf_out[[1]]), y = c(1:(length(buf_out[[1]])-1),max_y), type = "n", main = "Динамика продаж всех товаров \n выбранного магазина", xlab= "День", ylab = "Выручка, руб")
  colors = paste0('#', sample(100000:999999, length(buf_out)))
  for (i in 2:length(buf_out)){
    points(x = 1:length(buf_out[[i]]),
           y = buf_out[[i]],
           col = colors[i]
    )
    lines(x = 1:length(buf_out[[i]]),
          y = buf_out[[i]],
          col = colors[i]
    )
    }
  
  # Определим положение, названия и цвета:
  main = "Товары"
  location = "topright"
  labels = colnames(buf_out)[2:length(colnames(buf_out))]
  # легенда
  legend(-1,1, labels, title = main,bty = "n", xpd=TRUE, fill = colors)
}

draw.allpr.onemag()
draw.allpr.onemag(out2)

#5.3 Динамика прибыли всех товаров одного магазина

draw.allpr.onemag.profit <- function(mag = 1){
  buf_out <- vec.out[[mag]]
  buf_in <- vec.in[[mag]]
  buf_rez <- vec.out[[mag]]
  
  for(i in 1:length(goods)){
    for(j in 1:length(out1[[1]])){
      
      buf_rez[j,i+1] <- buf_out[j,i+1]*prodaga[i]-buf_in[j,i+1]*postavka[i]-(buf_in[j,i+1]-buf_out[j,i+1])*utilisazia[i]
    }
    
  }
  #макс для у
  max_y <- 0
  for(i in 2:(length(buf_rez))){
    if(max(buf_rez[[i]]) > max_y){
      max_y <-max(buf_rez[[i]]) 
      vec_with_max_y <- i
    }
  }
  #мин для у
  min_y <- 1000000000
  for(i in 2:(length(buf_rez))){
    if(min(buf_rez[[i]]) < min_y){
      min_y <-min(buf_rez[[i]]) 
      vec_with_max_y <- i
    }
  }
  
  plot(x = 1:length(buf_rez[[1]]), y = c(min_y,1:(length(buf_rez[[1]])-2),max_y), type = "n", main = "Динамика прибыли всех товаров \n выбранного магазина", xlab= "День", ylab = "пРИБЫЛЬ, руб")
  colors = paste0('#', sample(100000:999999, length(buf_rez)))
  for (i in 2:length(buf_rez)){
    points(x = 1:length(buf_rez[[i]]),
           y = buf_rez[[i]],
           col = colors[i]
    )
    lines(x = 1:length(buf_rez[[i]]),
          y = buf_rez[[i]],
          col = colors[i]
    )
  }
  
  # Определим положение, названия и цвета:
  main = "Товары"
  labels = colnames(buf_rez)[2:length(colnames(buf_rez))]
  # легенда
  legend(-1,min_y, labels, title = main,bty = "n", xpd=TRUE, fill = colors)
}

draw.allpr.onemag.profit()
draw.allpr.onemag.profit(2)
#5.4 Прибыль по одному товару во всех магазинах
draw.onepr.allmag.profit <- function(product = 'Хлеб'){
  #номер данного продукта во всех продажах
  prodact_ind <- 0
  for(i in 1:length(goods)){
    prodact_ind <- prodact_ind + 1
    if(goods[[i]]$name == product){
      break
    }
  }
  #вектор со значениями по продажам данного продукта из всех магазинов
  buf_out <- c()
  for(i in 1:length(vec.out)){
    buf_out <- c(buf_out, sum(vec.out[[i]][[prodact_ind+1]]))
  }
  
  #вектор со значениями по поставкам данного продукта из всех магазинов
  buf_in <- c()
  for(i in 1:length(vec.in)){
    buf_in <- c(buf_in, sum(vec.in[[i]][[prodact_ind+1]]))
  }
  
  #составляем вектор со значениями по утилизации данного продукта из всех магазинов
  buf_ut <- c()
  for(i in 1:length(vec.in)){
    buf_ut <- c(buf_ut, sum(vec.in[[i]][[prodact_ind+1]])-sum(vec.out[[i]][[prodact_ind+1]]))
  }
  
  #составляем итоговый вектор
  for_rez <- c()
  for(i in 1:length(buf_in)){
    for_rez <- c(for_rez, buf_out[i]*prodaga[prodact_ind]-buf_in[i]*postavka[prodact_ind]-buf_ut[i]*utilisazia[prodact_ind])
  }
  
  barplot(height = for_rez, names.arg = c(1:10), col = 'red', main = paste0('Прибыль по всем магазинам: \n ',product), xlab= "Номер магазина", ylab = "Прибыль, руб")
  
}

draw.onepr.allmag.profit()
draw.onepr.allmag.profit('Авокадо')


#5.5 Прибыль по нескольким товарам во всех магазинах
# install.packages("ggplot2")
# install.packages("reshape2")
library(ggplot2)
library(reshape2)
df <- data.frame(status = mag[1:10])

for(i in 1:length(goods)){
  df[i+1] <- res.table[,1+2+11*(i-1)][1:10]
  names(df)[i+1] <- goods[[i]]$name
}


df_melted <- melt(df, value.name = "value")
ggplot(data = df_melted, aes(x = variable, y = value)) + geom_col(colour = "black",fill = "red") + facet_wrap(~status) + ggtitle("Прибыль по нескольким товарам \n во всех магазинах")+ylab('Прибыль, руб')+xlab('Товары')



#5.6 Прибыль по одному товару во всех магазинах (ящик с усами)

onemg.profit.box <- function(product = 'Хлеб'){
  #номер данного продукта во всех продажах
  prodact_ind <- 0
  for(i in 1:length(goods)){
    prodact_ind <- prodact_ind + 1
    if(goods[[i]]$name == product){
      break
    }
  }
  boxplot(res.table[,1+2+11*(i-1)][1:10], main = 'Прибыль по выбранному товару \n во всех магазинах', xlab = product)
}

onemg.profit.box()
onemg.profit.box('Молоко')
#---------------------------------------------------------------------

library(ggplot2)
onemg.profit.box2 <- function(product = 'Хлеб'){
  #номер данного продукта во всех продажах
  prodact_ind <- 0
  for(i in 1:length(goods)){
    prodact_ind <- prodact_ind + 1
    if(goods[[i]]$name == product){
      break
    }
  }
  value = res.table[,1+2+11*(prodact_ind-1)][1:10]
  name = product
  box <- as.data.frame(1:10)
  ggplot(box, aes(x = name, y = value, fill = "#F8766D")) + geom_boxplot(alpha = 0.5) + geom_point(colour = 'red', size = 5)+
    theme(text = element_text(size = 18),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.x = element_blank(),
          legend.position = "none")
}

onemg.profit.box2()
onemg.profit.box2('Молоко')

