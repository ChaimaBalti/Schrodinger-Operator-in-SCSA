function [psinnor_N1,psinnor_N2,psinnor_N3,kappa_N1,kappa_N2,kappa_N3,peaks_N1,peaks_N2,peaks_N3,indice_peak_N1,indice_peak_N2,indice_peak_N3] = reorganiser(psinnor,kappa)
%UNTITLED Summary of this function goes here
%cette fonction permet de determiner les psi normaliser- les K_n de chaque
%niveau ainsi que les valeurs et position de chaque pics a chaque niveaux 
%PARAMETRES:
%                           **** entrées*****:
%  psinnor : la matrice de tous les psi normalisee
%  kappa   : matrice dont les diagonalle ronforme les K_n
                           % *****Sorties****:
%psinnor_N1/psinnor_N2/psinnor_N3: se sont des matrices dont les colonnes
%represantent  les psi normalisées de niveau1/niveau2/niveau3

%kappa_N1/kappa_N2/kappa_N3:se sont des vecteurs de kappa (lamda(0.5))de chaque niveau 
%dont chaque valeurs kappa_N[i] est assissocie en psinnor_N[i]

% peaks_N1:(taille: 1Xnombres des psi qui ont une seule pics)
% peaks_N1(1,i): presente la valeurs de pics de psinnor_N1(:,i)(une seule
% pics)

%peaks_N2:(taille: 2Xnombres des psi qui ont 2 pics )
%peaks_N2(:,i): vecteur [pic1;pic2] presente les valeurs de pics de
%psinnor_N2(:,i)(2 pics)

%%peaks_N3:(taille: 3Xnombres des psi qui ont 3 pics)
%peaks_N3(:,i): vecteur [pic1;pic2;pic3] presente les valeurs de pics de
%psinnor_N3(:,i)(3 pics)

%indice_peak_Nj:jXnombres des psi qui ont j pics(j=1,2,3)
%indice_peak_Nj(:,i):vecteurs[indice de pics1;..;indice de picsj] presente
%les valeurs d'indice pics de peaks_Nj(:,i) 

n=size(psinnor);
psinnor_N1=[];
psinnor_N2=[];
psinnor_N3=[];

All_K_vect=diag(kappa);

kappa_N1=[];
kappa_N2=[];
kappa_N3=[];

indice_peak_N1=[];
indice_peak_N2=[];
indice_peak_N3=[];

peaks_N1=[];
peaks_N2=[];
peaks_N3=[];



%figure
for i=1:n(2)
    peaks = findpeaks(psinnor(:,i).^2);
    % Supprimer les valeurs nulles du vecteur peaks
    indices_non_zero = peaks > 10^(-7);
    peaks_non_zero = peaks(indices_non_zero);
    
    indices_pic=find(peaks > 10^(-7)); 
    
    m=size(peaks_non_zero);% nombre de peak 
    if(m(1)==1)
%         
%         drawnow;
%         plot(psinnor(:,i).^2)
%         pause(0.6);

        psinnor_N1=[psinnor_N1,psinnor(:,i)];%les colones sont les psi qui ont 1 pics
        kappa_N1=[kappa_N1,All_K_vect(i)];
        
        peaks_N1=[peaks_N1,peaks_non_zero];
        indice_peak_N1=[indice_peak_N1,indices_pic];

        
    elseif (m(1)==2)
%         drawnow;
%         plot(psinnor(:,i).^2)
%         hold on
%         pause(0.6);
        kappa_N2=[kappa_N2,All_K_vect(i)];        
        psinnor_N2=[psinnor_N2,psinnor(:,i)];%les colones sont les psi qui ont 2 pics
        peaks_N2=[peaks_N2,peaks_non_zero];
        indice_peak_N2=[indice_peak_N2,indices_pic];
     elseif (m(1)==3) 
%         drawnow;
%         plot(psinnor(:,i).^2)
%         pause(0.6);
        psinnor_N3=[psinnor_N3,psinnor(:,i)];%les colones sont les psi qui ont 3 pics
        kappa_N3=[kappa_N3,All_K_vect(i)];
        peaks_N3=[peaks_N3,peaks_non_zero];
        indice_peak_N3=[indice_peak_N3,indices_pic];
    end
    
end

end

