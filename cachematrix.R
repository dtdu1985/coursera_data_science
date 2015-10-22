## makeCacheMatrix function: sets value of matrix using free variable; get value of matrix
## cacheSolve function: generates inverse of the matrix; get inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {    ##prompts user-input matrix square dimension 
  data_in <- NULL
  set <- function(y){
    x <<- y
    data_in <<- NULL
  }
  get <- function() x
  setMatrix <- function(solve) data_in <<- solve
  getMatrix <- function() data_in
  list(set=set, get=get, setMatrix = setMatrix, getMatrix = getMatrix)
}


## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x=matrix(), ...) {
  data_in <- x$getMatrix()
  if(!is.null(data_in)){
    message("getting cached inverse matrix data")
    return(data_in)
  }
  data_temp <- x$get()
  data_in <- solve(data_temp, ...)
  x$setMatrix(data_in)
  data_in
}

