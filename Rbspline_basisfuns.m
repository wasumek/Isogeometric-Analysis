function N = bspline_basisfuns(i,xi,p,U)
% This routine determines for a given xi and its corresponding knot span i
% the non-vanishing basis functions N(1:p+1), which are evaluated at xi.
% i:        to xi corresponding knot span
% xi:       the xi we search the knot span for
% p:        degree of the B-Spline/NURBS
% U(n+p+1): knot vector

	% Preallocate the N array
	N = zeros(p+1,1);

	% Unroll the first iteration of the outer loop, since
	% this is the special branch of the Cox-deBoor formula.

    if p == 0
        N(1) = 1;
    else 
        N(1) = 1;
        for j=2:p+1
            % For k=1 there is no dependence on N(k-1) of the previous run.
            saved = 0.0;
            for k=1:j-1
                % Compute $N_{i-j+k,j-1}$ according to the Cox-deBoor formula
                I = i-j+k;
                P = j-1;
                if U(I+P+1) - U(I+1) == 0.0
                    tmp = saved + N(k);
                else
                    tmp = saved + (U(I+P+1) - xi)/(U(I+P+1) - U(I+1))*(N(k));
                end
                % Precompute the first summand of $N_{i-j+k+1,j-1}$ for the next
                % iteration of the inner loop.
                I = i-j+k+1;
                if U(I+P) - U(I) == 0 
                    saved = N(k);
                else
                    saved = (xi - U(I))/(U(I+P) - U(I))*(N(k));
                end
                N(k) = tmp;
            end
            % Unroll the last iteration of the inner loop
            N(k+1) = saved;
        end
    end
end
