## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    # Initialiser l'inverse à NULL
    inv <- NULL
    
    # Définir la matrice
    set <- function(y) {
        x <<- y
        inv <<- NULL  # Réinitialiser l'inverse si la matrice change
    }
    
    # Obtenir la matrice
    get <- function() x
    
    # Définir l'inverse
    setinverse <- function(inverse) inv <<- inverse
    
    # Obtenir l'inverse
    getinverse <- function() inv
    
    # Renvoyer une liste des fonctions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

Fonction cacheSolve : calcule l'inverse de la "matrice" spéciale créée par makeCacheMatrix.
# Si l'inverse a déjà été calculé (et que la matrice n'a pas changé), il récupère l'inverse depuis le cache.
                                   
cacheSolve <- function(x, ...) {
    # Vérifier si l'inverse est déjà dans le cache
    inv <- x$getinverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)  # Renvoyer l'inverse depuis le cache
    }
    
    # Si l'inverse n'est pas dans le cache, le calculer
    data <- x$get()
    inv <- solve(data, ...)  # Calculer l'inverse avec la fonction solve()
    x$setinverse(inv)  # Stocker l'inverse dans le cache
    inv  # Renvoyer l'inverse calculé
}
