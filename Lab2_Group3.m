% Q:-1_1   x1(n)=3* delta(n+2) + 2*delta(n) -delta (n-3) +5* delta(n-7) , -5<=n<=15 

n=[-5:15];
subplot(2,2,1);
x1= 3*impseq(-2,-5,15) + 2*impseq(0,-5,15) - impseq(3,-5,15) + 5*impseq(7,-5,15);
stem(x1);

%Q-1_2  :- x(n)= exp*(0.1*n)[u(n+20)-u(n-10)]
n1=[-5:15];
subplot(2,2,2);
x2= exp(0.1*n1).*(stepseq(-20,-5,15)-stepseq(10,-5,15) );
stem(x2);


%Q-1_3 :- x(n)= exp(-0.05*pi)* sin(0.1*pi*n + pi/3) 
subplot(2,2,3);
n2=[0:100];
x2= (0.1*pi*n2 )+ pi/3;
x3=exp(-0.05*n2).*sin(x2);
stem(x3);
title("x(n)= exp(-0.05*pi)* sin(0.1*pi*n + pi/3)");

%Q-2_1  Histogram of sequence of 1,00,000 uniformly distributed numbers over (0,2)

a=0;
b=2;
r=(b-a).*rand(1,100000)+a;
[x1,y1]=hist(r,100);
bar(y1,x1);
xlabel('Interval 0-2');
ylabel('number of elements ');


%Q-2_2  Gaussian random sequence,mean=10,variance=10 , 10000 samples
n=[1:10000];
x4= 10 +sqrt(10)*randn(1,10000);
[x5,y5]=hist(x4,100);
bar(y5,x5);
xlabel('Interval');
ylabel('number of elements  ');

%Q:-2_3

a= -0.5;
b= 0.5;
y1=(b-a).*rand(1,10000)+a;
y2=(b-a).*rand(1,10000)+a;
y3=(b-a).*rand(1,10000)+a;
y4=(b-a).*rand(1,10000)+a;

x1= y1+y2+y3+y4 ;
[z1,x1]=hist(x1,100);
bar(x1,z1);
xlabel('Interval');
ylabel('number of elements  ');





