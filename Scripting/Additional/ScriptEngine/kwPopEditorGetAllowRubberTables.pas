unit kwPopEditorGetAllowRubberTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorGetAllowRubberTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_GetAllowRubberTables
//
// editor:GetAllowRubberTables
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
 TkwPopEditorGetAllowRubberTables = class(_kwEditorFromStackWord_)
  {* editor:GetAllowRubberTables }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetAllowRubberTables
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

type _Instance_R_ = TkwPopEditorGetAllowRubberTables;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorGetAllowRubberTables

procedure TkwPopEditorGetAllowRubberTables.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F1E6F18032A_var*
//#UC END# *4F4CB81200CA_4F1E6F18032A_var*
begin
//#UC START# *4F4CB81200CA_4F1E6F18032A_impl*
 aCtx.rEngine.PushInt(Ord(anEditor.AllowRubberTables));
//#UC END# *4F4CB81200CA_4F1E6F18032A_impl*
end;//TkwPopEditorGetAllowRubberTables.DoWithEditor

class function TkwPopEditorGetAllowRubberTables.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetAllowRubberTables';
end;//TkwPopEditorGetAllowRubberTables.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.