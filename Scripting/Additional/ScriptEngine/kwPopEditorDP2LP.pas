unit kwPopEditorDP2LP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorDP2LP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_DP2LP
//
// *Формат:* X Y anEditorControl pop:editor:DP2LP
// *Описание:* Переводи значения точки из долей дюйма в пиксели.
// *Пример:*
// {code}
// 100 100  focused:control:push pop:editor:DP2LP
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
 TkwPopEditorDP2LP = {final scriptword} class(TkwEditorFromStackWord)
  {* *Формат:* X Y anEditorControl pop:editor:DP2LP
*Описание:* Переводи значения точки из долей дюйма в пиксели.
*Пример:*
[code] 
100 100  focused:control:push pop:editor:DP2LP
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorDP2LP
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorDP2LP

procedure TkwPopEditorDP2LP.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_503C650202E5_var*
var
 l_X, l_Y : Integer;
 l_SPoint : Tl3SPoint;
 l_Point  : Tl3Point;
//#UC END# *4F4CB81200CA_503C650202E5_var*
begin
//#UC START# *4F4CB81200CA_503C650202E5_impl*
 if aCtx.rEngine.IsTopInt then
  l_Y := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана координата Y.');
 if aCtx.rEngine.IsTopInt then
  l_X := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана координата X.');
 l_SPoint.Init(l_X, l_Y);
 l_Point := anEditor.Canvas.DP2LP(l_SPoint);
 aCtx.rEngine.PushInt(l_Point.Y);
 aCtx.rEngine.PushInt(l_Point.X);
//#UC END# *4F4CB81200CA_503C650202E5_impl*
end;//TkwPopEditorDP2LP.DoWithEditor

class function TkwPopEditorDP2LP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:DP2LP';
end;//TkwPopEditorDP2LP.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_DP2LP
 TkwPopEditorDP2LP.RegisterInEngine;
{$IfEnd} //not NoScripts

end.