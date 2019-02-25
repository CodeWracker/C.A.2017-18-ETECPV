# C.A.2017-18-ETECPV
Quiz utilizando PIC18F4520

#Resumo
O projeto visa elaborar um Jogo(Quizz) de perguntas e respostas com 5 alternativas que deverão ser respondidas por um dos competidores.

#Funcionamento e Regras do Jogo

Haverão 10 botões para respostas, 2 para escolha do jogador.

Haverão 6 lâmpadas,3 para cada jogador, duas verdes, duas amarelas e duas vermelhas.

Haverão 3 displays, dois para o placar de cada jogador e um para o cronometro.

Haverá uma buzina.
Os Botões indicados com a mesma letra serão curto circuitados.

A placa de controle enviará os pulsos de clock para os placares e o sinal de reset para o cronometro.

A placa de Controle receberá um sinal da placa do cronometro para detectar que o tempo acabou.

A placa de controle enviará o sinal para a placa de controle das lâmpadas para ativar a lâmpada respectiva a seu pino.

O apresentador fará a pergunta e dira as alternativas e então entregará uma ficha com as 5 alternativas para o jogador e sua equipe lerem assim que o apresentador disser que pode apertar o botão vermelho.

Assim que o botão for apertado um cronometro começa a contar de 0 até 60 segundos.

O jogador que apertar o botão vermelho primeiro terá o direito de escolher uma alternativa apertando um dos 5 botões indicados pelas letras: a, b, c, d, e.

Se o jogador escolher a resposta correta, a lâmpada verde acenderá, irá aumentar em 1 o seu placar, o cronometro irá parar e irá para a próxima pergunta.

Se o jogador escolher a resposta errada, a lâmpada vermelha acenderá, o cronometro irá parar, tocará uma buzina e irá para a próxima pergunta.

Se o jogador não escolher nenhuma resposta antes do tempo acabar, o cronometro vai parar, a lâmpada vermelha acenderá, tocará uma buzina e irá para a próxima pergunta.

No Final do Jogo o apresentador vai apertar o botão de Reset para preparar a mesa para a próxima rodada.

Ganha aquele que tiver mais pontos em seu placar.
