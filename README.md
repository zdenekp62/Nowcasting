# Forecasting Project Modeling

Repo with modeling codes from the Forecasting Project.
The project goal is the forecast of economic indicators to provide more timely indicators of the economy.

## Setup

* Make sure that .Rprofile is loaded to allow access to pre-installed packages
* GitHub repo at https://github.com/dsd-statcan/forecasting_modeling

### Installation Packages

* renv package: https://blog.rstudio.com/2019/11/06/renv-project-environments-for-r/ 
* `renv::restore()`: installs all packages available in renv
* `renv::snapshot()`: adds newly installed packages to renv
* `renv::init(bare = TRUE)` 
* `renv::use_python()`, 

## R Style Guide

* Preference of R Notebooks over R Markdown
* Following tidyverse style guide https://style.tidyverse.org/
* Use linting for R Notebooks and R code: `install.packages("lintr")`
* Use styler for conform style of the R code: `install.packages("styler")`
