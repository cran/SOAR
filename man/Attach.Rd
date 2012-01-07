\name{Attach}
\alias{Attach}
\alias{AttachData}
\alias{AttachUtils}
\title{
  Attach object cache
}
\description{
Place a stored object cache one the search path, or change the position
of such a cache already on the search path.
}
\usage{
Attach(lib = Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache"),
       lib.loc = Sys.getenv("R_LOCAL_LIB_LOC", unset = "."),
       pos = 2, uniquely = TRUE, readonly = FALSE, ...)
AttachData(...)
AttachUtils(...)
}
\arguments{
  \item{lib}{The name of the cache directory from which items are to be
    removed.  May be given as a character string, or as a name,
    (i.e. without quotes) for convenience.  The default is as follows:
    \itemize{
      \item For \code{Attach}, the value of the \code{R} environment
	variable \code{R_LOCAL_CACHE}, or \code{.R_Cache} if unset,
      \item For \code{AttachData}, the value of the \code{R} environment
	variable \code{R_CENTRAL_DATA}, or \code{.R_Data} if unset,
      \item For \code{AttachUtils}, the value of the \code{R}
	environment variable \code{R_CENTRAL_UTILS}, or \code{.R_Utils}
	if unset.
    }
  }
  \item{lib.loc}{
    The enclosing directory where the cache directory is to be found.
    The default is as follows:
    \itemize{
      \item For \code{Attach}, the value of the \code{R} environment
	variable \code{R_LOCAL_LIB_LOC}, or the current working directory
	if unset,
      \item For \code{AttachDate} and \code{AttachUtils} the value of
	the \code{R} environment variable \code{R_CENTRAL_LIB_LOC}, or
	he user's \code{HOME} directory if unset.
    }
  }
  \item{pos}{
    The position on the search path where the object cache is to be
    placed, or the new position if the cache is already on the search
    path.
  }
  \item{uniquely}{
    Logical. Are multiple copies of the same cache on the search path to
    be disallowed?  If \code{TRUE}, a single copy only is left on the
    search path.
  }
  \item{readonly}{
    Logical.  If \code{TRUE} modifications to the objects in the cache
    are prevented.
  }
  \item{\dots}{
    Extra arguments to be passed on to internal \code{SOAR} functions.
    Presently unused.
  }
}
\details{
  An existing object cache is attached to the search path.  If the
  object cache directory, \code{file.path(lib.loc, lib)}, currently does
  not exist a warning is issued to that effect, but also advising that
  the directory will be created when an object is to be \code{Store}d
  there.
}
\note{
  If the cache is not presently attached to the search path, it is
  sliently attached at postion 2 before objects are removed from it.

  Old caches made in pre-release versions of \code{SOAR} (known as
  \code{ASOR}) will be converted to the present format with a
  warning that this is happening.  After this conversion only the
  current version of the package may be used to access the cached
  objects.
}
\value{
Nothing of interest.  The function is used solely for its side-effect on
the search path
}
\references{
None
}
\author{
Bill Venables
}
\note{
This function is not often needed, as any of the other main functions,
(\code{Store}, \code{Objects}, \code{Remove} and their variants), will
automatically attach the object cache if required to do so.  A common
use is to change the position of a currently attached object cache on
the search path.

To release an object cache from the search path, use the standard
function \code{detach}.
}

\seealso{
\code{\link{attach}}, \code{\link{detach}}.
}
\examples{
## change default cache, keeping any previous setting
oldLC <- Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache")
Sys.setenv(R_LOCAL_CACHE=".R_Test")

## generate some dummy data
dummy <- rnorm(100)
mn <- mean(dummy)
va <- var(dummy)

Attach()                            # may give warning

## store it in the stored object cache
Store(dummy, mn, va)
Search()

Attach(pos=3)                       # change to pos=3
Search()

Objects()
Remove(mn, va)
Objects()
Remove(Objects())                   # empty the cache

detach(".R_Test")                   # remove from search path
Sys.setenv(R_LOCAL_CACHE=oldLC)     # restore normal default
}
\keyword{utilities}

