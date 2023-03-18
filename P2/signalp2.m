%       |  1+(2/7)*t   si -7/2<t<0
% x(t)= |
%       |  (2/7)*t-1   si 0<t<7/2
function y = signalp2(t)
    y = zeros(size(t));
    for i=1:length(t)
        if -7/2<t(i) & t(i)<0
            y(i)=1+(2/7)*t(i);
        elseif 0<t(i) & t(i)<7/2
            y(i)=(2/7)*t(i)-1;
        end
    end
end
