%permet de tracer tous les vecteurs propres l'un apres l'autres 

% figure;
% i=1;
% n=size(psinnor);
% while (i<=n(2))
%     drawnow;
%     plot(psinnor(:,i).^2)
%     pause(0.6);
%     i=i+1;
% end


% subplot(2, 2, 1);
% hold on ;
% plot(psinnor1(:,1).^2,'DisplayName','psinnor')
% plot(psinnor2(:,1).^2,'DisplayName','psinnor')
% title('Psi1^2');
% figure;
% hold off;
% 
% subplot(2, 2, 2);
% hold on ;
% plot(psinnor1(:,2).^2,'DisplayName','psinnor')
% plot(psinnor2(:,2).^2,'DisplayName','psinnor')
% 
% title('Psi2^2');
% hold off;
% 
% 
% subplot(2, 2, 3);
% hold on ;
% plot(psinnor1(:,3).^2,'DisplayName','psinnor')
% plot(psinnor2(:,3).^2,'DisplayName','psinnor')
% title('Psi3^2');
% hold off;
% 
% 
% subplot(2, 2, 4);
% hold on ;
% plot(psinnor1(:,4).^2,'DisplayName','psinnor')
% plot(psinnor2(:,4).^2,'DisplayName','psinnor')
% title('Psi4^2');
% hold off;

 
%  hold on;
%  plot(t,yscsa);
%  plot([0,10],[yscsa(1),yscsa(1)]);
%  plot(t2,yscsa2)
%  plot(t1,yscsa1)

% figure
% hold on 
% plot(psinnor1(:,3).^2)
% plot(peak_indices2,peaks2,'s');
% hold off
figure
for j=1:32
    
    %hold on
    drawnow 
    plot (psinnor_N2(:,j).^2)
    pause(0.4)
    %hold off
end 