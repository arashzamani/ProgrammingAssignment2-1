## these functions do lexical scooping based on week 3 of coursera 
## R programming course
## I hava only changed the sample in description of assignment 2

## this function is used for scooping the value of matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## this function in the first step get the inverve value if it exist
## elst it print "getting cached data"
## if the inverse of matrix have not been computed then it compute it 
## with solve function

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}