function GrasslandWUE
%Function takes "Alice's output" and perfroms correlation analysis wrt
%water use efficiency (WUE).

%% fetch WUE
%Output available @ http://nacp.ornl.gov/mstmipdata/mstmip_simulation_results_global_v1.jsp
%MsTMIP Model: BIOME-BGC; Simulation: BG1; Variables: GPP and Evap; time resolution: Monthly
%Code assumes netcdf files are local
%pth='C:\Users\cs2239\Downloads'; %change as needed
pth='/Users/syc/Documents/C3_C4_Bob'; %change as needed

GPP=ncread([pth filesep 'BIOME-BGC_BG1_Monthly_GPP.nc4'],'GPP'); %units: kg C m-2 s-1
Evap=ncread([pth filesep 'BIOME-BGC_BG1_Monthly_Evap.nc4'],'Evap'); %units: kg H2O m-2 s-1
%Note: WUE is gross C uptake (GPP) per unit H2O loss (Evap). Higher values
%are more efficient, plants "create" more GPP per unit water.
[GPP Evap]=deal(GPP(:,:,end-335:end),Evap(:,:,end-335:end)); %1901-2010 to 1982-2010
%Note: Use only last 28 years. This corresponds to satellite-era when 
%simulated values are thought to be higher quality.
WUEh=nanmean(GPP,3)./nanmean(Evap,3);
lath=ncread([pth filesep 'BIOME-BGC_BG1_Monthly_Evap.nc4'],'lat'); %half-degree lat --needed for interp2
lonh=ncread([pth filesep 'BIOME-BGC_BG1_Monthly_Evap.nc4'],'lon'); %half-degree lon --needed for interp2



% Get a Member Node to talk to
import org.dataone.client.v2.DataONEClient;
mn = DataONEClient.getMN('urn:node:mnDemo2');

% Get SYNMAP_PRESENTVEG_C3Grass_RelaFrac_NA_v2.0.nc dataset
synmap_c3grass_pid = '22e72484-07f6-4167-911c-6950dc1f6412';
data = mn.get([], synmap_c3grass_pid);
% Save the data locally
system_metadata_synmap_c3grass = mn.getSystemMetadata([], synmap_c3grass_pid);
synmap_c3grass_path = [pth filesep system_metadata_synmap_c3grass.fileName];
fid = fopen(synmap_c3grass_path, 'w');
fwrite(fid, data, 'int8');
fclose(fid);

% Get SYNMAP_PRESENTVEG_C4Grass_RelaFrac_NA_v2.0.nc
synmap_c4grass_pid =  '89bb3f7f-b881-48c3-b40f-86de8a8f4fc0';
data = mn.get([], synmap_c4grass_pid);
% Save the data locally
system_metadata_synmap_c4grass = mn.getSystemMetadata([], synmap_c4grass_pid);
synmap_c4grass_path = [pth filesep system_metadata_synmap_c4grass.fileName];
fid = fopen(synmap_c4grass_path, 'w');
fwrite(fid, data, 'int8');
fclose(fid);

% Get SYNMAP_PRESENTVEG_Grass_Fraction_NA_v2.0.nc
synmap_presentveg_grass_pid = '15a312cb-83b9-44b6-b157-15a168507c38';
data = mn.get([], synmap_presentveg_grass_pid);
% Save the data locally
system_metadata_synmap_presentveg_grass = mn.getSystemMetadata([], synmap_presentveg_grass_pid);
synmap_presentveg_grass_path = [pth filesep system_metadata_synmap_presentveg_grass.fileName];
fid = fopen(synmap_presentveg_grass_path, 'w');
fwrite(fid, data, 'int8');
fclose(fid);

% fetch Alice's output
C3Frac=ncread(synmap_c3grass_path,'C3_frac'); %units: relative fraction
C4Frac=ncread(synmap_c4grass_path,'C4_frac'); %units: relative fraction
GrassFrac=ncread(synmap_presentveg_grass_path,'grass'); %units: relative fraction
latq=ncread(synmap_c3grass_path,'lat'); %quarter-degree lat --needed for interp2
lonq=ncread(synmap_c3grass_path,'lon'); %quarter-degree lon --needed for interp2




%% snap to common grid
%Regrettably Alice is quarter-degree for North American and Bob is
%half-degree global.
[lathm lonhm]=meshgrid(lath,lonh);
[latqm lonqm]=meshgrid(latq,lonq);
WUEq=interp2(lathm,lonhm,WUEh,latqm,lonqm);

%% viz
mask=~isnan(WUEq) & GrassFrac>0; %good pixels only
[WUEq C3Frac C4Frac GrassFrac]=deal(zscore(WUEq(mask)),C3Frac(mask),C4Frac(mask),GrassFrac(mask));
%Note: C4Frac is left in but not currently used.
[fitobject1 gof1]=fit([C3Frac,GrassFrac],WUEq,'poly11'); %linear polynomial surface fit
fig1 = figure(1);
plot(fitobject1,[C3Frac,GrassFrac],WUEq)
xlabel 'C3 grass relative fraction [dim]'
ylabel 'Grasslands fraction [dim]'
zlabel 'Water use efficiency [\sigma]'
disp(gof1)
disp(fitobject1)
print(fig1, 'water-use-efficiency', '-dpng');
%We find that WUE increases with both the relative fraction of C3 grasses
%and overall grass fraction.

%% viz 2
[fitobject2 gof2]=fit(GrassFrac,WUEq,'poly1'); %linear fit
fig2 = figure(2);
h=plot(fitobject2,GrassFrac,WUEq);
set(h,'linewidth',4); %bold trend line
xlabel 'Grasslands fraction [dim]'
ylabel 'Water use efficiency [\sigma]'
disp(gof2)
disp(fitobject2)
print(fig2, 'tenancy-4-WUE', '-dpng');
%We find a weak tendency for WUE to decline as overall grass fraction 
%increases.
