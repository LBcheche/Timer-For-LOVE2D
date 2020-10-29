# Timer para LOVË2D

Timer é uma classe LOVË2D responsável por chamar uma função após um certo tempo.

Um tempo de espera e uma função de retorno são definidos pela classe cliente passando
uma tabela de parametros no construtor ou chamando seus respectivos métodos set.


## PRÉ-REQUISITOS

- Plataforma [LOVË2D](https://love2d.org/). 
- Timer.lua deve ser capaz de usar [class.lua](https://github.com/vrld/hump/blob/master/class.lua). Ex: `Class = require 'lib/class'`  


## MÉTODOS PÚBLICOS

### Construtor

- `init(params)`: Função do construtor responsável por instanciar um objeto Timer. O parâmetro `params` é uma tabela com o seguinte formato:

```
{
    time = ... ,
    alarmFunction = function() return ... end,
    loop = ... ,
}
```

onde:

- `time`: Número que representa o tempo atual em segundos.

- `alarmFunction`: Função callback da classe cliente que será chamada após o término do Timer.

- `loop`: Booleano que sinaliza se o temporizador será automaticamente reiniciado.

### Método de Atualização

- `update(dt)`: Função callback padrão da plataforma LOVË2D, responsável pela atualização do Timer. 
Deve ser chamado na função update da classe cliente ou diretamente da função `love.update` em *main.lua* . 
O `dt` é a abreviação mais comum de delta time (variação de tempo), que geralmente é utilizado como parametro na função
`love.update`, representando a quantidade de tempo passado desde que foi chamado pela última vez.

### Métodos de Manuseio do Temporizador

- `start()`: Função pública responsável por iniciar o timer.

- `reset()`: Função pública responsável por reiniciar o timer.

- `pause()`: Função pública responsável por pausar o timer.



### Métodos Set

- `setAlarmFunction(afunc)`: Função pública responsável por definir a função callback que será chamada ao final da contagem regressiva.
O parâmetro `afunc` é uma função callback definida pela classe cliente.

- `setTime(time)`: Função pública responsável por definir o tempo para a contagem regressiva. 
O parâmetro `time` é um valor numerico que será atribuido ao tempo do Timer, dimensionado em segundos.

- `setLoop(bLoop)`: Função pública responsável por definir se o timer irá 
reiniciar automaticamente após um ciclo de temporização regressiva. O parâmetro `bLoop` é um valor booleano. 

### Métodos Get/Has

- `getTime()`: Função pública responsável por retornar o tempo atual do Timer.

- `isRunning()`: Função pública responsável por retornar um valor booleano que 
indica se o timer está atualizando a contagem regressiva.

- `expired()`: Função pública responsável por retornar um valor booleano que 
indica se o timer expirou.
