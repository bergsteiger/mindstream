unit kwInsertFromStreamCommon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwInsertFromStreamCommon.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwInsertFromStreamCommon
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwEditorFromStackWord,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInsertFromStreamCommon = {abstract} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // public methods
   function GetFormat(const aCtx: TtfwContext): Integer; virtual; abstract;
 end;//TkwInsertFromStreamCommon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  ActiveX,
  l3Base,
  l3Filer,
  nevInternalInterfaces,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwInsertFromStreamCommon

procedure TkwInsertFromStreamCommon.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_52650217029A_var*
var
 l_Filer    : Tl3CustomDOSFiler;
 l_Format   : Integer;
 l_Reader   : Tk2CustomReader;
 l_FileName : AnsiString;
//#UC END# *4F4CB81200CA_52650217029A_var*
begin
//#UC START# *4F4CB81200CA_52650217029A_impl*
 l_Format := GetFormat(aCtx);
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя файла!', aCtx);
 l_FileName := aCtx.rEngine.PopDelphiString;
 l_FileName := aCtx.rCaller.ResolveInputFilePath(l_FileName);
 l_Filer := Tl3CustomDOSFiler.Make(l_FileName, l3_fmRead, False);
 try
  InevDocumentContainerInternal(anEditor.TextSource.DocumentContainer.Internal).GetReader(l_Format,
                                                                                          l_Filer As IStream,
                                                                                          l_Reader,
                                                                                          False,
                                                                                          l_Filer.CodePage);
  try
   if l_Reader = nil then Exit;
   with anEditor do
    TextSource.DocumentContainer.TagWriter.WriteTagEx(View, l_Reader, Selection.Cursor);
  finally
   l3Free(l_Reader);
  end;//try..finally
 finally
  l3Free(l_Filer);
 end;
//#UC END# *4F4CB81200CA_52650217029A_impl*
end;//TkwInsertFromStreamCommon.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwInsertFromStreamCommon
 TkwInsertFromStreamCommon.RegisterClass;
{$IfEnd} //not NoScripts

end.