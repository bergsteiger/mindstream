{$IfNDef UnknownImpl_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$Basic Concepts"
// Модуль: "UnknownImpl.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Требования к низкоуровневым библиотекам::L3$Basic Concepts::Ref Counting::UnknownImpl
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define UnknownImpl_imp}
 _RefCounted_Parent_ = _UnknownImpl_Parent_;
 {$Include ..\L3\RefCounted.imp.pas}
 _UnknownImpl_ = {mixin} class(_RefCounted_)
 public
 // realized methods
   function _AddRef: Integer; stdcall;
     {* Увеличивает счетчик ссылок. }
   function _Release: Integer; stdcall;
     {* Уменьшает счетчик ссылок. }
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; stdcall;
     {* Приводит базовый интерфейс к запрашиваемуму, если это возможно. }
 end;//_UnknownImpl_

{$Else UnknownImpl_imp}

{$Include ..\L3\RefCounted.imp.pas}

// start class _UnknownImpl_

function _UnknownImpl_._AddRef: Integer;
//#UC START# *47913C24007F_516D4D0D0237_var*
//#UC END# *47913C24007F_516D4D0D0237_var*
begin
//#UC START# *47913C24007F_516D4D0D0237_impl*
 Use;
 Result := RefCount;
 // - тут есть проблемы с многопоточностью
//#UC END# *47913C24007F_516D4D0D0237_impl*
end;//_UnknownImpl_._AddRef

function _UnknownImpl_._Release: Integer;
//#UC START# *47913C5301A1_516D4D0D0237_var*
var
 l_RC : Integer;
//#UC END# *47913C5301A1_516D4D0D0237_var*
begin
//#UC START# *47913C5301A1_516D4D0D0237_impl*
 l_RC := RefCount - 1;
 Free;
 Result := l_RC;
 // - тут есть проблемы с многопоточностью
//#UC END# *47913C5301A1_516D4D0D0237_impl*
end;//_UnknownImpl_._Release

function _UnknownImpl_.QueryInterface(const IID: TGUID;
  out Obj): HResult;
//#UC START# *47913CBF0265_516D4D0D0237_var*
//#UC END# *47913CBF0265_516D4D0D0237_var*
begin
//#UC START# *47913CBF0265_516D4D0D0237_impl*
 if TObject(Self).GetInterface(IID, Obj) then
  Result := S_Ok
 else
  Result := E_NoInterface;
//#UC END# *47913CBF0265_516D4D0D0237_impl*
end;//_UnknownImpl_.QueryInterface

{$EndIf UnknownImpl_imp}
