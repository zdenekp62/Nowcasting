# Stock Market data for Construction Industry

Using the stock market data as a sentiment indicator to track investment
in building construction


## Analysis Workflow with Notebooks

* PackageTesting.Rmd: Tested `qandmod` package capabilities for later use.
* TSX_listed_Issuers.Rmd: Analyzed which stocks are available for construction indusry based
on what David Bertrand provided
* TSX_listed_Issuers2.Rmd: Analyzed which TSX construction industry stocks are available 
based on latest overview excel file downloaded from TSX page. 
This excel file was copied into the StockMarket directory for version control.
* EDA_TSX_listed.Rmd: EDA of TSX construction companies analyzed previously.
Identify and anlayze properties to build stock indices.
* Build_Stock_Indices.Rmd: Downloads the stock data and builds indices.






## Which Stock to choose?

* Which quantity to track per stock?
  * Open, High, Low, Close, Volume, and Adjusted (Yahoo)?
  * OpCl(GS) #daily percent change open to close
  * OpOp(GS) #one period open to open change
  * HiCl(GS) #the percent change from high to close 
  * As we consider the monthly value, do we aggregate per month or just take the value at the end of the month?
  


## TSX Stock access


* Market Statistics reports for TSX by Industry: https://www.tsx.com/listings/current-market-statistics
  * Use this categorization to extract construction-related companies


* Requirements
  * Must have access to TSX stock data
  * Must be free, with simple API key
  * automatic download once per month possible (for latest data)
  * in PoC one-time download sufficient

* quantmod package
  * implemented is a CURL command to a certain URL which allows to download the data as csv
  * The getSymbols.yahoo function allows to download yahoo data. 

```
      yahoo.URL <- .yahooURL(Symbols.name, from.posix, 
        to.posix, interval, "history", handle)
      # yahoo.URL <- "https://query2.finance.yahoo.com/v7/finance/download/BPY?period1=1167609600&period2=1603756800&interval=1d&events=history&crumb=iMFA1aqUnun"

      read.csv(curl::curl(yahoo.URL, handle = handle$ch)
```
for example


* Google Finance API: no google support, suggested to use differene API (https://rapidapi.com/blog/google-finance-api-alternatives/)
* Yahoo Finance API : one of the most popular and visited financial sites with extensive stock market data (rapidapi)
  * Limited access to company statistics such as history of enterprise value, requires premium. Stock data is for free.
* Yahoo Finance Direct manual download of certain stocks is possible through their website (e.g. csv download https://ca.finance.yahoo.com/quote/BPY-UN.TO/history?p=BPY-UN.TO)
* rapidapi.com: hosts many apis: free, fremium; Yahoo F API is fremium (needs credit card); collaborates with many API providers and provides their services through their platform
* Alphavantage: https://rapidapi.com/alphavantage/api/alpha-vantage/pricing
* Investors Exchange (IEX) Trading API: 
  * Free API available t  https://rapidapi.com/eec19846/api/investors-exchange-iex-trading
  * According to comments on rapidapi, IEX discontinued IEX API and started a new IEX Cloud API service

### Real Estate Stocks Examples by David 

BPY	Brookfield Property Partners L.P.
CAR	Canadian Apartment Properties Real Estate Investment Trust
REI	Riocan Real Estate Investment Trust
AP	Allied Properties Real Estate Investment Trust
HR	H&R Real Estate Investment Trust
FSV	FirstService Corporation
FCR	First Capital Real Estate Investment Trust
SRU	SmartCentres Real Estate Investment Trust
BBU	Brookfield Business Partners L.P.
CHP	Choice Properties Real Estate Investment Trust
CIGI	Colliers International Group Inc.
GRT	Granite Real Estate Investment Trust
CSH	Chartwell Retirement Residences
CUF	Cominar Real Estate Investment Trust
MRC	Morguard Corporation

## Own Research

* Cost total capital: cost debt (total debt) + cost of equity (stock)
  * Cost debt: interest expense/total debt 
  * Cost of equity: dividend payment rate (typical, don’t change much) / stock price; 

* REITS
  * https://en.wikipedia.org/wiki/List_of_REITs_in_Canada
  * Mortgage REITS vs rental REITS. What would be a good indicator? Analyze the investment mandate of these REITS to determine whether inclusion is appropriate
    * discard mortgage REITS: they buy mortgage debts; they don't own buildings; 
  
* Dividents vs Stocks vs ETFs
  * Dividend yields will only reflect dividend paying stocks. Which I believe are heavily weighted to the banks in the TSX. 
  * ETFs: ETFs are really just ways for investors to easily get diversified exposure, whether that be to the broad market or within an specific industry (ie JETS, airline ETF in the US) ,without having to purchases shares of each company and rebalancing portfolios.
  
* IATD purchases monthly data from the TMX group (Vivian's group)
  


Construction and engineering stocks include companies that build residential and non-residential building construction, contract services and other building, material and infrastructure related companies.


* Real estate investment trust (REIT):  company that owns, and in most cases operates, income-producing real estate. REITs own many types of ***commercial*** real estate,

* S&P/TSX Composite Index contains a few companies labeled as construction
  * https://en.wikipedia.org/wiki/S%26P/TSX_Composite_Index
* TD International Equity Index ETF Units: Goes ony back to 2016.


* Could US construction indices be valuable? How close are the Canadian and US markets linked?
* How about bonds, mutual funds or other trading tools?


TPE: Trans-Pacific Exchange

### US 

* Dow Jones U.S. Home Construction Index
  * goes back to 01/2009