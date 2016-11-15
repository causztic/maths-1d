function a = csvd(d, index, color)
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    
    %        quality ratio
    %
    %    summation of sigma to l
    %    ------------------------------
    %    summation of sigma to r
    
    % instead of choosing r to be min(m,n), we can empirically
    % determine the largest r to prevent size increase, where 
    % m*n = l(1+m+n), rounding off to next integer.
        
    r = ceil((ms*ns)/(1+ms+ns));
    
    % a lower triangular matix of 1s multiplied by S then by a column
    % vector of 1s sums up the trace for each l from 1 to r.
    t = tril(ones(ms, ms));
    quality = (t*S*ones(ns, 1));
    % The resulting traces when divided by the initial trace gives us
    % the quality ratio.
   	quality_y = (quality/quality(ms))*100;
    
    % space_y is the compression ratio from question 1 expressed as a 
    % percentage.  
    x = 1:min(ms,ns);
    space_y = ((ms*ns)./(x*(1+ms+ns)));
    
    % subplot based on index, the two graphs on the same plot
    subplot(3,2,index);
    plot(x, quality_y, x, space_y, color);
    
    % set axis limits and labels
    ylim([0,100]);
    xlim([0,r]);
    xlabel('l');
    ylabel('percentage');
    legend('y = quality(r)','y = compression(r)','Location','southeast')
    
    % plot the difference
    subplot(3,2,index+1);
    diff = quality_y - space_y';
    plot(x, diff);    
    ylim([0,100]);
    xlim([0,r]);
    l = r;
%     
    % pick only singular values that are the at least 1% of the maximum
    % singular value.
    % 
    % l = find(s >= 0.01 * s(1));
    % a = appr(U,S,V',max(l));
    
    a = appr(U,S,V',l);

    % convert numbers to string to display on console
    m = num2str(size(d,1));
    n = num2str(size(d,2));
    ell = num2str(max(l));
    
    % display dimensions and l for each channel
    disp([m,' x ',n,' using l = ',ell,' for the ',color,' channel.']);
end
