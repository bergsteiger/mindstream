unit kwStrToInt;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStrToInt.pas"
// Начат: 16.05.2011 11:13
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwStrToInt
//
// Преобразование строки в число.
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
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
 TkwStrToInt = class(_tfwStrWord_)
  {* Преобразование строки в число. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStrToInt
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

type _Instance_R_ = TkwStrToInt;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwStrToInt

procedure TkwStrToInt.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DD0CE7C031D_var*
//#UC END# *4DD0CF6F0197_4DD0CE7C031D_var*
begin
//#UC START# *4DD0CF6F0197_4DD0CE7C031D_impl*
 aCtx.rEngine.PushInt(StrToInt(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_4DD0CE7C031D_impl*
end;//TkwStrToInt.DoString

class function TkwStrToInt.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0CE7C031D_var*
//#UC END# *4DB0614603C8_4DD0CE7C031D_var*
begin
//#UC START# *4DB0614603C8_4DD0CE7C031D_impl*
 Result := 'StrToInt';
//#UC END# *4DB0614603C8_4DD0CE7C031D_impl*
end;//TkwStrToInt.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.