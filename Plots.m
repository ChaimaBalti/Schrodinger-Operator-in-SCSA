figure;
subplot(2, 2, 1);
plot(psinnor(1:70,1).^2,'DisplayName','psinnor')
title('Psi1^2');
subplot(2, 2, 2);
plot(psinnor(1:70,2).^2,'DisplayName','psinnor')
title('Psi2^2');
subplot(2, 2, 3);
plot(psinnor(1:70,3).^2,'DisplayName','psinnor')
title('Psi3^2');
subplot(2, 2, 4);
plot(psinnor(1:70,4).^2,'DisplayName','psinnor')
title('Psi4^2');
%plot(+psinnor(:,2).^2+psinnor(:,1).^2,'DisplayName','psinnor')