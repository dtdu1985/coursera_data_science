corr <- function(directory, threshold=0){
  all_files <- list.files(directory, full.names=TRUE)
  dset_final <- vector(mode="numeric", length = 0)
  
  for(i in 1:length(all_files)){
    read_in <- read.csv(all_files[i])
    tot_complete <- sum((!is.na(read_in$sulfate)) & (!is.na(read_in$nitrate)))
    
    if(tot_complete>threshold){
      dset_temp <- read_in[which(!is.na(read_in$nitrate)), ]
      dset_temp2 <- dset_temp[which(!is.na(dset_temp$sulfate)), ]
      dset_final <- c(dset_final, cor(dset_temp2$sulfate, dset_temp2$nitrate))
      ##which takes a boolean vector and returns elements of indices that are true
    }
  }
  return(dset_final)
}
  
  
