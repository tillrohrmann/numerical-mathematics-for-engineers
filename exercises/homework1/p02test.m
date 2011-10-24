% Programming Exercise Numerical Mathematics for Engineers II
% Homework 1
% Authors: Sophie Kohle (MatrNr.: ), Ana Kosareva (MatrNr.: ), Till Rohrmann (MatrNr.: 343756)
% 
% Using OCTAVE

function [Fgs, Fmgs] = p02test()
	for j=1:1:10
		V=rand(500,50*j);
		Ugs = p02gs(V);
		Umgs=p02mgs(V);
		Fgs(j) = F(Ugs);
		Fmgs(j)=F(Umgs);
	end
endfunction

function[n] = F(U)
	n=norm(eye(columns(U))-U'*U,"fro");
endfunction
