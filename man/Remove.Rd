\name{Remove}
\alias{Remove}
\alias{RemoveData}
\alias{RemoveUtils}
\title{
Remove stored objects from the disc.
}
\description{
These utilities may be used to remove objects under delayed assignment
from the disc permanently, where objects are respectively held in a
local cache, a central data cache or central utilities cache.  
}
\usage{
Remove(..., list = character(0),
       lib = Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache"),
       lib.loc = Sys.getenv("R_LOCAL_LIB_LOC", unset = getwd()))
RemoveData(...)
RemoveUtils(...)
}
%- maybe also 'usage' for other objects documented here.
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
      \item For \code{Remove}, the value of the \code{R} environment
	variable \code{R_LOCAL_CACHE}, or \code{.R_Cache} if unset,
      \item For \code{RemoveData}, the value of the \code{R} environment
	variable \code{R_CENTRAL_DATA}, or \code{.R_Data} if unset,
      \item For \code{RemoveUtils}, the value of the \code{R}
	environment variable \code{R_CENTRAL_UTILS}, or \code{.R_Utils}
	if unset.
      }
    }
  \item{lib.loc}{
    The enclosing directory where the cache directory is to be found.
    The default is as follows:
    \itemize{
      \item For \code{Remove}, the value of the \code{R} environment
      variable \code{R_LOCAL_LIB_LOC}, or the current working directory
      if unset, 
      \item For \code{RemoveDate} and \code{RemoveUtils} the value of
	the \code{R} environment variable \code{R_CENTRAL_LIB_LOC}, or
	he user's \code{HOME} directory if unset.
      }
    }
}
\details{
  Linking the default values of \code{lib} and \code{lib.loc} to
  environment variables allows the user to re-set the defaults, if need
  be, either during startup or in the \code{R} session.  
}
\value{
  Nothing.  Used only for side-effects.
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
\references{
  None
}
\author{
  Bill Venables
}
\seealso{
\code{\link{rm}}, \code{\link{remove}}.
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
