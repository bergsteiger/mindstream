unit Refcounted;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$Basic Concepts"
// Модуль: "Refcounted.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Требования к низкоуровневым библиотекам::L3$Basic Concepts::Ref Counting::TRefcounted
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include l3Define.inc}

interface

type
 _RefCounted_Parent_ = TObject;
 {$Include RefCounted.imp.pas}
 TRefcounted = class(_RefCounted_)
 end;//TRefcounted

implementation

uses
  Windows
  ;

{$Include RefCounted.imp.pas}

end.