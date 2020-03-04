clc;
close all;
clear all;


                                                                     %Input Signal Given Is A Sine Wave.
n=input('Enter N value for N-bit PCM : ');
N=input('Enter number of Sample to be taken in a period : ');
L=2^n;                                                               %No. of Quantized Levels.
t=1/N:1/N:1;
h=ones(1,length(t));
fc=1;
itrain=(square(2*pi*20*fc*t)+1)/2;
X = sin(2*pi*fc*t);
Y=X.*itrain;
figure(1);
subplot(3,1,1);
plot(t,X,'linewidth',1.5);
title('\color{red} INPUT SIGNAL');
xlabel('Time-->');
ylabel('Amplitude-->');
								     %Sampled signal
subplot(3,1,3);
stem(t,Y,'linewidth',1.5);
title('\color{red} SAMPLED SIGNAL');
xlabel('Time-->');
ylabel('Amplitude-->');
subplot(3,1,2);
plot(t,itrain);
title('\color{red} IMPULSE TRAIN');
xlabel('Time-->');
ylabel('Amplitude-->');
axis([0 0.1 0 1])

							           %Quantization
del=2/L;
Z=L/2;
Level=[-1:del:1];
for i=1:Z
    Level1(i)=Level(i);
end
k=1;
for i=Z+2:L+1
    Level2(k)=Level(i);
    k=k+1;
end

for j = 1:N
    if X(j)<0
        X(j)=X(j)*-1;
        for i=1:L/2
            Level1x(i)=Level1(i)*-1;
            z1(i)=Level1x(i)-X(j);
            if z1(i)<0 
                z1(i)=z1(i)*-1;
            end
        end
        for i=1:L/2
            Z(i)=z1(i);
        end
        
        Z=min(Z);
        
        for i=1:L/2
            if z1(i)==Z
                X(j)=Level1(i);
            end
        end
    elseif X(j)>0
        for i=1:L/2
            z2(i)=Level2(i)-X(j);
            if z2(i)<0 
                z2(i)=z2(i)*-1;
            end
        end
        for i=1:L/2
            Z(i)=z2(i);
        end
        
        Z=min(Z);
        
        for i=1:L/2
            if z2(i)==Z
                X(j)=Level2(i);
            end
        end
    else
        X(j)=0;
    end
end
								%Plotting The Quantized Signal
figure(2);
stem(t,X,'.','linewidth',1.5);
title('\color{red} QUANTIZED SIGNAL');
xlabel('Time-->');
ylabel('Amplitude-->');

								%Encoding
d = (0:L)';
b = de2bi(d);
E=[];
for j=1:N
    for i=1:L+1
        if X(j)==Level(i)
            E=b(i,:);
        end
    end
     if(j)==1
            X_Encoded = E;
     else
            X_Encoded = [X_Encoded E];
     end    
end
								%Plotting The Encoded Signal   
figure(3);
t_1=1:length(X_Encoded);
stairs(t_1,X_Encoded,'linewidth',1.5);
axis([0 100 0 2]);
title('\color{red} ENCODED SIGNAL');
xlabel('Time-->');
ylabel('Amplitude-->');

length_1=length(b(1,:));


								%Demodulation
count=length_1;
start=1;
for j=1:N
    new=X_Encoded(start:(start+count-1));
    start=start+count;
    for i=1:L+1
        if new==b(i,:)
            X_demod(j)=Level(i);
        end
    end
end
figure(4);
plot(t,X_demod,'linewidth',1.5);
title('\color{red} DEMODULATED SIGNAL');
xlabel('Time-->');
ylabel('Amplitude-->');
