unit Refcounted;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$Basic Concepts"
// Модуль: "Refcounted.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Требования к низкоуровневым библиотекам::L3$Basic Concepts::Ref Counting::TRefcounted
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\L3\l3Define.inc}

interface

type
 _RefCounted_Parent_ = TObject;
 {$Include ..\L3\RefCounted.imp.pas}
 TRefcounted = class(_RefCounted_)
 end;//TRefcounted

implementation

uses
  Windows
  ;

{$Include ..\L3\RefCounted.imp.pas}

end.