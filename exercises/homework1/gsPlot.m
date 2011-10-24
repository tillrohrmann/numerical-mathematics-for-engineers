% Programming Exercise Numerical Mathematics for Engineers II
% Homework 1
% Authors: Sophie Kohle (MatrNr.: ), Ana Kosareva (MatrNr.: ), Till Rohrmann (MatrNr.: 343756)
% 
% Using OCTAVE
%
% gsPlot creates the plot of ||I-U^{T}U||_{fro} with U containing the orthogonalized vectors of a
% random matrix of the size (500x50j) with 0 < j < 11

function gsPlot()
	clf;
	[Fgs, Fmgs] = p02test();
	x=1:1:10;
	x=x*50;
	p = semilogy(x,Fgs,'-r',x,Fmgs,'-g');
	ylabel("||I - U^{T}U||_{Fro}");
	xlabel("Number of orthogonalized vectors");
	hleg1 = legend('Fgs','Fmgs');
endfunction
