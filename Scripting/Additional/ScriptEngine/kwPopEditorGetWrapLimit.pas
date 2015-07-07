unit kwPopEditorGetWrapLimit;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorGetWrapLimit.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_GetWrapLimit
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
 TkwPopEditorGetWrapLimit = {final} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetWrapLimit
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

type _Instance_R_ = TkwPopEditorGetWrapLimit;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

type
  TevCEWHack = class(TevCustomEditorWindow)
  end;//TevCEWHack

// start class TkwPopEditorGetWrapLimit

procedure TkwPopEditorGetWrapLimit.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_51499706003B_var*
//#UC END# *4F4CB81200CA_51499706003B_var*
begin
//#UC START# *4F4CB81200CA_51499706003B_impl*
 with TevCEWHack(anEditor) do
  aCtx.rEngine.PushInt(LP2DP(l3PointX(WrapLimit)).X);
//#UC END# *4F4CB81200CA_51499706003B_impl*
end;//TkwPopEditorGetWrapLimit.DoWithEditor

class function TkwPopEditorGetWrapLimit.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetWrapLimit';
end;//TkwPopEditorGetWrapLimit.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.