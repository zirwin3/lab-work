function HeadModel = in_headmodel_bst(HeadModelFile, ApplyOrient, varargin)
% IN_HEADMODEL_BST: Wrapper for in_bst_headmodel (added for backward compatibility)

% @=============================================================================
% This function is part of the Brainstorm software:
% https://neuroimage.usc.edu/brainstorm
% 
% Copyright (c) University of Southern California & McGill University
% This software is distributed under the terms of the GNU General Public License
% as published by the Free Software Foundation. Further details on the GPLv3
% license can be found at http://www.gnu.org/copyleft/gpl.html.
% 
% FOR RESEARCH PURPOSES ONLY. THE SOFTWARE IS PROVIDED "AS IS," AND THE
% UNIVERSITY OF SOUTHERN CALIFORNIA AND ITS COLLABORATORS DO NOT MAKE ANY
% WARRANTY, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, NOR DO THEY ASSUME ANY
% LIABILITY OR RESPONSIBILITY FOR THE USE OF THIS SOFTWARE.
%
% For more information type "brainstorm license" at command prompt.
% =============================================================================@
%
% Authors: Francois Tadel, 2016

% Display warning
warning('Use in_bst_headmodel instead.');
% Just call in_bst_headmodel()
if (nargin > 2)
    HeadModel = in_bst_headmodel(HeadModelFile, ApplyOrient, varargin{:});
elseif (nargin == 2)
    HeadModel = in_bst_headmodel(HeadModelFile, ApplyOrient);
elseif (nargin == 1)
    HeadModel = in_bst_headmodel(HeadModelFile);
end

