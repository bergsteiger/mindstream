unit l3ProtoDataContainer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3ProtoDataContainer.pas"
// Начат: 08.07.2009 21:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Low Level::L3::l3CoreObjects::Tl3ProtoDataContainer
//
// Самый примитивный контейнер данных
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 _l3DataContainer_Parent_ = Tl3ProtoObject;
 {$Include ..\L3\l3DataContainer.imp.pas}
 Tl3ProtoDataContainer = {abstract} class(_l3DataContainer_)
  {* Самый примитивный контейнер данных }
 end;//Tl3ProtoDataContainer

implementation

{$Include ..\L3\l3DataContainer.imp.pas}

end.