function y=senal_x(t)
y=zeros(size(t));%no olvidar!!!
 for i=1:length(t)
     if (-1<t(i) & t(i)<0)
         y(i)=-t(i)-1;
     else 
         y(i)=0;
     end
 end
end
