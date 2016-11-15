function a = csvd_q3(d)

    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    
    t = tril(ones(ms, ms));
    quality = (t*S*ones(ns, 1));
    
    % The resulting traces when divided by the initial trace gives us the quality ratio.
   	quality_y = (quality/quality(ms))*100;
    
    % space_y is the compression ratio from question 1 expressed as a  percentage.  
    x = 1:min(ms,ns);
    space_y = ((ms*ns)./(x*(1+ms+ns)));

    diff = quality_y - space_y';
    g = gradient(diff);
    
    % A we approach r, for every increasing l, there is a 
    % decreasing % of compression and lesser quality kept per l.
    
    % This means that the gradient of the difference approaches 0 when l 
    % approaches r.
    % With this in mind, we find the smallest acceptable l 
    % that has a gradient close to 0. 
    % We choose 0.15 to be the cut off point.

    l = ceil(find(g < 0.15, 1));
    
    % MUTLIPICATION 
    
    list = 1:l;
    a = U(:,list)*S(list, list)*V(:,list)';

    m = num2str(size(d,1));
    n = num2str(size(d,2));
    ell = num2str(max(l));
    
    disp([m,' x ',n,' using l = ',ell]);
end
