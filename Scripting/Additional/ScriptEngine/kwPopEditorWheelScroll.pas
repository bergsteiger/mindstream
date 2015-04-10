unit kwPopEditorWheelScroll;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorWheelScroll.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_WheelScroll
//
// *Формат:* aUp aVeritcal anEditorControl pop:editor:WheelScroll
// *Описание:* Прокручивает документ к позиции скроллера. aVeritcal - если true, то скроллируем
// повертикали. aUp - сроллировать вверх, если true
// *Пример:*
// {code}
// false true focused:control:push anEditorControl pop:editor:WheelScroll
// {code}
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
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 TkwPopEditorWheelScroll = {final} class(_kwEditorFromStackWord_)
  {* *Формат:* aUp aVeritcal anEditorControl pop:editor:WheelScroll
*Описание:* Прокручивает документ к позиции скроллера. aVeritcal - если true, то скроллируем повертикали. aUp - сроллировать вверх, если true
*Пример:*
[code] 
false true focused:control:push anEditorControl pop:editor:WheelScroll
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorWheelScroll
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorWheelScroll;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorWheelScroll

procedure TkwPopEditorWheelScroll.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4F5A730085_var*
var
 l_Up       : Boolean;
 l_Vertical : Boolean;
//#UC END# *4F4CB81200CA_4F4F5A730085_var*
begin
//#UC START# *4F4CB81200CA_4F4F5A730085_impl*
 if aCtx.rEngine.IsTopBool then
  l_Vertical := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задана ориентация прокрукти!');
 if aCtx.rEngine.IsTopBool then
  l_Up := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задано направление прокрукти!');
 with anEditor.View.Scroller[l_Vertical] do
  if l_Up then
   WheelUp
  else
   WheelDown;
//#UC END# *4F4CB81200CA_4F4F5A730085_impl*
end;//TkwPopEditorWheelScroll.DoWithEditor

class function TkwPopEditorWheelScroll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:WheelScroll';
end;//TkwPopEditorWheelScroll.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.