# Comparison of extraChIPs Differential Signal Methods


This is a workflow designed to directly compare the output of multiple approaches to detection of Differential (ChIP) Signal, specifically with regard to those available in the `extraChIPs` package.
Analysis using `DiffBind` will also be included as a reference standard, especially when using methods which should replicate this methodology.

## Methods

The methods being compared will be

| Abbreviation  | Package | Windows | Normalisation | Method | Assay |
|:------------- |:-------- |:------- |:------------- |:------ |:---- |
| DB-LS        | DiffBind | Fixed   | Library Size  | QLF    | counts |
| DB-TMM       | DiffBind | Fixed   | TMM           | QLF    | counts |
| FW-LS        | extraChIPs | Fixed   | Library Size  | QLF    | counts |
| FW-TMM       | extraChIPs | Fixed   | TMM           | QLF    | counts |
| FW-TMMG      | extraChIPs | Fixed   | TMM Groups    | QLF    | counts |
| FW-SQN       | extraChIPs | Fixed   | qsmooth       | QLF    | normCounts |
| FW-SQNGC     | extraChIPs | Fixed   | qsmoothGC     | QLF    | normCounts |
| SW-LS        | extraChIPs | Sliding   | Library Size  | QLF    | counts |
| SW-TMM       | extraChIPs | Sliding   | TMM           | QLF    | counts |
| SW-TMMG      | extraChIPs | Sliding   | TMM Groups    | QLF    | counts |
| SW-SQN       | extraChIPs | Sliding   | qsmooth       | QLF    | normCounts |
| SW-SQNGC     | extraChIPs | Sliding   | qsmoothGC     | QLF    | normCounts |
| SW-SQN       | extraChIPs | Sliding   | Library Size  | LT     | logCPM |
| SW-SQN       | extraChIPs | Sliding   | qsmooth       | LT     | logCPM |
| SW-SQNGC     | extraChIPs | Sliding   | qsmoothGC     | LT     | logCPM |

Table: *Methods available in extraChIPs which are being compared *


This makes a total of 15 methods.
All above methods will be initially tested using $H_0: \mu = 0$.
Subsequent comparisons will be made using $H_0: -\lambda < \mu < \lambda$ but excluding DiffBind results.

## Datasets

All approaches will be compared across multiple datasets:

| Cell Type | ChIP Target | Treatments |
|:--------- |:----------- |:---------- |
| ZR-75-1   | AR          | E2, E2DHT  |
| ZR-75-1   | ER$\alpha$  | E2, E2DHT  |
| ZR-75-1   | H3K27ac     | E2, E2DHT  |

Table: *Cell lines and ChIP targets being analysed*

The key **defining features** underlining this selection are:

- AR will shift from cytoplasmic to nuclear in response to DHT leading to unbalanced signal
- ER$\alpha$ should show approximately the same levels of signal between conditions, and like AR, should produce 'narrow' binding regions
- H3K27ac will be far broader peaks than either AR or ER$\alpha$

## Peak Definitions

BamFiles and Peaks are assumed available as prepared using https://github.com/smped/PRJNA509779.

Treatment-specific peaks will be defined using those detected in 2/3 samples.
The union of treatment-specific peaks will be taken as the set of reference ranges.


## Expectations

The **expectations are** that :

1. DB-LS and FW-LS should return near identical results
2. DB-TMM and FW-TMM should return near identical results
3. DB-TMM, FW-TMM, SW-TMM should return large numbers of errors for *AR specifically*
4. Sliding windows should out-perform fixed-width windows for H3K27ac





A [workflowr][] project.

[workflowr]: https://github.com/workflowr/workflowr
