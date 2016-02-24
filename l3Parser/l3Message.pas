unit l3Message;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Message -                 }
{ Начат: 18.07.2002 15:50             }
{ $Id: l3Message.pas,v 1.2 2008/02/13 12:26:22 lulin Exp $ }

// $Log: l3Message.pas,v $
// Revision 1.2  2008/02/13 12:26:22  lulin
// - <TDN>: 72.
//
// Revision 1.1  2002/07/18 11:59:15  law
// - new unit: l3Message.
//

{$I l3Define.inc }

interface

resourcestring
  l3_MesCannotModifyConstantString = 'Cannot modify constant string ''%s''';
  l3_MesNewUndoOperation = 'Новая Undo-операция %s';

implementation

end.

