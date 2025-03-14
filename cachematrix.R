## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Variable pour stocker l'inverse de la matrice
  
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Réinitialise l'inverse car la matrice a changé
  }
  
  get <- function() x  # Retourne la matrice originale
  
  setInverse <- function(inverse) inv <<- inverse  # Stocke l'inverse
  
  getInverse <- function() inv  # Retourne l'inverse stocké
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Cette fonction calcule l'inverse de la "matrice" spéciale.
## Si l'inverse a déjà été calculé, il est récupéré depuis le cache.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Vérifie si l'inverse est déjà en cache
  
  if (!is.null(inv)) {
    message("getting cached data")  # Affiche un message si on utilise le cache
    return(inv)  # Retourne l'inverse stocké
  }
  
  mat <- x$get()  # Récupère la matrice
  inv <- solve(mat, ...)  # Calcule l'inverse
  x$setInverse(inv)  # Stocke l'inverse dans le cache
  
  inv  # Retourne l'inverse
}
