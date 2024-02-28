function liste_nombres = convert_sample(echantillon)
%cette fonction permet de convertir chaque echantillon de la data en une
%liste 
%   Detailed explanation goes here
% Supprimer les crochets de début et de fin
echantillon=table2array(echantillon);
echantillon1=echantillon{1,1};
echantillon1 = echantillon1(2:end-1);
% Séparer la chaîne en sous-chaînes basées sur les virgules
sous_echantillon = strsplit(echantillon1, ',');

% Convertir les sous-chaînes en nombres
liste_nombres = str2double(sous_echantillon);
end

