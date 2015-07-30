unit kwPopEditorGetWrapLimit;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetWrapLimit.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetWrapLimit
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evCustomEditorWindow,
  kwEditorFromStackWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorGetWrapLimit = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetWrapLimit
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type
  TevCEWHack = class(TevCustomEditorWindow)
  end;//TevCEWHack

// start class TkwPopEditorGetWrapLimit

procedure TkwPopEditorGetWrapLimit.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_51499706003B_var*
//#UC END# *4F4CB81200CA_51499706003B_var*
begin
//#UC START# *4F4CB81200CA_51499706003B_impl*
 with TevCEWHack(anEditor) do
  aCtx.rEngine.PushInt(LP2DP(l3PointX(WrapLimit)).X);
//#UC END# *4F4CB81200CA_51499706003B_impl*
end;//TkwPopEditorGetWrapLimit.DoWithEditor

class function TkwPopEditorGetWrapLimit.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetWrapLimit';
end;//TkwPopEditorGetWrapLimit.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetWrapLimit
 TkwPopEditorGetWrapLimit.RegisterInEngine;
{$IfEnd} //not NoScripts

end.