#' List of colour palettes
#' @export
palettes <- list(
  paloma = c("#83AF9B","#C8C8A9","#F9CDAD","#FC9D9A","#FE4365"),
  dora = c("#52777A","#542437","#C02942","#D95B43","#ECD078"),
  ploen = c("#3F5671","#83A1C3","#CEB5C8","#C5A79C","#B17776"),
  pastel1=c("#439093","#E9DD8A","#F9EBD9","#EBD6D7","#F09B93")
)

#' Select ltc palette
#' @description This function returns colour palettes
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. But hopefully we'll add more palettes soon. All color
#'   schemes are derived from the most excellent Tumblr blog:
#'   If omitted, uses all colours.#' @return A vector of hex colour codes
#' @export
#' @examples
#' ltc("paloma")
#' ltc("dora")


ltc <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )

 structure(out, class = "LTCpalette", name = name)
}


#' Plot colour palette
#' @description Plot chosen colour palette from ltc package
#' @param x A vector of colours
#' @return An image showing colours in palette
#' @export
#' @import ggplot2
#' @examples
#' paloma <- ltc("paloma")
#' palt(paloma)

palt <- function(x) {
  n <- length(x)
  df <- data.frame(x = c(1:n), y = rep(1, n), text=x[1:n])
  ggplot(df, aes(x = x, y = y)) +
    geom_tile(fill = x,
              colour = "white",
              size = 3) +
    geom_text(aes(label=text), color="#333333", nudge_y = -0.53) +
    theme_void() +
    theme(legend.position = "none")
}
