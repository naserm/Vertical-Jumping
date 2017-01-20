function dx=Dynamics_k2(t,y,v)
i=0;
dx=y;
while(i<size(t,1))
    i=i+1;
    x=y(i,:);
    u=v(i,:);   
    dx(i,:)=xp_function_k2_mex(x,u);
end