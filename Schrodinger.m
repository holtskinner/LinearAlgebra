n=100;%Approximate infinity by 100
h=.05;
m=2*n;

A = zeros(m-1,m-1);

for i=1:m-1,
  if (i-1>0)
    A(i,i-1)=1/h^2;%Top of diagonal
  end
  if (i+1<m)
    A(i,i+1)=1/h^2;%Bottom of diagonal
  end
  A(i,i)=-2/h^2;%diagonal
end

V = zeros(m-1, m-1);

 for i=1: m-1,
  %V(i,i) = (1/2)*((i-n)*h)^2;
  %V(i,i) = (1/10)*((i-n)*h)^4 - ((i-n)*h)^2;
  V(i,i) = (1/10)*((i-n)*h)^4 - ((i-n)*h)^2 + (1/10)*((i-n)*h);
  end;
  
L = (-1/2)*A + V; %left hand side of equation

[P, D] = eig(L);
[D, ind] = sort(diag(D));
P=P(:,ind);

disp(D(1:10))
plot(P(:, 1))
