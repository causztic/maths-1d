function a = csvd_q5_part1(d)
    [U,S,V] = svd(d);
    l = 1;
    list = 1:l;
    a = U(:,list)*S(list, list)*V(:,list)';
end
