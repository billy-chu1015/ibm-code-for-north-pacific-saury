clc
clear


line = load('boundary_world_360.dat');

[a,b] = find(isnan(line)==1);

nzone = size(a,1)/2;

kcolor = [210 180 140]/255;

figure

for i = 1:nzone

    fill( ...
        line(a(i)+1:a(i+1)-1,1), ...
        line(a(i)+1:a(i+1)-1,2), ...
        kcolor);

    hold on

end
xlim([125,170])
ylim([18,45]);

folder='D:\track2010.ll';

s=load(fullfile(folder,'track2010_ll_1.dat'));

myp=plot(s(:,1),s(:,2),'r.');

axis equal

myt=title('Trajectory 1');


for ii=2:249

    s=load(fullfile(folder,...
        sprintf('track2010_ll_%d.dat',ii)));

    set(myp,...
        'xdata',s(:,1),...
        'ydata',s(:,2));

    set(myt,...
        'string',['Trajectory ',num2str(ii)]);

    pause(0.1)

end





























































 


















