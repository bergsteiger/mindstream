unit kwStartsStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStartsStr.pas"
// Начат: 03.11.2011 19:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwStartsStr
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
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
 TkwStartsStr = class(_tfwDualStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStartsStr
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwStartsStr;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class TkwStartsStr

procedure TkwStartsStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF0600C1_var*
//#UC END# *4DD0D021034C_4EB2AF0600C1_var*
begin
//#UC START# *4DD0D021034C_4EB2AF0600C1_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4EB2AF0600C1_impl*
end;//TkwStartsStr.DoStrings

class function TkwStartsStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF0600C1_var*
//#UC END# *4DB0614603C8_4EB2AF0600C1_var*
begin
//#UC START# *4DB0614603C8_4EB2AF0600C1_impl*
 Result := 'StartsStr';
//#UC END# *4DB0614603C8_4EB2AF0600C1_impl*
end;//TkwStartsStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.