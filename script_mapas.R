uls_mave_mun <- c("Santo Tirso", "Trofa", "Vila Nova de Famalicão")
uls_as_mun <- c("Amadora", "Sintra")

theme_map <- function(...) {
  theme_minimal() +                    # Começa com o tema minimalista do ggplot2
    theme(
      axis.line = element_blank(),       # Remove as linhas dos eixos
      axis.text.x = element_blank(),     # Remove o texto do eixo X
      axis.text.y = element_blank(),     # Remove o texto do eixo Y
      axis.ticks = element_blank(),      # Remove os ticks (marcadores) dos eixos
      axis.title.x = element_blank(),    # Remove o título do eixo X
      axis.title.y = element_blank(),    # Remove o título do eixo Y
      panel.grid.major = element_blank(),# Remove as grades principais do painel
      panel.grid.minor = element_blank(),# Remove as grades menores do painel
      panel.border = element_blank(),    # Remove a borda do painel
    )
}

gdh_uls_comm <- comm_pt |> 
  mutate(
    municipio_2013 = geodsg
  ) |> 
  right_join(
    gdh_uls,
    by = "municipio_2013"
  )

uls_map <- ggplot() +
  geom_sf(data = comm_pt,
          aes(fill = NAME_1), 
          size = 0.8,
          colour = NA,
          # color = "darkgray",
          fill = "lightgray"
          ## fill = "white"
  ) +
  geom_sf(data = gdh_uls_comm, 
          aes(fill = municipio_2013),
          size = 0.3,
          color = "black"
  ) +
  labs(x = NULL, 
       y = NULL,
       legend = NULL,
       label = "ULS Amadora/Sintra e ULS Médio Ave"
       # title = "ULS Médio Ave", 
       # subtitle = "2024", 
       # caption = "Data: DGS, 2021"
  ) +
  #scale_fill_discrete(name = "Concelhos") +
  coord_sf() +
  # Ajustar a posição e estilo da legenda
  theme_map() +
  theme(
    legend.title = element_blank(),
    legend.position = "none",
    # legend.position = "right",
    # legend.direction = "vertical",
    legend.text = element_blank() # element_text(size = 8, colour = "gray50")
  )

ggsave("mapa_uls_junto.png", uls_map) 

ulsmave_map <- ggplot() +
  geom_sf(data = subset(comm_pt, geodsg %in% uls_mave_mun), 
          aes(fill = uls_mave_mun), 
          size = 1.0,
          colour = "black"
          # color = "darkgray",
          ## fill = "white"
  ) +
  # geom_sf(data = gdh_uls_comm, 
  #         aes(fill = municipio_2013),
  #         size = 0.3,
  #         color = "black"
  # ) +
  labs(x = NULL,
       y = NULL,
       legend = NULL,
       label = "",
       title = "ULS Médio Ave"
       # subtitle = "",
       # caption = ""
  ) +
  #scale_fill_discrete(name = "Concelhos") +
  coord_sf() +
  # Ajustar a posição e estilo da legenda
  theme_map() +
  theme(
    legend.title = element_blank(),
    legend.position = "none",
    # legend.position = "right",
    # legend.direction = "vertical",
    legend.text = element_blank() # element_text(size = 8, colour = "gray50")
  )

ulsmave_map

ggsave("mapa_uls_mave.png", ulsmave_map) 

subset(comm_pt, geodsg %in% uls_mave_mun)

uls_as_map <- ggplot() +
  geom_sf(data = subset(comm_pt, geodsg %in% uls_as_mun), 
          aes(fill = uls_as_mun), 
          size = 1.0,
          colour = "black"
          # color = "darkgray",
          ## fill = "white"
  ) +
  # geom_sf(data = gdh_uls_comm, 
  #         aes(fill = municipio_2013),
  #         size = 0.3,
  #         color = "black"
  # ) +
  labs(x = NULL,
       y = NULL,
       legend = NULL,
       label = "",
       title = "ULS Amadora Sintra"
       # subtitle = "",
       # caption = ""
  ) +
  #scale_fill_discrete(name = "Concelhos") +
  coord_sf() +
  # Ajustar a posição e estilo da legenda
  theme_map() +
  theme(
    legend.title = element_blank(),
    legend.position = "none",
    # legend.position = "right",
    # legend.direction = "vertical",
    legend.text = element_blank() # element_text(size = 8, colour = "gray50")
  )

uls_as_map

ggsave("mapa_uls_as.png", uls_as_map)

# ! - Falta: - Dados demográficos
## uls com distrito, concelhos e area ars