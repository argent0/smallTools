#!/bin/sed -f
{
   #obtain the first entry in WM_CLASS
   s/\(.*= *\)\("[a-z0-9]*"\)\(.*$\)/\2/
   #eliminate the "'s
   s/"//g
}
