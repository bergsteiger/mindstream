unit kwEndsStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEndsStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwEndsStr
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
 TkwEndsStr = class(_tfwDualStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEndsStr
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

type _Instance_R_ = TkwEndsStr;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class TkwEndsStr

procedure TkwEndsStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EB2AF3801E5_var*
//#UC END# *4DD0D021034C_4EB2AF3801E5_var*
begin
//#UC START# *4DD0D021034C_4EB2AF3801E5_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4EB2AF3801E5_impl*
end;//TkwEndsStr.DoStrings

class function TkwEndsStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB2AF3801E5_var*
//#UC END# *4DB0614603C8_4EB2AF3801E5_var*
begin
//#UC START# *4DB0614603C8_4EB2AF3801E5_impl*
 Result := 'EndsStr';
//#UC END# *4DB0614603C8_4EB2AF3801E5_impl*
end;//TkwEndsStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.