unit kwCat;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCat.pas"
// Начат: 16.05.2011 11:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwCat
//
// Соединяет две строки между собой.
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
 TkwCat = class(_tfwDualStrWord_)
  {* Соединяет две строки между собой. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCat
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

type _Instance_R_ = TkwCat;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.