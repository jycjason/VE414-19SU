using Distributions
using Random
using Plots
using StatsBase
gui()
n = 10000;
mu = Array{Float64, 1}(undef, n + 1);
sigma2 = Array{Float64, 1}(undef, n + 1);
mu[1] = 1;
sigma2[1] = 1;
for t in range(2, n + 1)
    a = (1+20*sigma2[t-1])/(2+2*sigma2[t-1]);
    b = sigma2[t - 1]/(1+sigma2[t-1]);
    muza = rand(Normal(a, b), 1);
    mu[t] = muza[1];
    sigma2z = rand() * 400 - 200;
    v = rand();
    while v > exp(-0.5*sigma2z)*exp(-(0.5-mu[t])^2/2/exp(sigma2z))*400
        sigma2z = rand() * 400 - 200;
        v = rand();
    end
    sigma2[t] = exp(sigma2z);

end

histogram(mu, fillcolor=[:black], fillalpha=0);
println("Mean of mu found by Gibbs Sampling is: E[mu|sigma2,X=0.5]=",  mean(mu));
