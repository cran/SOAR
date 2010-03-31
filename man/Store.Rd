\name{Store}
\alias{Store}
\alias{StoreData}
\alias{StoreUtils}
\title{
  Store objects out of memory in a stored object cache.
}
\description{
  These functions take objects in memory and store them on the disc in a
  directory we call a ``stored object cache''.  The objects remain
  visible and are brought back into memory as required using the same
  mechanism as is used for lazy loading in packages.  If the stored
  object cache does not already exist it is created.  If it is not
  already attached to the search path it is silently attached.
}
\usage{
Store(..., list = character(0),
      lib = Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache"),
      lib.loc = Sys.getenv("R_LOCAL_LIB_LOC", unset = getwd()),
      remove = TRUE)
StoreData(...)
StoreUtils(...)
}

\arguments{
  \item{\dots}{items to be removed.  Names are taken as objects to be
    removed.  Character strings, or calls resulting in character
    strings, are taken as providing names of items to be removed as
    character strings.
  }
  \item{list}{a character string vector providing the names of objects
    to be removed.  An alternative to \code{\dots} allowing the user to
    provide an explicit list of names.
  }
  \item{lib}{The name of the cache directory from which items are to be
    removed.  May be given as a character string, or as a name,
    (i.e. without quotes) for convenience.  The default is as follows:
    \itemize{
      \item For \code{Store}, the value of the \code{R} environment
	variable \code{R_LOCAL_CACHE}, or \code{.R_Cache} if unset,
      \item For \code{StoreData}, the value of the \code{R} environment
	variable \code{R_CENTRAL_DATA}, or \code{.R_Data} if unset,
      \item For \code{StoreUtils}, the value of the \code{R}
	environment variable \code{R_CENTRAL_UTILS}, or \code{.R_Utils}
	if unset.
      }
    }
  \item{lib.loc}{
    The enclosing directory where the cache directory is to be found.
    The default is as follows:
    \itemize{
      \item For \code{Store}, the value of the \code{R} environment
      variable \code{R_LOCAL_LIB_LOC}, or the current working directory
      if unset,
      \item For \code{StoreDate} and \code{StoreUtils} the value of
	the \code{R} environment variable \code{R_CENTRAL_LIB_LOC}, or
	he user's \code{HOME} directory if unset.
      }
    }

  \item{remove}{
    Logical.  Should the objects be removed from the current environment?
    Normally this would be the case.  
  }
}
\details{
  These functions take objects currently in memory and store them as
    \code{.RData} files in a special directory on the disc, normally a
    sub-directory of the present working directory.  We call the
    directory a ``stored object cache''.  The objects are then made
    visible by attaching an environment to the search path which loads
    the file on demand using essentially the lazy loading technique.
    The path of the stored object cache is specified in two parts, the
    \code{lib.loc} giving the path of the parent directory and the
    \code{lib}, giving the name of the directory iteself.  This is the
    same protocol as is used for loading packages using \code{library}
    or \code{require}, for example.
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
Nothing of interest.  Used only for its side effect.
}
\references{
  None.
}
\author{
  Bill Venables
}
\seealso{
  \code{\link{save}}, \code{\link{load}}.
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

