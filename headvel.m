function headvel=headvel(x)
t1 = sqrt(0.3e1);
t2 = pi ./ 0.6e1;
t3 = t2 + x(:,5) - x(:,7) - x(:,3) + x(:,1);
t4 = t2 - x(:,7) - x(:,3) + x(:,1);
t2 = t2 - x(:,7) + x(:,1);
t5 = pi ./ 0.3e1 + x(:,7);
t6 = x(:,2) - x(:,4) + x(:,6) - x(:,8);
t7 = t6 .* cos(t3);
t3 = t6 .* sin(t3);
t6 = x(:,2) - x(:,4) - x(:,8);
t8 = t6 .* cos(t4);
t4 = t6 .* sin(t4);
t6 = -x(:,2) + x(:,8);
t9 = cos(t2) .* t6;
t2 = sin(t2) .* t6;
t6 = 0.184257e6 ./ 0.1000000e7;
t10 = -0.27413e5 ./ 0.125000e6;
t11 = 0.5e1 ./ 0.16e2;
t12 = -0.11e2 ./ 0.100e3 .* x(:,8);
headvel = [t11 .* (t7 .* t1 + t3) + t6 .* (t8 .* t1 + t4) + t10 .* (t9 .* t1 + t2) + t12 .* cos(t5) t10 .* (-t2 .* t1 + t9) - t11 .* (t3 .* t1 - t7) - t6 .* (t4 .* t1 - t8) + t12 .* sin(t5)];
