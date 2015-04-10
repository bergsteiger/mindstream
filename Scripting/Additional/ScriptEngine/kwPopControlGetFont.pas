unit kwPopControlGetFont;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlGetFont.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::pop_control_GetFont
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
  Controls,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwPopControlGetFont = {final} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlGetFont
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evCustomEditorWindow,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlGetFont;

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

type
  TControlHack = class(TControl)
  end;//TControlHack

// start class TkwPopControlGetFont

procedure TkwPopControlGetFont.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5190C44F0279_var*
//#UC END# *4F212C3A015A_5190C44F0279_var*
begin
//#UC START# *4F212C3A015A_5190C44F0279_impl*
 if aControl is TevCustomEditorWindow
  then aCtx.rEngine.PushIntf((aControl as TevCustomEditorWindow).TextPara.Font)
  else aCtx.rEngine.PushObj(TControlHack(aControl).Font);
//#UC END# *4F212C3A015A_5190C44F0279_impl*
end;//TkwPopControlGetFont.DoControl

class function TkwPopControlGetFont.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:GetFont';
end;//TkwPopControlGetFont.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.