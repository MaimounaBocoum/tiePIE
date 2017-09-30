% Lancement scan de pression avec interferometre
figure('Position',[300 300 560 300])

uicontrol('Style', 'text','Fontsize',20,'string','min(mm)', 'Position', [120 255 130 35],'Callback', '');

uicontrol('Style', 'text','Fontsize',20,'string','max(mm)', 'Position', [260 255 130 35],'Callback', '');

uicontrol('Style', 'text','Fontsize',20,'string','pas(mm)', 'Position', [400 255 130 35],'Callback', '');

%% x
uicontrol('Style', 'text','Fontsize',20,'string','x', 'Position', [10 205 100 35],'Callback', '');

x1=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [120 205 130 35],'Callback', '');

x2=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [260 205 130 35],'Callback', '');

x3=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [400 205 130 35],'Callback', '');

%% y
uicontrol('Style', 'text','Fontsize',20,'string','y', 'Position', [10 155 100 35],'Callback', '');

y1=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [120 155 130 35],'Callback', '');

y2=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [260 155 130 35],'Callback', '');

y3=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [400 155 130 35],'Callback', '');

%% z
uicontrol('Style', 'text','Fontsize',20,'string','z', 'Position', [10 105 100 35],'Callback', '');

z1=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [120 105 130 35],'Callback', '');

z2=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [260 105 130 35],'Callback', '');

z3=uicontrol('Style', 'edit','Fontsize',20,'string','0', 'Position', [400 105 130 35],'Callback', '');


uicontrol('Style', 'pushbutton','Fontsize',20,'String', 'START','Position', [100 10 400 80],'Callback', 'Start;');
