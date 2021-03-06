# hrMonitoring

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates how to measure the Root Mean Square
of Successive Difference (RMSSD),the standard deviation of the IBI of normal
sinus beats (SDNN), the number of pairs of successive NNs that differ by more 
than 50 ms and  the proportion of NN50 divided by total number of NNs of the 
subject performing mobility tasks 

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_run_xx_hrv.csv", "[path_to]/")
```

The two parameters are:

- `subject_xx_run_xx_hrv.csv`: a `csv` file containing the heart rate 
variation  in ms presented in first column. 


### Variables

hrv (heart rate variability)

RMSSD: Root Mean Square of Successive Difference

SDNN: The Standard Devaition of the IBI of Normal sinus beats

NN50: The number of pairs of successive NNs that differ by more than 50 ms

pNN50: The proportion of NN50 divided by total number of NNs of the subject
performing mobility tasks

## Initial code structure

The current documentation may not be updated.

Below is the brief list of structure:

| Metric | Input | Expected units | Variable name | Format | Data Example | Input file | information MAP | Variable source |
|-|-|-|-|-|-|-|-|-|
| hrMonitoring | RR-interval | time (ms) | hrv | Double | 0.78,0.76,0.69,… | subject_xx_run_xx_hrv.csv | H10ChestStrip> prepProcess > inputFile | HR monitor |

Octave algorithm to obtain RMSSD, SDNN, NN50 and pNN50 for human mobility 
in the testbed.

## References
1. [Shaffer, F. and Ginsberg, J.P., 2017. An overview of heart rate variability metrics and norms. Frontiers in public health, 5, p.258.](https://www.frontiersin.org/articles/10.3389/fpubh.2017.00258)
