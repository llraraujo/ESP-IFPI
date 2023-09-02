//Beecrowd: 2031
//PS: Copiar o código inteiro e colar na questão correspondente do Beecrowd


var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

const partidas = parseInt(lines[0]);

for(let i = 0; i < lines.length ; i+=2){
    var jogador1 = lines[i+1];
    var jogador2 = lines[i+2];
    
    if(jogador1 == jogador2){
        if(jogador1 === "pedra"){
            console.log("Sem ganhador");
        }
        else if(jogador1 === "ataque"){
            console.log("Aniquilacao mutua");
        }
        else if(jogador1 === "papel"){
            console.log("Ambos venceram");
        }
    }
    else{
        if(jogador1 === "ataque"){
            console.log("Jogador 1 venceu");
        }
        else if(jogador2 === "ataque"){
            console.log("Jogador 2 venceu");
        }
        else if(jogador1 === "pedra"){
            console.log("Jogador 1 venceu");
        }
        else if(jogador2 === "pedra"){
            console.log("Jogador 2 venceu");
        }
        
    }

}


