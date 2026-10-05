clc;
clear;
figure('Name','2005 vs 2010 粒子轨迹');


KA_lon = [130 145 145 130];  KA_lat = [30 30 35 35];
SKA_lon = [122 145 145 122]; SKA_lat = [10 10 30 30];
KE_lon = [145 160 160 145];  KE_lat = [30 30 35 35];
SKE_lon = [145 160 160 145]; SKE_lat = [25 25 30 30];
EKE_lon = [160 175 175 160]; EKE_lat = [28 28 35 35];
SEKE_lon = [160 175 175 160];SEKE_lat = [25 25 28 28];
KOT_lon = [140 160 160 140]; KOT_lat = [35 35 47 47];
EKOT_lon = [160 175 175 160];EKOT_lat = [35 35 47 47];




subplot(1,2,1)

fid = load("D:\track2005.ll\newtrack_ll_150.dat");
lon = fid(:,1);
lat = fid(:,2);

plot(lon,lat,'k.')
hold on
xlim([125,170]); ylim([18,45]);
grid on; box on
title('2005')

plot([KA_lon KA_lon(1)],[KA_lat KA_lat(1)],'r','LineWidth',1.5)
plot([SKA_lon SKA_lon(1)],[SKA_lat SKA_lat(1)],'r','LineWidth',1.5)
plot([KE_lon KE_lon(1)],[KE_lat KE_lat(1)],'r','LineWidth',1.5)
plot([SKE_lon SKE_lon(1)],[SKE_lat SKE_lat(1)],'r','LineWidth',1.5)
plot([EKE_lon EKE_lon(1)],[EKE_lat EKE_lat(1)],'r','LineWidth',1.5)
plot([SEKE_lon SEKE_lon(1)],[SEKE_lat SEKE_lat(1)],'r','LineWidth',1.5)
plot([KOT_lon KOT_lon(1)],[KOT_lat KOT_lat(1)],'r','LineWidth',1.5)
plot([EKOT_lon EKOT_lon(1)],[EKOT_lat EKOT_lat(1)],'r','LineWidth',1.5)

inKOT = inpolygon(lon,lat,[KOT_lon KOT_lon(1)],[KOT_lat KOT_lat(1)]);
plot(lon(inKOT),lat(inKOT),'g.')







subplot(1,2,2)

fid = load("D:\track2010.ll\track2010_ll_150.dat");
lon = fid(:,1);
lat = fid(:,2);

plot(lon,lat,'k.')
hold on
xlim([125,170]); ylim([18,45]);
grid on; box on
title('2010')

plot([KA_lon KA_lon(1)],[KA_lat KA_lat(1)],'r','LineWidth',1.5)
plot([SKA_lon SKA_lon(1)],[SKA_lat SKA_lat(1)],'r','LineWidth',1.5)
plot([KE_lon KE_lon(1)],[KE_lat KE_lat(1)],'r','LineWidth',1.5)
plot([SKE_lon SKE_lon(1)],[SKE_lat SKE_lat(1)],'r','LineWidth',1.5)
plot([EKE_lon EKE_lon(1)],[EKE_lat EKE_lat(1)],'r','LineWidth',1.5)
plot([SEKE_lon SEKE_lon(1)],[SEKE_lat SEKE_lat(1)],'r','LineWidth',1.5)
plot([KOT_lon KOT_lon(1)],[KOT_lat KOT_lat(1)],'r','LineWidth',1.5)
plot([EKOT_lon EKOT_lon(1)],[EKOT_lat EKOT_lat(1)],'r','LineWidth',1.5)

% ===== KOT点 =====
inKOT = inpolygon(lon,lat,[KOT_lon KOT_lon(1)],[KOT_lat KOT_lat(1)]);
plot(lon(inKOT),lat(inKOT),'g.')