unit l3Struct;
{* Структуры. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Struct - описание различных структур (Object) }
{ Начат: 12.04.98 16:27               }
{ $Id: l3Struct.pas,v 1.5 2013/05/24 15:59:50 lulin Exp $ }

// $Log: l3Struct.pas,v $
// Revision 1.5  2013/05/24 15:59:50  lulin
// - пытаемся портироваться под XE4.
//
// Revision 1.4  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.3  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  l3Types
  ;

type
  Tl3OrderKeyPrim = {$IfDef XE4}record{$Else}object{$EndIf}
   {* Ключ сортировки, без методов. }
    public
    // public fields
      Primary : Long;
      Delta   : Long;
  {$IfDef XE4}
    public
    // public methods
      function Compare(const K: Tl3OrderKeyPrim): Long;
        {* - сравнивает два ключа. }
      function Pred: Tl3OrderKeyPrim;
        {* - предыдущее значение. }
      function Succ: Tl3OrderKeyPrim;
        {* - следующее значение. }
      function StrengthPred: Tl3OrderKeyPrim;
        {* - предыдущее "сильное" значение. }
      function StrengthSucc: Tl3OrderKeyPrim;
        {* - следующее "сильное" значение. }
      procedure SetNull;
        {* - обнуляет ключ. }
  {$EndIf  XE4}
  end;{Tl3OrderKeyPrim}

  {$IfDef XE4}
  Tl3OrderKey = Tl3OrderKeyPrim;
  {$Else XE4}
  Tl3OrderKey = object(Tl3OrderKeyPrim)
   {* Ключ сортировки. }
    public
    {public methods}
      function Compare(const K: Tl3OrderKeyPrim): Long;
        {* - сравнивает два ключа. }
      function Pred: Tl3OrderKey;
        {* - предыдущее значение. }
      function Succ: Tl3OrderKey;
        {* - следующее значение. }
      function StrengthPred: Tl3OrderKey;
        {* - предыдущее "сильное" значение. }
      function StrengthSucc: Tl3OrderKey;
        {* - следующее "сильное" значение. }
      procedure SetNull;
        {* - обнуляет ключ. }
  end;{Tl3OrderKey}
  {$EndIf XE4}

implementation

{ start object Tl3OrderKey }

function Tl3OrderKey.Compare(const K: Tl3OrderKeyPrim): Long;
  {-сравнивает два ключа}
begin
 Result := Primary - K.Primary;
 if (Result = 0) then Result := Delta - K.Delta;
end;

function Tl3OrderKey.Pred: Tl3OrderKey;
  {-предыдущее значение}
begin
 Result.Primary := Primary;
 Result.Delta := System.Pred(Delta);
end;

function Tl3OrderKey.Succ: Tl3OrderKey;
  {-следующее значение}
begin
 Result.Primary := Primary;
 Result.Delta := System.Succ(Delta);
end;

function Tl3OrderKey.StrengthPred: Tl3OrderKey;
  {-предыдущее "сильное" значение}
begin
 Result.Primary := System.Pred(Primary);
 Result.Delta := 0;
end;

function Tl3OrderKey.StrengthSucc: Tl3OrderKey;
  {-следующее "сильное" значение}
begin
 Result.Primary := System.Succ(Primary);
 Result.Delta := 0;
end;

procedure Tl3OrderKey.SetNull;
  {-обнуляет ключ}
begin
 Primary := 0;
 Delta := 0;
end;

end.

