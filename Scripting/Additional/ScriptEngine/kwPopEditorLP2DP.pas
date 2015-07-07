unit kwPopEditorLP2DP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorLP2DP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_LP2DP
//
// *Формат:* X Y anEditorControl pop:editor:LP2DP
// *Описание:* Переводи значения точки из долей дюйма в пиксели.
// *Пример:*
// {code}
// 100 100  focused:control:push pop:editor:LP2DP
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
 TkwPopEditorLP2DP = {final} class(_kwEditorFromStackWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorLP2DP
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

type _Instance_R_ = TkwPopEditorLP2DP;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.