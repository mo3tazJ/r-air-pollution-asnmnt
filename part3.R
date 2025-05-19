corr <- function(directory, threshold = 0){
    complete_dataframe <- complete(directory)
    sub_data <- complete_dataframe[, which(nobs > threshold)]
    placeholder <- numeric(length = 0L)
    if(length(sub_data$id) == 0) {
        placeholder
    } else {
        
    }
}
