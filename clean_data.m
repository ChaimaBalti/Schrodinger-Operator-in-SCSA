function dataframe = clean_data(data,t_stop,t)
%permet de convertir data en une data qui contient des liste des signaux de
%PPG dans une periodee [0,t_stop]

%determiner indice de t_stop dans t 
indice = find(t >= t_stop, 1);
numeros_echantillons = (1:1002)';
signaux_PPG = cell(1002, 1); % Initialise une cellule vide
% Supposons que vous avez déjà vos signaux PPG dans une cellule appelée ppg_cell
for i=1:1002
    PPG_F_i=convert_sample(data(i,14));
    signaux_PPG{i,1}= PPG_F_i(1:indice);
end 
% Créer une table
dataframe = table(numeros_echantillons, signaux_PPG);

% Renommer les colonnes si nécessaire
dataframe.Properties.VariableNames = {'Numéro', 'Signal_PPG'};
end

