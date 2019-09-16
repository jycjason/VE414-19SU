using Distributions
using Random

n = [50, 250, 750, 1500, 3000];
for i in n
    y_accept = Array{Float64, 1}(undef, i);
    j = 0;
    while j < i
        v = rand();
        y = rand(Normal(0.5, 1), 1);
        if v <= 1/(1 + y[1]^2)
            j = j + 1;
            y_accept[j] = y[1];
        end
    end
    println("For n = ", i, ", mean is ", mean(y_accept));
end
