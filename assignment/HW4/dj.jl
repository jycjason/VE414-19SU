using Distributions
using Plotly
a = 0; b = 1;
n = 50;
fA = Array{Float64, 1}(undef, n);
fB = Array{Float64, 1}(undef, n);
u_grid = Array{Float64, 1}(undef, n);
for i in 1:1:n
    u_grid[i] = (b - a)/n * i-1/2/n;
    fB[i] = (-exp(-(0.5 + (1/u_grid[i]-1)^0.5)^2/2)+exp(-(0.5 - (1/u_grid[i]-1)^0.5)^2/2))/2/(u_grid[i]^2);
    fA[i] = (exp(-(0.5 + (1/u_grid[i]-1)^0.5)^2/2)+exp(-(0.5 - (1/u_grid[i]-1)^0.5)^2/2))/2/(u_grid[i]-u_grid[i]^2)^0.5;
end
posterior = fB/sum(fB);
A = (b - a)/n*sum(fA);
B = (b - a)/n*sum(fB);
m = 100;
samples = Array{Float64, 1}(undef, m);
distribution = Categorical(posterior);
for i in 1:1:m
    samples[i] = u_grid[rand(distribution)];
end
print(B/A*mean(samples))
