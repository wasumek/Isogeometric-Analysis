function S = nurb_eval(nurb, coeffs, dimS, u)

size_u = size(u,2);
% Preallocate S
S = zeros(dimS,size_u);
dim = numel(nurb.order);




if (dim == 1)
    % Perform two bspline_eval calls to determine the numerator and
    % the denominator of Equation (4).
    Num = bspline_eval(nurb, coeffs(1:dimS,:,:), dimS, u);
    Den = bspline_eval(nurb, nurb.coeffs(4,:,:),dimS,u)   ;
    S = Num./Den;
elseif (dim == 2)
    % Almost the same code as in the dim == 1 case.
    Num = bspline_eval(nurb, coeffs(1:dimS,:,:),dimS,u);
    Den = bspline_eval(nurb, nurb.coeffs(4,:,:),1,u);
    size(Num)
    size(Den)
    
    for i = 1:size_u
       S(1,i) = Num(1,i)/Den(i);
       S(2,i) = Num(2,i)/Den(i);
    end
        
end
end
