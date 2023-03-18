function d = delta(t)
    d = zeros(size(t));
    for i=1:length(t)
      if  t(i)==0
         d(i)=1;
      end
    end

end