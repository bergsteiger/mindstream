unit l3ParserInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3ParserInterfaces.pas"
// Начат: 10.05.2011 19:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Low Level::L3::l3CoreObjects::l3ParserInterfaces
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Variant
  ;

type
 Il3KeywordFinder = interface(IUnknown)
   ['{6B7313C8-EC12-43A4-9B0C-89C07EED8DA7}']
   function Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
   property KeywordByName[const aName: Il3CString]: Tl3PrimString
     read Get_KeywordByName;
 end;//Il3KeywordFinder

implementation

end.