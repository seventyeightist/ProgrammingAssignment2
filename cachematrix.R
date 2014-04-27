## Cache potentially time consuming operations for matrix inversion.
## So that when it is needed again, it can be looked up rather than re-calculated.

## makeCacheMatrix: Create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
}


## cacheSolve: Calculate the inverse of the matrix,
## but if the inverse has already been calculated and the matrix hasn't changed
## then retrieve the cached version rather than re-calculating.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}
