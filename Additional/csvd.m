function a = csvd(d)

    % the code is exactly the same as question 2.
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    
    r = ceil((ms*ns)/(1+ms+ns));
    t = tril(ones(ms, ns));
    
    quality = (t*S*ones(ms, 1));
   	quality_y = (quality/quality(ms))*100;
    
    x = 1:min(ms,ns);
    space_y = ((ms*ns)./(x*(1+ms+ns)));
    
    quality_gradient = quality_y./x';
    space_gradient = space_y./x;
    
    diff = abs(space_gradient-quality_gradient');
    l = x(find(diff > 0.8 & diff < 0.9));
    
    % instead of for loop, use direct multiplication
    % it will be faster than indiviually adding up for each value from 1:l
    % because the addition function will be called once for each element
    % from 1 to l while the new method will only be called once.
    
    list = 1:l;
    a = U(:,list)*S(list, list)*V(:,list)';

    m = num2str(size(d,1));
    n = num2str(size(d,2));
    ell = num2str(max(l));
    
    disp([m,' x ',n,' using l = ',ell]);
end
