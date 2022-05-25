function z_centroid = FMassCentroid(V,pdf)
%     z_centroid = trapz(V.*(pdf.density(V)))/trapz(pdf.density(V));
    [~,int_density,int_xdensity] = Fpdfdefinitions(pdf);
    
    %%%% This is the route using MATLAB function where the symbols are
    %%%% variables. The output z_centroid will be a specific value.
    int_x_rho_of_x = matlabFunction(int_xdensity);
    int_rho_of_x = matlabFunction(int_density);

    lower_bound = V(1);
    upper_bound = V(end);
    z_centroid = (int_x_rho_of_x(upper_bound) - int_x_rho_of_x(lower_bound))/(int_rho_of_x(upper_bound) - int_rho_of_x(lower_bound));
    
end