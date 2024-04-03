function verificacao() {
    // DECLARAÇÃO DE VARIÁVEIS
    var nome = document.getElementById("exampleNome").value;
    var cpf = document.getElementById("exampleCPF").value;
    var email = document.getElementById("exampleEmail").value;
    var cidade = document.getElementById("exampleCidade").value;
    var telefone = document.getElementById("examplePhone").value;
    var dataNascimento = document.getElementById("exampleNascimento").value;
    var obs = document.getElementById("exampleOBS").value;

    if (nome === "" || cpf === "" || email === "" || cidade === "" || telefone === "" || dataNascimento === "" || obs === "") {
        // CASO ALGUM CAMPO ESTEJA VAZIO, EXIBE O ALERTA VERMELHO
        document.getElementById("alertaDanger").style.display = "block";
        // ESCONDE O ALERTA VERDE PARA NÃO SER EXIBIDO NESSE CASO
        document.getElementById("alertaSucesso").style.display = "none";
    } else {
        // CASO ESTEJA TUDO OK, ESCONDE O ALERTA VERMELHO
        document.getElementById("alertaDanger").style.display = "none";
        // E EXIBE O ALERTA VERDE
        document.getElementById("alertaSucesso").style.display = "block";
        // DÁ UM TEMPO E REDIRECIONA O USUÁRIO PARA A HOME
        setTimeout(function() {
            window.location.href = "index.html";
        }, 3500);
    }
}
