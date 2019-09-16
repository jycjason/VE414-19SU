using Distributions
using Random

n = 10000;
mu = Array{Float64, 1}(undef, n + 1);
mu[1] = 5;
muz = Array{Float64, 1}(undef, 1);
muz[1] = 0;
for t in range(2, n + 1)
    mu[t] = (20*(0.5-mu[t-1])^2+1)/2/((0.5-mu[t-1])^2+1);
    if abs(mu[t]-mu[t-1])<0.0001
        muz[1]=mu[t];
        break;
    end
end
println("Mode of mu found by Expectation Maximization method is: ",  muz[1]);
