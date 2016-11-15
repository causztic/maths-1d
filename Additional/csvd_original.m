function a = csvd(d)
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    r = ceil((ms*ns)/(1+ms+ns));
    t = tril(ones(ms, ms));
    quality = (t*S*ones(ns, 1));
   	quality_y = (quality/quality(ms))*100;
    x = 1:min(ms,ns);
    space_y = ((ms*ns)./(x*(1+ms+ns)));
    quality_gradient = quality_y./x';
    space_gradient = space_y./x;
    
    % find an acceptable difference to use, we will use 0.8 and 0.9
    diff = abs(space_gradient-quality_gradient');
    idx = find(diff > 0.8 & diff < 0.9);
    
    if idx
        l = x(idx);
    else
        l = r;
    end
    
    % SUMMATION
    a = appr(U,S,V',l);

    % convert numbers to string to display on console
    m = num2str(size(d,1));
    n = num2str(size(d,2));
    ell = num2str(max(l));
    
    % display dimensions and l for each channel
    disp([m,' x ',n,' using l = ',ell]);
end
