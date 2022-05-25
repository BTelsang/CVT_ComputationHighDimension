function z_centroids = FLlyods(Omega,N,pdf,z_ini)
    
    global tol
    
    z = z_ini + 2*tol;
    z_centroids = z_ini;
    while norm(z-z_centroids) > tol
        z = z_centroids;
        V = FVoronoi(z,Omega);
        for i = 1:N
            z_centroids(i) = FMassCentroid(V{i},pdf);
        end
    end
end