gdh_base <-  import("data/data_gdh/base_gdh_icd10_no_freg.csv")

gdh_base <- clean_names(gdh_base)

code_residence <- import("data/data_gdh/codigos_residencia.csv")

code_residence <- code_residence |> 
  clean_names() |> 
  select(
    cod_dist, 
    cod_conc,
    des_dcf
  )

# valores únicos hospital_id
hosp_id <- distinct(gdh_base, hosp_id)

tipo_adm <- distinct(gdh_base, adm_tip)



#  
patient_id <- distinct(gdh_base, seq_number)

total_patients <- length(patient_id$seq_number)
  

patient_id <- patient_id |> 
  mutate(
    total_patients = length(patient_id$seq_number)
  )

sum_


# factorizar sexo, tipo_port_apr31
# 


# agrupar por idades 
mutate(
  valor_cat = cut(valor, c(0, 3, 6, 9, 12, 15))
  
# criar tabela 
# variáveis: idade, sexo, nº episodios, 