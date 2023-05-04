# MECH-105-Algorithms- Simpson 
This is a general MATLAB function for integrating experimental data using Simpson’s 1/3 rule. 
It checks if there are an odd number of intervals, if there are, the trapezoidal rule is used for the last interval.
The function numerically evaluates the integral of the vector of function values y with respect to x.
It checks that the inputs are the same length, the x input is equally spaced, and warns the user if the trapezoidal rule has to be used on the last interval.
