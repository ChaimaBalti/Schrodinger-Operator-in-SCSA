h=20;
gm=0.5;
data = readtable('alldata.csv');
y=table2array(data(:,1));
fs=120;
t=testvect();
tyty1=t(1:180);
[h,yscsa,Nh,psinnor,kappa,Ymin,squaredEIGF0]= SCSA_1D(tyty1,fs,h,gm);

%while (i<=7265)
  %plot(psinnor(:,i))
  %i++
%end
%hold off
All_lamda=-kappa;
All_lamda_vect=diag(All_lamda);

% Trier le vecteur pour faciliter le comptage
all_lamda_sorted = sort(diag(All_lamda));

% Initialiser les variables pour stocker les valeurs uniques et leurs occurrences
unique_values = [];
occurrences = [];

% Compter les occurrences de chaque valeur unique
while ~isempty(all_lamda_sorted)
    % Prendre la première valeur
    value = all_lamda_sorted(1);

    % Trouver le nombre d'occurrences de cette valeur
    count = sum(round(all_lamda_sorted) == round(value));
    if (count<4)
      % Ajouter cette valeur unique et son nombre d'occurrences aux listes (seulement les niviea 1 2 3 )
      unique_values = [unique_values, value];
      occurrences = [occurrences, count];
    end
    % Supprimer toutes les occurrences de cette valeur du vecteur
    all_lamda_sorted(round(all_lamda_sorted) == round(value)) = [];
end






