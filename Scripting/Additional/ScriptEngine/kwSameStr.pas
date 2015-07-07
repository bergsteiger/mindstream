unit kwSameStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSameStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwSameStr
//
// Проверяет одинаковые ли строки с учетом регистра.
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
 TkwSameStr = class(_tfwDualStrWord_)
  {* Проверяет одинаковые ли строки с учетом регистра. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSameStr
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

type _Instance_R_ = TkwSameStr;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class TkwSameStr

procedure TkwSameStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0CF1E00C8_var*
//#UC END# *4DD0D021034C_4DD0CF1E00C8_var*
begin
//#UC START# *4DD0D021034C_4DD0CF1E00C8_impl*
 aCtx.rEngine.PushBool(l3Same(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4DD0CF1E00C8_impl*
end;//TkwSameStr.DoStrings

class function TkwSameStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0CF1E00C8_var*
//#UC END# *4DB0614603C8_4DD0CF1E00C8_var*
begin
//#UC START# *4DB0614603C8_4DD0CF1E00C8_impl*
 Result := 'SameStr';
//#UC END# *4DB0614603C8_4DD0CF1E00C8_impl*
end;//TkwSameStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.