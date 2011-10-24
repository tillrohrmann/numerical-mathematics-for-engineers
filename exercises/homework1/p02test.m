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
	clf;
	x=1:1:10;
	x=x*50;
	p = semilogy(x,Fgs,'-r',x,Fmgs,'-g');
	ylabel("||I - U^{T}U||_{Fro}");
	xlabel("Number of orthogonalized vectors");
	hleg1 = legend('Fgs','Fmgs');
endfunction

function[n] = F(U)
	n=norm(eye(columns(U))-U'*U,"fro");
endfunction
