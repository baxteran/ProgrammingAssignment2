## cachematrix provides a constructor for a matrix implementation that includes a solver for the matrix inverse.
## Once the inverse has been calculated it is cached, avoiding the overhead of recalculating the inverse every time.
## The constructor provides a list of accessors to allow manipulation of the matrix.
## If the matrix is changed using the set function, then the cached inverse is cleared and recalculated lazily.

## Write a short comment describing this function
## This function stores a matrix and provides accessors to get and set the matrix and its inverse.
makeCacheMatrix <- function(x = matrix()) 
{
    ## init values
    inv <- NULL
    set <- function(y) 
    {
        x <<- y
        ## clear the inverse if the matrix is set.
        inv <<- NULL
    }
    ## define accessors
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    ## return list of accessors
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function
## This function solves the inverse for a square matrix and caches the result
## If a cached solution for the inverse is available, this is supplied to avoid the overhead
## of recalculation

cacheSolve <- function(x, ...)
{
    ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    ## First look for a cached solution
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    ## If that fails calculate the inverse
    data <- x$get()
    i <- solve(data, ...)
    ## now cache the value so we don't have to do this next time
    x$setInverse(i)
    ## and return the value to the caller
    return(i)
}
