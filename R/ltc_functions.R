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
#' @param palette_name Name of desired palette
#' @return A vector of hex colour codes
#' @export
#' @examples
#' ltc_palette("paloma")
#' ltc_palette("dora")


ltc_palette <- function(palette_name) {

  pal <- palettes[[palette_name]]
  if (is.null(pal))
    stop("Whoops! That colour palette does not exist in feathers :(")
  pal

}


#' Plot colour palette
#' @description Plot chosen colour palette from ltc package
#' @param x A vector of colours
#' @return An image showing colours in palette
#' @export
#' @import ggplot2
#' @examples
#' paloma <- ltc_palette("paloma")
#' print_pal(paloma)

print_pal <- function(x) {

  n <- length(x)
  df <- data.frame(x = c(1:n), y = rep(1, n), text=x)
  print(df)
  ggplot(df, aes(x = x, y = y)) +
    geom_tile(fill = x,
              colour = "white",
              size = 3) +
    geom_text(aes(label=text), color="#333333", nudge_y = -0.53) +
    theme_void() +
    theme(legend.position = "none")
}
