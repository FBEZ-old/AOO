# AOO
 AOO stands for Awk object oriented and it's a test to apply the object oriented paradigm to Awk. In embedded systems the C programming language is often used emulating object oriented paradigm (e.g. LVGL or ESP-IDF) and a similar approach is used here.

 Awk has a few features which must be taken into consideration before proceeding.

 * Variables are all global (except if you declare them as function's argument)
 * Functions can only return scalar


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

@namespace "AOO_Stack";

function create(obj){
    obj["_t"]="Stack"; #change type 
    obj["size"]=0;
    obj["values"][0]="";
    return 0;
}
 ```
  
