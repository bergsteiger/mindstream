unit kwCompareStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompareStr.pas"
// Начат: 16.05.2011 11:22
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwCompareStr
//
// Сравнение строк с учетом регистра.
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
 TkwCompareStr = class(_tfwDualStrWord_)
  {* Сравнение строк с учетом регистра. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCompareStr
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

type _Instance_R_ = TkwCompareStr;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class TkwCompareStr

procedure TkwCompareStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0D0A002BD_var*
//#UC END# *4DD0D021034C_4DD0D0A002BD_var*
begin
//#UC START# *4DD0D021034C_4DD0D0A002BD_impl*
 aCtx.rEngine.PushInt(l3Compare(l3PCharLen(aStr1), l3PCharLen(aStr2)));
//#UC END# *4DD0D021034C_4DD0D0A002BD_impl*
end;//TkwCompareStr.DoStrings

class function TkwCompareStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0D0A002BD_var*
//#UC END# *4DB0614603C8_4DD0D0A002BD_var*
begin
//#UC START# *4DB0614603C8_4DD0D0A002BD_impl*
 Result := 'CompareStr';
//#UC END# *4DB0614603C8_4DD0D0A002BD_impl*
end;//TkwCompareStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.