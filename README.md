# AOO
 AOO stands for Awk object oriented and it's a test to apply the object oriented paradigm to Awk. In embedded systems the C programming language is often used emulating object oriented paradigm (e.g. LVGL or ESP-IDF) and a similar approach is used here.


## Basics

 Awk has a few features which must be taken into consideration before proceeding.

 * Variables are all global (except if you declare them as function's argument)
 * Functions can only return scalar


To solve the first issue, there are two simple way. The fist one (added to gawk only recently) is the use of @namespace to assign to all variable and functions inside the file a prefix. The other one is to use an additional associative array holding all the variables used in the "class". This array can be declared in a BEGIN block, which is called as soon as the file is included. 
For instance, the version and class type are declared as follows:

```awk
@namespace "AOO_Stack";
BEGIN{
    _private["version"]="0.0.1";
    _private["type"]="Stack";
}
```

If you want to access the "version" value from the main program, you need to use "AOO_Stack::_private["version"]", which is not easy to stumble across by chance. 


 As with C emulation, the objects are a combination of a struct (in awk an associative array) and functions applied to it. 

Let's take into consideration a stack data structure. It has the following methods:
* `create`
* `delete`
* `push`
* `pop`
* `isEmpty`

and the following attributes:
* `_t`: The object type. Since awk doesn't have typing, this attribute will be used to check that the type is correct.
* `size`
* `values`: an array containing the stack values. 

The attributes are declared in the `create` method. Since all the variables are global, before proceeding the array "pointer" given to the function to be created must be cleared (i.e. deleted) in order to avoid having additional and unintentional key, value pairs. 


 ```awk

function create(obj){
    obj["_t"]="Stack"; 
    obj["size"]=0;
    obj["values"][0]="";
    return 0;
}
 ```

The push method can be implemented as follows:

```awk
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
```

Here first the type is checked to be "Stack". Then the input value is tested in order to see if it's an array or not. If it's a scalar, it's value is added to the array. Otherwise all the key:value pairs are added separately to the value array. Awk does not support direct array assignment in this case. 


## Inheritance

TODO

## Polymorphism 

TODO

## Installation

To "install" the files, you need to copy them into `/usr/share/awk` and change the `@include` in all the AOO_x files removing the aoo prefix. There seems to be a problem with relative paths. If you include "AOO_Stack.awk" from main in another directory, then all the inclusion you do in the "AOO_Stack.awk" are now relative to the path from which you called the main. 

TODO: script to do it or solve this apparent problem. 

