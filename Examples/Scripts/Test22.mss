USES
 to.dict
 math.dict
;

WordAlias filter FILTER

ARRAY FUNCTION >filter>
 ARRAY IN anArray
 ^ FUNCTOR IN aFunctor
 aFunctor anArray filter >>> Result
; // >filter>

for ( ( 1 to 20 ) >filter> IsOdd ) .
// - печатаем нечётные числа
'-------------------' .
for ( ( 1 to 20 ) >filter> IsEven ) .
// - печатаем чётные числа