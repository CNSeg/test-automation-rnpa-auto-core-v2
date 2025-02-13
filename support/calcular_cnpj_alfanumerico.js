function cnpj_alfanumerico_generator(){
    const elementos = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", 
        "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
        "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
                    
    const cnpj = [];

    // 1. Gerar os 12 primeiros elementos do cnpj 
    for (let i = 0; i < 12; i++) {
        const sorteio = elementos[Math.floor(Math.random() * elementos.length)];
        cnpj.push(sorteio);
    }

    // 2. Calcular o 1º dígito vericador
    var dv1 = calcular_dv(cnpj);
    cnpj.push(dv1);
    
    // 3. Calcular o 2º dígito vericador
    var dv2 = calcular_dv(cnpj);
    cnpj.push(dv2);

    return cnpj.join("");
}

/** Espera um array de strings */
function calcular_dv(cnpj){
    var pesos = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    
    // Adicionar o número 6 no começo do array
    if (cnpj.length == 13){
        pesos.unshift(6);
    }
    
    var somatorio = 0; 
    for (let i = 0; i < cnpj.length; i++){
        somatorio += pesos[i] * Number((cnpj[i].charCodeAt(0) - 48));
    }

    var result_mod = somatorio % 11;
    
    if ( result_mod == 0 || result_mod == 1){
        return "0";
    } else {
        return (11 - result_mod).toString(); 
    }
}

/** Espera uma string sem máscara */
function verificar_dv(cnpj){

    var doc = cnpj.slice(0,12);
    doc = doc.split("");

    var dv1 = calcular_dv(doc);
    doc.push(dv1);
    
    var dv2 = calcular_dv(doc);
    doc.push(dv2);

    return doc.join("") == cnpj;
}

var cnpj = cnpj_alfanumerico_generator();
console.log(`CNPJ Alfanumérico: ${cnpj}`);

var resultado = verificar_dv(cnpj)? "Sim" : "Não";
console.log(`É válido(${cnpj})? ${resultado}`);

resultado = verificar_dv("08583723000172")? "Sim" : "Não";
console.log(`É válido (08583723000172)? ${resultado}`);


