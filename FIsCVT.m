function YesCVT = FIsCVT(z,V,Omega,pdf)

global tol 

if sum(isnan(z(:))) > 0
    disp('Error: z is NAN')
    return;
end

N = length(z);
YesCVT = 1;
V_check = FVoronoi(z,Omega);
z_check = zeros(size(z));
for i = 1:N
    z_check(i) = FMassCentroid(V{i},pdf);
    if norm(V{i}-V_check{i}) >= tol
        disp('V in question is not the Voronoi partition of Omega w.r.t z')
        YesCVT = 0;
    end
end

if norm(z-z_check) >= tol
    disp('z is not mass centroid of V')
    norm(z-z_check)
    YesCVT = 0;
end

if YesCVT == 1
    disp('(z,V) is a CVT in Omega under the given pdf:')
    disp(pdf)
else
    disp('(z,V) is NOT a CVT in Omega under the given pdf:')
    disp(pdf)
end
