---
layout: post
title:  "Steps to Run Bob's Script"
date:   2016-05-17 12:15:30 -0500
categories: DataONE provenance
---
Bob interacts with [DataONE Search](https://search-sandbox-2.test.dataone.org) using the
keyword **grass**. Then, he discovers [Alice’s data package](https://search-sandbox-2.test.dataone.org/#view/metadata_e859d2dd-c5e6-4ec6-892f-1b00bb6f8f65.xml), amongst others. He decides to use
three NetCDF output data files which are part of her package, as input to his Grassland
Water Use Efficiency Analysis script. Having identified the data of interest in the
Member Node, Bob uses the same public identifier ids to retrieve these data and uses these ids in his own
code ([GrasslandWUE.m]({{site.baseurl}}/data/GrasslandWUE-yw.m)). Specifically, the `MemberNode:get`(session, id) call, which is available
from the MATLAB toolbox, not only retrieves Alice’s data package, but it also ensures
that the download event is recorded as part of a new provenance document, associated
with Bob’s analysis. Bob then proceeds to operate on the data using the method record( ) just as Alice did, eventually publishing
a new data package with his own results and their provenance using the function publish( ).

Steps to run Bob's script are listed as below and an example [data package for Bob](https://search-sandbox-2.test.dataone.org/#view/metadata_07277c1f-b2c2-467c-8aa2-792863524a21.xml) was generated.

{% highlight matlab %}
cd ~/Documents/C3_C4_Bob

import org.dataone.client.run.RunManager;
import org.dataone.client.configure.Configuration;

mgr = RunManager.getInstance();

mgr.configuration.science_metadata_config.title_prefix = 'GrasslandWUE Analysis: C3 C4 soil map processing: ';
mgr.configuration.science_metadata_config.title_suffix = ' ';
mgr.configuration.science_metadata_config.primary_creator_salutation = 'Dr.';
mgr.configuration.science_metadata_config.primary_creator_givenname = 'Bob';
mgr.configuration.science_metadata_config.primary_creator_surname = 'Smith';
mgr.configuration.science_metadata_config.primary_creator_address1 = 'Environmental Sciences Division';
mgr.configuration.science_metadata_config.primary_creator_address2 = 'Environmental National Laboratory';
mgr.configuration.science_metadata_config.primary_creator_city = 'CityB';
mgr.configuration.science_metadata_config.primary_creator_state = 'StateB';
mgr.configuration.science_metadata_config.primary_creator_zipcode = '12345-1234';
mgr.configuration.science_metadata_config.primary_creator_country = 'USA';
mgr.configuration.science_metadata_config.primary_creator_email = 'bob@xyz.com';
mgr.configuration.science_metadata_config.language = 'English';
mgr.configuration.science_metadata_config.abstract = 'Global land surfaces are classified by their relative fraction of Carbon 3 or Carbon 4 grasses, ...';
mgr.configuration.science_metadata_config.keyword1 = 'Carbon 3';
mgr.configuration.science_metadata_config.keyword2 = 'Carbon 4';
mgr.configuration.science_metadata_config.keyword3 = 'soil';
mgr.configuration.science_metadata_config.keyword4 = 'mapping';
mgr.configuration.science_metadata_config.keyword5 = 'global';
mgr.configuration.science_metadata_config.intellectual_rights = 'When using these data, please cite the originators as …';

mgr.record('/full/path/to/GrasslandWUE.m', 'Second Bob run');
{% endhighlight %}
