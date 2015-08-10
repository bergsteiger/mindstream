USES
 to.dict
 math.dict
 filter.dict
 io.dict
 map.dict
;

for ( ( 1 to 20 ) >filter> IsOdd >map> ( 1 + ) ) Print
// - печатаем нечётные числа + 1
'-------------------' Print
for ( ( 1 to 20 ) >filter> IsEven >map> ( 1 + ) ) Print
// - печатаем чётные числа + 1