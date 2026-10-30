SHAREABLE ANALYSIS AND OUTPUTS

DATA AVAILABILITY
Data are available upon request from the corresponding authors:
[blinded]

Request the cleaned df_final.RData used for this manuscript, with the original
data object, variable names, factor labels and coding. Data are not included.

REPRODUCING THE ANALYSES
1. Obtain the dataset from the corresponding authors.
2. Install R, Quarto and these R packages:
   install.packages(c("tidyverse", "knitr", "ggplot2", "patchwork", "gt",
     "mice", "mitml", "sandwich", "digest", "car", "gtable", "htmltools",
     "rmarkdown", "scales", "yaml"))
3. Set R's working directory to this folder. Run:
   source("analysis.R")
   render_analysis(data_path="C:/ResearchData/df_final.RData")
   Replace the example with the actual dataset path.
4. Wait for successful completion. Outputs are regenerated in Outputs/.
   Compare sample counts, main tables/figures and supplementary results with
   the supplied reports. The first run can take substantial time.

FILES
script_of_analyses.qmd: analyses and manuscript source, with portable paths.
analysis.R: launcher; requires Quarto available on PATH.
Outputs/Main_Manuscript/: BOTH blinded and unblinded manuscripts and main results.
Outputs/Supplementary_Files/: supplementary material.
The included outputs can be viewed without running any code.

Keep the seed (2026), 50 imputations, 20 iterations, sample filters and model
specifications unchanged for replication. No dependency lockfile is supplied;
R/package versions may affect results. A run records session information in
Outputs/Main_Manuscript/analysis_session_info.txt.
Rerunning also generates Outputs/private_cache/, containing participant-level
imputation objects: do not redistribute that cache or the dataset. To rerun
imputation from scratch, remove only the private_cache folder first.
Author names and ethics details are intentionally retained in the unblinded
manuscript and shared code. Generated files are overwritten on rerender.

