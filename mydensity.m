function [xi,yi,n] = mydensity(lon,lat,lon_min,lon_max,lat_min,lat_max,rad)
% edited by liyuesong at zhanjiang on 2021-5-17
% 
% 给出散点的经纬度，绘制散点密度图
% lon:散点经度
% lat:散点纬度
% lon_min,lon_max,lat_min,lat_max:搜索的范围
%  rad: 搜索半径
%
xlon=lon_min:rad:lon_max; %在搜索范围内定义网格
xlat=lat_min:rad:lat_max;
n=zeros(length(xlat),length(xlon));
xi=zeros(length(xlon),1);
yi=zeros(length(xlat),1);
for j=1:length(xlat)-1 %寻找每个网格中粒子的个数
    for i=1:length(xlon)-1
        ni=find(lon>=xlon(i)&lon<xlon(i+1)&lat>=xlat(j)&lat<xlat(j+1));
        n(j,i)=length(ni);
        if j==1
            xi(i)=(xlon(i)+xlon(i+1))/2;
        end
    end
    yi(j)=(xlat(j)+xlat(j+1))/2;
end
% xxlon=min(lon):radi:max(lon);
% xxlat=min(lat):radi:max(lat);
% xn=griddata(xi,yi,n,xxlon,xxlat','cubic');%为了作图美观，再次插值
% xn(xn<1)=nan; %将小于1的值设为Nan值，绘图显示为空白

% m_pcolor(xxlon,xxlat,xn);
% shading interp;
% colorbar;
% RGB = cbrewer('seq', 'Reds', 200, 'linear');
% colormap(RGB)
%caxis([1 600])
end

