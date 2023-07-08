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
| FW-CQN       | extraChIPs | Fixed   | CQN           | QLF    | counts |
| FW-CQNG      | extraChIPs | Fixed   | CQN Groups    | QLF    | counts |
| FW-SQN       | extraChIPs | Fixed   | qsmooth       | QLF    | normCounts |
| FW-SQNGC     | extraChIPs | Fixed   | qsmoothGC     | QLF    | normCounts |
| FW-LT        | extraChIPs | Fixed   | Library Size  | LT    | logCPM |
| SW-LS        | extraChIPs | Sliding   | Library Size  | QLF    | counts |
| SW-TMM       | extraChIPs | Sliding   | TMM           | QLF    | counts |
| SW-TMMG      | extraChIPs | Sliding   | TMM Groups    | QLF    | counts |
| SW-CQN       | extraChIPs | Sliding   | CQN           | QLF    | counts |
| SW-CQNG      | extraChIPs | Sliding   | CQN Groups    | QLF    | counts |
| SW-SQN       | extraChIPs | Sliding   | qsmooth       | QLF    | normCounts |
| SW-SQNGC     | extraChIPs | Sliding   | qsmoothGC     | QLF    | normCounts |
| SW-LT        | extraChIPs | Sliding   | Library Size  | LT     | logCPM |
| SW-LTSQN     | extraChIPs | Sliding   | qsmooth       | LT     | logCPM |
| SW-LTSQNGC   | extraChIPs | Sliding   | qsmoothGC     | LT     | logCPM |

Table: *Methods available in extraChIPs which are being compared *


This makes a total of 19 methods, of which two are specific to DiffBind and the remainder possible using extraChIPs.
All above methods will be initially tested using $H_0: \mu = 0$.
Subsequent comparisons will be made using $H_0: -\lambda < \mu < \lambda$ but excluding DiffBind results.

## Datasets

All approaches will be compared across multiple datasets:

| Dataset | Cell Type | ChIP Target | Treatments |
|:------- |:--------- |:----------- |:---------- |
| PRJNA509779 | ZR-75-1   | AR          | E2, E2DHT  |
| PRJNA509779 | ZR-75-1   | ER$\alpha$  | E2, E2DHT  |
| PRJNA509779 | ZR-75-1   | H3K27ac     | E2, E2DHT  |

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
4. Group-based approaches for TMM and CQN should perform strongly
4. Sliding windows should out-perform fixed-width windows for H3K27ac





A [workflowr][] project.

[workflowr]: https://github.com/workflowr/workflowr
