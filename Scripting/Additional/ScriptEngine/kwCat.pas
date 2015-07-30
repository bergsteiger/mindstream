unit kwCat;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCat.pas"
// Начат: 16.05.2011 11:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCat
//
// Соединяет две строки между собой.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDualStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCat = class(TtfwDualStrWord)
  {* Соединяет две строки между собой. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCat
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCat

procedure TkwCat.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0CEB403AE_var*
//#UC END# *4DD0D021034C_4DD0CEB403AE_var*
begin
//#UC START# *4DD0D021034C_4DD0CEB403AE_impl*
 aCtx.rEngine.PushString(l3Cat([aStr1, aStr2]));
//#UC END# *4DD0D021034C_4DD0CEB403AE_impl*
end;//TkwCat.DoStrings

class function TkwCat.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0CEB403AE_var*
//#UC END# *4DB0614603C8_4DD0CEB403AE_var*
begin
//#UC START# *4DB0614603C8_4DD0CEB403AE_impl*
 Result := 'Cat';
//#UC END# *4DB0614603C8_4DD0CEB403AE_impl*
end;//TkwCat.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCat
 TkwCat.RegisterInEngine;
{$IfEnd} //not NoScripts

end.