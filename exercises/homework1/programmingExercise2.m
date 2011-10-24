% Programming Exercise Numerical Mathematics for Engineers II
% Homework 1
% Authors: Sophie Kohle (MatrNr.: ), Ana Kosareva (MatrNr.: ), Till Rohrmann (MatrNr.: 343756)
% 
% Using OCTAVE

function[U] = p02gs(V)
	for i=1:1:columns(V)
		utemp = 0;
		for j=1:1:i-1
			utemp = utemp + dot(V(:,i),U(:,j))*U(:,j);
		end
		utemp = V(:,i)-utemp;
		U(:,i) = utemp/norm(utemp,2);
	end
endfunction

function[U] = p02mgs(V)
	for i=1:1:columns(V)
		utemp = V(:,i);
		for j=1:1:i-1
			utemp = utemp - dot(utemp,U(:,j))*U(:,j);
		end
		U(:,i)=utemp/norm(utemp,2);
	end
endfunction

function[n] = F(U)
	n=norm(eye(columns(U))-U'*U,"fro");
endfunction

function [Fgs, Fmgs] = p02test()
	for j=1:1:10
		V=rand(50,5*j);
		Ugs = p02gs(V);
		Umgs=p02mgs(V);
		Fgs(j) = F(Ugs);
		Fmgs(j)=F(Umgs);
	end
endfunction

function plotGS()
	[Fgs, Fmgs] = p02test();
	plot(Fgs);
	plot(Fmgs);
endfunction