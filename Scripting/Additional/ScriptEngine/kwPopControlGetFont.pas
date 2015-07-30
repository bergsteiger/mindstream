unit kwPopControlGetFont;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopControlGetFont.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::pop_control_GetFont
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Controls,
  tfwScriptingInterfaces,
  kwComponentFromStackWord,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwPopControlGetFont = {final scriptword} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlGetFont
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evCustomEditorWindow,
  Windows,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

type
  TControlFriend = {abstract} class(TControl)
   {* Друг для TControl }
  end;//TControlFriend

// start class TkwPopControlGetFont

procedure TkwPopControlGetFont.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5190C44F0279_var*
//#UC END# *4F212C3A015A_5190C44F0279_var*
begin
//#UC START# *4F212C3A015A_5190C44F0279_impl*
 if aControl is TevCustomEditorWindow
  then aCtx.rEngine.PushIntf((aControl as TevCustomEditorWindow).TextPara.Font)
  else aCtx.rEngine.PushObj(TControlFriend(aControl).Font);
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
// Регистрация pop_control_GetFont
 TkwPopControlGetFont.RegisterInEngine;
{$IfEnd} //not NoScripts

end.