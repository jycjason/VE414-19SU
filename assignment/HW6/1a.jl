using Distributions
using Random
using StatsBase
using Plots
gui()
n = 10000;
mu = Array{Float64, 1}(undef, n + 1);
sigma2 = Array{Float64, 1}(undef, n + 1);
mu[1] = 1;
sigma2[1] = 1;
for t in range(2, n + 1)
    sigma2z = rand() * 400 - 200 + sigma2[t-1];
    muz = mu[t-1] + rand(Normal(0, 4));
    alpha = 1;
    a = exp(-0.5*sigma2z) * exp(-(0.5-muz)^2/2/exp(sigma2z)-(muz-10)^2/2);
    c = exp(-0.5*sigma2[t-1]) * exp(-(0.5-mu[t-1])^2/2/exp(sigma2[t-1])-(mu[t-1]-10)^2/2);
    alpha = min(1, a/c);
    v = rand();
    if v <= alpha
        mu[t] = muz;
        sigma2[t] = sigma2z;
    else
        mu[t] = mu[t-1];
        sigma2[t] = sigma2[t-1];
    end
end
histogram(mu, fillcolor=[:black], fillalpha=0);
println("Mean of mu found by Metropolis-Hasting Method is: E[mu|sigma2,X=0.5]=",  mean(mu));
