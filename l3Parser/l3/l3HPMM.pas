unit l3HPMM;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3HPMM - обвязочный модуль для менеджера памяти HPMM. }
{ Начат: 01.02.2000 16:35 }
{ $Id: l3HPMM.pas,v 1.3 2012/11/01 09:42:57 lulin Exp $ }

// $Log: l3HPMM.pas,v $
// Revision 1.3  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.2  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.1  2001/02/01 14:18:58  law
// - модуль добавлен в CVS.
//

{$I l3Define.inc }

interface

uses
  MultiMM,

  l3Types
  ;

implementation

uses
  HPMM,
  
  l3Memory
  ;

function _l3MemorySize(P: Pointer): Long; far;
begin
 if (P = nil) then
  Result := 0
 else
  Result := PMemBlock(Long(P) - 4)^.Size;
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3HPMM.pas initialization enter'); {$EndIf}
  l3MemorySize := _l3MemorySize;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3HPMM.pas initialization leave'); {$EndIf}
end.

