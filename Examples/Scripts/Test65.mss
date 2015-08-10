STRING FUNCTION string:CatWihAny
 STRING IN aString
 IN aValue
 aString aValue ToPrintable Cat >>> Result
; // string:CatWihAny

STRING FUNCTION any:Cat
  ARRAY IN anArray
 '' anArray ==> string:CatWihAny >>> Result
; // any:Cat

[ 'Size: ' 1024 ' bytes' ] any:Cat Print