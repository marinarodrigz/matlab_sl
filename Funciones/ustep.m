function u= ustep(t)
    u=zeros(size(t));
 for i=1:length(t)
     if  t(i)>=0
         u(i)=1;
     end
 end
end