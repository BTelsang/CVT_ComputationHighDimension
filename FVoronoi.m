function V = FVoronoi(z,Omega)

global gridinc

    N = length(z);
    V = cell(1,N);
    a = Omega(1);
    V{1} = a:gridinc:mean([z(1) z(1+1)]);
    a = V{1}(end) + gridinc;
    for iter = 2:N-1
        V{iter} = a:gridinc:mean([z(iter) z(iter+1)]);
        a = V{iter}(end) + gridinc;
    end
    V{N} = a:gridinc:Omega(end);
end