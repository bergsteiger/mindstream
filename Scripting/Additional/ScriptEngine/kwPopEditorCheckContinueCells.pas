unit kwPopEditorCheckContinueCells;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorCheckContinueCells.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_CheckContinueCells
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
 TkwPopEditorCheckContinueCells = {final} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCheckContinueCells
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTableSearch,
  evTypes,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorCheckContinueCells;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorCheckContinueCells

procedure TkwPopEditorCheckContinueCells.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_507510BF02AB_var*
//#UC END# *4F4CB81200CA_507510BF02AB_var*
begin
//#UC START# *4F4CB81200CA_507510BF02AB_impl*
 aCtx.rEngine.PushBool(anEditor.Find(TevTextInContinueCellSearcher.Make, nil, [ev_soGlobal, ev_soUseInternalCursor]));
//#UC END# *4F4CB81200CA_507510BF02AB_impl*
end;//TkwPopEditorCheckContinueCells.DoWithEditor

class function TkwPopEditorCheckContinueCells.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CheckContinueCells';
end;//TkwPopEditorCheckContinueCells.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.