# TargetedNodeDeletionToolbox

The **Targeted Node Deletion Toolbox** is a collection of MATLAB functions for the analysis of various network parameters.

TargetedNodeDeletionToolbox was created by Dylan Terstege, a Neuroscience PhD candidate in the Epp Lab at the University of Calgary.

## Table of Contents

| Section  | Description | 
| ------------- | ------------- | 
| [1. Attack Parameters](#attack)   | Order of targeted deletion.  |
| [2. Variable Definitions](#vars)   | Description of input and output variables  |
| [3. Citation](#cite) | How to cite the Targeted Node Deletion Toolbox |
| [4. Contact Us](#contact)  | Where to reach us with questions  |

<a name="attack"/>

## 1. Attack Parameters

In the current analyses, targeted node deletion occurs in descending order of node degree.  Initial analyses are conducted on the intact network.  Degree is calculated and the node with the highest degree is removed from the network.  Analyses are reassessed on the attacked network before degree is recalculated and the node with the highest remaining degree is removed.

In the case where two nodes have the same degree, the node which is listed first in the network is removed first.

<a name="vars"/>

## 2. Variable Definitions

The function is as follows:

```Matlab
dsfs
```

<a name="cite"/>

## 3. Citation

If you find the Targeted Node Deletion Toolbox to be useful, and apply it in your research, please cite the following [article](https://www.biorxiv.org/content/10.1101/2021.03.28.437394v1) in which we first use these analyses:

Terstege, DJ, Durante, IM, Epp, JR, Brain-wide neuronal activation and functional connectivity are modulated by prior exposure to repetitive learning episodes.

<a name="contact"/>

## 4. Contact Us

**Contributors:**
- **Dylan Terstege*** (code/tool conceptualization/written documentation) - ![twitter-icon_16x16](https://user-images.githubusercontent.com/44174532/113163958-e3d3e400-91fd-11eb-8d79-17906d8d3f25.png)[@dterstege](https://twitter.com/dterstege) - ![Mail](https://user-images.githubusercontent.com/44174532/113164412-50e77980-91fe-11eb-9282-dd83852578ce.png)
<dylan.terstege@ucalgary.ca>


Principal Investigator:
- Jonathan Epp (tool conceptualization) - https://epplab.com

<sub><sup>***corresponding author**</sup></sub>
