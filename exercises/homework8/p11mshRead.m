% ----------------------------------------------------------------------------
% [p,e,t] = p11mshRead(fname, dim)
% ----------------------------------------------------------------------------
%
% general notation:
%  np        - number of point
%  nt        - number of elements
%  ne        - number of subelements
%  ntt       - number of distinct tags for elements
%  net       - number of distinct tags for subelements
%
% a mesh msh consists of the following fields:
% 
%  p         - coordinates of the mesh's points. 
%              size(p) == [dim,np]
%  t         - maps elements to points. 
%              size(t) == [dim+1,nt]
%  e         - maps subelements on the boundary to points. 
%              size(e) == [dim,ne]
%  t2e       - maps elements to subelements.
%              size(t2e) == [dim+1,nt], t2e is sparse
%              t2e(i,j) is the i-th local subelement of the element j (zero if
%              there is no i-th local subelement).
%  e2t       - maps subelements to elements.
%              size(e2t) == [2,ne]
%              e2t(1,i) is the element to which the subelement i belongs
%              and e2t(2,i) is the local index.
%  ttags     - vector of distinct tags appearing in t2tags.
%              size(ttags)==[1,ntt]
%  t2tags    - cell array that maps elements to its tags.
%              size(t2tags)==[1,nt]
%  tags2t    - cell array that maps tags to elements
%              size(tags2t)==[1,ntt]
%              tags2t{i} is an array of elements tagged with the tag 
%              ttags(i).
%  etags     - vector of distinct tags appearing in e2tags.
%              size(etags)==[1,net]
%  e2tags    - cell array that maps subelements to its tags
%              size(e2tags)==[1,ne]
%  tags2e    - cell array that maps tags to subelements
%              size(tags2e)==[1,net]
%              tags2e{i} is an array of subelements tagged with the tag 
%              etags(i).
%
% reads a mesh written by gmsh (ascii).
%
% details of the gmsh ascii file format:
% http://geuz.org/gmsh/doc/texinfo/gmsh.html#MSH-ASCII-file-format
%
% Copyright (C) 2011 André Gaul <gaul@math.tu-berlin.de>
% Licensed under the GNU GPLv3 , http://www.gnu.org/licenses/gpl-3.0.html
% ----------------------------------------------------------------------------

