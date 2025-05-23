% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/garnettFunction.R
\docType{class}
\name{cell_rules}
\alias{cell_rules}
\alias{cell_rules-class}
\title{cell_rules class}
\description{
Representation of cell type derived from marker file.
}
\section{Slots}{

\describe{
\item{\code{name}}{character. Name of the cell type.}

\item{\code{gene_names}}{character. A list of all of the genes included in the
definition.}

\item{\code{expressed}}{character. A list of genes defined as "expressed:".}

\item{\code{not_expressed}}{character. A list of genes defined as "not expressed:".}

\item{\code{gene_rules}}{vector of GeneRules-class. A list of genes defined under
specific rules using "expressed below:", "expressed above:", or
"expressed between:".}

\item{\code{meta}}{data.frame of meta data rules specified in marker file.}

\item{\code{parenttype}}{character. The name of the parent type - specified by
"subtype of:".}

\item{\code{references}}{character. A list of references included in the definition.}
}}

