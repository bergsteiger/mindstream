unit kwCharDupe;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCharDupe.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::char_Dupe
//
// Размножаем символ столько раз, сколько указано
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
 TkwCharDupe = {final} class(_tfwWStrWord_)
  {* Размножаем символ столько раз, сколько указано }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCharDupe
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCharDupe;

{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class TkwCharDupe

procedure TkwCharDupe.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F51FCBD03B9_var*
//#UC END# *4F4FE51201BD_4F51FCBD03B9_var*
begin
//#UC START# *4F4FE51201BD_4F51FCBD03B9_impl*
 aCtx.rEngine.PushString(ev_psFixLen('', aCtx.rEngine.PopInt, aStr.S[0]));
//#UC END# *4F4FE51201BD_4F51FCBD03B9_impl*
end;//TkwCharDupe.DoString

class function TkwCharDupe.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:Dupe';
end;//TkwCharDupe.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.