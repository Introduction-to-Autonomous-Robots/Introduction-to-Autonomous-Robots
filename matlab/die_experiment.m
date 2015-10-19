N=100;
for I=1:1000,
%histogram(randi([1 6],1,N*I),6)
histogram(randi([1 6],1,N*I)+randi([1 6],1,N*I),11)
title(sprintf('Number of samples %d',N*I));
drawnow
end;