unit kwWordPtrPushWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwWordPtrPushWord.pas"
// Начат: 12.02.2012 16:21
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwWordPtrPushWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwWordPtrWorker,
  tfwScriptingInterfaces,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWordPtrPushWord = class(TkwWordPtrWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
   function WordName: Il3CString; override;
 end;//TkwWordPtrPushWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwWordPtrPushWord

procedure TkwWordPtrPushWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F37AEBB0209_var*
//#UC END# *4DAEEDE10285_4F37AEBB0209_var*
begin
//#UC START# *4DAEEDE10285_4F37AEBB0209_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(f_Word));
//#UC END# *4DAEEDE10285_4F37AEBB0209_impl*
end;//TkwWordPtrPushWord.DoDoIt

function TkwWordPtrPushWord.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_4F37AEBB0209_var*
//#UC END# *558D2BCA0324_4F37AEBB0209_var*
begin
//#UC START# *558D2BCA0324_4F37AEBB0209_impl*
 Result := f_Word;
 Result := Result.GetRef(aCtx);
//#UC END# *558D2BCA0324_4F37AEBB0209_impl*
end;//TkwWordPtrPushWord.GetRef

function TkwWordPtrPushWord.WordName: Il3CString;
//#UC START# *55AFD7DA0258_4F37AEBB0209_var*
//#UC END# *55AFD7DA0258_4F37AEBB0209_var*
begin
//#UC START# *55AFD7DA0258_4F37AEBB0209_impl*
 Result := f_Word.WordName;
//#UC END# *55AFD7DA0258_4F37AEBB0209_impl*
end;//TkwWordPtrPushWord.WordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwWordPtrPushWord
 TkwWordPtrPushWord.RegisterClass;
{$IfEnd} //not NoScripts

end.