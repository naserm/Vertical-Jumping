function [PCM, CM]=positionsCM(x)
t1 = sqrt(0.3e1);
t2 = pi / 0.6e1;
t3 = t2 + x(5) - x(7) - x(3) + x(1);
t4 = sin(t3);
t5 = t2 - x(7) + x(1);
t6 = sin(t5);
t5 = cos(t5);
t2 = t2 - x(7) - x(3) + x(1);
t7 = cos(t2);
t2 = sin(t2);
t3 = cos(t3);
t8 = pi / 0.3e1 + x(7);
t9 = sin(t8);
t10 = t1 * t6 - t5;
t11 = t1 * t2 - t7;
t12 = 0.1853e4 / 0.10000e5;
t13 = 0.27413e5 / 0.125000e6 * t10;
t14 = 0.11e2 / 0.100e3 * t9;
t8 = cos(t8);
t2 = t1 * t7 + t2;
t5 = t1 * t5 + t6;
t6 = 0.27413e5 / 0.125000e6 * t5;
t7 = 0.11e2 / 0.100e3 * t8;
t15 = 0.294258429e9 / 0.2500000000e10;
t16 = 0.9676789e7 / 0.78125000e8;
t17 = -0.37e2 / 0.2000e4 * t1;
PCM = [t12 * (t1 * t4 - t3) + 0.184257e6 / 0.1000000e7 * t11 + t13 - t14 t12 * (t1 * t3 + t4) + 0.184257e6 / 0.1000000e7 * t2 + t6 + t7 t11 * t15 + t13 - t14 t15 * t2 + t6 + t7 t10 * t16 - t14 t16 * t5 + t7 -0.183e3 / 0.2000e4 * t9 + t17 * t8 0.183e3 / 0.2000e4 * t8 + t17 * t9];

% mass=61.9;
thighmassp=0.1478;
shankmassp=0.0481;
footmassp=0.0129;
CMx=(PCM(1)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(3)*thighmassp+...
    PCM(5)*shankmassp+...
    PCM(7)*footmassp);
CMy=(PCM(2)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(4)*thighmassp+...
    PCM(6)*shankmassp+...
    PCM(8)*footmassp);
CM=[CMx,CMy];