## The two functions below together calculates the inverse of a matrix 
## storing the inverse in a cache


## The function makeCacheMatrix creates a matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {

    s <- NULL
## initializes the matrix

    set <- function(y) {
                x <<- y
                s <<- NULL
        }
## gets the value of the inverse  matrix
    get <- function() x

##   sets the value of the inverse matrix
##   gets the value of the inverse matrix

    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
   

}

## cacheSolve computes the inverse of a square matrix that is returned
## by the function makeCacheMatrix

cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'

    s <- x$getsolve()

## if the inverse of the matrix has already been calculated, the matrix
## inverse is retrieved from the cache
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()

## solve is the R internal function that calculates the inverse of a matrix
    s <- solve(data, ...)
    x$setsolve(s)
    s

}


