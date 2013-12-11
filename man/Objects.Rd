\name{Objects}
\alias{Objects}
\alias{ObjectsData}
\alias{ObjectsUtils}
\alias{Ls}
\alias{LsData}
\alias{LsUtils}
\title{
  List objects in object caches.
}
\description{
These functions may be used to find stored object caches on the search
path and list the objectes stored in them.  If the object cache is
currently not on the search path it is silently attached at position 2.
}
\usage{
Objects(lib = Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache"),
        lib.loc = Sys.getenv("R_LOCAL_LIB_LOC", unset = "."),
        all.names = FALSE, pattern = ".*", readonly = FALSE)
ObjectsData(...)
ObjectsUtils(...)
Ls(lib = Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache"),
        lib.loc = Sys.getenv("R_LOCAL_LIB_LOC", unset = "."),
        all.names = FALSE, pattern = ".*", readonly = FALSE)
LsData(...)
LsUtils(...)
}
\arguments{
  \item{lib}{The name of the cache directory from which items are to be
    removed.  May be given as a character string, or as a name,
    (i.e. without quotes) for convenience.  The default is as follows:
    \itemize{
      \item For \code{Objects}, the value of the \code{R} environment
	variable \code{R_LOCAL_CACHE}, or \code{.R_Cache} if unset,
      \item For \code{ObjectsData}, the value of the \code{R} environment
	variable \code{R_CENTRAL_DATA}, or \code{.R_Data} if unset,
      \item For \code{ObjectsUtils}, the value of the \code{R}
	environment variable \code{R_CENTRAL_UTILS}, or \code{.R_Utils}
	if unset.
      }
    }
  \item{lib.loc}{
    The enclosing directory where the cache directory is to be found.
    The default is as follows:
    \itemize{
      \item For \code{Objects}, the value of the \code{R} environment
      variable \code{R_LOCAL_LIB_LOC}, or the current working directory
      if unset,
      \item For \code{ObjectsDate} and \code{ObjectsUtils} the value of
	the \code{R} environment variable \code{R_CENTRAL_LIB_LOC}, or
	he user's \code{HOME} directory if unset.
      }
    }
  \item{all.names}{
    Logical.  Should all names be listed?  Normally objects with names
    beginning with a period are not listed.
  }
  \item{pattern}{
    Regular expression giving the pattern of object names to be listed.
  }
  \item{readonly}{
    If the stored object cache is not present on the search path, it is
    silently attached at position 2.  Should it be attached as `read only'?
  }
  \item{\dots}{
    Dummy argument to allow any of the above to be specified.
  }
}
\details{
  These convenience functions provide the same functionality as the
  standard function \code{objects}, or equivalently \code{ls}, but
  specialised to stored object caches.  They automatically locate caches
  on the search path and, optionally, attach them if not currently present.
}
\value{
  A character string vector of object names.
}
\references{
  None
}
\author{
Bill Venables
}
\note{
  The standard functions \code{objects} or \code{ls} may always be used
  on stored object caches, but require the position on the search path
  to be specified.
}

\seealso{
  \code{\link{objects}}, \code{\link{ls}}.
}
\examples{
## change default cache, keeping any previous setting
oldLC <- Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache")
Sys.setenv(R_LOCAL_CACHE=".R_Test")

## generate some dummy data
dummy <- rnorm(100)
mn <- mean(dummy)
va <- var(dummy)

## store it in the stored object cache
Store(dummy, mn, va)
Search()
Objects()
Remove(mn, va)
Objects()
Remove(Objects())                   # empty the cache
detach(".R_Test")                   # remove from search path
Sys.setenv(R_LOCAL_CACHE=oldLC)     # restore normal default
}
\keyword{utilities}

