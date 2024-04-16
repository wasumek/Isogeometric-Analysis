function S = bspline_eval(bspline, coeffs, dimS, u)

% bspline:              holds the geometrical B-Spline structure
% coeffs(dimS,n1[,n2]): the coefficients we should use for evaluation, which are NOT
%                       necessarily the control points
% dimS:                 dimension of the space the curve/surface/DOF is embedded in,
%                       which implies that the first index of coeffs should have at
%                       least that many entries.
% u(dim,size_u):        the evaluation points with u(1,i) = $\xi_i$ and u(2,i) = $\eta_i$

dim = numel(bspline.order);
% Sanity checks of the bspline structure
assert(dim == numel(bspline.number));
assert(size(u,1) == dim);
assert(dim == ndims(coeffs)-1);
assert(size(coeffs,1) >= dimS);

size_u = size(u,2);
S = zeros(dimS,size_u);

%Preallocate S

if (dim == 1)
    % degree of bspline
    p = bspline.order-1;
    % number of control points
    n = bspline.number;
    for j=1:size_u
        % For each evaluation point u(:,j) find the corresponding knotspan i
        % using bspline_findspan and then determine the $p+1$ non-zero
        % basis functions N with bspline_basisfuns. Use this information to
        % form the linear combination.
        i = bspline_findspan(n,p,u(1,j),bspline.knots{1});
        funs = bspline_basisfuns(i,u(1,j),p,bspline.knots{1});
        for k = 1:p+1         
           S(:,j) =  S(:,j)+coeffs(:,i-p+k-1,1)*funs(k);
        end
        
    end
elseif (dim == 2)
    p  = bspline.order(1) -1;
    q  = bspline.order(2) -1;
    n1 = bspline.number(1);
    n2 = bspline.number(2);
    
    for j=1:size_u

        i1 = bspline_findspan(n1,p,u(1,j),bspline.knots{1});
        funs1 = bspline_basisfuns(i1,u(1,j),p,bspline.knots{1});
        
        i2 = bspline_findspan(n2,q,u(2,j),bspline.knots{2});        
        funs2 = bspline_basisfuns(i2,u(2,j),q,bspline.knots{2});

            for k1 = 1:p+1
               for k2 = 1:q+1
                    S(:,j) =  S(:,j) + coeffs(:,i1-p+k1-1,i2-q+k2-1)*funs1(k1)*funs2(k2);
               end
            end
        
    end
end
end
