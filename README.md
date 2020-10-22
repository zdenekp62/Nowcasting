# Forecasting Project Modeling

Repo with modeling codes from the Forecasting Project.
The project goal is the forecast of economic indicators to provide more timely indicators of the economy.

## Setup

* Make sure that .Rprofile is loaded to allow access to pre-installed packages
* Type `packrat::status()` to see if all packages are loaded properly when setting up a new server. The do `packrat::restore()` to install the packages via packrat (snapshots are done with packrat::snapshot())
* GitHub repo at https://github.com/dsd-statcan/forecasting_modeling

## R Style Guide

* Preference of R Notebooks over R Markdown
* Following tidyverse style guide https://style.tidyverse.org/
* Use linting for R Notebooks and R code: `install.packages("lintr")`
* Use styler for conform style of the R code: `install.packages("styler")`
