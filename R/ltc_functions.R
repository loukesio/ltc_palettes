#' List of colour palettes
#' @export
palettes <- list(
  paloma = c("#83AF9B","#C8C8A9","#F9CDAD","#f7bf95","#fe5c7a"),
  trio <- c("#3d5a80","#98c1d9","#e0fbfc","#ee6c4d","#293241"),
  dora = c("#52777A","#542437","#C02942","#D95B43","#ECD078"),
  ploen = c("#3F5671","#83A1C3","#CEB5C8","#FAC898","#B17776"),
  pastel1=c("#c9e3c2","#68b7bb","#E9C46A","#F4A261","#846A8A"),
  check1 = c("#fac3ad","#F67280","#9298BA","#0889A6"),
  surf= c("#fceaab","#F7A992","#82A0C2","#85496F"),
  new2 =c("#5980B1","#b96a8d","#A55062","#E05256","#E9A986"),
  new3 =c("#ff7676","#F9D662", "#7cab7d", "#75B7D1"),
  new4 = c("#E8B961","#E88170", "#C6BDE8", "#5DB7C4","#FD95BC"))

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

 structure(out, class = "palette", name = name)
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
    theme(plot.title = element_text(hjust = 0.5, face="italic"),legend.position = "none")  +
    labs(title = attributes(x)$name)
}