function [p,e,t] = p11mshRead(fname, dim)
    % open file
    [fid,msg] = fopen(fname, 'r');
    if (fid==-1)
        error(sprintf('Error opening file "%s": %s', fname, msg));
    end

    msh = struct;
    while (1)
        % read new line
        sec = fgetl(fid);
        % end of file?
        if (sec==-1)
            break
        end

        % at this point we expect a section keyword
        switch (sec)
            case '$MeshFormat'
                cnt=1;
                while (1)
                    line=getSecLine(fid, sec);
                    if (line==-1), break, end
                    % work!
                    if (cnt==1)
                        format = stringsplit(line, ' ');
                        if (format{1} ~= 2.2)
                            warning('written for version 2.2');
                        end
                        if (format{2} ~= 0)
                            error('only ascii format supported!');
                        end
                    else
                        warning('more than 1 MeshFormat line.');
                    end
                    cnt=cnt+1;
                end

            case '$Comments'
                while (1)
                    line=getSecLine(fid, sec);
                    if (line==-1), break, end
                    % work!
                end

            case '$Nodes'
                cnt=1;
                while (1)
                    line=getSecLine(fid, sec);
                    if (line==-1), break, end
                    % work!
                    if (cnt==1)
                        nodenum = stringsplit(line);
                        nodenum = nodenum{1};
                        msh.p=zeros(dim,nodenum);
                    else
                        node = stringsplit(line);
                        if (node{1}>nodenum)
                            error('node index out of bounds.');
                        end
                        for i=1:dim
                            msh.p(i,node{1}) = node{1+i};
                        end
                    end
                    cnt=cnt+1;
                end

            case '$Elements'
                cnt=1;
                while (1)
                    line=getSecLine(fid, sec);
                    if (line==-1), break, end
                    % work!
                    if (cnt==1)
                        elnum = stringsplit(line);
                        elnum = elnum{1};
                        % read ALL the elements (and sort later)
                        % (http://knowyourmeme.com/memes/x-all-the-y)
                        els=zeros(4,elnum);   % 4 is max # of nodes (for 3d simplex)
                        eltypes=zeros(1,elnum);
                        eltags=cell(1,elnum);
                    else
                        el = stringsplit(line);
                        if (el{1}>elnum)
                            error('element index out of bounds.');
                        end
                        eltypes(el{1}) = el{2};
                        eltagnum = el{3};
                        eltags{el{1}} = zeros(1,eltagnum);
                        for i=1:eltagnum
                            eltags{el{1}}(i) = el{3+i};
                        end
                        % we only support simplices here!
                        switch (eltypes(el{1}))
                            case 1 % 2-node line
                                nodenum=2;
                            case 2 % 3-node triangle
                                nodenum=3;
                            case 4 % 4-node tetrahedron
                                nodenum=4;
                            case 15 % 1-node point
                                nodenum=1;
                            otherwise
                                error(sprintf('element type %d not implemented', eltype));
                        end
                        if (nodenum>4) 
                            error('nodenum %d for element %d out of bounds.', nodenum, el{1});
                        end
                        % store nodes
                        for i=1:nodenum
                            els(i,el{1}) = el{3+eltagnum+i};
                        end
                    end
                    cnt=cnt+1;
                end

                % process elements
                types=[15,1,2,4];
                for i=1:4 % iterate over dimension
                    el{i} = struct;
                    eli = find(eltypes==types(i));
                    el{i}.els = els(1:i,eli);
                    el{i}.el2tags = {eltags{eli}};
                    [el{i}.tags, el{i}.tag2els] = gettag2els(el{i}.el2tags);
                end

                % get the matlab [p, e, t] format
                msh.t = el{dim+1}.els;
                msh.ttags = el{dim+1}.tags;
                msh.t2tags = el{dim+1}.el2tags;
                msh.tags2t = el{dim+1}.tag2els;
                msh.e = el{dim}.els;
                msh.etags = el{dim}.tags;
                msh.e2tags = el{dim}.el2tags;
                msh.tags2e = el{dim}.tag2els;
                msh.optional = struct;
                msh.optional.el = el;

                % get super-to-sub-simplex mapping (and vice versa)
                %[msh.e2t, msh.t2e] = getMshSubSup(msh.t, msh.e);
                
            otherwise
                warning(sprintf('section "%s" not implemented.', sec));
                while (1)
                    line=getSecLine(fid, sec);
                    if (line==-1), break, end
                    % work!
                end
        end
    end

    p=msh.p;
    e=msh.e;
    t=msh.t;

    % check if all points are referenced!
    pref=zeros(size(p,1),1);
    for i=1:size(t,1)
        pref(t(i,:))=1;
    end
    for i=1:size(e,1)
        pref(e(i,:))=1;
    end
    old2new=[1:size(p,2)];
    for i=find(pref==0)'
        old2new(i:end)=old2new(i:end)-1;
    end
    for i=1:size(t,1)
        t(i,:)=old2new(t(i,:));
    end
    for i=1:size(e,1)
        e(i,:)=old2new(e(i,:));
    end
    p=p(:,find(pref~=0));

    % close file
    fclose(fid);
end

function secend=getSecEnd(sec)
    secend=['$End',sec(2:end)];
end

function line=getSecLine(fid, sec)
    line = fgetl(fid);
    if (line==-1)
        error(sprintf('section "%s" not closed properly.', sec));
    end
    if (strcmp(line,getSecEnd(sec)))
        line=-1;
    end
end

% MATLAB® does not have a good stringsplit, so we go with our own. 
% We additionally convert the parts to doubles (if possible)
function parts = stringsplit(str, delim)
    if (nargin<2)
        delim=' ';
    end
    parts={};
    rem=str;
    while (1)
        [part, rem] = strtok(rem, delim);
        if (isempty(part))
            break
        end
        % convert the part
        partnum = str2double(part);
        if (~isnan(partnum))
            part = partnum;
        end
        parts={ parts{:}, part};
    end
end

function [tagsfound, tag2els] = gettag2els(el2tags)
    tagsfound=[]; % tagsfound(i) is the i-th tag that is found
    tagscount=[]; % tagscount(i) is the number of times that the tag tagsfound(i) is found
    tag2els={};
    for i=1:length(el2tags) % i is element index
        for j=1:length(el2tags{i}) % j
            tag = el2tags{i}(j);
            if (isempty(find(tagsfound==tag)))
                tagsfound = [tagsfound, tag];
                tagscount = [tagscount, 0];
                tag2els{length(tagsfound)} = zeros(1,length(el2tags)-i);
            end
            k=find(tagsfound==tag); % index into tagsfound, tagscount and tag2els
            tagscount(k) = tagscount(k) + 1;
            tag2els{k}(tagscount(k)) = i;
        end
    end
    for i=1:length(tagsfound)
        tag2els{i}=tag2els{i}(1:tagscount(i));
    end
end
