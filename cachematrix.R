## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

cacheSolve <- function(myMat, ...) {
        ## Return a matrix that is the inverse of 'x'
		inverseOfMyMat <- myMat$getinv()
    
    if(!is.null(inverseOfMyMat)) {
        message("getting cached data")
        return(inverseOfMyMat)
    }
    data <- myMat$get()
    inverseOfMyMat <- solve(data)
    myMat$setinv(inverseOfMyMat)
    inverseOfMyMat
}
