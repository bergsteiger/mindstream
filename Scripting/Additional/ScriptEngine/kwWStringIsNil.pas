unit kwWStringIsNil;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringIsNil.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_IsNil
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
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
 TkwWStringIsNil = {final} class(_tfwWStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringIsNil
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

type _Instance_R_ = TkwWStringIsNil;

{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class TkwWStringIsNil

procedure TkwWStringIsNil.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FEC2F02C9_var*
//#UC END# *4F4FE51201BD_4F4FEC2F02C9_var*
begin
//#UC START# *4F4FE51201BD_4F4FEC2F02C9_impl*
 aCtx.rEngine.PushBool(l3IsNil(aStr));
//#UC END# *4F4FE51201BD_4F4FEC2F02C9_impl*
end;//TkwWStringIsNil.DoString

class function TkwWStringIsNil.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:IsNil';
end;//TkwWStringIsNil.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.