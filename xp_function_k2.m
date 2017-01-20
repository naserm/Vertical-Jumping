function dx=xp_function_k2(x,u)
dy=MassM_k2(x)\FM_k2(x,u)';
dx=[x(2) dy(1) x(4) dy(2) x(6) dy(3) x(8) dy(4) x(10) dy(5) x(12) dy(6)];