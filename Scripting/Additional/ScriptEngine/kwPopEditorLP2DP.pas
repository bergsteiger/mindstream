unit kwPopEditorLP2DP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorLP2DP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_LP2DP
//
// *Формат:* X Y anEditorControl pop:editor:LP2DP
// *Описание:* Переводи значения точки из долей дюйма в пиксели.
// *Пример:*
// {code}
// 100 100  focused:control:push pop:editor:LP2DP
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
 TkwPopEditorLP2DP = {final scriptword} class(TkwEditorFromStackWord)
  {* *Формат:* X Y anEditorControl pop:editor:LP2DP
*Описание:* Переводи значения точки из долей дюйма в пиксели.
*Пример:*
[code] 
100 100  focused:control:push pop:editor:LP2DP
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorLP2DP
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorLP2DP

procedure TkwPopEditorLP2DP.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_503C589F0334_var*
var
 l_X, l_Y : Integer;
 l_SPoint : Tl3SPoint;
//#UC END# *4F4CB81200CA_503C589F0334_var*
begin
//#UC START# *4F4CB81200CA_503C589F0334_impl*
 if aCtx.rEngine.IsTopInt then
  l_Y := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана координата Y.');
 if aCtx.rEngine.IsTopInt then 
  l_X := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана координата X.');
 l_SPoint := anEditor.Canvas.LP2DP(l3Point(l_X, l_Y));
 aCtx.rEngine.PushInt(l_SPoint.Y);
 aCtx.rEngine.PushInt(l_SPoint.X);
//#UC END# *4F4CB81200CA_503C589F0334_impl*
end;//TkwPopEditorLP2DP.DoWithEditor

class function TkwPopEditorLP2DP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:LP2DP';
end;//TkwPopEditorLP2DP.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_LP2DP
 TkwPopEditorLP2DP.RegisterInEngine;
{$IfEnd} //not NoScripts

end.