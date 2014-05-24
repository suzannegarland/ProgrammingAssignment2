## these functions allow caching the matrix of an inverse

## this creates an object with its matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {  
## v means inverse
	v <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
## return the value of the matrix
	get <- function() x
	
## provide the inverse of a matrix
	setinverse <- function(inverse) v <<-inverse
## return the inverse of the matrix
	getinverse <- function() v
	list(set = set, get = get,
												setinverse = setinverse,
												getinverse = getinverse)

}


## Matrix inverse shines through

cacheSolve <- function(x, ...) {
	
        ## Return a matrix that is the inverse of 'x'
	
	v <- x$getinverse()
	if(!is.null(v)) {
		message("getting cached data")
		return(v)
	}
	data <- x$get()
	v <- solve(data)
	x$setinverse(v)
	v
}
