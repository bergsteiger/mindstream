unit l3FilerRes;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3StringIDEx
  ;

{$If not defined(Nemesis)}
var
  { Локализуемые строки Local }
 str_l3mmFileOp : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'l3mmFileOp'; rValue : 'Файловая операция');
  { 'Файловая операция' }
 str_l3mmFileOpFmt : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'l3mmFileOpFmt'; rValue : 'Файловая операция [%s]');
  { 'Файловая операция [%s]' }
{$IfEnd} //not Nemesis

{$If defined(Nemesis)}
var
  { Локализуемые строки LocalNemesis }
 str_l3mmFileOp : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'l3mmFileOp'; rValue : 'Загрузка документа');
  { 'Загрузка документа' }
 str_l3mmFileOpFmt : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'l3mmFileOpFmt'; rValue : 'Загрузка документа [%s]');
  { 'Загрузка документа [%s]' }
{$IfEnd} //Nemesis

implementation

uses
  l3MessageID
  ;


initialization
{$If not defined(Nemesis)}
// Инициализация str_l3mmFileOp
 str_l3mmFileOp.Init;
{$IfEnd} //not Nemesis
{$If not defined(Nemesis)}
// Инициализация str_l3mmFileOpFmt
 str_l3mmFileOpFmt.Init;
{$IfEnd} //not Nemesis
{$If defined(Nemesis)}
// Инициализация str_l3mmFileOp
 str_l3mmFileOp.Init;
{$IfEnd} //Nemesis
{$If defined(Nemesis)}
// Инициализация str_l3mmFileOpFmt
 str_l3mmFileOpFmt.Init;
{$IfEnd} //Nemesis

end.