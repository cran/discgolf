% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tag.R
\name{tag}
\alias{tag}
\title{Tag data}
\usage{
tag(tag, url = NULL, key = NULL, user = NULL, ...)
}
\arguments{
\item{tag}{A tag name}

\item{url}{Base url for a Discourse installation. See 
\code{\link{disc_setup}}}

\item{key}{Your api key on the Discourse installation. See 
\code{\link{disc_setup}}}

\item{user}{Your user name on the Discourse installation. See 
\code{\link{disc_setup}}}

\item{...}{Named parameters passed on to \code{\link[crul]{HttpClient}}}
}
\description{
Tag data
}
\examples{
\dontrun{
tag('r')
tag('geospatial')
}
}
