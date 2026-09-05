-- Specs do veículo exigidas pelo grupo estruturado veicProd (TVeicProd) da NF-e
-- de venda de moto 0km — não têm de onde vir hoje (nem no estoque 0km nem no
-- catálogo de modelos). Cadastradas por unidade no estoque 0km; a maioria sai
-- da NF de entrada da fábrica. Ver docs-fiscal-299/pendencias.md §2.8 / §2.12.
alter table estoque_motos_novas
  add column if not exists potencia_motor text,               -- pot (CV)
  add column if not exists peso_liquido numeric,              -- pesoL (kg)
  add column if not exists peso_bruto numeric,                -- pesoB (kg)
  add column if not exists numero_motor text,                 -- nMotor
  add column if not exists codigo_cor_fabricante text,        -- cCor (código de cor do fabricante)
  add column if not exists codigo_cor_denatran text,          -- cCorDENATRAN
  add column if not exists codigo_marca_modelo_denatran text; -- cMod (código Marca/Modelo DENATRAN)

comment on column estoque_motos_novas.potencia_motor is 'veicProd/pot — potência do motor em CV.';
comment on column estoque_motos_novas.numero_motor is 'veicProd/nMotor — número do motor (por unidade).';
comment on column estoque_motos_novas.codigo_marca_modelo_denatran is 'veicProd/cMod — código Marca/Modelo da tabela DENATRAN.';
