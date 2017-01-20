function Fs=Fs_k1(x,ddx)
ddankle= ddx(:,1);
ddknee = ddx(:,2);
ddhip  = ddx(:,3);
ddtheta= ddx(:,4);

t1 = pi ./ 0.6e1;
t2 = -x(:,7) + x(:,1) + t1;
t3 = sin(t2);
t4 = sqrt(0.3e1);
t5 = x(:,5) - x(:,7) - x(:,3) + x(:,1) + t1;
t6 = sin(t5);
t5 = cos(t5);
t2 = cos(t2);
t1 = -x(:,7) - x(:,3) + x(:,1) + t1;
t7 = cos(t1);
t1 = sin(t1);
t8 = pi ./ 0.3e1 + x(:,7);
t9 = sin(t8);
t8 = cos(t8);
t10 = x(:,2) .^ 2;
t11 = x(:,8) .^ 2;
t12 = t4 .* (t11 + t10) - ddankle + ddtheta;
t13 = (-ddankle + ddtheta) .* t4;
t14 = x(:,4) .^ 2;
t15 = -t4 .* (t11 + t14 + t10) + ddankle - ddknee - ddtheta;
t16 = t4 .* (ddankle - ddknee - ddtheta) + t10 + t11 + t14;
t17 = x(:,6) .^ 2;
t18 = -t4 .* (t11 + t14 + t17 + t10) + ddankle + ddhip - ddknee - ddtheta;
t14 = t4 .* (ddankle + ddhip - ddknee - ddtheta) + t10 + t11 + t14 + t17;
t17 = ddtheta .* t8 - t11 .* t9;
t8 = ddtheta .* t9 + t11 .* t8;
t9 = x(:,2) .* x(:,4);
t19 = (x(:,2) - x(:,4) + x(:,6)) .* x(:,8) + (-x(:,2) + x(:,4)) .* x(:,6) + t9;
t20 = x(:,2) - x(:,4);
t21 = t19 .* t5;
t22 = t20 .* x(:,8);
t23 = -t9 - t22;
t24 = t23 .* t1;
t25 = x(:,8) .* x(:,2);
t26 = -0.1262610640890189e16 ./ 0.62500000000000e14;
t27 = 0.1262610640890189e16 ./ 0.125000000000000e15;
t28 = 0.102465904561321e15 ./ 0.3906250000000e13;
t29 = -0.102465904561321e15 ./ 0.7812500000000e13;
t30 = -0.1358845513e10 ./ 0.200000000e9;
t31 = 0.1134389923e10 ./ 0.62500000e8;
t32 = 0.1134389923e10 ./ 0.125000000e9;
t33 = 0.2954487e7 ./ 0.200000000e9;
Fs = [t29 .* (t12 .* t3 + t2 .* (t13 - t11 - t10)) + t27 .* (t1 .* t15 + t16 .* t7) + t32 .* (t14 .* t5 + t18 .* t6) + t30 .* t17 + t33 .* t4 .* t8 - t31 .* (t21 + ((-x(:,2) + x(:,4) - x(:,6)) .* x(:,8) + t20 .* x(:,6) - t9) .* t6 .* t4) + t26 .* (t7 .* (t9 + t22) + t24 .* t4) - t28 .* t25 .* (-t3 .* t4 + t2) t26 .* (t23 .* t7 .* t4 + t24) - t27 .* (t1 .* t16 - t15 .* t7) + t28 .* t25 .* (t2 .* t4 + t3) + t29 .* (t12 .* t2 + t3 .* (-t13 + t11 + t10)) + t30 .* t8 + t31 .* (t19 .* t6 + t21 .* t4) - t32 .* (t14 .* t6 - t18 .* t5) - t33 .* t4 .* t17 + 0.607239e6 ./ 0.1000e4];
