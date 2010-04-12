\name{Search}
\alias{Search}
\title{
Slightly enhanced display of the search path
}
\description{
Produces an object which, when printed, shows each entry on the search
path, together with the enclosing directory, or \code{lib.loc}, where
the entry is a package or similar.
}
\usage{
Search(abbrev = FALSE)
}
\details{
Provides a way to distinguish between multiple entries on the search
path with the same name, by showing their \code{lib.loc} directories, if
any.
}
\arguments{
  \item{abbrev}{If the \code{lib.loc} is long should it be truncated to
    avoid overwhelming the display?
    \itemize{
      \item If \code{FALSE} (the default), no truncation,
      \item If \code{TRUE} truncate on the left leaving the last 50
      characters, 
      \item If numeric, truncate on the left leaving the last
      \code{max(1,abbrev)} characters. 
    }
  }
}
\value{
A two-column character matrix with the first column showing the names of
the entries on the search path and the second their \code{lib.loc}
directories, where applicable.  The printed matrix will have quotes
suppressed with \code{noquote}.
}
\references{
None
}
\author{
Bill Venables
}
\note{
May be independently useful outside the \code{ASOR} package.
}

\seealso{
\code{\link{search}}.
}
\examples{
Search()
}
\keyword{utilities}

