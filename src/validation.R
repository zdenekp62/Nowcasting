# this script contains validation functions



# -------- evaluation metrics ---------

mape <- function(actual,pred){
  mape <- mean(abs((actual - pred)/actual))*100
  return (mape)
}
mae <- function(actual,pred){
  mae <- mean(abs(actual - pred))
  return (mae)
}

# -------- train-valid splitting ---------

train_valid_split <- function (data, valid_year="2017") {
  # this splitting is for the model development work, hence only 
  # returns train and validation splits. The validation year is specified.
  
  stopifnot("tbl_ts" %in% class(data))
  stopifnot("date" %in% colnames(data))
  
  
  valid_idx <- format(data$date, "%Y") == valid_year
  
  train_dates <- lapply((as.numeric(valid_year) - 6):(as.numeric(valid_year) - 1),
                        as.character)
  train_idx <- format(data$date, "%Y") %in% train_dates
  
  test_year <- as.character(as.numeric(valid_year) +1)
  test_idx <- format(data$date, "%Y") == test_year
  
  valid_year <- as.character(as.numeric(test_year) - 1) # prev year validation
  print(paste("validation year: ", valid_year, "test year: ", test_year))
  
  print(paste("train len: ", sum(train_idx), ", valid len: ", sum(valid_idx), 
              ", test len: ", sum(test_idx)))
  
  list(train=train_idx, valid=valid_idx)
  
}

# -------- test set evaluation ---------



test_evaluation_year <- function(best_model_fit, best_model_predict, 
                                 test_year="2019", data, dependent="value",
                                 train_window_size=7) {
  # data must contain 'value' column which is ground truth
  
  stopifnot("tbl_ts" %in% class(data))
  stopifnot("date" %in% colnames(data))
  
  test_idx <- format(data$date, "%Y") == test_year
  train_dates <- lapply((as.numeric(test_year) - train_window_size):(as.numeric(
    test_year) - 1),
    as.character)
  train_idx <- format(data$date, "%Y") %in% train_dates
  
  # fitting the model
  
  model <- best_model_fit(data[train_idx, ])
  
  y_pred <- pull(best_model_predict(model, data[test_idx, ]), dependent)
  y_true <-  pull(data[test_idx, ], dependent)
  
  
  # validation of y_pred from best_model_predict
  if (length(y_pred) != length(y_true)) {
    stop(paste("STOP! number of predictions not equal length of test set",
               "Check your best_model_predict function provided."))
  }
  
  
  mape_error <- mape(y_true, y_pred)
  mae_error <- mae(y_true, y_pred)
  
  # calculate validation metrics and MAPE mape
  metrics <- data.frame(mape=mape_error, mae=mae_error)
  metrics
}
test_evaluation_multi_year <- function (best_model_fit, best_model_predict, 
                                        data, dependent="value",
                                        train_window_size=7) {
  
  test_years <- c("2018", "2019", "2020")
  
  result_2018 <- test_evaluation_year(best_model_fit, best_model_predict, 
                                      "2018", data, dependent=dependent, train_window_size)
  result_2018$test_year <- "2018"
  
  result_2019 <- test_evaluation_year(best_model_fit, best_model_predict, 
                                      "2019", data, dependent=dependent, train_window_size)
  result_2019$test_year <- "2019"
  
  result_2020 <- test_evaluation_year(best_model_fit, best_model_predict, 
                                      "2020", data, dependent=dependent, train_window_size)
  result_2020$test_year <- "2020"
  
  rbind(result_2018, result_2019, result_2020)
}




