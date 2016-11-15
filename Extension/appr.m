% compute the approximation given by equation (2) in the slides

% function c = appr(u,s,v,ell)
% c = u(:,ell)*s(ell,ell)*v(ell,:);
% end

function c = appr(u,s,v,l)
    c = 0;
    for k = 1:l
        c = c + u(:,k)*s(k,k)*v(k,:);
    end
end