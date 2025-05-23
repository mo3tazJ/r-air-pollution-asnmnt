# "complete" is function which return a data frame of the name of the file and the number of complete cases
complete <- function(directory, id = 1:332) {
    # Initialize vectors to hold the results
    ids <- integer()
    nobs <- integer()
    # Reading Files Names
    files_list <- list.files(directory, full.names = TRUE)
    # Sub-setting the corresponding files by the provided param "id"
    obs <- files_list[id]
    for (i in id) {
        # Read the data from CSV file
        tmp <- read.csv(files_list[i])
        # Calculate the number of complete cases
        complete_count <- sum(complete.cases(tmp))
        # Append to the results vectors
        ids <- c(ids, i)
        nobs <- c(nobs, complete_count)
    }
    # Create and return the data frame
    data.frame(id = ids, nobs = nobs)
}
