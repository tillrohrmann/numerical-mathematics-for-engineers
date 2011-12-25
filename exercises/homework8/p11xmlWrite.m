% ----------------------------------------------------------------------------
% xmlWrite(fname, el)
% ----------------------------------------------------------------------------
%
% el is a XML element struct with the following fields:
%       
%   name      - the element's name.
%   attr      - a struct with the attributes and their values
%   subels    - a cell array with data strings or element structs.
% 
% Thus the written XML file looks like this (with anames=fieldnames(attr)):
%   <name anames{1}="getfield(attr,anames{1})" ...>
%       subels{1}
%       ...
%   </name>
%
% Copyright (C) 2011 André Gaul <gaul@math.tu-berlin.de>
% Licensed under the GNU GPLv3 , http://www.gnu.org/licenses/gpl-3.0.html
% ----------------------------------------------------------------------------

function p11xmlWrite(fname, el)
    fid = fopen(fname, 'w');
    xmlWriteEl(fid, el, 0);
    fclose(fid);
end

function xmlWriteEl(fid, el, level)
    % write start tag
    indent(fid, level);
    fprintf(fid, '<%s', el.name);
    
    % write attributes
    if (isfield(el, 'attr'))
        attrnames = fieldnames(el.attr);
        for i=1:length(attrnames)
            fprintf(fid, ' %s="%s"', attrnames{i}, getfield(el.attr, attrnames{i}));
        end
    end

    fprintf(fid, '>\n');
    
    % write data and subelements
    if (isfield(el, 'subels'))
        for i=1:length(el.subels)
            % data
            if (ischar(el.subels{i}))
                indent(fid, level+1);
                fprintf(fid, '%s\n', el.subels{i});

            % subelement
            elseif (isstruct(el.subels{i}))
                xmlWriteEl(fid, el.subels{i}, level+1);
            else
                error('subelement type not recognized.');
            end
        end
    end

    % write end tag
    indent(fid, level);
    fprintf(fid, '</%s>\n', el.name);
end

function indent(fid, level)
    fprintf(fid, sprintf('%% %ds', level), '');
end
