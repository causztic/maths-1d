function a = csvd_q5_part1(d)

    % the code is exactly the same as question 2.
    [U,S,V] = svd(d);
    [ms, ns] = size(S);
    l = 1;
    list = 1:l;
    a = U(:,list)*S(list, list)*V(:,list)';
end
