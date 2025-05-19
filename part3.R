corr <- function(directory, threshold = 0){
    # Creating complete obs Data frame from directory
    complete_dataframe <- complete(directory)
    # sub-setting the qualified by threshold
    qualified <- complete_dataframe[complete_dataframe$nobs > threshold,]
    if(length(qualified$id) <= threshold) {
        return(numeric(0))
    } else {
        #print("Yes")
        return(str(qualified))
    }
}
