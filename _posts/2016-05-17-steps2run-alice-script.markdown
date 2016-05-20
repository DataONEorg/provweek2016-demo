---
layout: post
title:  "Steps to Run Alice's Script"
date:   2016-05-17 12:00:30 -0500
categories: DataONE provenance
---

We present two features related to provenance: `Run Manager`, an API for capturing
retrospective provenance from `R` [14] and `MATLAB` [8] script runs; and `YesWorkflow`
[10], a script annotation and provenance querying tool, designed to help users better
understand the structure and intent of a script, and to expose and query its provenance.

We introduce the provenance and search features of DataONE by means of an example
involving three Earth scientist personas who interact through a DataONE `Member
Node`: In Figure 1, Alice has developed a script for producing C3/C4 carbon soil
maps [15]. She uses the YesWorkflow (YW) tool to mark-up the script and expose
the underlying workflow view (i.e., prospective provenance) that is inherent in her soil
mapping code as shown in Figure 2.

By using the Run Manager to run her script, Alice not only obtains the expected
results, but she also captures their provenance, compliant with DataONE’s `ProvONE`
data model. ProvONE [5] is an extension of the W3C `PROV-O` [3] standard for representing
provenance, and includes specializations for representing both retrospective
provenance about the runtime execution and prospective provenance about the structure
and flow of the analytical script or workflow. At the end of the experimentation
phase, Alice is ready to publish her results to a DataONE Member Node. To do so, she
uses the DataONE MATLAB tool to automatically generate a DataONE-compliant data
package in OAI-ORE format, including the ProvONE provenance document, the script
itself, and its YW-generated workflow view.

Steps to run Alice's script are listed as below:

{% highlight matlab %}
cd ~/Documents/C3_C4_mapping/

import org.dataone.client.run.RunManager;
import org.dataone.client.configure.Configuration;

mgr = RunManager.getInstance();

mgr.configuration.science_metadata_config.title_prefix = 'MsTMIP: C3 C4 soil map processing: ';
mgr.configuration.science_metadata_config.title_suffix = ' ';
mgr.configuration.science_metadata_config.primary_creator_salutation = 'Dr.';
mgr.configuration.science_metadata_config.primary_creator_givenname = 'Yaxing';
mgr.configuration.science_metadata_config.primary_creator_surname = 'Wei';
mgr.configuration.science_metadata_config.primary_creator_address1 = 'Environmental Sciences Division';
mgr.configuration.science_metadata_config.primary_creator_address2 = 'Oak Ridge National Laboratory';
mgr.configuration.science_metadata_config.primary_creator_city = 'Oak Ridge';
mgr.configuration.science_metadata_config.primary_creator_state = 'TN';
mgr.configuration.science_metadata_config.primary_creator_zipcode = '37831-6290';
mgr.configuration.science_metadata_config.primary_creator_country = 'USA';
mgr.configuration.science_metadata_config.primary_creator_email = 'weiy@ornl.gov';
mgr.configuration.science_metadata_config.language = 'English';
mgr.configuration.science_metadata_config.abstract = 'Global land surfaces are classified by their relative fraction of Carbon 3 or Carbon 4 grasses, ...';
mgr.configuration.science_metadata_config.keyword1 = 'Carbon 3';
mgr.configuration.science_metadata_config.keyword2 = 'Carbon 4';
mgr.configuration.science_metadata_config.keyword3 = 'soil';
mgr.configuration.science_metadata_config.keyword4 = 'mapping';
mgr.configuration.science_metadata_config.keyword5 = 'global';
mgr.configuration.science_metadata_config.intellectual_rights = 'When using these data, please cite the originators as …';

mgr.record('/Users/syc/Documents/C3_C4_mapping/C3_C4_map_present_NA_with_comments.m', 'First Alice run');

mgr.view('runNumber', 1, 'sections', {'details', 'used', 'generated'});

{% endhighlight %}
