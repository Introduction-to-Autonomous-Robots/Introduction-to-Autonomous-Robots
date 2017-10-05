%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Introduction to Autonomous Robots
%       Nikolaus Correll
%
% die_experiment.m
%
% Goal: help you understand the concept of
% a discrete probability distribution function
% and the limits of the Gaussian distribution.
%
% Activities: run the program either with the 
% single die experiment for different numbers 
% of iterations (I). The histogram function 
% counts the number of occurences of the value
% your die/dice return. How do you expect this
% distribution to look like for more iterations?
% Will it be Gaussian? What else? 

N=100;
for I=1:10,
%% Single die experiment (comment/uncomment either one)   
histogram(randi([1 6],1,N*I),6)
%% Double dice experiment
%histogram(randi([1 6],1,N*I)+randi([1 6],1,N*I),11)

title(sprintf('Number of samples %d',N*I));
xlabel('Value');
ylabel('Occurences');
drawnow
end;