# Write a function that given your birthday (as a date), 
# returns how old you are in years.
library(lubridate)
age <- function(bday) {
  int_bday <- interval(bday,now())
  return(as.duration(int_bday))
}

age(ymd("1999-04-08"))

install.packages('dygraphs')
library(help='dygraphs')
vignette(dygraphs)
