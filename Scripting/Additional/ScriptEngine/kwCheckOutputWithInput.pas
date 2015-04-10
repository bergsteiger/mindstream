unit kwCheckOutputWithInput;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCheckOutputWithInput.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::CheckOutputWithInput
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
 TkwCheckOutputWithInput = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCheckOutputWithInput
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCheckOutputWithInput;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCheckOutputWithInput

procedure TkwCheckOutputWithInput.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F5F490D030B_var*
var
 l_H : AnsiString;
 l_In : AnsiString;
 l_Out : AnsiString;
 l_Delim : AnsiChar;
//#UC END# *4DAEEDE10285_4F5F490D030B_var*
begin
//#UC START# *4DAEEDE10285_4F5F490D030B_impl*
 l_H := aCtx.rEngine.PopDelphiString;
 if (Length(l_H) > 0) then
  l_Delim := l_H[1]
 else
  l_Delim := #0; 
 //l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 l_Out := aCtx.rEngine.PopDelphiString;
 RunnerAssert(Length(l_Out) > 0, 'Имя файла не может быть пустым', aCtx);
 l_In := aCtx.rEngine.PopDelphiString;
 RunnerAssert(Length(l_In) > 0, 'Имя файла не может быть пустым', aCtx);
 aCtx.rCaller.CheckOutputWithInput(l_In, l_Out, l_Delim, false, false, '', true);
//#UC END# *4DAEEDE10285_4F5F490D030B_impl*
end;//TkwCheckOutputWithInput.DoDoIt

class function TkwCheckOutputWithInput.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tests:CheckOutputWithInput';
end;//TkwCheckOutputWithInput.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.