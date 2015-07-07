{$IfNDef kwInsertFromStreamCommon_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInsertFromStreamCommon.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwInsertFromStreamCommon
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwInsertFromStreamCommon_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwInsertFromStreamCommon_ = {mixin} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // public methods
   function GetFormat(const aCtx: TtfwContext): Integer; virtual; abstract;
 end;//_kwInsertFromStreamCommon_
{$IfEnd} //not NoScripts

{$Else kwInsertFromStreamCommon_imp}

{$IfNDef kwInsertFromStreamCommon_imp_impl}
{$Define kwInsertFromStreamCommon_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class _kwInsertFromStreamCommon_

procedure _kwInsertFromStreamCommon_.DoWithEditor(const aCtx: TtfwContext;
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
end;//_kwInsertFromStreamCommon_.DoWithEditor

{$IfEnd} //not NoScripts

{$Else  kwInsertFromStreamCommon_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwInsertFromStreamCommon_imp_impl}
{$EndIf kwInsertFromStreamCommon_imp}
