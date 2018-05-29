#' Soft theme for ggplot2 maps
#'
#' @param base_size The default font size for the map.
#' @export
map_theme_soft <- function(base_size = 12){
  ggthemes::theme_map(base_size = base_size) %+replace%
    theme(
      axis.title = element_text(size = 14),
      legend.background = element_rect(colour=NA, fill =NA),
      legend.direction = "vertical",
      legend.position = "right",
      legend.title = element_blank(),
      plot.margin = margin(1, 1, 1, 1, 'cm'),
      legend.key.height = unit(1, "cm"), legend.key.width = unit(0.2, "cm"),
      panel.grid = element_blank(),
      panel.border = element_blank(),
      panel.background = element_rect(fill = '#edebe1', colour = '#edebe1'),
      panel.grid.major = element_line(colour = '#d6d4c9'),
      plot.background = element_rect(fill = '#edebe1', colour = '#edebe1'),
      plot.title = element_text(color = '#adab9f', hjust = 0, size = 12),
      plot.subtitle =  element_text(color = '#adab9f', hjust = 0, size = 11),
      plot.caption = element_text(color = '#adab9f', hjust = 1, size = 10),
      strip.background = element_rect(fill = NA)
    )
}


#' Dark theme for ggplot2 maps
#'
#' @param base_size The default font size for the map.
#' @export
map_theme_space <- function(base_size = 12){
  ggthemes::theme_map(base_size = base_size) %+replace%
    theme(
      axis.title = element_text(size = 14),
      legend.background = element_rect(colour=NA, fill =NA),
      legend.direction = "vertical",
      legend.position = "right",
      legend.text = element_text(color = '#babaae'),
      legend.title = element_blank(),
      plot.margin = margin(1, 1, 1, 1, 'cm'),
      legend.key.height = unit(1, "cm"), legend.key.width = unit(0.2, "cm"),
      panel.grid = element_blank(),
      panel.border = element_blank(),
      panel.background = element_rect(fill = '#3a3a35', colour = '#3a3a35'),
      panel.grid.major = element_line(colour = '#5e5e58'),
      plot.background = element_rect(fill = '#3a3a35', colour = '#3a3a35'),
      plot.title = element_text(color = '#babaae', hjust = 0, size = 12),
      plot.subtitle =  element_text(color = '#babaae', hjust = 0, size = 11),
      plot.caption = element_text(color = '#babaae', hjust = 1, size = 10),
      strip.background = element_rect(fill = NA)
    )
}

#' White theme for ggplot2 maps
#'
#' @param base_size The default font size for the map.
#' @export
map_theme_stark <- function(base_size = 12){
  ggthemes::theme_map(base_size = base_size) %+replace%
    theme(
      axis.title = element_text(size = 14),
      legend.background = element_rect(colour=NA, fill =NA),
      legend.direction = "vertical",
      legend.position = "right",
      legend.text = element_text(color = '#adab9f'),
      legend.title = element_blank(),
      plot.margin = margin(1, 1, 1, 1, 'cm'),
      legend.key.height = unit(1, "cm"), legend.key.width = unit(0.2, "cm"),
      panel.grid = element_blank(),
      panel.border = element_blank(),
      panel.background = element_rect(fill = '#fffef9', colour = '#fffef9'),
      panel.grid.major = element_line(colour = '#d6d4c9'),
      plot.background = element_rect(fill = '#fffef9', colour = '#fffef9'),
      plot.title = element_text(color = '#adab9f', hjust = 0, size = 12),
      plot.subtitle =  element_text(color = '#adab9f', hjust = 0, size = 11),
      plot.caption = element_text(color = '#adab9f', hjust = 1, size = 10),
      strip.background = element_rect(fill = NA)
    )
}
