---
layout: default
title:  "Installation Matlab-DataONE Toolbox"
categories: DataONE provenance
---

In order to install the Matlab-DataONE Toolbox, you need first clone the Github repository to your local computer using the command:
<code>
git clone https://github.com/DataONEorg/matlab-dataone.git
</code>

In Matlab, **change to the matlab-dataone directory**. For example, the directory is `~/Desktop/matlab-dataone`. Then, type the command:
<code>
cd ~Desktop/matlab-dataone
</code>

In this directory, **run the `install_matlab_dataone.m` file** by entering the following command:
<code>
install_matlab_dataone
</code>

The `install_matlab_dataone` bash script creates a default provenance cache and provenance data for each execution of a script are stored in the cache. Once the toolbox is installed, **restart Matlab** to ensure all libraries are available.
