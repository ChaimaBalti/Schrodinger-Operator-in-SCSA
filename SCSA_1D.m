%% Copyright (C) 2024 user
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <https://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @deftypefn {} {@var{retval} =} SCSA_1D (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: user <user@DESKTOP-DIOLJSB>
%% Created: 2024-01-31

%this function return :
%***yscsa : signal after the SCSA methode *****
%*** Nh   :number of negative eigenvalues*****
%***psinnor:  The L^2 normalized eigenfunction of the negarive eigenvalues*****
%***kappa  :  matrix of norm of negative eigenvalues^gm*****
%***Ymin : min of the signal y *****
%***squaredEIGF0?
function [h,yscsa,Nh,psinnor,kappa,Ymin,squaredEIGF0] = SCSA_1D (y, fs,h,gm)
  Lcl = (1/(2*sqrt(pi)))*(gamma(gm+1)/gamma(gm+(3/2)));
  N=max(size(y));
  %% remove the negative part
  Ymin=min(y);

  y_scsa = y -Ymin;
  %% Build Delta metrix for the SC_hSA
  feh = 2*pi/N;
  D=delta(N,fs,feh);

  %% start the SC_hSA
  Y = diag(y_scsa);
  SC_h = -h*h*D-Y; % The Schrodinger operaor

  % = = = = = = Begin : The eigenvalues and eigenfunctions
  [psi,lamda] = eig(SC_h); % All eigenvalues and associated eigenfunction of the schrodinger operator
  % Choosing  eigenvalues
  All_lamda = diag(lamda);
  ind = find(All_lamda<0);


  %  negative eigenvalues
  Neg_lamda = All_lamda(ind);
  kappa = diag((abs(Neg_lamda)).^gm);
  Nh = size(ind,1); %%#ok<NASGU> % number of negative eigenvalues



  if Nh~=0

    % Associated eigenfunction and normalization
    psin = psi(:,ind(:,1)); % The associated eigenfunction of the negarive eigenvalues
    I = simp(psin.^2,fs); % Normalization of the eigenfunction
    psinnor = psin./sqrt(I);  % The L^2 normalized eigenfunction


    %yscsa =4*h*sum((psinnor.^2)*kappa,2); % The 1D SC_hSA formula
    yscsa1 =((h/Lcl)*sum((psinnor.^2)*kappa,2)).^(2/(1+2*gm));
  else

      psinnor = 0*psi;  % The L^2 normalized eigenfunction
      yscsa1=0*y;
      yscsa1=yscsa1-10*abs(max(y));
      disp('There are no negative eigenvalues. Please change the SCSA parameters: h, gm ')
  end


  if size(y_scsa) ~= size(yscsa1)
    yscsa1 = yscsa1';
  end

   %% add the removed negative part
   yscsa = yscsa1 + Ymin;


  squaredEIGF0=(h/Lcl)*(psinnor.^2)*kappa;

end
