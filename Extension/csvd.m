function a = csvd(d)
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    
    % instead of choosing r to be min(m,n), we can empirically
    % determine the largest r to prevent size increase, where 
    % m*n = l(1+m+n), rounding off to next integer.
        
    r = ceil((ms*ns)/(1+ms+ns));
    l = r;
    for k = 1:r
        a = appr(U,S,V',k);
        if max(d - a) < 50
            l = k;
            break
        end
    end
    % convert numbers to string to display on console
    m = num2str(size(d,1));
    n = num2str(size(d,2));
    ell = num2str(l);
    
    % display dimensions and l for each channel
    disp([m,' x ',n,' using l = ',ell]);
end
