unit kwIterateWindows;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIterateWindows.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::IterateWindows
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
 TkwIterateWindows = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIterateWindows
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  IterateWindowsUtils,
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIterateWindows;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwIterateWindows

procedure TkwIterateWindows.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_510A7457012E_var*
var
 l_Obj: TObject;
 l_Data: TIterateWindowsRec;
//#UC END# *4DAEEDE10285_510A7457012E_var*
begin
//#UC START# *4DAEEDE10285_510A7457012E_impl*
 RunnerAssert(aCtx.rEngine.IsTopObj, 'В итератор не передано слово.', aCtx);
 l_Obj := aCtx.rEngine.PopObj;
 RunnerAssert(l_Obj is TtfwWord, 'В итератор не передано слово.', aCtx);

 l_Data.rEnumMethod := l_Obj as TtfwWord;
 l_Data.rCtx := @aCtx;
 
 EnumWindows(@IterateWindowsMethod, LongInt(@l_Data));
//#UC END# *4DAEEDE10285_510A7457012E_impl*
end;//TkwIterateWindows.DoDoIt

class function TkwIterateWindows.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateWindows';
end;//TkwIterateWindows.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.