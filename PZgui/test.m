t = linspace(-pi,pi,100);

x = sin(t) + 0.25*rand(size(t));
a = [1]
b=[1 2 3]
y = filter(b,a,x);

plot(t,x)
hold on
plot(t,y)
legend('Input Data','Filtered Data')