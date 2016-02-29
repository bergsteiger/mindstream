unit l3PureMixIns;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$Domain"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3PureMixIns.pas"
// Начат: 12.03.2008 20:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> Shared Delphi Требования к низкоуровневым библиотекам::L3$Domain::l3PureMixIns
//
// Абстрактные примеси.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

(*
 Ml3CountHolder = PureMixIn
   function pm_GetCount: Integer;
   property Count: Integer
     read pm_GetCount;
     {* Число элементов. }
 end;//Ml3CountHolder
*)

(*
 Ml3List = PureMixIn(Ml3CountHolder)
  {* Список. }
  Params : _ItemType_
   function pm_GetEmpty: Boolean;
   function pm_GetFirst: _ItemType_;
   function pm_GetLast: _ItemType_;
   function pm_GetItems(anIndex: Integer): _ItemType_;
   property Empty: Boolean
     read pm_GetEmpty;
   property First: _ItemType_
     read pm_GetFirst;
     {* Первый элемент. }
   property Last: _ItemType_
     read pm_GetLast;
     {* Последний элемент. }
   property Items[anIndex: Integer]: _ItemType_
     read pm_GetItems;
     default;
 end;//Ml3List
*)

(*
 Ml3ListEx = PureMixIn(Ml3List)
   function IndexOf(const anItem: _ItemType_): Integer;
   function Add(const anItem: _ItemType_): Integer;
 end;//Ml3ListEx
*)

(*
 Ml3CheckStamp = PureMixIn
   function CheckStamp(const aGUID: TGUID): Boolean;
     {* Проверяет метку реализации интерфейса. Например для того, чтобы узнать, что реализация наша "родная". }
 end;//Ml3CheckStamp
*)

(*
 Ml3ChangingChanged = PureMixIn
   procedure Changed;
     {* нотификация о завершении изменения состояния объекта. Для перекрытия и использования в потомках. }
   procedure Changing;
     {* нотификация о начале изменения состояния объекта. Для перекрытия и использования в потомках. }
 end;//Ml3ChangingChanged
*)

implementation

end.