function[U] = p02gs(V)
% Programming Exercise Numerical Mathematics for Engineers II
% Homework 1
% Group: nm2-103
% Authors: Sophia Kohle (MatrNr.: 341322), Ana Kosareva (MatrNr.: 321785), Till Rohrmann (MatrNr.: 343756)
% 
% Using OCTAVE
	for i=1:3:columns(V)
		utemp = 0;
		for j=1:1:i-1
			utemp = utemp + dot(V(:,i),U(:,j))*U(:,j);
		end
	utemp = V(:,i)-utemp;
	U(:,i) = utemp/norm(utemp,2);
end
