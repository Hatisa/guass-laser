function rz = Rz(zr, z)
    ZR = zr * ones(size(z));
    rz = z .* (1 + (ZR./z).^2);
end