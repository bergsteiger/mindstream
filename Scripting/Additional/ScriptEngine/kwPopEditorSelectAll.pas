unit kwPopEditorSelectAll;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorSelectAll.pas"
// Начат: 14.06.2011 17:05
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectAll
//
// pop:editor:SelectAll. Выделяет весь документ в редакторе.
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
 TkwPopEditorSelectAll = {scriptword} class(TkwEditorFromStackWord)
  {* pop:editor:SelectAll. Выделяет весь документ в редакторе. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectAll
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSelectAll

procedure TkwPopEditorSelectAll.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4DF75C6902E6_var*
//#UC END# *4F4CB81200CA_4DF75C6902E6_var*
begin
//#UC START# *4F4CB81200CA_4DF75C6902E6_impl*
 anEditor.Select(ev_stDocument);
//#UC END# *4F4CB81200CA_4DF75C6902E6_impl*
end;//TkwPopEditorSelectAll.DoWithEditor

class function TkwPopEditorSelectAll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectAll';
end;//TkwPopEditorSelectAll.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectAll
 TkwPopEditorSelectAll.RegisterInEngine;
{$IfEnd} //not NoScripts

end.