function adjustValue({value, object, fieldName, isObjectArray = false}){
    if (value == "remove field"){
        if(fieldName in object){
            delete object[fieldName];
        }
    } else {
        var adjustedValue = checkForValues(value);

        if(isObjectArray){
            object[fieldName].push(adjustedValue);
        }
        else{
            object[fieldName] = adjustedValue;
        }
    }
}
   
function checkForValues(value){
    if (value == "as an empty string"){
        return "";
    }
    else if (value == "as a numeric value"){
        return 0;
    } 
    else if (value == "as an empty array"){
        return [];
    }
    else if (value == "as an empty object"){
        return {};
    }
    else if (value == "as null"){
        return null;
    }
    else if (value == "as undefined"){
        return undefined;
    } else {
        return value;
    }  
}

module.exports = {
    adjustValue
}