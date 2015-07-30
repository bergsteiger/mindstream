unit kwPopEditorSelectPara;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Костицын М.
// Модуль: "kwPopEditorSelectPara.pas"
// Начат: 16.12.2011
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectPara
//
// pop:editor:SelectPara. Выделяет текущий параграф в редакторе
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
 TkwPopEditorSelectPara = {scriptword} class(TkwEditorFromStackWord)
  {* pop:editor:SelectPara. Выделяет текущий параграф в редакторе }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectPara
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSelectPara

procedure TkwPopEditorSelectPara.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EEB668D000C_var*
//#UC END# *4F4CB81200CA_4EEB668D000C_var*
begin
//#UC START# *4F4CB81200CA_4EEB668D000C_impl*
 anEditor.Select(ev_stPara);
//#UC END# *4F4CB81200CA_4EEB668D000C_impl*
end;//TkwPopEditorSelectPara.DoWithEditor

class function TkwPopEditorSelectPara.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectPara';
end;//TkwPopEditorSelectPara.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectPara
 TkwPopEditorSelectPara.RegisterInEngine;
{$IfEnd} //not NoScripts

end.