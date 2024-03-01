# Teoria da Computação e Linguagens Formais e Automatos
Estudo de modelos matemáticos que possibilitam a especificação e o reconhecimento de linguagens (no sentido amplo da palavra), suas classificações, estruturas, propriedades, características e inter-relacionamentos.

## 18/02/2024 - 23/02/2024
== Linguagens Formais:
Conceitos:
- Alfabeto - ∀ conjunto finito e não vazio de símbolos.
- Símbolos - representações gráficas indivisíveis.
- *Cadeia - sequência finita de símbolos escolhidos de um alfabeto usualmente, denota-se alfabeto por Σ

Notações envolvendo cadeias de símbolos:
- Concatenação - justa posição ordenada dos símbolos de duas cadeias, formando uma nova cadeia.
Exemplo: Σ = {0,1}
cadeias ς = } β =
 Υ = } 

é associativa: (ςΥ)β=ς(Υβ)
NÃO é comutativa: ςΥ ≠ Υς
Seja X um símbolo E Σ
Então X^n = X X X X … X / N vazia

Exemplo:
Potência de um alfabeto - conjunto de todas as cadeias de
certo comprimento, formada por símbolos de Σ
Σ^k = Σ^0 U Σ^1 U Σ^2 U Σ^3 U ……
Σ^3 = { Vazio, 0,1,00,01,10,11,000,0001,0010,0111... }

Comprimento da Cadeia: I I, é o n° natural que designer quantos símbolos compõem certa cadeia.
Exemplo:
Cadeia vazia = não tem símbolos, seu comprimento é zero.

LINGUAGEM FORMAL L sobre um Σ = coleção de cadeias de
comprimento finito compostas por símbolos de Σ
Σ^* = {0,1,2,3,……..infinito}
Σ^+ = Σ* - {vazio} - começa com o Σ^1

![Linguagem formal](incluir_url)

As linguagens de interesse prático, caso das linguagens de programação, precisam de métodos e notações que permitam e identificam as cadeias que efetivamente pertencem à linguagem que estiver sendo definida, descartando-se ao demais.
São 3 métodos dentre os mais empregados para a representação finita de linguagens;
- Gramática = especificação finita de dispositivos de GERAÇÃO DE CADEIAS. Deve ser capaz de GERAR toda e qualquer cadeia pertencente à linguagem definida pela gramática, e nada mais.

- Reconhecedores = especificações finitas de dispositivos de ACEITAÇÕES DE CADEIAS. Deverá ACEITAR toda e qualquer cadeia pertencente à linguagem por ele definido e REJEITAR as demais.

- ENUMERAÇÕES = relacionam de forma explicita e exaustiva, todas as cadeias pertencentes à linguagem especifica.

== Gramática:
Constituem sistemas formais baseados em regras de substituição, através dos quais é possível produzir uma sentença válida na linguagem.

== Descrição Formal: uma gramática G consiste de 4 objetos:
- Um conjunto Σ (alfabeto da linguagem), cujos elementos serão chamados de terminais, usualmente denotados pelas letras minúsculas.
- Um conjunto N de símbolos diferentes dos terminais. (Σ ∩ N = ∅), cujos elementos serão chamados de não terminais, usualmente denotados por letras maiúsculas. São os símbolos intermediários utilizados na geração das sentenças, mas sem fazer parte das mesmas.
- Um elemento S E N, é chamado de símbolo inicial.
- Um conjunto P de regras de substituição/produção. Este conjunto consiste de expressões da forma A → x1,x2…xN; A = ao menos 1 não terminal x1,x2… = x1 E ( Σ U N ) em que A poderá ser substituído por x1,x2,…xN.
Exemplo: G = { Σ, N,S,P}
    Σ = {a,b,c}
    N = {S,A,B,C}
    S = {S}
    P = 1. S → Aab
    2. S → B
    3. A → aB
    4. A → a
    5. B → bC
    6. C → ac
    7. C → Vazia
Forma Sentencial: ∀ cadeia x1,x2 …..xN , com Xi E (Z N)

== Derivação Direta: G ⇒ T
em que G gera imediatamente T
Ex: G= aBabC, T= abCabC

![Derivação Direta](incluir_url)

Derivação: G *⇒ T em que G⇒ g1 ⇒ g2 ⇒ g3 …. T
Ex: S*⇒ aabC

![Derivação](incluir_url)

