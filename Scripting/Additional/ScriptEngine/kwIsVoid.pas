unit kwIsVoid;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsVoid.pas"
// Начат: 06.09.2011 19:10
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TypeChecking::TypeCheckingPack::IsVoid
//
// Значение на стеке - пустое
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
 TkwIsVoid = class(_tfwAutoregisteringWord_)
  {* Значение на стеке - пустое }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsVoid
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsVoid;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsVoid

procedure TkwIsVoid.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E6637BE033A_var*
//#UC END# *4DAEEDE10285_4E6637BE033A_var*
begin
//#UC START# *4DAEEDE10285_4E6637BE033A_impl*
 if aCtx.rEngine.IsTopType(tfw_svtVoid) then
 begin
  aCtx.rEngine.Drop;
  aCtx.rEngine.PushBool(true);
 end//aCtx.rEngine.IsTopType(tfw_svtVoid)
 else
 begin
  aCtx.rEngine.Drop;
  aCtx.rEngine.PushBool(false);
 end;//aCtx.rEngine.IsTopType(tfw_svtVoid)
//#UC END# *4DAEEDE10285_4E6637BE033A_impl*
end;//TkwIsVoid.DoDoIt

class function TkwIsVoid.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsVoid';
end;//TkwIsVoid.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.