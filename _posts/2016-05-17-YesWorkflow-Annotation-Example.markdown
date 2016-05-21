---
layout: post
title:  "YesWorkflow Annotation Example"
date:   2016-05-17 12:25:30 -0500
categories: DataONE provenance
---

A user can use the [YesWorkflow (YW) tool](https://github.com/yesworkflow-org/yw-prototypes) to mark-up the script and expose the
underlying workflow view (i.e., **prospective** provenance). For example, Alice's soil mapping
code is shown as below.

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
