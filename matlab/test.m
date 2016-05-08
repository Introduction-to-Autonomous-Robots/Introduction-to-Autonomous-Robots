m1=5;
s1=2.1;

m2=12;
s2=1;

d1=normrnd(m1,s1,10000,1);
d2=normrnd(m2,s2,10000,1);

m=m1+s1^2/(s1^2+s2^2)*(m2-m1)
s=1/(1/s1^2+1/s2^2)


s=s1^2/(1+s1^2/s2^2)
 =s1^2*s2^2/(s2^2+s1^2)

d3=normrnd(m,s,10000,1);

hist([d1 d2 d3],50)
legend('\sigma_1','\sigma_2','\sigma')
