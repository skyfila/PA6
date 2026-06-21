# PA6
# Kensea Jordan
# 6/19/2026
# Modifying a custom function to manipulate vectors


# Write an R script which includes a custom function that squares all numbers 
# in a vector and adds 5 to each.

myfunc <- function(myvec) {
  
  # Use a for loop in the function to iterate through each element in the vector 
  # to perform the calculation
#   for (i in 1:length(myvec)) { 
#     myvec[i] <- myvec[i]^2 + 5
#   }
  
  ## Replace the for loop in the custom function with a vectorized operation
  
  ## Add a try block to the function which handles the exception if one of the 
  ## parameter elements is non-numeric
  errm <- try(myvec^2 + 5, silent=TRUE)
  
  if (class(errm) == "try-error") {
    myvec[] <- NA
  } 
  else {
    myvec <- errm
    
  }
  return(myvec)
}


# Call your function from the script with a numeric vector to test it.
vec <- seq(1,10,.5)
print(vec)

## Add a second test with a numeric vector that also includes a string element 
## to test your exception handler
string_vec <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, "10")
print(string_vec)

myfunc(vec)
myfunc(string_vec)

## In your test, change the direct call to the function with one of the apply
## functions (try them all to see which works best)

lapply_test <- lapply(vec, myfunc)
print(lapply_test)

sapply_test <- sapply(vec, myfunc)
print(sapply_test)
