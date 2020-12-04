# Forecasting of building permits

## Workflow

### EDA

* EDA_Permits.Rmd: Exploration of permits data and gained insights of series
properties to be modeled. We would need to model 42 series 
consisting of all prov+CA, non-res, res, non-res+res. 

### Modeling Totals for Canada

Here we aim to get best model for one series, specifically: permits for Canada,
non-res.

BP_model1: First simple AR model. No exogenious data.
Demonstrated validation methods and usage of 
ARIMA model (ARIMA(0,1,5)).


