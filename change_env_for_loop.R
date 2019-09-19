library(data.table)
my_env <- new.env()
my_env$d1 <- data.frame(a = 1:5, b = 1:5)
my_env$d2 <- data.frame(a = 1:5, b = 1:5)
my_env$d3 <- data.frame(a = 1:5, b = 1:5)

for(i in ls(my_env)){
  #with(my_env, setDT(get(i))) # convert to data table by reference
  #with(my_env, setnames( x = get(i), c('x', 'y')))  # assign column name by reference
  with(my_env, setattr( x =get(i), j = 'group', value = '0_0')) # assign group column with a value
}


my_env2 <- new.env()
my_env2$d1 <- data.table(a = 1:5, b = 1:5)
my_env2$d2 <- data.table(a = 1:5, b = 1:5)
my_env2$d3 <- data.table(a = 1:5, b = 1:5)

# set column names and value as group id
for(i in ls(my_env2)){
  # with(my_env, setDT(get(i))) # convert to data table by reference
  with(my_env2, setnames( x = get(i), c('x', 'y')))  # assign column name by reference
  with(my_env2, set( x = get(i), j = 'group', value = '0_0')) # assign group column with a value
}


DT = data.table(a=1:3, b=4:6)
f = function(...) {
  setattr(DT,c('1','2'), value=8)  # by reference
}
f()
