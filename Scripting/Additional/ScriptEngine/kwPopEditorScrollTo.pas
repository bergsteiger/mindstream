unit kwPopEditorScrollTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorScrollTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ScrollTo
//
// *Формат:* aValue aVeritcal anEditorControl pop:editor:ScrollTo
// *Описание:* Прокручивает документ к позиции скроллера. aVeritcal - если true, то скроллируем
// повертикали.
// *Пример:*
// {code}
// 150 true focused:control:push pop:editor:ScrollBottom
// {code}
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
 TkwPopEditorScrollTo = {final scriptword} class(TkwEditorFromStackWord)
  {* *Формат:* aValue aVeritcal anEditorControl pop:editor:ScrollTo
*Описание:* Прокручивает документ к позиции скроллера. aVeritcal - если true, то скроллируем повертикали.
*Пример:*
[code] 
150 true focused:control:push pop:editor:ScrollBottom
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorScrollTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorScrollTo

procedure TkwPopEditorScrollTo.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4F463A0009_var*
var
 l_Position : Integer;
 l_Vertical : Boolean;
//#UC END# *4F4CB81200CA_4F4F463A0009_var*
begin
//#UC START# *4F4CB81200CA_4F4F463A0009_impl*
 if aCtx.rEngine.IsTopBool then
  l_Vertical := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задана ориентация прокрукти!');
 if aCtx.rEngine.IsTopInt then
  l_Position := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана величина прокрукти!');
 with anEditor.View.Scroller[l_Vertical] do
  ScrollTo(l_Position);
//#UC END# *4F4CB81200CA_4F4F463A0009_impl*
end;//TkwPopEditorScrollTo.DoWithEditor

class function TkwPopEditorScrollTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ScrollTo';
end;//TkwPopEditorScrollTo.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ScrollTo
 TkwPopEditorScrollTo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.