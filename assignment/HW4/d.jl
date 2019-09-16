using Distributions
using RCall

R"""
a = 0; b = 1;
n = 3000;
u_grid = seq( from = 1/n, to=b, length.out =n)
u_grid = u_grid-1/2/n
fB = (-exp(-(0.5 + (1/u_grid-1)^0.5)^2/2)+exp(-(0.5 - (1/u_grid-1)^0.5)^2/2))/2/(u_grid^2)
fA = (exp(-(0.5 + (1/u_grid-1)^0.5)^2/2)+exp(-(0.5 - (1/u_grid-1)^0.5)^2/2))/2/(u_grid-u_grid^2)^0.5
posterior = fB/sum(fB)
A = (b - a)/n*sum(fA)
B = (b - a)/n*sum(fB)
m=1000
samples =sample(u_grid,prob=posterior,size=m,replace=TRUE)
print(B/A*mean(samples))
"""
