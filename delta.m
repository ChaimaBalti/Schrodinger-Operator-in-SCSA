% ## Copyright (C) 2024 user
% ##
% ## This program is free software: you can redistribute it and/or modify
% ## it under the terms of the GNU General Public License as published by
% ## the Free Software Foundation, either version 3 of the License, or
% ## (at your option) any later version.
% ##
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ##
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <https://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*-
% ## @deftypefn {} {@var{retval} =} delta (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: user <user@DESKTOP-DIOLJSB>
% ## Created: 2024-01-31


    %**********************************************************************
    %*********             Delata Metrix discretization           *********
    %**********************************************************************
function Dx = delta (n, fex,feh)
  ex = kron([(n-1):-1:1],ones(n,1));
  if mod(n,2)==0
    dx = -pi^2/(3*feh^2)-(1/6)*ones(n,1);
    test_bx = -(-1).^ex*(0.5)./(sin(ex*feh*0.5).^2);
    test_tx =  -(-1).^(-ex)*(0.5)./(sin((-ex)*feh*0.5).^2);
  else
    dx = -pi^2/(3*feh^2)-(1/12)*ones(n,1);
    test_bx = -0.5*((-1).^ex).*cot(ex*feh*0.5)./(sin(ex*feh*0.5));
    test_tx = -0.5*((-1).^(-ex)).*cot((-ex)*feh*0.5)./(sin((-ex)*feh*0.5));
  end
  Ex = full(spdiags([test_bx dx test_tx],[-(n-1):0 (n-1):-1:1],n,n));

  Dx=(feh/fex)^2*Ex;


end
