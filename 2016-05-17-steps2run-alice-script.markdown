---
layout: post
title:  "Steps to Run Alice's Script"
categories: DataONE provenance
---

This post describes the steps of running Alice's script and recording both retrospective and prospective provenance for the script execution. Assume that Alice has developed a script for producing Carbon3/Carbon4 soil
maps. She uses the YesWorkflow (YW) tool to mark-up the script and expose
the underlying workflow view (i.e., prospective provenance).

By using the Run Manager to run her script, Alice not only obtains the expected
results, but she also captures their provenance, compliant with DataONE’s [ProvONE data model][provone].
At the end of the experimentation
phase, Alice is ready to publish her results to a DataONE Member Node. To do so, she
uses the DataONE MATLAB tool to automatically generate a DataONE-compliant data
package in OAI-ORE format, including the ProvONE provenance document, the script
itself, and its YW-generated workflow view.

Steps to run Alice’s script are listed as below and an example [data package for Alice](https://search-sandbox-2.test.dataone.org/#view/metadata_e859d2dd-c5e6-4ec6-892f-1b00bb6f8f65.xml) was generated.

{% highlight matlab %}
cd ~/Documents/C3_C4_Alice/

import org.dataone.client.run.RunManager;
import org.dataone.client.configure.Configuration;

mgr = RunManager.getInstance();

mgr.configuration.science_metadata_config.title_prefix = 'MsTMIP: C3 C4 soil map processing: ';
mgr.configuration.science_metadata_config.title_suffix = ' ';
mgr.configuration.science_metadata_config.primary_creator_salutation = 'Dr.';
mgr.configuration.science_metadata_config.primary_creator_givenname = 'Alice';
mgr.configuration.science_metadata_config.primary_creator_surname = 'Smith';
mgr.configuration.science_metadata_config.primary_creator_address1 = 'Environmental Sciences Division';
mgr.configuration.science_metadata_config.primary_creator_address2 = 'Environmental National Laboratory';
mgr.configuration.science_metadata_config.primary_creator_city = 'CityA';
mgr.configuration.science_metadata_config.primary_creator_state = 'StateA';
mgr.configuration.science_metadata_config.primary_creator_zipcode = '12345-1234';
mgr.configuration.science_metadata_config.primary_creator_country = 'USA';
mgr.configuration.science_metadata_config.primary_creator_email = 'alice@abc.org';
mgr.configuration.science_metadata_config.language = 'English';
mgr.configuration.science_metadata_config.abstract = 'Global land surfaces are classified by their relative fraction of Carbon 3 or Carbon 4 grasses, ...';
mgr.configuration.science_metadata_config.keyword1 = 'Carbon 3';
mgr.configuration.science_metadata_config.keyword2 = 'Carbon 4';
mgr.configuration.science_metadata_config.keyword3 = 'soil';
mgr.configuration.science_metadata_config.keyword4 = 'mapping';
mgr.configuration.science_metadata_config.keyword5 = 'global';
mgr.configuration.science_metadata_config.intellectual_rights = 'When using these data, please cite the originators as …';

mgr.record('/full/path/to/C3_C4_map_present_NA_with_comments.m', 'First Alice run');

mgr.view('runNumber', 1, 'sections', {'details', 'used', 'generated'});

{% endhighlight %}

[provone]: https://purl.dataone.org/provone-v1-dev
[prov-o]: https://www.w3.org/TR/prov-o/
