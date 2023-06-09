function Y=ft2(input)
 size=length(input);
 l=log2(size);
 p=ceil(l); 
 Y=input; 
 N = 2^p;
 N2=N/2; 
 YY = -pi*sqrt(-1)/N2; 
 WW = exp(YY);  
 JJ = 0 : N2-1;  
 W=WW.^JJ;
 for L = 1 : p-1
    u=Y(:,1:N2);
    v=Y(:,N2+1:N);
    t=u+v;
    S=W.*(u-v);
    Y=[t ; S];
    U=W(:,1:2:N2);
    W=[U ;U];
    N=N2;
    N2=N2/2;
 end;
 u=Y(:,1);
 v=Y(:,2);
 Y=[u+v;u-v];
 Y