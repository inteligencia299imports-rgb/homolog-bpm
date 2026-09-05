/**
 * Specs do grupo `veicProd` (veículo novo) exigidas pela SEFAZ na NF-e de venda
 * de moto 0km. Ficam por unidade em `estoque_motos_novas` — cadastradas no dialog
 * "Dados fiscais (NF-e)" do estoque 0km. Enquanto qualquer uma faltar, a edge
 * function `emitir-nfe-compra` emite a nota SEM o grupo estruturado.
 */

export interface SpecsVeicProd {
  potencia_motor?: string | number | null;
  peso_liquido?: string | number | null;
  peso_bruto?: string | number | null;
  numero_motor?: string | null;
  codigo_cor_fabricante?: string | null;
  codigo_cor_denatran?: string | null;
  codigo_marca_modelo_denatran?: string | null;
}

const CAMPOS: Array<{ key: keyof SpecsVeicProd; label: string }> = [
  { key: 'potencia_motor', label: 'Potência do motor' },
  { key: 'peso_liquido', label: 'Peso líquido' },
  { key: 'peso_bruto', label: 'Peso bruto' },
  { key: 'numero_motor', label: 'Nº do motor' },
  { key: 'codigo_cor_fabricante', label: 'Código de cor (fabricante)' },
  { key: 'codigo_cor_denatran', label: 'Código de cor DENATRAN' },
  { key: 'codigo_marca_modelo_denatran', label: 'Código Marca/Modelo DENATRAN' },
];

const preenchido = (v: unknown) => !!String(v ?? '').trim();

/** Labels das specs que faltam para o grupo veicProd. Vazio = completo. */
export function pendenciasVeicProd(m: SpecsVeicProd | null | undefined): string[] {
  if (!m) return CAMPOS.map((c) => c.label);
  return CAMPOS.filter((c) => !preenchido(m[c.key])).map((c) => c.label);
}
