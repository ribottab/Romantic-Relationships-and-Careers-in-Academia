# Launch from this folder: Rscript analysis.R
# In RStudio: set the working directory to this folder, then source analysis.R.
render_analysis <- function(project_dir = getwd(), data_path = NULL) {
  project_dir <- normalizePath(project_dir, winslash="/", mustWork=TRUE)
  script <- file.path(project_dir, "script_of_analyses.qmd")
  if(!file.exists(script)) stop("Set project_dir to the folder containing script_of_analyses.qmd.")
  if(!is.null(data_path)) {
    old_data_path <- Sys.getenv("HOMOGAMY_DATA_PATH", unset=NA_character_)
    on.exit(if(is.na(old_data_path)) Sys.unsetenv("HOMOGAMY_DATA_PATH") else
      Sys.setenv(HOMOGAMY_DATA_PATH=old_data_path), add=TRUE)
    Sys.setenv(HOMOGAMY_DATA_PATH=normalizePath(data_path, winslash="/", mustWork=TRUE))
  }
  data_file <- Sys.getenv("HOMOGAMY_DATA_PATH",
                         unset=file.path(project_dir,"data","df_final.RData"))
  if(!file.exists(data_file)) stop("Dataset not included. Supply an authorized data_path.")
  quarto <- unname(Sys.which("quarto"))
  if(!nzchar(quarto)) stop("Install Quarto and ensure its command is available on PATH.")
  old_dir <- setwd(project_dir)
  on.exit(setwd(old_dir), add=TRUE)
  status <- system2(quarto, shQuote(c("render", "script_of_analyses.qmd")))
  if(status != 0L) stop("Quarto rendering failed; inspect the preceding error.")
  invisible(file.path(project_dir,"Outputs"))
}
if(sys.nframe() == 0L) render_analysis()

