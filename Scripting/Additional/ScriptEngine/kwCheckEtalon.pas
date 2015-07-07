unit kwCheckEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCheckEtalon.pas"
// Начат: 19.05.2011 20:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::CheckEtalon
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
 TkwCheckEtalon = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCheckEtalon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCheckEtalon;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCheckEtalon

procedure TkwCheckEtalon.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DD547B70001_var*
var
 l_H : AnsiString;
 l_S : AnsiString;
 l_Delim : AnsiChar;
//#UC END# *4DAEEDE10285_4DD547B70001_var*
begin
//#UC START# *4DAEEDE10285_4DD547B70001_impl*
 l_H := aCtx.rEngine.PopDelphiString;
 if (Length(l_H) > 0) then
  l_Delim := l_H[1]
 else
  l_Delim := #0; 
 l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 RunnerAssert(Length(l_S) > 0, 'Имя файла не может быть пустым', aCtx);
 aCtx.rCaller.CheckWithEtalon(l_S, l_Delim);
//#UC END# *4DAEEDE10285_4DD547B70001_impl*
end;//TkwCheckEtalon.DoDoIt

class function TkwCheckEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tests:CheckEtalon';
end;//TkwCheckEtalon.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.