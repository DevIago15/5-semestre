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
        document.getElementById("modalDanger").style.display = "block";
    } else {
        document.getElementById("modalSucesso").style.display = "block";
        // DÁ UM TEMPO E REDIRECIONA O USUÁRIO PARA A HOME
        setTimeout(function() {
            window.location.href = "index.html";
        }, 3500);
    }
}

  // Selecione o modal Danger
  var modalDanger = document.getElementById('modalDanger');
  // Selecione o botão "OK" do modal Danger
  var okBtnDanger = document.getElementById('modalOKBtn');
  // Selecione os botões "Close" do modal Danger
  var closeBtnsDanger = document.querySelectorAll('.btn-close');

  // Adicione um ouvinte de evento para o clique no botão "OK" do modal Danger
  okBtnDanger.addEventListener('click', closeModalDanger);

  // Adicione ouvintes de evento para o clique nos botões "Close" do modal Danger
  closeBtnsDanger.forEach(function(btn) {
    btn.addEventListener('click', closeModalDanger);
  });

  // Selecione o modal de Sucesso
  var modalSuccess = document.getElementById('modalSucesso');
  // Selecione o botão "OK" do modal de Sucesso
  var okBtnSuccess = document.getElementById('modalOKBtnS');
  // Selecione os botões "Close" do modal de Sucesso
  var closeBtnsSuccess = document.querySelectorAll('.btn-close');

  // Adicione um ouvinte de evento para o clique no botão "OK" do modal de Sucesso
  okBtnSuccess.addEventListener('click', closeModalSuccess);

  // Adicione ouvintes de evento para o clique nos botões "Close" do modal de Sucesso
  closeBtnsSuccess.forEach(function(btn) {
    btn.addEventListener('click', closeModalSuccess);
  });

  // Função para fechar o modal de Danger
  function closeModalDanger() {
    modalDanger.classList.remove('show');
    modalDanger.setAttribute('aria-hidden', 'true');
    modalDanger.style.display = 'none';
    document.body.classList.remove('modal-open');
  }

  // Função para fechar o modal de Sucesso
  function closeModalSuccess() {
    modalSuccess.classList.remove('show');
    modalSuccess.setAttribute('aria-hidden', 'true');
    modalSuccess.style.display = 'none';
    document.body.classList.remove('modal-open');
  }

  // Adicione um ouvinte de evento para quando o modal de Danger é mostrado
  modalDanger.addEventListener('shown.bs.modal', function () {
    // Adicione a classe de fundo escurecido ao body
    document.body.classList.add('modal-open');
  });

  // Adicione um ouvinte de evento para quando o modal de Sucesso é mostrado
  modalSuccess.addEventListener('shown.bs.modal', function () {
    // Adicione a classe de fundo escurecido ao body
    document.body.classList.add('modal-open');
  });
