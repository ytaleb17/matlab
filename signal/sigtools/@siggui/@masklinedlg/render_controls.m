function render_controls(this)
%RENDER_CONTROLS

%   Author(s): J. Schickler
%   Copyright 2004-2005 The MathWorks, Inc.
%   $Revision: 1.1.6.3 $  $Date: 2005/06/16 08:46:15 $

sz = dialog_gui_sizes(this);

this.Container = uipanel('Parent', this.Parent, ...
    'Units', 'Pixels', ...
    'Position', sz.controls);

rendercontrols(this, sz.controls-[sz.controls(1:2) 0 0], {'EnableMask', ...
    'NormalizedFrequency', 'FrequencyVector', 'MagnitudeUnits', 'MagnitudeVector'});

hLayout = siglayout.gridbaglayout(this.Parent, ...
    'VerticalWeights',   [1 0], ...
    'HorizontalWeights', [1 0 0 0], ...
    'HorizontalGap',     5*sz.pixf, ...
    'VerticalGap',       5*sz.pixf);

hLayout.add(this.Container, 1, [1 4], ...
    'Fill', 'Both');

width = get(this.DialogHandles.ok, 'Position');
width = width(3);

hLayout.add(this.DialogHandles.ok, 2, 1, ...
    'Anchor', 'East', ...
    'MinimumWidth', width);

hLayout.add(this.DialogHandles.cancel, 2, 2, ...
    'MinimumWidth', width);

hLayout.add(this.DialogHandles.help, 2, 3, ...
    'MinimumWidth', width);

hLayout.add(this.DialogHandles.apply, 2, 4, ...
    'MinimumWidth', width);

hLayout = siglayout.gridbaglayout(this.Container, ...
    'VerticalWeights',   [0 0 0 0 1], ...
    'HorizontalWeights', [0 1 0], ...
    'VerticalGap',       5*sz.pixf, ...
    'HorizontalGap',     5*sz.pixf);

h = get(this, 'Handles');

% Add a label to show the frequency units.
h.frequencyunits = uicontrol(this.Container, ...
    'Style', 'text', ...
    'HorizontalAlignment', 'Left', ...
    'String', '0 to 1');

hLayout.add(h.enablemask, 1, [1 3], ...
    'TopInset', 2*sz.pixf, ...
    'Anchor', 'West', ...
    'PreferredWidth', largestuiwidth(h.enablemask)+20*sz.pixf);
hLayout.add(h.normalizedfrequency, 2, [1 3], ...
    'Anchor', 'West', ...
    'PreferredWidth', largestuiwidth(h.normalizedfrequency)+20*sz.pixf);
hLayout.add(h.frequencyvector_lbl, 3, 1, ...
    'TopInset', 3*sz.pixf, ...
    'Anchor', 'West', ...
    'MinimumWidth', largestuiwidth(h.frequencyvector_lbl));
hLayout.add(h.frequencyvector, 3, 2, ...
    'Fill', 'Horizontal');
hLayout.add(h.frequencyunits, 3, 3, ...
    'RightInset', 5*sz.pixf, ...
    'TopInset',   5*sz.pixf, ...
    'MinimumWidth', largestuiwidth(h.frequencyunits));
hLayout.add(h.magnitudeunits_lbl, 4, 1, ...
    'TopInset', 3*sz.pixf, ...
    'Anchor', 'West', ...
    'MinimumWidth', largestuiwidth(h.magnitudeunits_lbl));
hLayout.add(h.magnitudeunits, 4, [2 3], ...
    'RightInset', 5*sz.pixf, ...
    'Fill', 'Horizontal');
hLayout.add(h.magnitudevector_lbl, 5, 1, ...
    'TopInset', 3*sz.pixf, ...
    'Anchor', 'NorthWest', ...
    'MinimumWidth', largestuiwidth(h.magnitudevector_lbl));
hLayout.add(h.magnitudevector, 5, [2 3], ...
    'RightInset', 5*sz.pixf, ...
    'Anchor', 'North', ...
    'Fill', 'Horizontal');

set(this, 'Handles', h);
set(handles2vector(this), 'Visible', 'On');

% Add a listener to update the frequencyunits label.
l = get(this, 'WhenRenderedListeners');
l(end+1) = handle.listener(this, [this.findprop('FrequencyUnits'), ...
    this.findprop('NormalizedFrequency')], 'PropertyPostSet', @frequencyunits_listener);
set(l(end), 'CallbackTarget', this);
set(this, 'WhenRenderedListeners', l);

% Update the frequency units label.
frequencyunits_listener(this);

% -------------------------------------------------------------------------
function frequencyunits_listener(this, eventData)

h = get(this, 'Handles');

if this.NormalizedFrequency
    str = '0 to 1';
else
    str = this.FrequencyUnits;
end

set(h.frequencyunits, 'String', str);

% [EOF]
