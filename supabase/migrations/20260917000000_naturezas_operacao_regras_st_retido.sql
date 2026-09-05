-- Alíquota do ICMS-ST suportada pelo consumidor final (pST) do grupo
-- "ICMS retido anteriormente por substituição tributária" (CST 60 / TICMS60).
-- Parametrizada na regra de ICMS da natureza — mesma linha onde já ficam
-- aliquota_icms_efetiva / reducao_base_calculo_efetiva.
alter table naturezas_operacao_regras
  add column if not exists aliquota_suportada_consumidor_final numeric;

comment on column naturezas_operacao_regras.aliquota_suportada_consumidor_final is
  'pST — alíquota do ICMS-ST suportada pelo consumidor final (grupo ICMS-ST retido, CST 60). Ex.: 12 (SC).';
