{$IfNDef kwCheckWithEtalonCommon_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCheckWithEtalonCommon.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwCheckWithEtalonCommon
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCheckWithEtalonCommon_imp}
{$If not defined(NoScripts)}
 _DrawOutputSupport_Parent_ = _kwCheckWithEtalonCommon_Parent_;
 {$Include ..\ScriptEngine\DrawOutputSupport.imp.pas}
 _kwCheckWithEtalonCommon_ = {mixin} class(_DrawOutputSupport_)
 private
 // private fields
   f_ScriptCaller : ItfwScriptCaller;
   f_OutputFileName : AnsiString;
 protected
 // realized methods
   function DoOpenLog(const aView: InevView): AnsiString; override;
   procedure DoCloseLog(const aLogName: AnsiString); override;
 protected
 // protected methods
   procedure ExecuteWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow);
 end;//_kwCheckWithEtalonCommon_
{$IfEnd} //not NoScripts

{$Else kwCheckWithEtalonCommon_imp}

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\DrawOutputSupport.imp.pas}

// start class _kwCheckWithEtalonCommon_

procedure _kwCheckWithEtalonCommon_.ExecuteWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *50F3D8DF034F_50D456F10356_var*
//#UC END# *50F3D8DF034F_50D456F10356_var*
begin
//#UC START# *50F3D8DF034F_50D456F10356_impl*
 f_OutputFileName := ChangeFileExt(ExtractFileName(aCtx.rScriptFilename), '.shapes');
 RunnerAssert(AnsiStartsStr('TK', f_OutputFileName), 'Имя файла должно начинаться с TK', aCtx);
 Delete(f_OutputFileName, 1, 2);
 f_OutputFileName := aCtx.rCaller.ResolveOutputFilePath(f_OutputFileName);
 f_ScriptCaller := aCtx.rCaller;
 try
  SaveDrawing(anEditor);
 finally
  f_ScriptCaller := nil;
 end;//try..finally
//#UC END# *50F3D8DF034F_50D456F10356_impl*
end;//_kwCheckWithEtalonCommon_.ExecuteWithEditor

function _kwCheckWithEtalonCommon_.DoOpenLog(const aView: InevView): AnsiString;
//#UC START# *4E1C0C6C026C_50D456F10356_var*
//#UC END# *4E1C0C6C026C_50D456F10356_var*
begin
//#UC START# *4E1C0C6C026C_50D456F10356_impl*
 Result := f_OutputFileName;
//#UC END# *4E1C0C6C026C_50D456F10356_impl*
end;//_kwCheckWithEtalonCommon_.DoOpenLog

procedure _kwCheckWithEtalonCommon_.DoCloseLog(const aLogName: AnsiString);
//#UC START# *4E1C0C8C0007_50D456F10356_var*
//#UC END# *4E1C0C8C0007_50D456F10356_var*
begin
//#UC START# *4E1C0C8C0007_50D456F10356_impl*
 f_ScriptCaller.CheckWithEtalon(aLogName, #0);
//#UC END# *4E1C0C8C0007_50D456F10356_impl*
end;//_kwCheckWithEtalonCommon_.DoCloseLog

{$IfEnd} //not NoScripts

{$EndIf kwCheckWithEtalonCommon_imp}
