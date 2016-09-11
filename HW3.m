function R = HW3(A, m)
m=rand(5);
A= m' * m;
display(A)


        [m,m]=size(A);
        R=zeros(m,m);
        row=1;
        col=1;
        j=1;
        for i=1:m,
            a11=sqrt(A(1,1));
            R(row,col)=a11;
            if(m~=1)                
                R21=A(j+1:m,1)/a11;
                R(row+1:end,col)=R21;
                A=(A(j+1:m,j+1:m)-R21*R21');
                [m,m]=size(A);
                row=row+1;
                col=col+1;  
            end
        end
        
  R=R';
  if(!R)%If the factorization doesn't work, it's not positive definite!
  error('A is not positive definite!!!!!!');
  end
 

