unit kwIsArray;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIsArray.pas"
// Начат: 01.12.2011 19:50
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TypeChecking::TypeCheckingPack::IsArray
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
 TkwIsArray = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIsArray
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIsArray;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIsArray

procedure TkwIsArray.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4ED7A22A0107_var*
//#UC END# *4DAEEDE10285_4ED7A22A0107_var*
begin
//#UC START# *4DAEEDE10285_4ED7A22A0107_impl*
 if aCtx.rEngine.IsTopType(tfw_svtList) then
 begin
  aCtx.rEngine.Drop;
  aCtx.rEngine.PushBool(true);
 end//aCtx.rEngine.IsTopType(tfw_svtList)
 else
 begin
  aCtx.rEngine.Drop;
  aCtx.rEngine.PushBool(false);
 end;//aCtx.rEngine.IsTopType(tfw_svtList)
//#UC END# *4DAEEDE10285_4ED7A22A0107_impl*
end;//TkwIsArray.DoDoIt

class function TkwIsArray.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsArray';
end;//TkwIsArray.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.