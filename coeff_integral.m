function integral = coeff_integral(WG, wg_length, order, Ex_phi, Hy_phi, X)

betas = WG.getbeta(wg_length);
order_beta = betas(3);

Ex_beta_func = WG.eigenmode_function(wg_length, order);
Hy_beta_func = @(x) (1 / WG.k) * order_beta * Ex_beta_func(x);

Ex_beta = arrayfun(Ex_beta_func, X);
Hy_beta = arrayfun(Hy_beta_func, X);

integrate_this = Ex_beta .* Hy_phi + Ex_phi .* Hy_beta;
integral = trapz(X, integrate_this);



end