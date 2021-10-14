#' @title col2transparent
#' @name col2transparent
#' @description R color to transparent conversion.
#' @param col R color name or R color pal [mandatory]
#' @param alpha.perc an alpha-transparency level in percent [default: 0]
#' @return A character vector with elements of 9 characters,
#' "#" followed by the red, blue, green and alpha values in hexadecimal
#' (after rescaling to 0 ... 255).
#' @importFrom grDevices col2rgb palette rgb
#' @seealso [grDevices::palette()]
#' @examples
#' paloma <- ltc("paloma")
#' paloma <- col2transparent(paloma,50)
#' plts(paloma)
#' @export col2transparent
#' @author Kristian K Ullrich

col2transparent <- function(col, alpha.perc = 0){
  if(class(col) == "character"){
    if(length(col) == 1){
      alpha = (100 - alpha.perc) * 255 / 100
      R = col2rgb(col)[1]
      G = col2rgb(col)[2]
      B = col2rgb(col)[3]
      return(rgb(R, G, B, alpha, maxColorValue = 255))
    } else {
      return(unlist(lapply(col,
                           function(x) {
                             col2transparent(x, alpha.perc)
                           })))
    }
  }
  if(class(col) == "palette"){
    out <- unlist(lapply(col, function(x) {col2transparent(x, alpha.perc)}))
    out <- structure(out, class = "palette", name = attr(col, "name"))
    return(out)
  }
}
