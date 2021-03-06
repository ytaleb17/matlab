function examples = getexamples(this)
%GETEXAMPLES   Get the examples.

%   Author(s): V. Pellissier
%   Copyright 2005 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $  $Date: 2005/06/30 17:38:52 $

examples = {{ ...
    'Design an arbitrary-magnitude real FIR filter.', ...
    'B1 = 0:0.01:0.18;B2 = [.2 .38 .4 .55 .562 .585 .6 .78];B3 = [0.79:0.01:1];',...
    'A1 = .5+sin(2*pi*7.5*B1)/4;    % Sinusoidal section',...
    'A2 = [.5 2.3 1 1 -.2 -.2 1 1]; % Piecewise linear section',...
    'A3 = .2+18*(1-B3).^2;          % Quadratic section',...
    'F = [B1 B2 B3];',...
    'A = [A1 A2 A3];', ...
    'N = 300;',...
    'd = fdesign.arbmag(''N,F,A'',N,F,A);',...
    'Hd = design(d,''freqsamp'',''Window'',{@kaiser,.5});',...
    'fvtool(Hd)'},...
    { ...
    'Design an arbitrary-magnitude complex FIR filter.', ...
    'F = [-1 -.93443 -.86885 -.80328 -.7377 -.67213 -.60656 -.54098 -.47541,...',...
    '   -.40984 -.34426 -.27869 -.21311 -.14754 -.081967 -.016393 .04918 .11475,...',...
    '   .18033 .2459 .31148 .37705 .44262 .5082 .57377 .63934 .70492 .77049,...',...
    '   .83607 .90164 1];',...
    'A = [.0095848 .021972 .047249 .099869 .23119 .57569 .94032 .98084 .99707,...',...
    '   .99565 .9958 .99899 .99402 .99978 .99995 .99733 .99731 .96979 .94936,...',...
    '   .8196 .28502 .065469 .0044517 .018164 .023305 .02397 .023141 .021341,...',...
    '   .019364 .017379 .016061];', ...
    'N = 48;',...
    'd = fdesign.arbmag(''N,F,A'',N,F,A);',...
    'Hd = design(d,''freqsamp'',''Window'',''rectwin'');',...
    'fvtool(Hd)'}};


% [EOF]
