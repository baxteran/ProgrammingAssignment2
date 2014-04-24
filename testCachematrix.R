## test my cachematrix.R
setwd("~/Rprog/ProgrammingAssignment2")
source ("./cachematrix.R")
## make a simple square matrix
mdat <- matrix (c(1,2,3,4), nrow =2 , ncol =2)
## construct a cached matrix
myCachedMatrix <- makeCacheMatrix(mdat)
## confirm that it is correctly constructed
myCachedMatrix$get()
## call the solver once
invM <- cacheSolve(myCachedMatrix)
invM
## call again to confirm caching
invM <- cacheSolve(myCachedMatrix)
invM
## test again with a 3x3 matrix
mdat2 <-matrix(c(5,6,7,8,9,0,1,2,3), nrow=3 , ncol=3)
myCachedMatrix$set(mdat2)
## check that the cache has been cleared by setting the matrix
myCachedMatrix$getInverse()
## check that the matrix has been updated
myCachedMatrix$get()
## invoke the solver
invM <- cacheSolve(myCachedMatrix)
invM
## show that the new solution has been cached
myCachedMatrix$getInverse()

