%  QR
function [Q,R] = HW5(A)
  m = size(A); %counter
  Q = eye(m);%identity matrix!
  R = A;

  for j = 1:m
    for i = m:-1:(j+1)
      T = eye(m); %"Q Transposed"
      [x,y] = rotation(R(i-1,j),R(i,j)); %calls rotator function
      T([i-1, i],[i-1, i]) = [x -y; y x];
      R = T'*R; %Q transposed transposed * R(A changed with rotators)
      Q = Q*T;%Q*Q'
    end %end i for
  end %end j for
end %end function

%function to compute rotation
function [x,y] = rotation(a,b)
  if b == 0 
    x = 1;
    y = 0;
  else
    if abs(b) > abs(a)
      r = a / b;
      y = 1 / sqrt(1 + r^2);
      x = y*r;
    else
      r = b / a;
      x = 1 / sqrt(1 + r^2);
      y = x*r;
    end %end inner if else
  end %end outer if else
end %end function