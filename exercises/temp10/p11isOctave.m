% ----------------------------------------------------------------------------
% v = p11isOctave()
% ----------------------------------------------------------------------------
%
% returns 
%   1  if code is run in octave and 
%   0  if it is run under MATLAB and
%
% Copyright (C) 2011 André Gaul <gaul@math.tu-berlin.de>
% Licensed under the GNU GPLv3 , http://www.gnu.org/licenses/gpl-3.0.html
% ----------------------------------------------------------------------------

function v = p11isOctave()
    vo=ver('octave');
    if (~isempty(vo))
        v=1;
    else
        v=0;
    end
end
