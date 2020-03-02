% Q:- 3 (a)
w=[-100:100]*pi/100 ;
H=0.19*ones(size(w))./(1.81-1.8*cos(w));
magnitude=abs(H);
phase=angle(H)*180/pi;
subplot(2,1,1);
plot(w/pi, magnitude);
subplot(2,1,2);
plot(w/pi ,phase);

% Q:- 3 (b)
[h1,n1] = stepseq(-20,-20,20); 
[h2,n2] = stepseq(20,-20,20);
[h3,n3] = sigadd(h1,n1,-h2,n2); 
n = n3; 
h = sinc(0.2*n).*h3;
w = [-300:300]*pi/300; 
H = dtft(h,n,w); 
magnitude = abs(H); 
phase = angle(H)*180/pi;
subplot(2,1,1); 
plot(w/pi,magnitude);
subplot(2,1,2);
plot(w/pi,phase);