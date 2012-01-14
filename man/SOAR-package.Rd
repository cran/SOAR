\name{SOAR-package}
\alias{SOAR-package}
\alias{SOAR}
\docType{package}
\title{
SOAR: Utility functions for memory management
}
\description{
  This suite of functions has two distinct purposes:
  \itemize{
    \item To provide an easy mechanism to store objects on the disc,
      releasing memory during the \code{R} session, but in
      such a way as to keep them visible on the search path and
      automatically loaded into memory if and when they are needed, and

    \item To allow objects to be made automatically available to multiple
      \code{R} sessions, possibly for testing prior to including them in
      formal packages.

    }
  }
\details{
  \tabular{ll}{
    Package: \tab SOAR\cr
    Type: \tab Package\cr
    Version: \tab 0.99-10\cr
    Date: \tab 2012-01-14\cr
    License: \tab GPL-2 or GPL-3\cr
    LazyLoad: \tab yes\cr
  }
  The function \code{Store} is used to take objects from memory and
  store them as \code{.RData} files, usually in a sub-directory of the
  current working directory we call a \emph{stored object cache}.  The
  directory is automatically created if required.  The search path is
  augmented to contain an entry that mirrors the stored object cache, in
  the sense that if an object in the cache is required in future it is
  loaded into memory by the same lazy loading mechanism as is used in
  packages.

  An established stored object cache may be added to, or re-positioned
  on, the search path by the function \code{Attach}, and the function
  \code{Objects} (alias: \code{Ls}) may be used to display the objects
  currently held in a stored object cache.

  Objects may be removed from the stored object cache using the function
  \code{Remove}.

  Any of the functions \code{Store}, \code{Objects} or \code{Remove}
  will silently attach existing stored object caches to the search path
  as required.

  Variants on the four basic functions with ``\code{Data}'' or
  ``\code{Utils}'' in their names, such as \code{StoreUtils} or
  \code{ObjectsData} differ from the corresponding basic version only in
  the way that their default argument values are defined.  The intention
  is to make it possible either to add to a \emph{local} stored object
  cache or to a \emph{central} stored object cache for data or utulity
  functions in a simple way.

  A function \code{Search} is also provided to show items on the search
  together with their \code{lib.loc} directories, as appropriate.

}
\author{
Bill Venables, borrowing heavily from David Brahm's package \pkg{g.data}.

Maintainer: Bill Venables, \email{Bill.Venables@CSIRO.au}.
}
\references{
  David E. Brahm, (2002) Delayed Data Packages, \emph{R News}, \bold{2},
  pp 11--12.  (Contains a brief discussion of the antecedent package,
  \pkg{g.data}.)
}
\keyword{ package }
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
