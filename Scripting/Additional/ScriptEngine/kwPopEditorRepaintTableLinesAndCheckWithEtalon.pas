unit kwPopEditorRepaintTableLinesAndCheckWithEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorRepaintTableLinesAndCheckWithEtalon.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_RepaintTableLinesAndCheckWithEtalon
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
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord,
  l3FrameLinesSpy,
  l3InternalInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _LinesDrawOutput_Parent_ = _kwEditorFromStackWord_;
 {$Include ..\ScriptEngine\LinesDrawOutput.imp.pas}
 TkwPopEditorRepaintTableLinesAndCheckWithEtalon = {final} class(_LinesDrawOutput_)
 private
 // private fields
   f_ScriptCaller : ItfwScriptCaller;
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
   procedure DoCloseLog(const aLogName: AnsiString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorRepaintTableLinesAndCheckWithEtalon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorRepaintTableLinesAndCheckWithEtalon;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

{$Include ..\ScriptEngine\LinesDrawOutput.imp.pas}

// start class TkwPopEditorRepaintTableLinesAndCheckWithEtalon

procedure TkwPopEditorRepaintTableLinesAndCheckWithEtalon.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4FA3BC08027F_var*
//#UC END# *4F4CB81200CA_4FA3BC08027F_var*
begin
//#UC START# *4F4CB81200CA_4FA3BC08027F_impl*
 f_OutputFileName := ExtractFileName(aCtx.rScriptFilename);
 f_OutputFileName := Copy(f_OutputFileName, 1, Length(f_OutputFileName) - Length('.lines') - 1);
 RunnerAssert(AnsiStartsStr('TK', f_OutputFileName), 'Имя файла должно начинаться с TK', aCtx);
 Delete(f_OutputFileName, 1, 2);
 f_OutputFileName := aCtx.rCaller.ResolveOutputFilePath(f_OutputFileName);
 f_ScriptCaller := aCtx.rCaller;
 if aCtx.rEngine.IsTopInt then
  f_Precision := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана точность округления!');
 try
  SaveDrawing(anEditor, False);
 finally
  f_ScriptCaller := nil;
 end;//try..finally
//#UC END# *4F4CB81200CA_4FA3BC08027F_impl*
end;//TkwPopEditorRepaintTableLinesAndCheckWithEtalon.DoWithEditor

procedure TkwPopEditorRepaintTableLinesAndCheckWithEtalon.DoCloseLog(const aLogName: AnsiString);
//#UC START# *4FA3C6D2025F_4FA3BC08027F_var*
//#UC END# *4FA3C6D2025F_4FA3BC08027F_var*
begin
//#UC START# *4FA3C6D2025F_4FA3BC08027F_impl*
 f_ScriptCaller.CheckWithEtalon(aLogName, #0);
//#UC END# *4FA3C6D2025F_4FA3BC08027F_impl*
end;//TkwPopEditorRepaintTableLinesAndCheckWithEtalon.DoCloseLog

class function TkwPopEditorRepaintTableLinesAndCheckWithEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:RepaintTableLinesAndCheckWithEtalon';
end;//TkwPopEditorRepaintTableLinesAndCheckWithEtalon.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.