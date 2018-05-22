## this code can be used to save resource if inverse of matrix will be calculated periodically
## matrix inverse is expensive and can consume high RAM when matrix dimensions are high 

## makeCacheMatrix function has 4 methods in it to change matrix value (set)
## read matrix value (get), set matrix inverse (setinv) and read the inverse value of a matrix (get inv)


makeCacheMatrix <- function(myMat1 = matrix()) {
	inverseMyMat <- NULL
    
    set <- function(myMat2) {
        myMat1 <<- myMat2
        inverseMyMat <<- NULL
    }
    
    get <- function() {
        myMat1
    }
    
    setinv <- function(invertedMyMat) {
        inverseMyMat <<- invertedMyMat
    }
    
    getinv <- function() {
        inverseMyMat
    }
    
    list(set = set , get = get , setinv = setinv, getinv = getinv)
}


## Below function is used to check if we already computed the inverse of a particular matrix
## This function takes output of makeCacheMatrix function as input

cacheSolve <- function(myMat, ...) {
    ##Read the inverse of the matrix from the cache
	inverseOfMyMat <- myMat$getinv()
    ## Check if the inverse is NULL or calculated before
	##if the inverse is not NULL, that means we have the inverse handy, return the inverse after printing the message
    if(!is.null(inverseOfMyMat)) {
        message("getting cached data")
        return(inverseOfMyMat)
    }
	## Below block will be run only if inverse is NULL i.e. not calculated before
	## use solve() command to calculate the inverse, set it in myMt object and return that value.
    data <- myMat$get()
    inverseOfMyMat <- solve(data)
    myMat$setinv(inverseOfMyMat)
    inverseOfMyMat
}
