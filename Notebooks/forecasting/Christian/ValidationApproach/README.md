# Investigation of Time Series Validation schemes

* Develop your own validation code or use an existing package?
* Is all modeling possible with multi-training fold validation?

## Existing Implementations

* Package by Rob
  * https://robjhyndman.com/hyndsight/tscv/
  * https://rdrr.io/cran/forecast/man/tsCV.html#heading-3
  * works only on objects with class `forecast` hence restrictive.

* rsample package: 
  * https://www.rdocumentation.org/packages/rsample/versions/0.0.8/topics/rolling_origin
  * better for different kind of models


