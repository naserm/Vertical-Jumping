function dx=Dynamics_k1(t,x,u)
% dx=xp_function_k1(t,x,u);


dx=0*x;
i=1;
while (i<=size(t,1))
    v=u(i,:);
    dx(i,:)=xp_function_k1_mex(t(i),x(i,:),v);
    i=i+1;
end