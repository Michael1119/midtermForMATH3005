%% Problem 2
clc
clear
tspan=2:2:10;
Y=@(t) sin(t)+cos(t);
exact=transpose(Y(tspan));
y1=RK2(0.1);
y2=RK2(0.05);
y3=RK2(0.025);
error1=abs(exact-y1);
error2=abs(exact-y2);
error3=abs(exact-y3);
ratio=error1./error2;
avg1=mean(error1);
avg2=mean(error2);
format shortG
y1
y2
ratio
format shortE
error1
error2
avg1
avg2

figure
plot(0:0.05:10,Y(0:0.05:10),'-',0:2:10,[1;y1],'o')
title('exact solution and computed solution with h=0.1')
xlabel('t')
ylabel('y')
legend('Y(t)','y_h(t)')

figure
plot(0:0.05:10,Y(0:0.05:10),'-',0:2:10,[1;y2],'o')
title('exact solution and computed solution with h=0.05')
xlabel('t')
ylabel('y')
legend('Y(t)','y_h(t)')

figure
semilogy(tspan,error1,'-o',tspan,error2,'-+')
title('error between exact solution and computed solution')
xlabel('t')
ylabel('e_h(t)')
legend({'e_{0.1}(t)','e_{0.05}(t)'},'Location','southeast')

x=transpose(log([0.1,0.05,0.025]));
y=transpose(log([error1(5),error2(5),error3(5)]));
A=[x,ones(length(x),1)];
par=(A'*A)\(A'*y);
a=par(1);
b=par(2);

figure
plot(log([0.1,0.05,0.025]),a*log([0.1,0.05,0.025])+b,'-',x,y,'o')
title('relationship between log of step size and log of error')
xlabel('ln(h)')
ylabel('ln(e_h(10))')
legend({'a*ln(h)+ln(b)','ln(e_h(10))'},'Location','southeast')
text(-2.8,-8.5,strcat('slope=',string(a)))
%% Problem 3a
clc
clear
t=0:2:10;
f=@(t,y) (cos(y)).^2;
Y=@(t) atan(t);
exact=transpose(Y(t));
opts1=odeset('RelTol',1e-8,'AbsTol',1e-4);
opts2=odeset('RelTol',1e-8,'AbsTol',1e-6);
[~,y1]=ode45(f,t,0,opts1);
[~,y2]=ode45(f,t,0,opts2);
error1=abs(exact-y1);
error2=abs(exact-y2);
format shortG
y1
y2
format shortE
error1
error2

figure
plot(0:0.05:10,Y(0:0.05:10),'-',t,y1,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-4}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'},'Location','southeast')

figure
plot(0:0.05:10,Y(0:0.05:10),'-',t,y2,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-6}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'},'Location','southeast')

figure
semilogy(t,error1,'-o',t,error2,'-+')
title('error between exact solution and computed solution with RelTol=10^{-8}')
xlabel('t')
ylabel('e(t)')
legend({'AbsTol=10^{-4}','AbsTol=10^{-6}'},'Location','southeast')
%% Problem 3b
clc
clear
t=0:2:10;
f=@(t,y) 1./(1+t.^2)-2*y.^2;
Y=@(t) t./(1+t.^2);
exact=transpose(Y(t));
opts1=odeset('RelTol',1e-8,'AbsTol',1e-4);
opts2=odeset('RelTol',1e-8,'AbsTol',1e-6);
[~,y1]=ode45(f,t,0,opts1);
[~,y2]=ode45(f,t,0,opts2);
error1=abs(exact-y1);
error2=abs(exact-y2);
format shortG
y1
y2
format shortE
error1
error2

figure
plot(0:0.05:10,Y(0:0.05:10),'-',t,y1,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-4}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'})

figure
plot(0:0.05:10,Y(0:0.05:10),'-',t,y2,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-6}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'})

figure
semilogy(t,error1,'-o',t,error2,'-+')
title('error between exact solution and computed solution with RelTol=10^{-8}')
xlabel('t')
ylabel('e(t)')
legend({'AbsTol=10^{-4}','AbsTol=10^{-6}'})
%% Problem 3c
clc
clear
t=0:4:20;
f=@(t,y) y/4.*(1-y/20);
Y=@(t) 20./(1+19*exp(-t/4));
exact=transpose(Y(t));
opts1=odeset('RelTol',1e-8,'AbsTol',1e-4);
opts2=odeset('RelTol',1e-8,'AbsTol',1e-6);
[~,y1]=ode45(f,t,1,opts1);
[~,y2]=ode45(f,t,1,opts2);
error1=abs(exact-y1);
error2=abs(exact-y2);
format shortG
y1
y2
format shortE
error1
error2
figure
plot(0:0.05:20,Y(0:0.05:20),'-',t,y1,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-4}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'},'Location','southeast')

figure
plot(0:0.05:20,Y(0:0.05:20),'-',t,y2,'o')
title('exact solution and computed solution with RelTol=10^{-8} and AbsTol=10^{-6}')
xlabel('t')
ylabel('y')
legend({'Y(t)','y(t)'},'Location','southeast')

figure
semilogy(t,error1,'-o',t,error2,'-+')
title('error between exact solution and computed solution with RelTol=10^{-8}')
xlabel('t')
ylabel('e(t)')
legend({'AbsTol=10^{-4}','AbsTol=10^{-6}'})