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
data products. With DataONE provenance tools, each run of a script will generate a data package. As the data package is indexed by the coordinating node upon the publication of the data package, the logical connection can be viewed and explored at [DataONE Search Site](https://search-sandbox-2.test.dataone.org).

In this demonstration we describe two features related to provenance. The first is an API
for capturing retrospective provenance from [R](https://github.com/NCEAS/recordr) and [Matlab](https://github.com/DataONEorg/matlab-dataone) script executions,
called Run Manager. The second is a script annotation tool, which we call [YesWorkflow](https://github.com/yesworkflow-org/yw-prototypes), designed to help developers and users better understand the structure and intent of a script.



Check out the [Matlab-DataONE User Guide][matlab-dataone-user-guide] and [Recordr-DataONE Introduction][intro-recordr] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Matlab-Dataone Github Repository][matlab-dataone Github repo] and [DataONE Provenance Tracking for R][recordr-Github-repo].

[matlab-dataone-user-guide]: https://github.com/DataONEorg/matlab-dataone/blob/master/docs/user-guide.rst
[matlab-dataone Github repo]:   https://github.com/DataONEorg/matlab-dataone
[recordr-Github-repo]: https://github.com/NCEAS/recordr
[intro-recordr]: https://github.com/NCEAS/recordr/blob/master/vignettes/intro_recordr.Rmd
