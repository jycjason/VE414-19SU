using Distributions
using Random

n = [50, 250, 750, 1500, 3000];
for i in n
    y = rand(Normal(0.5, 1), i);
    w = (2 * pi)^0.5./(1 .+ y.*y);
    println("For n = ", i, ", mean is ", sum(y .* w)/sum(w));
end
