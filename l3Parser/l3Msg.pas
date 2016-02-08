unit l3Msg;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3Msg - описание сообщений библиотеки L3}
{ Начат: 29.01.99 14:27 }
{ $Id: l3Msg.pas,v 1.13 2007/12/05 12:35:11 lulin Exp $ }

// $Log: l3Msg.pas,v $
// Revision 1.13  2007/12/05 12:35:11  lulin
// - вычищен условный код, составлявший разницу ветки и Head'а.
//
// Revision 1.12  2006/01/18 10:38:23  lulin
// - bug fix: не компилировалось тестовое приложение.
//
// Revision 1.11  2005/10/13 06:00:26  lulin
// - cleanup.
//
// Revision 1.10  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  l3Types
  ;

type
  {Базовый тип сообщений, содержащих только код сообщения}
  Ml3Base = object
    public
    // public fields
      Msg : Cardinal;
  end;//Ml3Base

  {Тип сообщения для изменения признака модификации содержимого объекта.
   cм: (V) MemGetModify}
  MemSetModify = object(Ml3Base)
    public
    // public fields
      Modified : CardinalBool;
  end;//MemSetModify

  {Базовый тип сообщений, не содержащих WParam}
  Ml3NoWParam = object(Ml3Base)
    private
    // internal fields
      NoWParam : Cardinal;
  end;//Ml3NoWParam

  {Базовый тип сообщений, не содержащих LParam}
  Ml3NoLParam = object(Ml3NoWParam)
    private
    // internal fields
      NoLParam : Long;
  end;//Ml3NoLParam

  {Далее следуют сообщения не содержащие LParam}

  {Тип сообщения для чтения информации о модификации содержимого объекта.
   cм: (^) MemSetModify}
  MemGetModify = object(Ml3NoLParam)
    public
    // public fields
      Modified  : LongBool;
  end;//MemGetModify

  TEMSetReadOnly = object(Ml3Base)
    ReadOnly  : CardinalBool;
    UnusedL   : Long;
    Result    : LongBool;
  end;//TEMSetReadOnly

implementation

end.

