function simulate() {
    // captura os dados incluidos no input
    const alphabetInput = document.getElementById('input-alphabet').value.trim();
    const statesInput = document.getElementById('input-states').value.trim();
    const initialStateInput = document.getElementById('input-initial-state').value.trim();
    const finalStatesInput = document.getElementById('input-final-states').value.trim();
    const transitionsInput = document.getElementById('input-transitions').value.trim();
    const inputString = document.getElementById('input-string').value.trim();
  
    // captura o objeto de erro para usar caso necessário
    const errorMessage = document.getElementById('error-message');
    
    // verifica se todos os campos estão preenchidos, caso não estejam, exibe mensagem de erro
    if (!alphabetInput || !statesInput || !initialStateInput || !finalStatesInput || !transitionsInput || !inputString) {
      errorMessage.textContent = 'Por favor, preencha todos os campos.';
      return;
    }
    
    // limpa a mensagem de erro, caso sucesso
    errorMessage.textContent = '';
  
    // divide os valores da entrada em partes pra processar, retirando espaços, formando um array só
    const alphabet = alphabetInput.split(',').map(s => s.trim());
    const states = statesInput.split(',').map(s => s.trim());
    const initialState = initialStateInput;
    const finalStates = finalStatesInput.split(',').map(s => s.trim());
    const transitions = transitionsInput.split(';').map(t => t.split(',').map(s => s.trim()));
  
    // simula o automato passo a passo
    let currentState = initialState; // começa no estado inicial declarado pelo usuario
    let steps = `Estado Inicial: ${initialState}\n`; // armazena o passo a passo da simulação
  
    for (let symbol of inputString) { // para cada simbolo na cadeia de entrada, o programa verifica com a transição declarada
      const transition = transitions.find(t => t[0] === currentState && t[1] === symbol);
      if (!transition) {
        steps += `Não há transição para o símbolo '${symbol}' a partir do estado '${currentState}'.\n`; // se não encontra transição, registra mensagem de erro nos passos 
        break; // interrompe a simulação
      }
      const nextState = transition[2]; // declara o próximo estado seguindo dentro do for
      const isFinalState = finalStates.includes(nextState) ? " final" : "";
      steps += `Leu o Símbolo '${symbol}', foi para o Estado${isFinalState} ${nextState}\n`;
      currentState = nextState; // atualiza o estado atual para o próximo estado
    }
  
    // verifica se o estado final é um estado de aceitação e exibe o resultado
    const isAccepted = finalStates.includes(currentState);
    const result = isAccepted ? 
      `A cadeia '${inputString}' foi ACEITA pelo Autômato!` : 
      `A cadeia '${inputString}' foi REJEITADA pelo Autômato!`;
  
    document.getElementById('simulation-steps').textContent = steps;
    document.getElementById('result').textContent = result;
  }

  // O código captura os valores dos campos de entrada, 
  // verifica se todos os campos estão preenchidos, processa os valores, simula o autômato passo a passo, 
  // e finalmente exibe os passos da simulação e o resultado (aceito ou rejeitado) ao usuário. A validação inicial garante que a 
  // simulação só ocorra se todos os campos estiverem devidamente preenchidos, melhorando a experiência do usuário.
  