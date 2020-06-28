# global script hosting initialization steps nad data retrival and processing 
# functions

suppressMessages(library(cansim))
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(plotly))


## Extract the Data

vector_names <- c(
  "v65201210", "v41690973", "v2062809", "v1001827265",
  "v1001826653", "v52367097", "v4391505", "v800450",
  "v32858858", "v32858865", "v32858872", "v74869", "v129449",
  "v129460", "v129472", "v129482"
)

vector_descr <- c(
  "RealGDP", "CPI", "Employment [pers]", "Int. merchendise trade Exp. [$]",
  "Int. merchendise trade Imp. [$]", "Retail Sales [$]", "hours worked",
  "Manufact. sales [$]", "Aircraft domestic [#]", "Aircraft transborder [#]",
  "Aircraft int other [#]", "Railway carloads [tons]", "Travelers US [pers]",
  "Travelers other country [pers]", "CA resident US [pers]",
  "CAresident other country [pers]"
)
names(vector_descr) <- vector_names

# I expect this date to be before the start of all time series/vectors.
start_date <- "1900-01-01"

# Retrieve all vectors. They are concatunated along axis 0.
vectors <- get_cansim_vector(vector_names, start_date)



## Preprocessing

# Normalization all indicators so that December 2019 = 100

indicators1 <- vector(length=16)
for (i in 1:length(vector_names)) {
  #print(i)
  indicator = filter(vectors, VECTOR == vector_names[i])
  ref_value = indicator$VALUE[indicator$REF_DATE == as.Date('2019-12-01')]
  indicator$VALUE_INDEX = 100. * indicator$VALUE/ref_value
  if (i == 1) {indicators = indicator}
  else {indicators <- rbind(indicators, indicator)}
  # indicators1[i]  <- indicator
}

# add indicator description to indicator vector
indicators$descr <- sapply(indicators$VECTOR, function(x) {
  vector_descr[x][[1]]
})

# plot
p <- ggplot(indicators, aes(x=as.Date(REF_DATE), y=VALUE_INDEX)) + geom_line((aes(group=descr, color=descr))) +
  scale_x_date(date_breaks="2 month", date_labels="%b %Y", limits = as.Date(c('2019-01-01','2020-06-01'))) + scale_y_continuous(breaks=seq(0, 180,20), limits= c(0, 180)) + labs(title='Index, December 2019=100', x='', y='')



