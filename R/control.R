#' @export
`%if%` <- function(env, cond) {
  cond <- eval(substitute(cond), env)
  list(env=env, true = cond, false  = !cond, val=rep(NA, length(cond)))
}

#' @export
`%then%` <- function(lst, val) {
  lst$val[lst$true] <- val[1]
  lst
}

#' @export
`%elif%` <- function(lst, cond) {
  cond <- eval(substitute(cond), lst$env)
  lst$true  <- lst$false &  cond
  lst$false <- lst$false & !cond
  lst
}

#' @export
`%else%` <- function(lst, val) {
  lst$val[lst$false] <- val[1]
  lst$val
}
