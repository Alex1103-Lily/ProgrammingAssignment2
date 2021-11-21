## caching the inverse of a matrix rather than compute it repeatedly

## creates "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
         m <- NULL
         set <- function(y) {
           x <<- y
           m <<- NULL
         }
         get <- function() x
         setInverseMatrix <- function(solve) m <<-solve
         getInverseMatrix <- function() m
         list(set = set, get = get,
              setInverseMatrix = setInverseMatrix,
              getInverseMatrix = getInverseMatrix)

}


## computes the inverse of "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        m <- x$getInverseMatrix
        if(!is.null(m)){
           message("getting cached data")
          return(m)
        }
         data <- x$getInverseMatrix()
         m <- solve(data, ...)
         x$setInverseMatrix(m)
         m
          ## Return a matrix that is the inverse of 'x'
}
