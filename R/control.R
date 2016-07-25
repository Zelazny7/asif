`%if%` <- function(env, cond) {
  list(condition = cond, elseCond  = !cond, returnVal = NULL)
}

`%then%` <- function(l, val) {
  if (is.null(l$returnVal)) l$returnVal <- rep(NA, length(l$condition))
  if (length(val) == 1) {
    l$returnVal[l$condition] <- val
  } else {
    stopifnot(length(l$returnVal) == val)
    l$returnVal[l$condition] <- val[l$condition]
  }
  return(l)
}

`%elif%` <- function(l, cond) {
  if (length(cond) != length(l$condition))
    stop("test conditions not the same length")
  l$condition <- l$elseCond & cond
  l$elseCond  <- l$elseCond & !cond
  return(l)
}

`%else%` <- function(l, val) {
  if (length(val) == 1) {
    l$returnVal[l$elseCond] <- val
  } else {
    stopifnot(length(l$returnVal) == length(val))
    l$returnVal[l$elseCond] <- val[l$elseCond]
  }
  return(l$returnVal)
}
