function wz = omega(w0,zr,z)
% w0:束腰处光斑半径1/e
% zr:瑞丽长度
% z：z方向坐标
    wz = w0 * sqrt(1+(z/zr).^2);
end