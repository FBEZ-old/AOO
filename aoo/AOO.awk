@namespace "AOO"

function checkType(obj, class){
    if(obj["_t"]==class["type"]){
        return 0;
    }else{
        return -1;
    }
}

function checkOutput(value_out){
    # the output variable should always be an array because arrays are passed by reference
    if(!awk::isarray(value_out)){ 
        return -1;
    }
    delete value_out;
    value_out["ret"]=0;
    value_out["msg"]="ok";
    return 0;
}

function checkError(value){
    if(value==0){
        return "No Error";
    }else{
        return "Error";
    }
}