% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/roi.R
\name{neuprint_find_neurons}
\alias{neuprint_find_neurons}
\alias{neuprint_bodies_in_ROI}
\title{Find bodies within a given ROI}
\usage{
neuprint_find_neurons(
  input_ROIs,
  output_ROIs = NULL,
  dataset = NULL,
  conn = NULL,
  all_segments = FALSE,
  ...
)

neuprint_bodies_in_ROI(
  roi,
  dataset = NULL,
  all_segments = FALSE,
  conn = NULL,
  ...
)
}
\arguments{
\item{input_ROIs}{a vector of input ROIs. Use \code{neuprint_ROIs} to see what is available.}

\item{output_ROIs}{a vector of input ROIs. Use \code{neuprint_ROIs} to see what is available.}

\item{dataset}{optional, a dataset you want to query. If \code{NULL}, the
default specified by your R environ file is used or, failing that the
current connection, is used. See \code{\link{neuprint_login}} for details.}

\item{conn}{optional, a neuprintr connection object, which also specifies the
neuPrint server. If NULL, the defaults set in your
\code{\link[=Startup]{.Rprofile}} or \code{\link[=Startup]{.Renviron}} are
used. See \code{\link{neuprint_login}} for details.}

\item{all_segments}{if TRUE, all bodies are considered, if FALSE, only 'Neurons', i.e. bodies with a status roughly traced status.}

\item{...}{methods passed to \code{neuprint_login}}

\item{roi}{a single ROI. Use \code{neuprint_ROIs} to see what is available.}
}
\value{
a n x n matrix, where the rows are input neurons and the columns are their targets
}
\description{
Find bodies that input/output within certain ROIs (i.e. they must have synapses in these areas)
}
\examples{
\donttest{
# Find some neurons with inputs in the Antennal Lobe (AL) and
# outputs in the LH
pncands=neuprint_find_neurons(input_ROIs = "AL(R)", output_ROIs = "LH(R)")
head(pncands)
plot(`LH(R).pre`~`AL(R).post`, data=pncands)
}
\donttest{
lhr=neuprint_bodies_in_ROI('LH(R)')
head(lhr)
}
}
\seealso{
\code{\link{neuprint_fetch_custom}}, \code{\link{neuprint_simple_connectivity}}, \code{\link{neuprint_common_connectivity}}
}
