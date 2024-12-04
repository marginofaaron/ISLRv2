# create sample_data 
x <- rnorm(500) 
y <- x + rnorm(500, 0, 10) 
z <- x - rnorm(500, 0, 7) 

sample_data <- data.frame(x, y, z) 

#create pairs plot 
pairs( sample_data )

