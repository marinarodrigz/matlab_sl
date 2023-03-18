function r = rampa(t)
 r = zeros(size(t));
    for i=1:length(t)
      if  t(i)>=0
         r(i)=t(i);
      end
    end
end