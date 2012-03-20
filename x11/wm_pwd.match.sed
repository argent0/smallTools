#!/bin/sed -f
{
   #remove the variable name
   #s/\(.*= \)\(.*$\)/\2/ 
   #remove the "'s
   #s/"//g
   #remove the username at hotname
   s/[a-zA-Z0-9]*@[a-zA-Z0-9]*://
   #restoring the ~
   s/~/\/home\/XXXX/
}
