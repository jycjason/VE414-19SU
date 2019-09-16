x = 0.5; a = -5; b = 5;
n = Array{Int64, 1}(undef,5);
n[1] = 50; n[2] = 250; n[3] = 750; n[4] = 1500; n[5] = 3000;
for j in 1:1:5
    if n[j] <= 1000
        y_grid = collect(
            range(a, length = n[j] , stop=b));
        newa = a ;
        l = (b - a)/n[j];
    elseif n[j] > 1000 && n[j] <= 2000
        nm = 1000;
        na = round(Int , (n[j] - nm) / 2) ;
        l = (b - a) / (nm - 1);
        newa = a - l * na ;
        y_grid = collect(
            range(newa, step=l, length=n[j]));
    else n[j] > 2000
        nm = round(Int, n[j] / 2) ;
        na = round(Int, (n[j] - nm) / 2) ;
        l = (b - a) / (nm - 1);
        newa = a - l * na ;
        y_grid = collect(
            range(newa, step=l, length=n[j])) ;
    end
    f = Array{Float64, 1}(undef, n[j]);
    for i in 1:1:n[j]
        f[i] = exp(-(0.5 - y_grid[i])^2/2)/(1 + y_grid[i]^2);
    end
    A = l * sum(f);
    for i in 1:1:n[j]
        f[i] = y_grid[i] * exp(-(0.5 - y_grid[i])^2/2)/(1 + y_grid[i]^2);
    end
    E = l * sum(f) / A;
    println("For n = ", n[j], ", E[Y|X=0.5] = ", E);
end
