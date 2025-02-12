const faker = require("faker");
const dateParser = require("./date-parser");

function createVariableFromString(value) {
    
    const validateCharsRegex = /(\d+) caracteres/;
    
    let newValue;

    if (validateCharsRegex.test(value)){
        let result = value.match(validateCharsRegex);
        let number = parseInt(result[1]);
        newValue = faker.random.alphaNumeric(number);
    }
    else if (value == "string vazia"){
        newValue = ""; 
    }
    else if (value == "nulo"){
        newValue = null; 
    }
    else if (value == "booleano"){
        newValue = true; 
    }
    else if (value == "numerico"){
        newValue = 1; 
    }
    else if (value == "array vazio"){
        newValue = []; 
    }
    else if (value == "objeto vazio"){
        newValue = {}; 
    }
    else if (value == "Amanhã"){
        newValue = dateParser.parseDate({
            format:"YYYY-MM-DD", 
            moment:"Amanhã"
        });
    }
    else if (value == "Ontem"){
        newValue = dateParser.parseDate({
            format:"YYYY-MM-DD", 
            moment:"Ontem"
        });
    }
    else {
        newValue = value;
    }

    return newValue;
}

module.exports = {
    createVariableFromString
}