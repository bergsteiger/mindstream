unit kwQueryCardFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwQueryCardFromStackWord.pas"
// Начат: 26.09.2011 18:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::QueryCardProcessing::TkwQueryCardFromStackWord
//
// Слово работающее с текущим редактором как с карточкой запроса
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evQueryCardEditor,
  tfwScriptingInterfaces,
  kwEditorFromStackWord,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwQueryCardFromStackWord = {abstract} class(TkwEditorFromStackWord)
  {* Слово работающее с текущим редактором как с карточкой запроса }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoCard(const aCtx: TtfwContext;
     aCard: TevQueryCardEditor); virtual; abstract;
 end;//TkwQueryCardFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwQueryCardFromStackWord

procedure TkwQueryCardFromStackWord.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E808D48037D_var*
//#UC END# *4F4CB81200CA_4E808D48037D_var*
begin
//#UC START# *4F4CB81200CA_4E808D48037D_impl*
 RunnerAssert(anEditor is TevQueryCardEditor, 'Это не КЗ', aCtx);
 DoCard(aCtx, anEditor as TevQueryCardEditor);
//#UC END# *4F4CB81200CA_4E808D48037D_impl*
end;//TkwQueryCardFromStackWord.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwQueryCardFromStackWord
 TkwQueryCardFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.