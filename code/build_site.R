## Update extraChIPs if needed
library(workflowr)
fl <- here::here(
	paste0(
		"analysis/",
		c("zr75_ar.Rmd")#, "zr75_er.Rmd", "zr75_h3k27ac.Rmd")
	)
)
wflow_build(fl)