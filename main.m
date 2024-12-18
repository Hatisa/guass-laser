clc;
clear;

tic;
Workplace= pwd;

micron = 1e-6;
nano = 1e-9;
e = 1.6e-19;
epsilon0 = 8.85e-12;
m_e = 9.1e-31;
w0 = 2 * micron;
lambda = 0.8 * micron;
k = 2 * pi / lambda;
zr = pi * w0^2 / lambda;
E0 = 1e14;

range = -20 *micron:40 * nano:20 *micron;
r = abs(range);
[~, nr] = size(r);

% 3D simulation
% x = -20:4e-3:20;
% y = -20:4e-3:20;
% [~, nx] = size(x);
% [~, ny] = size(y);
% X = repmat(x,ny,1);
% Y = repmat(y',1,nx);
% R = sqrt(X.^2 + Y.^2);
z = -10 *micron:20 * nano:10*micron;
[~, nz] = size(z);

R = repmat(r', 1, nz);
Z = repmat(z, nr, 1);
wz = omega(w0,zr,Z);
rz = Rz(zr,Z);
gouy = atan(Z/zr);

omega0 = w0 * ones(size(wz));
E = E0 * omega0./wz .* exp(-(R./wz).^2).* exp(-1i* (k * Z + k * R.^2./(2 * rz) - gouy));

figure(1)
mycolor = jetvar(256);
colormap(mycolor);
imagesc(z/micron, range/micron, real(E));
colorbar;
xlabel('z/(um)','fontsize',15);
ylabel('r/(um)','fontsize',15);
title('Ey');
saveas(gcf,[Workplace,'\ey.png']);
close;

figure(2)
mycolor = jetvar(256);
colormap(mycolor);
imagesc(z/micron, range/micron, imag(E));
colorbar;
xlabel('z/(um)','fontsize',15);
ylabel('r/(um)','fontsize',15);
title('Ex');
saveas(gcf,[Workplace,'\ex.png']);
close;

toc;
