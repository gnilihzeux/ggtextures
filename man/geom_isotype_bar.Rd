% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-isotype-bar.R
\docType{data}
\name{geom_isotype_bar}
\alias{geom_isotype_bar}
\alias{geom_isotype_col}
\alias{GeomIsotypeBar}
\alias{GeomIsotypeCol}
\title{Isotype bars}
\usage{
geom_isotype_bar(mapping = NULL, data = NULL, stat = "count",
  position = "stack", ..., img_height = grid::unit(1, "native"),
  img_width = NULL, ncol = 1, nrow = NA, legend_key_params = NULL,
  width = NULL, na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE)

geom_isotype_col(mapping = NULL, data = NULL, stat = "identity",
  position = "stack", ..., img_height = grid::unit(1, "native"),
  img_width = NULL, ncol = 1, nrow = NA, legend_key_params = NULL,
  width = NULL, na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[=aes]{aes()}} or
\code{\link[=aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[=ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[=fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data.}

\item{stat}{Override the default connection between \code{geom_bar()} and
\code{stat_count()}.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{...}{Other arguments passed on to \code{\link[=layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}

\item{img_height}{Height of the isotype image, in grid units. Should
be provided in \code{"native"} units, which are converted to data units.
If \code{NULL}, the image height is taken from the image width and the image
aspect ratio.}

\item{img_width}{Width of the isotype image, in grid units. Should
be provided in \code{"native"} units, which are converted to data units.
If \code{NULL}, the image width is taken from the image height and the image
aspect ratio.}

\item{ncol}{Number of image columns. If \code{NA}, is calculated based on the
data extent.}

\item{nrow}{Number of image rows. If \code{NA}, is calculated based on the
data extent.}

\item{legend_key_params}{A list holding additional parameters to be handed off
to \code{texture_grob()} when it is used to draw the legend keys. These parameters
can be used, for example, to make sure the images in the legend keys have the
correct size or alignment.}

\item{width}{Bar width. By default, set to 90\% of the resolution of the data.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[=borders]{borders()}}.}
}
\description{
\code{geom_isotype_bar()} and \code{geom_isotype_col()} are equivalent to
\code{\link[=geom_bar]{geom_bar()}} and \code{\link[=geom_col]{geom_col()}} but draw columns with unit images.
These two geoms are essentially identical to \code{geom_textured_bar()} and
\code{geom_textured_col()}, they just have slightly different default settings.
}
\examples{
library(ggplot2)
library(tibble)
library(magick)

data <- tibble(
  count = c(5, 3, 6),
  animal = c("giraffe", "elephant", "horse"),
  image = list(
    image_read_svg("http://steveharoz.com/research/isotype/icons/giraffe.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/elephant.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/horse.svg")
  )
)

ggplot(data, aes(animal, count, image = image)) +
  geom_isotype_col() +
  theme_minimal()

ggplot(data, aes(animal, count, image = image)) +
  geom_isotype_col(
    img_width = grid::unit(1, "native"), img_height = NULL,
    ncol = NA, nrow = 1, hjust = 0, vjust = 0.5, fill = "#80808040"
  ) +
  coord_flip() +
  theme_minimal()
}
\keyword{datasets}
