#' List of colour palettes
#' @export
palettes <- list(
  paloma = c("#83AF9B","#C8C8A9","#f8da8a","#f7bf95","#fe8ca1"),
  maya=c("#3d5a80","#98c1d9","#e0fbfc","#ee6c4d","#293241"),
  dora = c("#52777A","#542437","#C02942","#D95B43","#ECD078"),
  ploen = c("#3F5671","#83A1C3","#CEB5C8","#FAC898","#B17776"),
  olga=c("#c9e3c2","#8bc8cb","#eccd80","#f5ab70","#9c87a1"),
  mterese=c("#f7ddaa","#fac3ad","#f897a1","#9298BA","#9cbeed"),
  gaby=c("#fceaab","#f1a890","#a8c4cc","#82A0C2","#85496F"),
  franscoise=c("#5980B1","#b96a8d","#A55062","#E05256","#E9A986"),
  fernande=c("#ff7676","#F9D662","#7cab7d","#75B7D1"),
  sylvie=c("#E8B961","#E88170","#C6BDE8","#5DB7C4","#FD95BC"),
  crbhits=c("#CBC106","#27993C","#1C6838","#8EBCB5","#389CA7","#4D83AB","#CB7B26","#BF565D","#9E163C"),
  expevo=c("#FC4E07","#E7B800","#00AFBB","#8B4769","#1d457f","gray"))

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

#' Add information about the bio
#' @export
info <- data.frame(palette_name=c("paloma",
                                  "maya",
                                  "dora",
                                  "ploen",
                                  "olga",
                                  "mterese",
                                  "gaby",
                                  "franscoise",
                                  "fernande",
                                  "sylvie",
                                  "crbhits",
                                  "expevo"),
                   bio=c("Daughter of Francoise Gillot and Pablo Picasoo",
                         c("Daughter of  Marie-Thérèse Walte and Pablo Ruiz Picasso"),
                         c("French photographer, painter, and poet"),
                         c("A beautiful village in Northern Germany"),
                         c("Olga Khokhlova was a Russian balette dancer"),
                         c("Marie-Thérèse Walter was a French model and mother of Maya"),
                         c("Gabrielle Depeyre Lespinasse was a french dancer"),
                         c("Franscoise Gilot was a significant French painter"),
                         c("Fernande was a French model and artist"),
                         c("Sylvette David is a French artist and model"),
                         c("CRBHits is a R package"),
                         c("The colors that I use in my time series")))

#' Plot colour palette
#' @description Plot chosen colour palette from ltc package
#' @param x A vector of colours
#' @return An image showing colours in palette
#' @export
#' @import ggplot2 dplyr
#' @examples
#' paloma <- ltc("paloma")
#' pltc(paloma)

pltc <- function(chromata,...) {

  info2 =info %>%
    filter(palette_name==attributes(chromata)$name)

  n <- length(chromata)
  df <- data.frame(xvals = c(1:n), yvals = rep(1, n), text=chromata[1:n])
  ggplot2::ggplot(df, aes(x = xvals, y = yvals)) +
    ggplot2::geom_tile(fill = chromata,
              colour = "white",
              size = 1) +
    ggplot2::geom_text(aes(label=text), color="#333333", nudge_y = -0.53) +
    ggplot2::theme_void() +
    ggplot2::theme(plot.title = element_text(hjust = 0.5, face="italic"),
          plot.subtitle = element_text(hjust = 0.5, size=10),    # Subtitle customization
          legend.position = "none") +
    ggplot2::labs(title = info2$palette_name, subtitle = info2$bio)
}

#' Plot colour palette as sinus curve
#' @description Plot chosen colour palette from ltc package as sinus curve
#' @param x A vector of colours
#' @return A sinus curve showing colours in palette
#' @export
#' @import ggplot2 dplyr
#' @examples
#' paloma <- ltc("paloma")
#' plts(paloma)

plts <- function(chromata, ...) {
    x <- outer(
    seq(-pi, pi, length.out = 50),
    seq(0, pi, length.out = length(chromata)),
    function(x, y) sin(x - y))
    graphics::matplot(x, type = "l", lwd = 4, lty = 1, col = chromata, ...)
}
