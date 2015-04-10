unit kwCharToString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCharToString.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::char_ToString
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
 TkwCharToString = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCharToString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCharToString;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCharToString

procedure TkwCharToString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FDDC2031D_var*
//#UC END# *4DAEEDE10285_4F4FDDC2031D_var*
begin
//#UC START# *4DAEEDE10285_4F4FDDC2031D_impl*
 aCtx.rEngine.PushString(TtfwCStringFactory.C(aCtx.rEngine.PopChar));
//#UC END# *4DAEEDE10285_4F4FDDC2031D_impl*
end;//TkwCharToString.DoDoIt

class function TkwCharToString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:ToString';
end;//TkwCharToString.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.