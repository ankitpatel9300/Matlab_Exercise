A=[ 2 5 7 8 9]   %Q:-1  Create an vector.
AA=[1 0;1 1]     
B=[ 2 3 4 ; 5 6 7 ; 8 9 10]     %Q:-2  Create a matrix.   
C=[0;0;0;0;0]     %Q:-3 5x1 vector of zeros.
CC=rand(1,5)      %Q:-3 1x5 vector of random numbers.
D=transpose(B)    %Q:-4  Transpose a matrix.
E=dot(B,D)        %Q:-5  inner product of two matrices
F=cross(B,D)      %Q:-5  cross product of two matrices
G=inv(AA)         %Q:-5  inverse of a matrix.
GG= 2.*(B)        %Q:-6 element wise multiplication
H=cat(1,B,D)      %Q:-7  Concatenate two matrices.
I=complex(B,2)    %Q:-8  vector of complex numbers.
J=B*B(2,2)        %Q:-9  Multiply a row of a matrix with an element of that same matrix
K=[0:5:500]       %Q:-10  vector of values ranging from 0 to 500 with 100 elements.

%  Q:-11 Create a 2D plot of the sine function between 0 and 2π.

subplot(3,3,1);
t=0:0.1:2*pi;
SineWave=sin(t);
plot(t,SineWave);
% axis([0 2*pi -2 2]);
title('Sinewave 0- 2*pi ');
xlabel('Time'), ylabel('Sine wave');

%  Q:-12 3D plot of a surface by creating a grid along the X and Y axes
%  and plotting the Z-coordinate according to the exponential function.

subplot(3,3,2);
X=[-2:0.25:2];
Y=X;
[X,Y]=meshgrid(X);
Z=X.*exp(-X.^2-Y.^2);
surf(X,Y,Z);
title('3 -D Plot ');
xlabel('X Axis'), ylabel('Y Axis'),zlabel('Z Axis');


% Q:-13 Write a script to plot a vector of random data. Draw a horizontal line 
% at the mean. Save the script and run it from the command line.

subplot(3,3,3);
sample=50;
random_vec=rand(sample,1)    %Vector of 50 random number
hold on;
plot(random_vec);
m=mean(random_vec);
plot([0,sample],[m,m]);
title(' Random data and Mean line ');


# Q:-14  Write another script that calculates the mean of five samples of data from a vector of random data. 
# Calculate the overall mean. Use a for loop to perform the calculations. 
# For each iteration of the loop print out the intermediate results. 
# Use an if..else control block to display the results depending on whether the mean of the samples is less than, 
# greater than or equal to the overall mean.


% to use randsample function install statistics pkg for Octave
% To install pkg type sudo apt-get install octave-statistics in CLI(host-pc)
% and then type pkg load statistics in command line of octave
% Discription Link for randSample function
% https://pdollar.github.io/toolbox/matlab/randSample.html

randVec_5_sample=randsample(random_vec,5)   % 5 random samples from vector
    
% overall mean
   sum=0;
  for i=1:length(random_vec)
     sum=sum + random_vec(i);
  end
  mean_overall= sum/length(random_vec)
  
% Mean of 5 samples from randon number vectpr  
  sum1=0;
  for j=1:5
    sum1=sum1+randVec_5_sample(j);
     mean_In=sum1/j;
     fprintf("\nIntermediate mean #%d is: %0.1f \n", j, mean_In);
  end
  mean_5_samples= mean_In/5;
  
% comparing mean of 5 samples to Overall mean

  if(mean_5_samples< mean_overall)
      fprintf(" \nMean of 5 Samples is Less than Overall Mean");
      elseif (mean_5_samples > mean_overall)
      fprintf(" \nMean of 5 Samples is greater than Overall Mean");
      elseif(mean_5_samples = mean_overall )
      fprintf(" \nMean of 5 Samples is  Equall to Overall Mean");
      
  end  



% Q:-15 Create a function that calculates the sum of an arbitrary number of sinusoidal terms.
% Call this function from the OCTAVE command line or in an OCTAVE script (.m).

t=0:0.1:2*pi;
% first Sine term
subplot(3,3,4);
X=sin(2*t);
plot(X);
title('SIne 2*t ');
xlabel('Time'), ylabel('Amplitude');

% Second Sine term
subplot(3,3,5);
Y=sin(4*t);
plot(Y);
title('SIne 4*t ');
xlabel('Time'), ylabel('Amplitude');

% Third Sine term
subplot(3,3,6);
Z=sin(6*t);
plot(Z);
title('SIne 6*t ');
xlabel('Time'), ylabel('Amplitude');

% Addition of three sine terms
subplot(3,3,7);
Sum=X+Y+Z;
plot(Sum);
title('Sinusoidal tems addition ');
xlabel('Time'), ylabel('Amplitude');

