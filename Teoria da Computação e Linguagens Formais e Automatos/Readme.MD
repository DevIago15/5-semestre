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

é associativa: (ςΥ) β = ς (Υβ)
NÃO é comutativa: ςΥ ≠ Υς
Seja X um símbolo E Σ
Então X^n = X X X X … X / N vazia

Exemplo:
Potência de um alfabeto - conjunto de todas as cadeias de certo comprimento, formada por símbolos de Σ Σ^k = Σ^0 U Σ^1 U Σ^2 U Σ^3 U …… Σ^3 = { Vazio, 0,1,00,01,10,11,000,0001,0010,0111... }

Comprimento da Cadeia: I I, é o n° natural que designer quantos símbolos compõem certa cadeia.
Exemplo:
Cadeia vazia = não tem símbolos, seu comprimento é zero.

LINGUAGEM FORMAL L sobre um Σ = coleção de cadeias de
comprimento finito compostas por símbolos de Σ
Σ^* = {0,1,2,3,……..infinito}
Σ^+ = Σ* - {vazio} - começa com o Σ^1

![Linguagem formal](https://github.com/DevIago15/5-semestre/blob/main/Teoria%20da%20Computa%C3%A7%C3%A3o%20e%20Linguagens%20Formais%20e%20Automatos/img/ling_formal.png)

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
Exemplo: G = { Σ, N, S, P}
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
Ex: G = aBabC, T = abCabC

![Derivação Direta](https://github.com/DevIago15/5-semestre/blob/main/Teoria%20da%20Computa%C3%A7%C3%A3o%20e%20Linguagens%20Formais%20e%20Automatos/img/derivacao-direta.png)

Derivação: G *⇒ T em que G⇒ g1 ⇒ g2 ⇒ g3 …. T
Ex: S*⇒ aabC

![Derivação](https://github.com/DevIago15/5-semestre/blob/main/Teoria%20da%20Computa%C3%A7%C3%A3o%20e%20Linguagens%20Formais%20e%20Automatos/img/derivacao.png)

## 01/03/2024 | 
G = {Σ, N, S, P}
1. E -> E + T
2. E -> T
3. T -> T * F
4. T -> F
5. F -> (E)
6. F -> a
    A1 = (a + a) * a
    A2 = (a + a) * (a +

 => G (Gramática)
 => Σ (Alfabeto) = {a, +, *, (, )}
 => N (Terminais) = {E, T, F} (os que são substituidos)
 => S (Símbolo Inicial) = {E} (o símbolo que está na primeira regras)
 => P (Regras de Substituição)

![Cadeia](url)
Derivando essa gramática com base nas cadeias ditas:
- E 2=> T 3=> T * F 4=> F * F 5=> (E) * F 4=> (E + T) * F 2=> (T + T) * F 4=> (F + T) * F 6=> (a + T) * F 4=> (a + F) * F 6=> (a + a) * F => (a+a)*a
- E 2=> T 4=> F 6=> a
- E 4=> E + T 2=> T + T 4=> F + T 6=> a + T 4=> a + F 6=> a + a

OBS: os números antes das setas são as etapas citadas, etapa por etapa chega no resultado final da cadeia.

A identificação da linguagem gerada por determinada grámatica, L(G), exige abstração e alguma prática na manipulação das regras.
Ex: G = { Σ, N, S, P}, em que 
    1. S -> 0S33
    2. S -> A
    3. A -> 12
    4. A -> ℷ (cadeia vazia)

Qual o L(G)?
R: Essa linguagem aceita a seguinte gramática: L(G) = {ℷ , 12, 033, 01233, 00333300123333, 000333333, 00012333333}, ou seja L(G) = {G | G = 0 ^ n (12) ^ n 3 ^ 2n; n = 0, 1, n >= 0}

Separando a Grámatica:
Σ => {1, 0, 2, 3}
N => {S, A}
S => {S}

A geração de uma sentença; ou seja, de uma cadeia ℷ, que pertence à L(G), pode ser retratado por uma árvore de derivação.
EX: S -> aBa
    B -> Sb | bCC
    C -> abb

ℷ = aababbabbabbaba

Exemplo de G para números inteiros em Fortran:
OBS: Os não terminais serão ladeados por <>:

<int> -> <sign> <number> <sign> -> + | - | ℷ <number> -> <digit> | <digit> <number> <digit> -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 gere sentenças válidas para essa G

== Grámaticas Equivalentes
Duas gramáticas G1 e G2 são equivalentes se L(G1) = L(G2); ou seja, se geram a mesma linguagem.
- uma linguagem pode ser gerada por mais de uma gramática 
- uma gramática gera apenas uma linguagem
Exemplo:
G:
    S -> 0AS
    A -> S | A

G2: 
    S -> 0B
    B -> 0S | O 

== Grámaticas Ambíguas
Uma gramática G é dita ser ambigua se existe uma sentença G na L(G) com duas árvores de derivações distintas.
Exemplo 1:
    S -> A
    A -> A0A | 1
G = 10101

Exemplo 2:
<declaracao> -> if <condicao> then <declaracao> | if <condicao> then <declaracao> else <declaracao> | <condicao>
<condicao> -> C := 0 | D := 1 | A :=3 | A:= 4
G = if C = 0 then if D = 1 A := 3 else A := 4

## 08/03/2024 | Tipos de Gramáticas
A classificação das linguagens, conhecida como hierarquia de Chomsky, tem como principal mérito agrupar as linguagens em classes, de modo a antecipar as propriedades por uma linguagem e viabilizar a escolha mais econômica para representar determinada linguagem, evitando o uso de formalismos mais complexos que o necessário ou então insuficientes. Permite selecionar o modelo de implementação de menor custo para cada linguagem.

A hierarquia de Chomsky define 4 classes distintas de linguagens:
    - Gramática Inestrita (tipo Ø)
    G = {2, N, S, P} em que P t em a forma u -> v
    uE(ΣUN)* vE(ΣUN)*
    Exemplo: G com Σ = {a, c, d}
                   N = {S, X, Y}
                   S = {S}
             P: 1 - S -> aXYc
                2 - aX -> cad
                3 - Xc -> aXa
                4 - XYc -> Xcc
                5 - Yc ->   ℷ
G1 = cad => S 1=> aXYc 2=> cadYc 5=> cad
G2 = acadac => S 1=> aXYc 1=> aXcc 3=> aXac 2=> acadac

    - Gramática Sensível ao Contexto
    (Tipo 1)
            Produção da forma:
            αAβ -> αGβ
             u  -> v
    com | v | >= | u |
    Exemplo: G com = { a, b, c}, N = {S, X, Y}
    S = {S} e P:
    1 - S -> aXb
    2 - S -> aXa
    3 - Xa -> bc
    4 - Xb -> cb
    G = ?  

    - Gramática Livre de Contexto
    (Tipo 2)
    As produções são todas da forma: u -> v   
                             1 único    vE (ZUN)*
                             não terminal   
    Exemplo: G com Σ = {0, 1}, N = {S}, S ={S} e P:
                                S -> 0S1
                                S -> ℷ

    - Gramática Regular (Tipo 3)
    As produções são da forma:
        u -> v
    1 único não terminal, regular à direita

    V pode ser { ℷ
                 ΣN
                 N
                 Σ
               }
    Exemplo: Σ = {0, 1, 2, 3}, N = {S, A}, S={S} e P:
                1. S -> 0S
                2. S -> 15
                3. S -> A
                4. A -> 2
                5. A -> 3
                G = ?

    regular à esquerda
    V pode ser { ℷ
                 ΣN
                 N
                 Σ
               }

    Exemplo: 1. S -> S2
             2. S -> S3
             3. S -> A
             4. A -> 1
             5. A -> 0

    Hierarquia de Chamsky:
    - Toda G do tipo 3 é também do tipo 2
    - Nem toda G do tipo 2 é do tipo 1. São do tipo 1 apenas aquelas que não possuem produção u-> v, com v = ℷ
    - Toda G do tipo 1 é também do tipo Ø
    => Classificar pela G mais simples
    A seleção do tipo de G implica.
    a) propriedades exibidas pela 1(G)
    b) características estruturais da L(G)

    Estruturalmente:
    - L livros de contexto = distinguem-se das L regulares por exibirem características de aninhamento => blocos de comandos, expressões matemáticas.
    - L sensíveis ao contexto = distinguem-se das livres de contexto por conterem sentenças (construções, cjtos de símbolos) cuja validade é vinculada à presença de seu contexto.
    - L irrestritas = distinguem-se das LSC por conseguirem demonstrar a indecisidibilidade de um problema genérico.

## 22/03/2024 - Exercícios de Gramáticas

## 05/04/2023
Automato Finito Determinitisco
(Maquina de Estado Finito)

São máquinas formadas por um número finito de estados junto a um dispositivo de entrada(fita), que lê, um por um, da esquerda para direita, símbolos da cadeia de entrada.

É inicializado em um estado inicial, é lendo o símbolo mais à esquerda da fita.

Caso a máquina esteja em um estado vazio e o símbolo lido seja x, a máquina se moverá para um certo estado, de acordo com a regra xx, chamada de função de transição.

A máquina para após ler todos os símbolos da cadeia de entrada.
Exemplo: Suponha que a máquina M tenha 4 estados:
Q0, Q1, Q2 e Q3, e para as cadeias de entrada sejam formadas pelos símbolos {a, b, c}.

Seja Q0 o estado inicial e que as regras da função de transição sejam:

Alternativamente, tal máquina pode ser representada por diagramas de transição de estados, no qual os estados são representados por círculos. A seta -> aponta para o estado inicial. Os estados finais possuem círculos duplas. As transições são representadas por arcos direcionados:
QL x -> Qj

Para facilitar a descrição dos movimentos da máquina, introduzimos o conceito de configuração.

A configuração da máquina M é um par[Q0, vazio], em que Q é o estado atual e G = ak ak+1..am é a parte da cadeia da entrada que falta ser llida.

A configuração inicial é

Q0, Q1, Q2, Q3 ->
INCOMPLETO


## 10/05/2024
1 - Construir o diagrama de transição para os AFNDs que aceitam o sigma = {0, 1} e:
a) cadeias que tenham 01 com sufixo
b) cadeias que tenham 1 na antepenultima posição
c) cadeias que tenham dois 0's consecutivos ou dois Ps consecutivos
d) cadeias que tenham o último simbolo diferente do primeiro

2 - Construir AFNDs para as seguintes linguages:
a) L1 = {w00 | wEsigma = {0, 1} }
b) L2 = { x01y | x, y sigma {0, 1} }

3 - Construa um AFND que aceite cadeias sobre sigma = {0, 1, 2, 3, ..., 9} tal que o digito final ja tenha aparecido antes na cadeia.

4 - Seja M um AFND que:
Q = { q0, q1, q2 }
sigma = {a, b, c }
Q0 = { q0 }
F = { q1, q0 }
beta = { (q0, a) -> { q1, q2 }
	(q1, b) -> {q1, q2}
	(q2, c) -> {q2}
Qual a L(M)?

5 - Converta o seguinte AFND para um AFD equivalente:

6 - Dada G:
	S -> A
	A -> bB | vazio
	B -> aA
    
Construa o diagrama AFND equivalente
