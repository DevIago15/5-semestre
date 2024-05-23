using System;
using System.Collections.Generic;

namespace AfdIago
{
    class AFD
    {
        // declaração das matrizes
        private HashSet<string> Estados;
        private HashSet<char> Alfabeto;
        private string EstadoInicial;
        private HashSet<string> EstadosFinais;
        private Dictionary<(string, char), string> Transicoes;

        // conectando as matrize com as variaveis
        public AFD(HashSet<string> estados, HashSet<char> alfabeto, string estadoInicial, HashSet<string> estadosFinais, Dictionary<(string, char), string> transicoes)
        {
            Estados = estados;
            Alfabeto = alfabeto;
            EstadoInicial = estadoInicial;
            EstadosFinais = estadosFinais;
            Transicoes = transicoes;
        }

        // método que irá processar a cadeia
        public bool ProcessarCadeia(string cadeia)
        {
            string estadoAtual = EstadoInicial;
            Console.WriteLine($"\nEstado inicial: {estadoAtual}");

            foreach (char simbolo in cadeia)
            {
                if (!Alfabeto.Contains(simbolo))
                {
                    Console.WriteLine($"\nSímbolo {simbolo} não pertence ao alfabeto.");
                    return false;
                }

                if (!Transicoes.TryGetValue((estadoAtual, simbolo), out string estadoProximo))
                {
                    Console.WriteLine($"Não há transição definida para o estado {estadoAtual} com símbolo {simbolo}.");
                    return false;
                }

                Console.WriteLine($"Leu o Símbolo {simbolo} e foi para o Estado {estadoProximo}");
                estadoAtual = estadoProximo;
            }

            if (EstadosFinais.Contains(estadoAtual))
            {
                Console.WriteLine($"A cadeia {cadeia} foi ACEITA pelo Autômato!");
                return true;
            }
            else
            {
                Console.WriteLine($"A cadeia {cadeia} foi REJEITADA pelo Autômato!");
                return false;
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // define os estados, alfabetos, estados inicias/finais e transicoes do AFD
            var estados = new HashSet<string> { "Q0", "Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7" };
            var alfabeto = new HashSet<char> { '0', '1' };
            string estadoInicial = "Q0";
            var estadosFinais = new HashSet<string> { "Q2", "Q4", "Q6", "Q7" };
            var transicoes = new Dictionary<(string, char), string>
            {
                { ("Q0", '0'), "Q1" },
                { ("Q0", '1'), "Q1" },
                { ("Q1", '0'), "Q3" },
                { ("Q1", '1'), "Q7" },
                { ("Q2", '0'), "Q2" },
                { ("Q2", '1'), "Q2" },
                { ("Q3", '0'), "Q4" },
                { ("Q3", '1'), "Q5" },
                { ("Q4", '0'), "Q4" },
                { ("Q4", '1'), "Q6" },
                { ("Q5", '0'), "Q7" },
                { ("Q5", '1'), "Q7" },
                { ("Q6", '0'), "Q6" },
                { ("Q6", '1'), "Q6" },
                { ("Q7", '0'), "Q7" },
                { ("Q7", '1'), "Q7" }
            };

            // cria do AFD
            AFD afd = new AFD(estados, alfabeto, estadoInicial, estadosFinais, transicoes);

            // solicita ao usuário a cadeia que deseja analisar
            Console.WriteLine("Digite a cadeia que você deseja analisar:");
            string cadeia = Console.ReadLine();

            // processa a cadeia e retorna o resultado
            afd.ProcessarCadeia(cadeia);
        }
    }
}
