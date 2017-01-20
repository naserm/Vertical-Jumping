function [VCM, CM]=velocitiesCM(x)
t1 = sqrt(0.3e1);
t2 = pi / 0.6e1;
t3 = t2 + x(5) - x(7) - x(3) + x(1);
t4 = t2 - x(7) - x(3) + x(1);
t2 = t2 - x(7) + x(1);
t5 = pi / 0.3e1 + x(7);
t6 = cos(t5);
t7 = x(2) - x(4) - x(8);
t8 = t7 * cos(t4);
t4 = t7 * sin(t4);
t7 = t8 * t1 + t4;
t9 = -x(2) + x(8);
t10 = cos(t2) * t9;
t2 = sin(t2) * t9;
t9 = t10 * t1 + t2;
t11 = x(2) - x(4) + x(6) - x(8);
t12 = t11 * cos(t3);
t3 = t11 * sin(t3);
t11 = 0.184257e6 / 0.1000000e7;
t13 = 0.1853e4 / 0.10000e5;
t14 = -0.11e2 / 0.100e3 * x(8);
t15 = t14 * t6;
t16 = -0.27413e5 / 0.125000e6 * t9;
t5 = sin(t5);
t4 = t4 * t1 - t8;
t2 = -t2 * t1 + t10;
t8 = t14 * t5;
t10 = -0.27413e5 / 0.125000e6 * t2;
t14 = -0.183e3 / 0.2000e4;
VCM = [t7 * t11 + t13 * (t12 * t1 + t3) + t15 + t16 -t11 * t4 - t13 * (t3 * t1 - t12) + t8 + t10 t15 + t16 + 0.294258429e9 / 0.2500000000e10 * t7 t10 - 0.294258429e9 / 0.2500000000e10 * t4 + t8 t15 - 0.9676789e7 / 0.78125000e8 * t9 -0.9676789e7 / 0.78125000e8 * t2 + t8 x(8) * (t14 * t6 + 0.37e2 / 0.2000e4 * t5 * t1) x(8) * (t14 * t5 - 0.37e2 / 0.2000e4 * t6 * t1)];

% mass=61.9;
thighmassp=0.1478;
shankmassp=0.0481;
footmassp=0.0129;
VCMx=(VCM(1)*(1-thighmassp-shankmassp-footmassp)+...
    VCM(3)*thighmassp+...
    VCM(5)*shankmassp+...
    VCM(7)*footmassp);
VCMy=(VCM(2)*(1-thighmassp-shankmassp-footmassp)+...
    VCM(4)*thighmassp+...
    VCM(6)*shankmassp+...
    VCM(8)*footmassp);
CM=[VCMx,VCMy];