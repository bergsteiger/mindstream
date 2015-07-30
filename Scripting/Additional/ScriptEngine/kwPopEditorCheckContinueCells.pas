unit kwPopEditorCheckContinueCells;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorCheckContinueCells.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_CheckContinueCells
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorCheckContinueCells = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCheckContinueCells
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTableSearch,
  evTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorCheckContinueCells

procedure TkwPopEditorCheckContinueCells.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_507510BF02AB_var*
//#UC END# *4F4CB81200CA_507510BF02AB_var*
begin
//#UC START# *4F4CB81200CA_507510BF02AB_impl*
 aCtx.rEngine.PushBool(anEditor.Find(TevTextInContinueCellSearcher.Make, nil, [ev_soGlobal, ev_soUseInternalCursor]));
//#UC END# *4F4CB81200CA_507510BF02AB_impl*
end;//TkwPopEditorCheckContinueCells.DoWithEditor

class function TkwPopEditorCheckContinueCells.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CheckContinueCells';
end;//TkwPopEditorCheckContinueCells.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_CheckContinueCells
 TkwPopEditorCheckContinueCells.RegisterInEngine;
{$IfEnd} //not NoScripts

end.