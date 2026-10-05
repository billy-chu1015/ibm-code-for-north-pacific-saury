clc;
clear;

figure("Name",'2005粒子轨迹');



fid = load("D:\track2005.ll\newtrack_ll_150.dat");
lon=fid(:,1);
lat=fid(:,2);
plot(lon,lat,'k.')
xlim([125,170])
ylim([18,45]);
hold on


line=load('boundary_world_360.dat');
%line=load('boundary.dat')；
[a b]=find(isnan(line)==1);nzone=size(a,1)/2;
kcolor=[210 180 140]/255;
for i=1:nzone
fill(line(a(i)+1:a(i+1)-1,1),line(a(i)+1:a(i+1)-1,2),kcolor);
hold on;
end
hold on






grid on
box on


% -------- KA --------
KA_lon = [130 145 145 130];
KA_lat = [30 30 35 35];

% -------- SKA --------
SKA_lon = [122 145 145 122];
SKA_lat = [10 10 30 30];
% 
% -------- KE --------
KE_lon = [145 160 160 145];
KE_lat = [30 30 35 35];
% 
% -------- SKE --------
SKE_lon = [145 160 160 145];
SKE_lat = [25 25 30 30];
% 
% -------- EKE --------
EKE_lon = [160 175 175 160];
EKE_lat = [28 28 35 35];

% -------- SEKE --------
SEKE_lon = [160 175 175 160];
SEKE_lat = [25 25 28 28];
% 
% -------- KOT --------
KOT_lon = [140 160 160 140];
KOT_lat = [35 35 47 47];

% -------- EKOT --------
EKOT_lon = [160 175 175 160];
EKOT_lat = [35 35 47 47];
plot([KA_lon KA_lon(1)], ...
     [KA_lat KA_lat(1)], ...
     'r','LineWidth',2)

plot([SKA_lon SKA_lon(1)], ...
     [SKA_lat SKA_lat(1)], ...
     'r','LineWidth',2)

plot([KE_lon KE_lon(1)], ...
     [KE_lat KE_lat(1)], ...
     'r','LineWidth',2)

plot([SKE_lon SKE_lon(1)], ...
     [SKE_lat SKE_lat(1)], ...
     'r','LineWidth',2)

plot([EKE_lon EKE_lon(1)], ...
     [EKE_lat EKE_lat(1)], ...
     'r','LineWidth',2)

plot([SEKE_lon SEKE_lon(1)], ...
     [SEKE_lat SEKE_lat(1)], ...
     'r','LineWidth',2)

plot([KOT_lon KOT_lon(1)], ...
     [KOT_lat KOT_lat(1)], ...
     'r','LineWidth',2)

plot([EKOT_lon EKOT_lon(1)], ...
     [EKOT_lat EKOT_lat(1)], ...
     'r','LineWidth',2)



text(136,31,'KA','fontsize',14,'fontweight','bold')
text(136,27,'SKA','fontsize',14,'fontweight','bold')

text(151,32.5,'KE','fontsize',14,'fontweight','bold')
text(151,27,'SKE','fontsize',14,'fontweight','bold')

text(167,32.5,'EKE','fontsize',14,'fontweight','bold')
text(167,26.5,'SEKE','fontsize',14,'fontweight','bold')

text(151,40,'KOT','fontsize',14,'fontweight','bold')
text(166,40,'EKOT','fontsize',14,'fontweight','bold')


hold on

% kot区域
kot_poly_lon = [KOT_lon, KOT_lon(1)];
kot_poly_lat = [KOT_lat, KOT_lat(1)];


%赋值和判断
inKOT = inpolygon(lon, lat, kot_poly_lon, kot_poly_lat);

hold on
plot(lon(inKOT), lat(inKOT), 'g.');  




N_total = length(lon);                % 总点数
N_KOT = sum(inKOT);                   % KOT 内点数
ratio_KOT = N_KOT / N_total;          % 比例

fprintf('总点数 = %d\n', N_total);
fprintf('KOT 内点数 = %d\n', N_KOT);
fprintf('KOT 内点比例 = %.2f %% \n', ratio_KOT*100);









% KA区域
ka_poly_lon = [KA_lon, KA_lon(1)];
ka_poly_lat = [KA_lat, KA_lat(1)];
%赋值
inKA = inpolygon(lon, lat, ka_poly_lon, ka_poly_lat);
plot(lon(inKA), lat(inKA), 'b.');


N_total = length(lon);        
N_KA = sum(inKA);             
ratio_KA = N_KA / N_total;    

fprintf('总点数 = %d\n', N_total);
fprintf('KA 内点数 = %d\n', N_KA);
fprintf('KA 内点比例 = %.2f %% \n', ratio_KA*100);



%SKA
ska_poly_lon = [SKA_lon, SKA_lon(1)];
ska_poly_lat = [SKA_lat, SKA_lat(1)];
inSKA = inpolygon(lon, lat, ska_poly_lon, ska_poly_lat);
plot(lon(inSKA), lat(inSKA), 'p');


N_total = length(lon);        
N_SKA = sum(inSKA);             
ratio_SKA = N_SKA / N_total;    

fprintf('总点数 = %d\n', N_total);
fprintf('SKA 内点数 = %d\n', N_SKA);
fprintf('SKA 内点比例 = %.2f %% \n', ratio_SKA*100);







%KE
ke_poly_lon = [KE_lon, KE_lon(1)];
ke_poly_lat = [KE_lat, KE_lat(1)];
inKE = inpolygon(lon, lat, ke_poly_lon, ke_poly_lat);
plot(lon(inKE), lat(inKE), 'r.');


N_total = length(lon);        
N_KE = sum(inKE);             
ratio_KE = N_KE / N_total;    

fprintf('总点数 = %d\n', N_total);
fprintf('KE 内点数 = %d\n', N_KE);
fprintf('KE 内点比例 = %.2f %% \n', ratio_KE*100);



%SKE
ske_poly_lon = [SKE_lon, SKE_lon(1)];
ske_poly_lat = [SKE_lat, SKE_lat(1)];
inSKE = inpolygon(lon, lat, ske_poly_lon, ske_poly_lat);
plot(lon(inSKE), lat(inSKE), 'y.');

N_total = length(lon);        
N_SKE = sum(inSKE);             
ratio_SKE = N_SKE / N_total;    

fprintf('总点数 = %d\n', N_total);
fprintf('SKE 内点数 = %d\n', N_SKE);
fprintf('SKE 内点比例 = %.2f %% \n', ratio_SKE*100);


%EKE
eke_poly_lon = [EKE_lon, EKE_lon(1)];
eke_poly_lat = [EKE_lat, EKE_lat(1)];
inEKE = inpolygon(lon, lat, eke_poly_lon, eke_poly_lat);
plot(lon(inEKE), lat(inEKE), 'm.');









