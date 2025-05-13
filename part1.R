# Write a function named 'pollutantmean' that calculates the mean of a pollutant across a specified list of monitors.
pollutantmean <- function(directory, pollutant, id) {
    files_list <- list.files(directory, full.names = T)
    ops <- files_list[id]
    tmp <- lapply(ops, read.csv)
    output <- do.call(rbind, tmp)
    dat <- output[, pollutant]
    mean(dat, na.rm = T)
}
