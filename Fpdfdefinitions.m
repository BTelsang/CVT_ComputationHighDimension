function [density,int_density,int_xdensity,density_max] = Fpdfdefinitions(pdf)

%%%% The outputs are in symbolic expressions. To evaluate them, either
%%%% assign a value to their inputs and use subs(.) or convert them to a
%%%% matlab function using matlabFunction. Latter option needs all the
%%%% inputs to be assigned values, whereas the former can have one or more
%%%% inputs as symbolic. Word of caution: when you use subs(.), be sure to
%%%% have the exact symbol assigned. 

switch pdf.name
    case 'Uniform'
        syms y
        a = pdf.parameters(1);
        b = pdf.parameters(2);
        density = y/(y*(b-a));

    case 'Gaussian'
        syms y
        mu = pdf.parameters(1);
        sigma = pdf.parameters(2);
        
        if pdf.unknownparameters(1) == 1
            if pdf.unknownparameters(2) == 1
                density(y,mu,sigma) = (exp(-(y-mu).^2/(4*sigma^2)))/(sqrt(2*pi*sigma^2));
            else
                density(y,mu) = (exp(-(y-mu).^2/(4*sigma^2)))/(sqrt(2*pi*sigma^2));
            end
        else
            if pdf.unknownparameters(2) == 1
                density(y,sigma) = (exp(-(y-mu).^2/(4*sigma^2)))/(sqrt(2*pi*sigma^2));
            else
                density = (exp(-(y-mu).^2/(4*sigma^2)))/(sqrt(2*pi*sigma^2));
            end
        end
        
    
    case 'Cauchy'
        syms y
        
        x0 = pdf.parameters(1);
        pargamma = pdf.parameters(2);
        
        if pdf.unknownparameters(1) == 1
            if pdf.unknownparameters(2) == 1
                density(y,x0,pargamma) = 1/(pi*pargamma*(1+((y-x0)/pargamma).^2));
            else
                density(y,x0) = 1/(pi*pargamma*(1+((y-x0)/pargamma).^2));
            end
        else
            if pdf.unknownparameters(2) == 1
                density(y,pargamma) = 1/(pi*pargamma*(1+((y-x0)/pargamma).^2));
            else
                density = 1/(pi*pargamma*(1+((y-x0)/pargamma).^2));
            end
        end
       
    case 'Exponential'
        syms y
        lambda = pdf.parameters(1);
        if isa(lambda,'sym') == 1
            density(y,lambda) = (lambda*exp(-(lambda*y)));
        else
            if isa(lambda,'double') == 1
                density = (lambda*exp(-(lambda*y)));
            else
                disp('lambda is of incorrect data type')
            end
        end
        
    case 'Gamma'
        syms y
        k = pdf.parameters(1);
        theta = pdf.parameters(2);
        
        if pdf.unknownparameters(1) == 1
            if pdf.unknownparameters(2) == 1
                density(y,k,theta) = ((y^(k-1) * exp(-y/theta) )/(gamma(k)*theta^k));
            else
                density(y,k) = ((y^(k-1) * exp(-y/theta) )/(gamma(k)*theta^k));
            end
        else
            if pdf.unknownparameters(2) == 1
                density(y,theta) = ((y^(k-1) * exp(-y/theta) )/(gamma(k)*theta^k));
            else
                density  = ((y^(k-1) * exp(-y/theta) )/(gamma(k)*theta^k));
            end
        end

    case 'QiangDu'
        syms y
        density = exp(-10*y^2);
        
  
        
end

int_xdensity = int(y*density);
int_density = int(density);
eqn = diff(density) == 0;
y = double(solve(eqn));
density_max = subs(density);
