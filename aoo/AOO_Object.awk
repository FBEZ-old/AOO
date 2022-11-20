@namespace "AOO_Object";
@include "aoo/AOO.awk";

BEGIN{
    _private["version"] = "0.0.1";
    _private["type"]="Object";
}

function create(obj){
    delete obj;
    obj["_t"]="Object";
    return 0;
}

function remove(obj){
    if(AOO::checkType(obj, _private)!=0) return -1;
    delete obj;
    return 0;
}

function getType(obj, value_out){
    if(AOO::checkOutput(value_out)!=0)   return -1;
    value_out["ret"] = obj["_t"];
    return 0;
}

function toString(obj, string_out,        j){
    if(!isarray(string_out)) return 0;
    delete string_out;
    # This is a generic method which works with an array, to be strictly OO, it should access only the Object _t value, the only attribute of Object
    for(j in obj){
        if(!isarray(obj[j])){
            string_out[j]=obj[j];
        }else{
            string_out[j]="<array>";
        }
    }
}
