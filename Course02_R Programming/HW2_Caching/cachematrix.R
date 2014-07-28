## R Programming - John Hopkins University
## Programming Assigment 2
## Lexical Scoping

## written by Billy.ljm
## 24 July 2014
## MIT License

makeCacheMatrix <- function(mat = matrix()) {
	## returns: augmented matrix comaptible with cacheSolve() to cache inverse
	## x: matrix to converted to above-mentioned augmented matrix
	matInv <- NULL # init inverse to null
	setInv <- function(inv) matInv <<- inv 
	getMat <- function() mat 
	getInv <- function() matInv 
	list(setInv = setInv, # set cached inverse 
		 getMat = getMat, # get actual matrix
		 getInv = getInv) # return  cached inverse (null = no cache)
}

cacheSolve <- function(mat, ...) {
	## returns: inverse of augmented matrix
	## mat: augmented matrix created via makeCacheMatrix()
	## return cache if possible, otherwise calculate & caches resulting inverse
	## Note: matrix provided must be invertible	
	if(is.null(mat$getInv()))
		mat$setInv(solve(mat$getMat()))
	mat$getInv()
}
