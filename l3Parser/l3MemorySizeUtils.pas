unit l3MemorySizeUtils;
{$Include l3Define.inc}

interface

uses
  l3MemorySizeUtilsPrim
  ;

type
 PMem = System.PANSIChar;

{$If not defined(XE)}
var l3MemorySize : Tl3MemorySizeFunc = L3MemorySizeDelphi7;
 {* функция для получения размера куска памяти}
{$IfEnd} //not XE

{$If defined(XE)}
var l3MemorySize : Tl3MemorySizeFunc = L3MemorySizeXE;
 {* функция для получения размера куска памяти}
{$IfEnd} //XE

implementation

end.