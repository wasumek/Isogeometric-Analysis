function i = bspline_findspan(n,p,xi,U)
% This routine searches for a given xi the corresponding knot span.
% n:        no. of control points
% p:        degree of the B-Spline/NURBS
% xi:       the xi we search the knot span for
% U(n+p+1): knot vector
    
    if xi == 1
        i = n;
    else
        
        for i = p+1:n
            if U(i)~= U(i+1)
                break
            end
        end
    end
	%YOUR_CODE

	% Here you have to implement a linear (or even binary?)
	% search for the knotspan i.
	%YOUR_CODE
end
