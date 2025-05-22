corr <- function(directory, threshold = 0){
    # Creating complete obs Data frame from directory
    complete_dataframe <- complete(directory)
    # sub-setting the qualified by threshold
    qualified <- complete_dataframe[complete_dataframe$nobs > threshold,]
    # if (nrow(qualified) == 0)
    if(length(qualified$id) == 0) {
        #print("NO")
        print(qualified$id)
        
        return(numeric(0))
    } else {
        # Calculate correlations for qualified monitors
        correlations <- numeric(nrow(qualified))
        for (i in seq_along(qualified$id)) {
            current_id <- qualified$id[i]
            file_path <- file.path(directory, sprintf("%03d.csv", current_id))
            data <- read.csv(file_path)
            complete_data <- data[complete.cases(data), ]
            correlations[i] <- cor(complete_data$sulfate, complete_data$nitrate)
        }
        #print("Yes")
        #return(str(qualified))
        correlations

    }
}
