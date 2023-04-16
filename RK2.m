function y = RK2(h)

y=zeros(5,1);
n=10/h;
yold=1;
k=1;

for i=1:n
    ynew=yold+h*(1/4*f((i-1)*h,yold)+3/4*f((i-1)*h+2/3*h,yold+2/3*h*f((i-1)*h,yold)));
    if abs(mod(i*h,2))<1e-8
        y(k)=ynew;
        k=k+1;
    end
    yold=ynew;
end

end

function dy = f(t,y)

dy=-y+2*cos(t);

end