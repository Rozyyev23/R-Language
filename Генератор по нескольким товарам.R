#функция генерации файла с ценами
generate.price <- function(way = 'd:/Розыев Ата/Микси/Анализ/',
                           file.name = 'Цены',
                           goods){
  file.price <- paste0(way, file.name, '.txt')
  data.price <- data.frame('Вид' = c('Поставка' , 'Продажа' , 'Утилизация'))
  for(i in 1:length(goods)){
    data.price[1,i+1] <- goods[[i]]$price_in 
    data.price[2,i+1] <- goods[[i]]$price_out
    data.price[3,i+1] <- goods[[i]]$price_util
    colnames(x = data.price)[i+1] = goods[[i]]$name
  }
  write.table( x = data.price, file = file.price, col.names = T, row.names = F, fileEncoding = 'UTF-8')
  return(data.price)
}



#функция генерации данных для нескольких товаров
SUPPLY <- 1
SALE <- 2
FILE_SUPPLY <- 'in'
FILE_SALE <- 'out'

generate.data <- function(way = '',
                          file.name='Поставка',
                          days = 7,
                          dataType = SUPPLY,
                          goods = list(name = 'Томаты кг', min = 100, max =120, price_in = 150, price_out = 200, price_util = 70)){
  
  #проверим существует ли папка и если ее нет создадим ее
  if (way != ''){
    isFoundDir <- dir.exists(way)
    if(isFoundDir == F){
      dir.create(path = way, showWarnings = F)
      if (isFoundDir == F){
        print('Папка не сущ, создать нельзя')
        return(NULL)
      }
    }
  }
  
  #сформируем файл с ценами, если его еще нет
  if(! file.exists('d:/Розыев Ата/Микси/Анализ/Цены')){
    generate.price(goods = goods)
  }
  
  # если формируем файл продаж, считываем или генерим поставку
  if(dataType == SALE){
    file.in <- paste0(way, file.name, '.', FILE_SUPPLY)
    isFoundFile <- file.exists(file.in)
    if(isFoundFile){
      data.in <- read.table(file = file.in, header = T, encoding = 'UTF-8')
    } else {
      data.in <- data.frame('День' = 1:days)
      for(i in 1:length(goods)){
        data.in[i+1] <- sample(x = goods[[i]]$min:goods[[i]]$max, size = days, replace = T) 
        colnames(x = data.in)[i+1] = goods[[i]]$name
      }
      write.table( x = data.in, file = file.in, col.names = T, row.names = F, fileEncoding = 'UTF-8')
    }
    
    
    data.out <- data.frame('Дни'=1:days)
    #добавим столбцы под каждый товар
    for(i in 1:length(goods)){
      data.out[,1+i] <- sample(x=goods[[i]]$min:goods[[i]]$max, size =days, replace = T)
      colnames(x = data.out)[1+i]<-goods[[i]]$name
    }
    #сравним data.out и data.in
    for(i in 1:length(goods)){
      data.out[,i+1] <- ifelse(data.out[,i+1] > data.in[,i+1], data.in[,i+1], data.out[,i+1])
    }
    #запишем таблицу в файл с нужным расширением
    ext <- switch(dataType, FILE_SUPPLY, FILE_SALE)
    
    write.table(x=data.out, file=paste0(way, file.name, '.', ext), col.names = T, row.names = F)
    return(data.out)
  }
  
  
  #создадим таблицу из двух столбцов длиной days
  tabl <- data.frame('Дни'=1:days)
  #добавим столбцы под каждый товар
  for(i in 1:length(goods)){
    tabl[,1+i] <- sample(x=goods[[i]]$min:goods[[i]]$max, size =days, replace = T)
    colnames(x = tabl)[1+i]<-goods[[i]]$name
  }
  
  
  #запишем таблицу в файл с нужным расширением
  ext <- switch(dataType, FILE_SUPPLY, FILE_SALE)
  
  write.table(x=tabl, file=paste0(way, file.name, '.', ext), col.names = T, row.names = F)
  return(tabl)
}