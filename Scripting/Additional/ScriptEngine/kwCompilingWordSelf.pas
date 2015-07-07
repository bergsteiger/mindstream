unit kwCompilingWordSelf;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompilingWordSelf.pas"
// Начат: 12.02.2012 16:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::CompilingWordSelf
//
// Указатель на текущее компилируемое слово
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwCompilingWordSelf = {final} class(_tfwAutoregisteringWord_)
  {* Указатель на текущее компилируемое слово }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
   function IsImmediate: Boolean; override;
 end;//TkwCompilingWordSelf
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwWordPtrPushWord,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCompilingWordSelf;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCompilingWordSelf

procedure TkwCompilingWordSelf.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F37AD0B02F1_var*
var
 l_CW : TtfwWord;
 l_W : TkwWordPtrPushWord;
//#UC END# *4DAEEDE10285_4F37AD0B02F1_var*
begin
//#UC START# *4DAEEDE10285_4F37AD0B02F1_impl*
 //l_CW := aCtx.rCompiler.GetWordCompilingNow;
 (*
 Надо именно aCtx.rWordDefiningNow, т.к. не работает так:
 : OUT IN %S
  %SN .
  %SS .
  %S%C ==> ( @SELF DO )
 ;
 А работает только так:
 : OUT IN %S
  %SN .
  %SS .
  VAR l_Self
  @SELF =: l_Self
  %S%C ==> ( l_Self DO )
 ;
 *)
 l_CW := aCtx.rWordDefiningNow;
 Assert(l_CW <> nil);
 l_W := TkwWordPtrPushWord.Create(l_CW);
 try
  aCtx.rCompiler.AddCodePart(l_W, false, aCtx);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDE10285_4F37AD0B02F1_impl*
end;//TkwCompilingWordSelf.DoDoIt

class function TkwCompilingWordSelf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '@SELF';
end;//TkwCompilingWordSelf.GetWordNameForRegister

function TkwCompilingWordSelf.IsImmediate: Boolean;
 {-}
begin
 Result := true;
end;//TkwCompilingWordSelf.IsImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.