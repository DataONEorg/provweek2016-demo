---
layout: post
title:  "DataONE Provenance Support Demo Overview"
date:   2016-05-17 11:32:30 -0500
categories: DataONE provenance
---
# Overview

[DataONE](https://www.dataone.org) is a federated data network focusing on earth and environmental
science data. DataONE provenance systems enable reproducible research and facilitate
proper attribution of scientific results transitively across generations of derived
data products.

In this demonstration we describe two features related to provenance. The first is an API
for capturing **retrospective** provenance from R and Matlab script executions,
called **Run Manager**. The second is a script annotation tool for **prospective** provenance, which we call **YesWorkflow**, designed to help developers and users better understand the structure and intent of a script.


The RunManager can manage the file I/O events  and determine provenance relationships between file objects related to a script execution. Information about the script execution is stored in the cache. The RunManager provides functions for capturing, searching, archiving, and sharing provenance. The supported functions are available at [DataONE Run Manager and API for Capturing Provenance in Script Executions](https://github.com/DataONEorg/sem-prov-design/blob/master/docs/PROV-capture/Run-manager-API.rst).  

DataONE provides two RunManager implementation for [DataONE recordr R package](https://github.com/NCEAS/recordr)  and [DataONE Matlab toolbox](https://github.com/DataONEorg/matlab-dataone) scripts. Check out the [Matlab-DataONE User Guide][matlab-dataone-user-guide] and [Recordr-DataONE Introduction]({{site.baseurl}}/data/intro_recordr.pdf) for more information on DataONE provenance tools. File all bugs/feature requests at [Matlab-Dataone Github Repository][matlab-dataone Github repo] and [DataONE Provenance Tracking for R][recordr-Github-repo].

[YesWorkflow](https://github.com/yesworkflow-org/yw-prototypes) is a tool to enable users to mark up scripts with YesWorkflow annotations to reveal the computational steps and dataflows that may be implicit in the scripts. In addition, YesWorkflow provides query ability for the prospective provenance of the scripts.

With DataONE provenance tools, each run of a script will generate a data package. When the data package is indexed by the coordinating node upon the publication of the data package, the logical connection can be viewed and explored at [DataONE Search Site](https://search-sandbox-2.test.dataone.org) to facilitate data sharing in the community.

[matlab-dataone-user-guide]: https://github.com/DataONEorg/matlab-dataone/blob/master/docs/user-guide.rst
[matlab-dataone Github repo]:   https://github.com/DataONEorg/matlab-dataone
[recordr-Github-repo]: https://github.com/NCEAS/recordr
[intro-recordr]: https://github.com/NCEAS/recordr/blob/master/vignettes/intro_recordr.Rmd
