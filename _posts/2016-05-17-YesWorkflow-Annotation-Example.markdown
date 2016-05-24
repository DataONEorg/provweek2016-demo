---
layout: post
title:  "YesWorkflow Annotation Example"
date:   2016-05-23 12:25:30 -0500
categories: DataONE provenance
---
[YesWorkflow](https://github.com/yesworkflow-org/yw-prototypes)  is a tool that models conventional scripts and exposes the underlying workflow view (**prospective** provenance). Firstly, a YesWorkflow user can add special YesWorkflow (YW) comments to existing scripts. These comments declare how data are used and results are produced, step by step, by the script. Then, the YesWorkflow tool interprets the YW comments and produces a graphical output that reveals the computation steps and the data flows hidden in the script. The YesWorkflow annotation table is available at [here](). Lastly, YesWorkflow provides query capability for the prospective and retrospective provenance of the scripts. We use [Alice's soil mapping script]({{site.baseurl}}/data/C3_C4_map_present_NA.m) to demonstrate the usage of the YesWorkflow tool.

![image text]({{site.baseurl}}/img/alice-yw-combined-view.jpg "YesWorkflow-annotation")

{% highlight matlab %}
%% @begin fetch_SYNMAP_land_cover_map_variable
%  @in mstmip_SYNMAP_NA_QD.nc @as SYNMAP_land_cover_map_data
%  @out lon @as lon_variable
%  @out lat @as lat_variable
%  @out lon_bnds @as lon_bnds_variable
%  @out lat_bnds @as lat_bnds_variable

%% Load input: SYNMAP land cover classification map;
%% also read coordinate variables to re-use them later
grass_type=[19,20,21,22,23,24,25,26,27,38,41,42,43];
sncid=netcdf.open('inputs/land_cover/SYNMAP_NA_QD.nc', 'NC_NOWRITE');
fvid=netcdf.inqVarID(sncid, 'biome_frac');
frac=netcdf.getVar(sncid,fvid);
tvid=netcdf.inqVarID(sncid, 'biome_type');
type=netcdf.getVar(sncid,tvid);

lon_vid=netcdf.inqVarID(sncid, 'lon');
lon=netcdf.getVar(sncid,lon_vid);
lat_vid=netcdf.inqVarID(sncid, 'lat');
lat=netcdf.getVar(sncid,lat_vid);
lon_bnds_vid=netcdf.inqVarID(sncid, 'lon_bnds');
lon_bnds=netcdf.getVar(sncid,lon_bnds_vid);
lat_bnds_vid=netcdf.inqVarID(sncid, 'lat_bnds');
lat_bnds=netcdf.getVar(sncid,lat_bnds_vid);

netcdf.close(sncid)
%% @end fetch_SYNMAP_land_cover_map_variable
{% endhighlight %}
