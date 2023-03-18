t=-3:0.005:3;
x=zeros(size(t))
for i=1:length(t)
    if(0<t(i)& t(i)<1)
        x(i)=t(i)
    else x(i)=0;
    end
end

figure;
subplot(221);
plot(t,x,'LineWidth',3);
grid on;
xlim([t(1) t(end)]) %t(1) posicion 1 de t
xlabel('t')
ylabel('x(t)')
title('x(t)')
