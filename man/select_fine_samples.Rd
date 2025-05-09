% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/garnettFunction.R
\name{select_fine_samples}
\alias{select_fine_samples}
\title{This function takes single-cell expression data in the form of a CDS object
and a cell type definition file (marker file) and trains a multinomial
classifier to assign cell types. The resulting \code{garnett_classifier}
object can be used to classify the cells in the same dataset, or future
datasets from similar tissues/samples.}
\usage{
select_fine_samples(
  cds,
  marker_file,
  db,
  cds_gene_id_type = "ENSEMBL",
  marker_file_gene_id_type = "SYMBOL",
  cutoff = 0.75,
  min_observations = 8,
  max_training_samples = 500,
  num_unknown = 500,
  propogate_markers = TRUE,
  cores = 1,
  lambdas = NULL,
  classifier_gene_id_type = "ENSEMBL",
  return_initial_assign = TRUE
)
}
\arguments{
\item{cds}{Input CDS object.}

\item{marker_file}{A character path to the marker file to define cell types.
See details and documentation for \code{\link{Parser}} by running
\code{?Parser}for more information.}

\item{db}{Bioconductor AnnotationDb-class package for converting gene IDs.
For example, for humans use org.Hs.eg.db. See available packages at
\href{http://bioconductor.org/packages/3.8/data/annotation/}{Bioconductor}.
If your organism does not have an AnnotationDb-class database available,
you can specify "none", however then Garnett will not check/convert gene
IDs, so your CDS and marker file must have the same gene ID type.}

\item{cds_gene_id_type}{The type of gene ID used in the CDS. Should be one
of the values in \code{columns(db)}. Default is "ENSEMBL". Ignored if
db = "none".}

\item{marker_file_gene_id_type}{The type of gene ID used in the marker file.
Should be one of the values in \code{columns(db)}. Default is "SYMBOL".
Ignored if db = "none".}

\item{min_observations}{An integer. The minimum number of representative
cells per cell type required to include the cell type in the predictive
model. Default is 8.}

\item{max_training_samples}{An integer. The maximum number of representative
cells per cell type to be included in the model training. Decreasing this
number increases speed, but may hurt performance of the model. Default is
500.}

\item{num_unknown}{An integer. The number of unknown type cells to use as an
outgroup during classification. Default is 500.}

\item{propogate_markers}{Logical. Should markers from child nodes of a cell
type be used in finding representatives of the parent type? Should
generally be \code{TRUE}.}

\item{cores}{An integer. The number of cores to use for computation.}

\item{lambdas}{\code{NULL} or a numeric vector. Allows the user to pass
their own lambda values to \code{\link[glmnet]{cv.glmnet}}. If \code{NULL},
preset lambda values are used.}

\item{classifier_gene_id_type}{The type of gene ID that will be used in the
classifier. If possible for your organism, this should be "ENSEMBL", which
is the default. Ignored if db = "none".}

\item{return_initial_assign}{Logical indicating whether an initial
assignment data frame for the root level should be returned instead of a
classifier. This can be useful while choosing/debugging markers. Please
note that this means that a classifier will not be built, so you will not
be able to move on to the next steps of the workflow until you rerun the
functionwith \code{return_initial_assign = FALSE}. Default is \code{FALSE}.}
}
\description{
This function takes single-cell expression data in the form of a CDS object
and a cell type definition file (marker file) and trains a multinomial
classifier to assign cell types. The resulting \code{garnett_classifier}
object can be used to classify the cells in the same dataset, or future
datasets from similar tissues/samples.
}
\details{
This function has three major parts: 1) parsing the marker file 2)
 choosing cell representatives and 3) training the classifier. Details on
 each of these steps is below:

 Parsing the marker file: the first step of this function is to parse the
 provided marker file. The marker file is a representation of the cell types
 expected in the data and known characteristics about them. Information
 about marker file syntax is available in the documentation for the
 \code{\link{Parser}} function, and on the
 \href{https://cole-trapnell-lab.github.io/garnett}{Garnett website}.

 Choosing cell representatives: after parsing the marker file, this function
 identifies cells that fit the parameters specified in the file for each cell
 type. Depending on how marker genes and other cell type definition
 information are specified, expression data is normalized and expression
 cutoffs are defined automatically. In addition to the cell types in the
 marker file, an outgroup of diverse cells is also chosen.

 Training the classifier: lastly, this function trains a multinomial GLMnet
 classifier on the chosen representative cells.

 Because cell types can be defined hierarchically (i.e. cell types can be
 subtypes of other cell types), steps 2 and 3 above are performed iteratively
 over all internal nodes in the tree representation of cell types.

 See the
 \href{https://cole-trapnell-lab.github.io/garnett}{Garnett website} and the
 accompanying paper for further details.
}
