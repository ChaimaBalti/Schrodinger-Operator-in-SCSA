clear;
h=20;
gm=0.5;
t_stop=10;
fs=120;


data = readtable('alldata.csv');
echantillon=data(7,14);%table size (0,1) de type char format liste 
liste_nombres=  convert_sample(echantillon);
t = (1/fs) * (0:length(liste_nombres)-1); % Les instants de temps commencent à 0

indice = find(t >= t_stop, 1); 
liste_nombres=liste_nombres(1:indice);%signal PPG_F prris pour t<10s

[h,yscsa,Nh,psinnor,kappa,~,~] = SCSA_1D (liste_nombres, fs,h,gm);
lamda1=diag(kappa);
%si fs: sampling frequence 

t = (1/fs) * (0:length(liste_nombres)-1); % Les instants de temps commencent à 0


% determiner vecteur des valeurs propres 
All_K_vect=diag(kappa);


%la premiere periode commence pour t appartient [0,0.9167]
min=find((t>=0.9167),1);
t1=t(1:min);
liste_nombres1=liste_nombres(1:min);
[h,yscsa1,Nh1,psinnor1,kappa1,~,~] = SCSA_1D (liste_nombres1, fs,h,gm);
kappa1_vect=diag(kappa1);


%la deusieme  periode commence pour t appartient [0.9167,1.458]
min=find((t>=0.9167),1);
max=find(t>=1.458,1);
t2=t(min:max);
liste_nombres2=liste_nombres(min:max);
[h,yscsa2,Nh2,psinnor2,kappa2,Ymin,squaredEIGF0] = SCSA_1D (liste_nombres2, fs,h,gm);
kappa2_vect=diag(kappa2);




[psinnor_N1,psinnor_N2,psinnor_N3,kappa_N1,kappa_N2,kappa_N3,peaks_N1,peaks_N2,peaks_N3,indice_peak_N1,indice_peak_N2,indice_peak_N3] = reorganiser(psinnor,kappa);
dataframe = clean_data(data,t_stop,t);

%ajouter les colonnes de psinnor_Nj , kappa_Nj , peaks_Nj et indice_pics_Nj de chaque niveau  j(j=1,2,3) 
colonne_psinnor_N1= cell(1002, 1); % Initialise une cellule vide
colonne_psinnor_N2= cell(1002, 1); % Initialise une cellule vide
colonne_psinnor_N3= cell(1002, 1); % Initialise une cellule vide

colonne_kappa_N1= cell(1002, 1); % Initialise une cellule vide
colonne_kappa_N2= cell(1002, 1); % Initialise une cellule vide
colonne_kappa_N3= cell(1002, 1); % Initialise une cellule vide

colonne_valeurs_pics_N1= cell(1002, 1); % Initialise une cellule vide
colonne_valeurs_pics_N2= cell(1002, 1); % Initialise une cellule vide
colonne_valeurs_pics_N3= cell(1002, 1); % Initialise une cellule vide

colonne_indices_pics_N1= cell(1002, 1); % Initialise une cellule vide
colonne_indices_pics_N2= cell(1002, 1); % Initialise une cellule vide
colonne_indices_pics_N3= cell(1002, 1); % Initialise une cellule vide


N=2;%numero des echantillant changer N=1002(numero de lignes dans dataframe)
for num_pat=1:N
    echatillon0=table2array(dataframe(num_pat,2));
    echantillontype_liste=echatillon0{1,1}; %faire un appel
    [h,yscsa,Nh,psinnor,kappa,Ymin,squaredEIGF0] = SCSA_1D (echantillontype_liste, fs,h,gm);
    [psinnor_N1,psinnor_N2,psinnor_N3,kappa_N1,kappa_N2,kappa_N3,peaks_N1,peaks_N2,peaks_N3,indice_peak_N1,indice_peak_N2,indice_peak_N3] = reorganiser(psinnor,kappa);


    colonne_psinnor_N1{num_pat,1}=psinnor_N1;
    colonne_psinnor_N2{num_pat,1}=psinnor_N2;
    colonne_psinnor_N3{num_pat,1}=psinnor_N3;
    
    colonne_kappa_N1{num_pat,1}=kappa_N1;
    colonne_kappa_N2{num_pat,1}=kappa_N2;
    colonne_kappa_N3{num_pat,1}=kappa_N3;
    
    colonne_valeurs_pics_N1{num_pat,1}=peaks_N1;
    colonne_valeurs_pics_N2{num_pat,1}=peaks_N2;
    colonne_valeurs_pics_N3{num_pat,1}=peaks_N3;
    
    colonne_indices_pics_N1{num_pat,1}=indice_peak_N1;
    colonne_indices_pics_N2{num_pat,1}=indice_peak_N2;
    colonne_indices_pics_N3{num_pat,1}=indice_peak_N3;
    
end
dataframe.Psi_Normalise_Niveau1 = colonne_psinnor_N1;
dataframe.K_Niveau1 = colonne_kappa_N1;
dataframe.Valeurs_Pics_Niveau1=colonne_valeurs_pics_N1;
dataframe.Indices_Pics_Niveau1=colonne_indices_pics_N1;

dataframe.Psi_Normalise_Niveau2 = colonne_psinnor_N2;
dataframe.K_Niveau2= colonne_kappa_N2;
dataframe.Valeurs_Pics_Niveau2=colonne_valeurs_pics_N2;
dataframe.Indices_Pics_Niveau2=colonne_indices_pics_N2;


dataframe.Psi_Normalise_Niveau3= colonne_psinnor_N3;
dataframe.K_Niveau3= colonne_kappa_N3;
dataframe.Valeurs_Pics_Niveau3=colonne_valeurs_pics_N3;
dataframe.Indices_Pics_Niveau3=colonne_indices_pics_N3;

%comment faire un appel : 
%echatillon2=table2array(dataframe(numero de patient ,numero de colonne));
%echantillontype_array=echatillon2{1,1}; %faire un appel;



