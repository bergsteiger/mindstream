unit kwPopEditorDP2LP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorDP2LP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_DP2LP
//
// *Формат:* X Y anEditorControl pop:editor:DP2LP
// *Описание:* Переводи значения точки из долей дюйма в пиксели.
// *Пример:*
// {code}
// 100 100  focused:control:push pop:editor:DP2LP
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
 TkwPopEditorDP2LP = {final} class(_kwEditorFromStackWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorDP2LP
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Units,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorDP2LP;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.