## Put comments here that give an overall description of what your
## functions do

## This function, makeCacheMatrix creates a matrix taht can cache its inverse
## which is really a list containing a function to set the matrix and get the 
## value of the inverse. 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setinverse <- function(mean) m
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function calculates the inverse of the matrix created with the above function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
m <- x$getmean()
if(!is.null(m)){
  message("getting cached data")
  return(m)
}
data <- x$get()
m<- solve(data,...)
x$setinverse(m)
m
}
