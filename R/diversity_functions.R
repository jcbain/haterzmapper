#' Calculates the diversity index of a vector of data.
#'
#' @param x Vector of counts
#' @param index Selected diversity index. Can be 'shannon' or 'simpson'
#' @return An index of class numeric
#' @examples
#' diversity_index(x = c(1, 2, 3))
#' diversity_index(x = c(20,20,20), index = 'simpson')
#' @export
diversity_index <- function(x, index = 'shannon'){
  tot = sum(x)
  prop = x/tot

  if(index == 'shannon'){
    H = -1 * sum(prop * log(prop))
    d = H
  }
  if(index == 'simpson'){
    D = 1/sum(prop^2)
    d = D
  }
  d
}


#' Calculates the eveness of the diversity index. It can take on a value between
#'     0 and 1 with 1 being complete eveness.
#'
#' @param x Vector of counts
#' @param index Selected diversity index. Can be 'shannon' or 'simpson'
#' @return A eveness metric of class numeric
#' @examples
#' equitability(x = c(1, 2, 3))
#' equitability(x = c(20,20,20), index = 'simpson')
#' @export
equitability <- function(x, index = 'shannon'){
  S = length(x)
  d = haterzmapper::diversity_index(x, index = index)

  if(index == 'shannon'){
    Hmax = log(S)
    E = d/Hmax
  }
  if(index == 'simpson'){
    E = d/S
  }
  E
}
