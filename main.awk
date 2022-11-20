#!/usr/bin/awk -f

@include "aoo/AOO_Stack.awk"


BEGIN{
	print("test: main");

	ENVIRON["AWKPATH"]

	arr["a"]=1;
	arr["b"]=2;

	AOO_Stack::create(s1);
	AOO_Stack::printObject(s1);
	AOO_Stack::push(s1, 5);
	AOO_Stack::printObject(s1);
	AOO_Stack::push(s1, 9);
	AOO_Stack::printObject(s1);
	AOO_Stack::push(s1, "ciao");
	AOO_Stack::printObject(s1);
	AOO_Stack::push(s1, arr);
	AOO_Stack::printObject(s1);

	AOO_Stack::pop(s1,ret);
	print(ret["ret"]);
	AOO_Stack::remove(s1);
	AOO_Stack::printObject(s1);


}
