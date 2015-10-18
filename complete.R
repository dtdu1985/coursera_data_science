complete <- function(directory,id){
  
  file_names <- list.files(directory, full.names=TRUE)  ##gives directory followed by file name
  dset_final <- data.frame()   ##empty data frame to store final dset
  
  for (i in id){
    read_in <- read.csv(file_names[i])
    nobs <- sum(complete.cases(read_in))
    dset_temp <- data.frame(i,nobs)
    dset_final <- rbind(dset_final, dset_temp)
  }
  
  colnames(dset_final) <- c("id", "nobs") ##name columns id and nobs
  return (dset_final)
}
