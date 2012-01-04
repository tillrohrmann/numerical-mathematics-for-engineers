% ----------------------------------------------------------------------------
% msh = getMshUnit(dim, npoints)
% ----------------------------------------------------------------------------
% 
% create unit interval (dim=1) / square (dim=2) / cube (dim=3) mesh with
% npoints+2 nodes (including the 2 boundary nodes) per dimension. npoints is
% thus the number of inner nodes per dimension and the mesh size is
% h=1/(npoints+1).
%
% For octave this function needs the 'msh' package (version >= 1.0.2)
% (http://octave.sourceforge.net/msh/index.html)
% 
% Copyright (C) 2011 André Gaul <gaul@math.tu-berlin.de>
% Licensed under the GNU GPLv3 , http://www.gnu.org/licenses/gpl-3.0.html
% ----------------------------------------------------------------------------

function [p,e,t] = p11mshUnit(dim, npoints)
    switch(dim)
        case 1
            p=linspace(0,1,npoints+2);
            e=[1,npoints+2];
            t=[1:npoints+1;2:npoints+2];
        case 2
            if (p11isOctave())
                xh = linspace(0, 1, npoints+2);
                msh = msh2m_structured_mesh(xh, xh, 1, 1:4);
                p = msh.p(1:dim,:);
                e = msh.e(1:dim,:);
                t = msh.t(1:dim+1,:);
            else
                % geometry description (oh, don't ask why)
                gd = [3;4;0;1;1;0;0;0;1;1]; 
                dl = decsg(gd);
                [p,e,t] = poimesh(dl,npoints+1,npoints+1);
                e = e(1:2,:);
                t = t(1:3,:);
            end
        case 3 
            if (p11isOctave())
                xh = linspace(0, 1, npoints+2);
                msh = msh3m_structured_mesh(xh, xh, xh, 1, 1:6);
                p = msh.p;
                e = msh.e(1:dim,:);
                t = msh.t(1:dim+1,:);
            else
                xh = linspace(0, 1, npoints+2);
                [X,Y,Z] = meshgrid(xh,xh,xh);
                p = [X(:),Y(:),Z(:)]';
                T = DelaunayTri(p');
                t = T.Triangulation';
                % we have to add the boundary seperately
                e = freeBoundary(T)';
            end
        otherwise
            error('dimension %d not implemented', dim);
    end
end
