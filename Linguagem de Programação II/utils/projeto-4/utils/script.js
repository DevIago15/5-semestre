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
// COMPORTAMENTO DOS MODAIS DO FORMULÁRIO
  var modalDanger = document.getElementById('modalDanger');
  var okBtnDanger = document.getElementById('modalOKBtn');
  var closeBtnsDanger = document.querySelectorAll('.btn-close');

  okBtnDanger.addEventListener('click', closeModalDanger);

  closeBtnsDanger.forEach(function(btn) {
    btn.addEventListener('click', closeModalDanger);
  });

  var modalSuccess = document.getElementById('modalSucesso');

  var okBtnSuccess = document.getElementById('modalOKBtnS');

  var closeBtnsSuccess = document.querySelectorAll('.btn-close');

  okBtnSuccess.addEventListener('click', closeModalSuccess);

  closeBtnsSuccess.forEach(function(btn) {
    btn.addEventListener('click', closeModalSuccess);
  });

  function closeModalDanger() {
    modalDanger.classList.remove('show');
    modalDanger.setAttribute('aria-hidden', 'true');
    modalDanger.style.display = 'none';
    document.body.classList.remove('modal-open');
  }

  function closeModalSuccess() {
    modalSuccess.classList.remove('show');
    modalSuccess.setAttribute('aria-hidden', 'true');
    modalSuccess.style.display = 'none';
    document.body.classList.remove('modal-open');
  }

  modalDanger.addEventListener('shown.bs.modal', function () {

    document.body.classList.add('modal-open');
  });

  modalSuccess.addEventListener('shown.bs.modal', function () {
    document.body.classList.add('modal-open');
  });
