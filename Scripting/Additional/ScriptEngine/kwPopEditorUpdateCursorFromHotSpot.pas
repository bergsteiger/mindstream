unit kwPopEditorUpdateCursorFromHotSpot;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorUpdateCursorFromHotSpot.pas"
// Начат: 08.09.2011 18:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_UpdateCursorFromHotSpot
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
 TkwPopEditorUpdateCursorFromHotSpot = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorUpdateCursorFromHotSpot
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

type
  TevCustomEditorWindowHack = class(TevCustomEditorWindow)
  end;//TevCustomEditorWindowHack

// start class TkwPopEditorUpdateCursorFromHotSpot

procedure TkwPopEditorUpdateCursorFromHotSpot.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E68D7D10110_var*
//#UC END# *4F4CB81200CA_4E68D7D10110_var*
begin
//#UC START# *4F4CB81200CA_4E68D7D10110_impl*
 TevCustomEditorWindowHack(anEditor).UpdateCursorFromHotSpot;
//#UC END# *4F4CB81200CA_4E68D7D10110_impl*
end;//TkwPopEditorUpdateCursorFromHotSpot.DoWithEditor

class function TkwPopEditorUpdateCursorFromHotSpot.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:UpdateCursorFromHotSpot';
end;//TkwPopEditorUpdateCursorFromHotSpot.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_UpdateCursorFromHotSpot
 TkwPopEditorUpdateCursorFromHotSpot.RegisterInEngine;
{$IfEnd} //not NoScripts

end.