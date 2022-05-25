function CVTEnergy = FCVTEnergy(z_supstar,V_supstar,pdf)
% Inputs: centroids and their Voronoi regions. 
[n,N] = size(z_supstar);
CVTEnergy = 0;
syms y

if n == 1
    for k = 1:N
        IntSum = 0;
        for i = 1:n
            [density,~,~] = Fpdfdefinitions(pdf{i});
            integfun1_parta = matlabFunction(int((y-z_supstar(i,k))^2*density));
            prodi = 1;
            for j = 1:n
                if j ~= i
                    [~,int_density] = Fpdfdefinitions(pdf{j});
                    integfun1_partb = matlabFunction(int_density);
%                     prodi = prodi*(integfun1_partb(V_supstar{j,k}{1}(end)) - integfun1_partb(V_supstar{j,k}{1}(1)));
                    prodi = prodi*(integfun1_partb(V_supstar{j,k}(end)) - integfun1_partb(V_supstar{j,k}(1)));
                end
            end
%             Ii = (integfun1_parta(V_supstar{i,k}{1}(end)) - integfun1_parta(V_supstar{i,k}{1}(1))) * prodi;
            Ii = (integfun1_parta(V_supstar{i,k}(end)) - integfun1_parta(V_supstar{i,k}(1))) * prodi;
            IntSum = IntSum + Ii;
        end
        CVTEnergy = CVTEnergy + IntSum;
    end
else
    for k = 1:N
        IntSum = 0;
        for i = 1:n
            [density,~,~] = Fpdfdefinitions(pdf{i});
            integfun1_parta = matlabFunction(int((y-z_supstar(i,k))^2*density));
            prodi = 1;
            for j = 1:n
                if j ~= i
                    [~,int_density] = Fpdfdefinitions(pdf{j});
                    integfun1_partb = matlabFunction(int_density);
                    prodi = prodi*(integfun1_partb(V_supstar{j,k}{1}(end)) - integfun1_partb(V_supstar{j,k}{1}(1)));
    %                 prodi = prodi*(integfun1_partb(V_supstar{j,k}(end)) - integfun1_partb(V_supstar{j,k}(1)));
                end
            end
            Ii = (integfun1_parta(V_supstar{i,k}{1}(end)) - integfun1_parta(V_supstar{i,k}{1}(1))) * prodi;
    %         Ii = (integfun1_parta(V_supstar{i,k}(end)) - integfun1_parta(V_supstar{i,k}(1))) * prodi;
            IntSum = IntSum + Ii;
        end
        CVTEnergy = CVTEnergy + IntSum;
    end
end


