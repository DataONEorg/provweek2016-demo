---
layout: post
title:  "Steps to Run Bob's Script!"
date:   2016-05-17 12:15:30 -0500
categories: DataONE provenance
---
Bob’s interaction with DataONE begins with a user interface search, i.e., using the
keyword `grass`, he discovers Alice’s data package, amongst others. He decides to use
three NetCDF output data files which are part of her package, as input to his Grassland
Water Use Efficiency Analysis script [7]. Having identified the data of interest in the
Member Node, Bob uses `its public identifier id` to retrieve it and use it in his own
code (`GrasslandWUE.m`). Specifically, the `MemberNode:get(session, id)`` call, available
from the MATLAB toolbox, not only retrieves Alice’s data package, but it also ensures
that the download event is recorded as part of a new provenance document, associated
with Bob’s analysis. If Bob manually downloaded Alice’s data (i.e., without using the
DataONE tool), then the link between the data packages would likely be broken, leading
to a disconnect in provenance and requiring additional “stitching” operations [12].

Bob then proceeds to operate
on the data using the DataONE MATLAB toolbox just as Alice did, eventually publishing
a new data package with his own results and their provenance.

Steps to run Alice's script are listed as below:

{% highlight matlab %}
cd ~/Documents/C3_C4_Bob

import org.dataone.client.run.RunManager;
import org.dataone.client.configure.Configuration;

mgr = RunManager.getInstance();

mgr.configuration.science_metadata_config.title_prefix = 'GrasslandWUE Analysis: C3 C4 soil map processing: ';
mgr.configuration.science_metadata_config.title_suffix = ' ';
mgr.configuration.science_metadata_config.primary_creator_salutation = 'Dr.';
mgr.configuration.science_metadata_config.primary_creator_givenname = 'Christopher';
mgr.configuration.science_metadata_config.primary_creator_surname = 'Schwalm';
mgr.configuration.science_metadata_config.primary_creator_address1 = 'Environmental Sciences Division';
mgr.configuration.science_metadata_config.primary_creator_address2 = 'Oak Ridge National Laboratory';
mgr.configuration.science_metadata_config.primary_creator_city = 'Oak Ridge';
mgr.configuration.science_metadata_config.primary_creator_state = 'TN';
mgr.configuration.science_metadata_config.primary_creator_zipcode = '12345-1234';
mgr.configuration.science_metadata_config.primary_creator_country = 'USA';
mgr.configuration.science_metadata_config.primary_creator_email = 'schwalm.christopher@gmail.com';
mgr.configuration.science_metadata_config.language = 'English';
mgr.configuration.science_metadata_config.abstract = 'Global land surfaces are classified by their relative fraction of Carbon 3 or Carbon 4 grasses, ...';
mgr.configuration.science_metadata_config.keyword1 = 'Carbon 3';
mgr.configuration.science_metadata_config.keyword2 = 'Carbon 4';
mgr.configuration.science_metadata_config.keyword3 = 'soil';
mgr.configuration.science_metadata_config.keyword4 = 'mapping';
mgr.configuration.science_metadata_config.keyword5 = 'global';
mgr.configuration.science_metadata_config.intellectual_rights = 'When using these data, please cite the originators as …';

mgr.record('/Users/syc/Documents/C3_C4_Bob/GrasslandWUE.m', 'Second Bob run');
{% endhighlight %}
