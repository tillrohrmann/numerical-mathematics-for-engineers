% ----------------------------------------------------------------------------
% vtkWrite(fname, p, e, t, uh)
% ----------------------------------------------------------------------------
%
% Writes a mesh and associated data in the VTK unstructured grid format (.vtu
% XML files). This function needs xmlWrite.m and takes the following arguments:
% 
%  fname    - the filename (e.g. 'solution.vtu')
%  p, e, t  - the MATLAB-style mesh description (1d/2d/3d)
%             (compare MATLAB's initmesh)
%  uh       - data associated with the points p. Useful for linear finite 
%             element basis functions. If omitted, only the mesh is written.
%
% Copyright (C) 2011 André Gaul <gaul@math.tu-berlin.de>
% Licensed under the GNU GPLv3 , http://www.gnu.org/licenses/gpl-3.0.html
% ----------------------------------------------------------------------------

function p11vtkWrite(fname, p, e, t, uh)
    % build xml element
    xml = struct('name', 'VTKFile', 'attr', struct('type', 'UnstructuredGrid'));
    
    dim = size(p,1);
    np = size(p,2);
    nt = size(t,2);
    % unstructured grid element
    ug = struct('name', 'UnstructuredGrid');
    piece = struct('name', 'Piece', 'attr', struct(...
        'NumberOfPoints', sprintf('%d', np),...
        'NumberOfCells', sprintf('%d', nt)...
        ));
    % fill points
    pointsda = struct('name', 'DataArray', 'attr', struct(...
        'NumberOfComponents', '3',...
        'type', 'Float32',...
        'format', 'ascii'...
        ));
    pointsda.subels = { sprintf('%f ', reshape([p;zeros(3-dim,np)], 3*np, 1)) };
    points = struct('name', 'Points');
    points.subels = {pointsda};

    % fill cells
    cellconda = struct('name', 'DataArray', 'attr', struct(...
        'Name', 'connectivity',...
        'type', 'Int32',...
        'format', 'ascii'...
        ));
    cellconda.subels = { sprintf('%d ', reshape(t, (dim+1)*nt, 1)-1 ) };
    celloffda = struct('name', 'DataArray', 'attr', struct(...
        'Name', 'offsets',...
        'type', 'Int32',...
        'format', 'ascii'...
        ));
    celloffda.subels = { sprintf('%d ', ((dim+1)*[1:nt] )) };
    celltypda = struct('name', 'DataArray', 'attr', struct(...
        'Name', 'types',...
        'type', 'Int32',...
        'format', 'ascii'...
        ));
    switch(dim)
        case 1
            vtkcelltype = 3;
        case 2
            vtkcelltype = 5;
        case 3
            vtkcelltype = 10;
        otherwise
            error(sprintf('dim %d not supported', dim));
    end
    celltypda.subels = { sprintf('%d ',  vtkcelltype*ones(nt,1))};
    cells = struct('name', 'Cells');
    cells.subels = {cellconda, celloffda, celltypda};
    piece.subels = { points, cells};

    % fill pointdata
    if (nargin>4 && ~isempty(uh))
        if (any(size(uh)~=[np,1]))
            error('uh size mismatch.');
        end
        uhda = struct('name', 'DataArray', 'attr', struct(...
            'Name', 'solution uh',...
            'type', 'Float32',...
            'format', 'ascii'...
            ));
        uhda.subels = { sprintf('%f ', uh )};
        pointdata = struct('name', 'PointData', 'attr', struct('Scalars', 'solution uh'));
        pointdata.subels = {uhda};
        piece.subels = {piece.subels{:}, pointdata};
    end

    ug.subels = {piece};
    xml.subels = {ug};

    p11xmlWrite(fname, xml);
end
