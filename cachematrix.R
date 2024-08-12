## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse.


makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL  # Initialize the inverse property

    # Method to set the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL  # Reset the inverse when the matrix is changed
    }

    # Method to get the matrix
    get <- function() x

    # Method to set the inverse of the matrix
    setInverse <- function(inverse) inv <<- inverse

    # Method to get the inverse of the matrix
    getInverse <- function() inv

    # Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}
## This function computes the inverse of the special "matrix" created by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inv <- x$getInverse()  # Retrieve the cached inverse if it exists

    # If the inverse is already cached, return it
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
                # Otherwise, compute the inverse
    mat <- x$get()  # Get the matrix from our special matrix object
    inv <- solve(mat, ...)  # Compute the inverse using solve()
    x$setInverse(inv)  # Cache the inverse for future use

    inv  # Return the inverse
}

        
