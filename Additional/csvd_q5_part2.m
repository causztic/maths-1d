function a = csvd_q5_part2(d)

    % the code is exactly the same as question 2.
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    % choose the maximum possible l (though not the most efficient)
    % For highest efficient r, 
    % use r = mn/(1+m+n)
    l = min(ms,ns);
    list = 1:l;
    a = U(:,list)*S(list, list)*V(:,list)';
end
