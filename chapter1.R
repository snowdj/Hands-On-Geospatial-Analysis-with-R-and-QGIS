jan_price = c(10, 20, 30)

increase = c(1, 2, 3)

mar_price = old_price + increase
june_price = c(20, 25, 33)
matrix(jan_price, mar_price, june_price)
all_prices = matrix(c(jan_price, mar_price, june_price), nrow= 3)
all_prices

all_prices2 = matrix(c(jan_price, mar_price, june_price), nrow= 3, byrow = TRUE)
all_prices2

items = c("potato", "rice", "oil")
class(items)

all_prices3 = data.frame(items, jan_price, mar_price, june_price)
all_prices3

all_prices3$mar_price

all_prices4 = all_prices3[-1]
all_prices4

pen = c(3, 4, 3.5)
all_prices4 = rbind(all_prices4, pen)
all_prices4

aug_price = c(22, 24, 31, 5)
all_prices4 = cbind(all_prices4, aug_price)
all_prices4
# or

all_prices3[["mar_price"]]
all_prices3[2, 3]

all_prices_list = list(items, jan_price, mar_price, june_price)
all_prices_list

# Now suppose, we add price of egg to items and we also add prices for jan_price and mar_price and not for june_price. 

items = c("potato", "rice", "oil", "egg")
jan_price = c(10, 20, 30, 15)
mar_price = c(11, 22, 33, 18)

# Now items, jan_price and mar_price have 4 elements whereas june_price have 3 elements. So, we can't use dataframe in 
# this case to store all of these values in a single variable. Not to worry, lists is to rescue here. Using list, we can
# get almost all the advantages of dataframe in addition to its capacity of storing different set of elements (columns in
# case of dataframe) with different lengths.

all_prices_list2 = list(items, jan_price, mar_price, june_price)
all_prices_list2


all_prices_list2[2]
class(all_prices_list2[2])

all_prices_list2[[2]]
class(all_prices_list2[[2]])


# Looping in R

jan = all_prices4$jan_price
for(price in jan){
  print(price^2)
}

# Functions

square = function(data){
  for(price in jan){
    print(price^2)
  }
}

square(all_prices4$jan_price)

power_function = function(data, power){
  for(price in data){
    print(price^power)
  }
}

power_function(all_prices4$june_price, 4)

power_function2 = function(data, power){
  data^power
}
lapply(all_prices4$june_price, power_function2, 4)

unlist(lapply(all_prices4$june_price, power_function2, 4))

sapply(all_prices4$june_price, power_function2, 4)


all_prices = data.frame(items = rep(c("potato", "rice", "oil"), 4), 
                        jan_price = c(10, 20, 30, 10, 18, 25, 9, 17, 24, 9, 19, 27), 
                        mar_price = c(11, 22, 33, 13, 25, 32, 12, 21, 33, 15, 27, 39), 
                        june_price = c(20, 25, 33, 21, 24, 40, 17, 22, 27, 13, 18, 23)
                        )
all_prices




all_prices$items = factor(all_prices$items)
str(all_prices)
tapply(all_prices$mar_price, factor(all_prices$items), mean)




x = rnorm(50)
y = rnorm(50)
# pch = 19 stands for filled dot
plot(x, y, pch = 19, col = 'blue')

str(all_prices)
library(ggplot2)
ggplot(all_prices, aes(x = items, y = jan_price)) +
  geom_point()

ggplot(all_prices, aes(x = items, y = jan_price)) +
  geom_point() +
  geom_point(stat = "summary", fun.y = "mean", colour = "red", size = 3)


ggplot(all_prices, aes(x = jan_price, y = june_price)) +
  geom_point() +
  facet_grid(. ~ items) 

ggplot(all_prices, aes(x = jan_price, y = june_price)) +
  geom_point() +
  facet_grid(. ~ items) +
  # se = TRUE inside stat_smooth() shows
  stat_smooth(method = "lm", se = TRUE, col = "red")