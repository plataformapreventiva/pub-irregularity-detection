# Load Población y Geometrías
con1 <- prev_connect()

# Geometría
geom_nal <- load_geom(con1,raw,geom_municipios_old,geom_col=geom,col_shape=cve_muni)

### Población y Pobreza
## CONEVAL 2015
coneval <- load_table(con1,clean,coneval_municipios) %>% retrieve_result() %>% 
  filter(data_date == "2015-a")

## Intercensal 2015
intercensal <- load_table(con1,public,poblacion_intercensal_mun_2015) %>% retrieve_result() %>%
  dplyr::rename(poblacion_intercensal = poblacion)
## Conapo
conapo <- load_table(con1,raw,conapo_proyecciones_poblacion) %>% retrieve_result() 
poblacion <- left_join(coneval, intercensal)

