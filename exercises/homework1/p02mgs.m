function[U] = p02mgs(V)
% Programming Exercise Numerical Mathematics for Engineers II
% Homework 1
% Group: nm2-103
% Authors: Sophia Kohle (MatrNr.: 341322), Ana Kosareva (MatrNr.: 321785), Till Rohrmann (MatrNr.: 343756)
% 
% Using OCTAVE
	for i=1:1:columns(V)
		utemp = V(:,i);
		for j=1:1:i-1
			utemp = utemp - dot(utemp,U(:,j))*U(:,j);
		end
		U(:,i)=utemp/norm(utemp,2);
	end
endfunction
