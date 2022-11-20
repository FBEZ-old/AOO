@include "aoo/AOO.awk";
@include "aoo/AOO_Object.awk";
@namespace "AOO_Stack";

BEGIN{

    _private["version"]="0.0.1";
    _private["type"]="Stack";
}

function create(obj){
    AOO_Object::create(obj); #super class
    obj["_t"]="Stack"; #change type 
    obj["size"]=0;
    obj["values"][0]="";
    return 0;
}

function push(obj,value_in){
    if(AOO::checkType(obj, _private)!=0) return -1;

    if(!awk::isarray(value_in)){
        obj["values"][obj["size"]]=value_in;
    }else{
        for(k in value_in){
            obj["values"][obj["size"]][k]=value_in[k];
        }
    }
    obj["size"]=obj["size"]+1;
    return 0;
}

function pop(obj, value_out){
    if(AOO::checkType(obj, _private)!=0) return -1;
    if(AOO::checkOutput(value_out)!=0)   return -1;

    value_out["ret"]=obj["values"][obj["size"]];
    delete obj["values"][obj["size"]]
    obj["size"]=obj["size"]-1;
    return 0;
}

function remove(obj){
    if(AOO::checkType(obj, _private)!=0) return -1;
    AOO_Object::remove(obj);
}

function getType(obj, value_out){
    return AOO_Object::getType(obj,value_out);
}

function printObject(obj){
    if(AOO::checkType(obj, _private)!=0) return -1;

    print "values: ";
    for(j in obj["values"]){
        if(!awk::isarray(obj["values"][j])){
            print obj["values"][j];
        }else{
            print "Array";
        }
    }
}

function toString(obj,string_out){
    return AOO_Object::toString(obj, string_out);
}

