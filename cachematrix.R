## Cache potentially time consuming operations for matrix inversion.
## So that when it is needed again, it can be looked up rather than re-calculated.

## makeCacheMatrix: Create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL                           ## To store the inverse of a matrix
    ## Define set function for x (an invertible matrix)
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
    ## Define get function (return x, an invertible matrix)
  get <- function() x
  
    ## Define setinverse function (store the inverse of the matrix)
  setinverse <- function(solve) i <<- solve
  
    ## Define getinverse function (return the inverse of the matrix as stored)
  getinverse <- function() i
  
    ## List of the 4 functions we just defined
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve: Calculate the inverse of the matrix,
## but if the inverse has already been calculated and the matrix hasn't changed
## then retrieve the cached version rather than re-calculating.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
    ## Try to getinverse() from the cached object
  i <- x$getinverse()
    ## Check if we were able to get a value for the inverse out of the cached object
    ## not null if it's already cached so in that case just return it
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
    ## If not already cached then it will reach here:
    ## retrieve the data, calculate its inverse and cache it
    ## and return the inverse to the caller
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
