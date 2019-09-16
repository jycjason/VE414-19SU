n = Array{Int64, 1}(undef,5);
n[1] = 50; n[2] = 250; n[3] = 750; n[4] = 1500; n[5] = 3000;
for j in 1:1:5
    f = Array{Float64, 1}(undef, n[j]);
    ee = Array{Float64, 1}(undef, n[j]);
    for i in 1:1:n[j]
        f[i] = (exp(-(0.5+(2*n[j]/(2*i-1)-1)^0.5)^2/2) + exp(-(0.5-(2*n[j]/(2*i-1)-1)^0.5)^2/2))/((2*n[j]-2*i+1)*(2*i-1))^0.5;
        ee[i] = (-exp(-(0.5+(2*n[j]/(2*i-1)-1)^0.5)^2/2) + exp(-(0.5-(2*n[j]/(2*i-1)-1)^0.5)^2/2))/2/((2*i-1)/2/n[j]);
    end
    A = sum(f);
    E = sum(ee)/A/n[j];
    println("For n = ", n[j], ", Normallized constant is A = ", A);
    println("For n = ", n[j], ", E[Y|X=0.5] = ", E);
end
