x=[0:0.01:5];
y1=10 + 5*exp(-x).*cos(x + 0.5);
y2=10 + 5*exp(-x).*cos(3*x + 0.5);
y3=10 + 5*exp(-x).*cos(10*x + 0.5);
plot(x,y1,"-",x,y2,"--",x,y3,"-.");
xlabel("Time (sec)")
ylabel("y(x)")
grid on