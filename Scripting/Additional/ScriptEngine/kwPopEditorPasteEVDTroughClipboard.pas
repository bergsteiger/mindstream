unit kwPopEditorPasteEVDTroughClipboard;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorPasteEVDTroughClipboard.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_PasteEVDTroughClipboard
//
// Описание: загружает EVD'файл в виде текста в буфер обмена, а потом вставляет в редактор.
// Формат:
// {code}
// anEditor aFileName pop:editor:PasteEVDTroughClipboard
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
 TkwPopEditorPasteEVDTroughClipboard = {final} class(_kwEditorFromStackWord_)
  {* Описание: загружает EVD'файл в виде текста в буфер обмена, а потом вставляет в редактор.
Формат: 
[code]
anEditor aFileName pop:editor:PasteEVDTroughClipboard
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPasteEVDTroughClipboard
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Types,
  l3Memory,
  l3Stream,
  l3Base,
  evTypes,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorPasteEVDTroughClipboard;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorPasteEVDTroughClipboard

procedure TkwPopEditorPasteEVDTroughClipboard.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_53957B0E024C_var*
var
 l_Filer       : Tl3FileStream;
 l_FileName    : AnsiString;
 l_MemoryStream: Tl3MemoryStream;
//#UC END# *4F4CB81200CA_53957B0E024C_var*
begin
//#UC START# *4F4CB81200CA_53957B0E024C_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Мне нужна строка!', aCtx);
 l_FileName := aCtx.rEngine.PopDelphiString;
 l_FileName := aCtx.rCaller.ResolveInputFilePath(l_FileName);
 l_Filer := Tl3FileStream.Create(l_FileName, l3_fmRead);
 try
  l_MemoryStream := Tl3MemoryStream.Create;
  try
   l_MemoryStream.CopyFrom(l_Filer, l_Filer.Size);
   Win32Check(OpenClipboard(anEditor.Handle));
   try
    SetClipboardData(cf_EverestTxt, l3System.ReleaseHandle(l_MemoryStream.MemoryPool.ReleaseHandle));
   finally
    Win32Check(CloseClipboard);
   end;
   anEditor.Paste;
  finally
   FreeAndNil(l_MemoryStream);
  end;
 finally
  FreeAndNil(l_Filer);
 end;
//#UC END# *4F4CB81200CA_53957B0E024C_impl*
end;//TkwPopEditorPasteEVDTroughClipboard.DoWithEditor

class function TkwPopEditorPasteEVDTroughClipboard.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PasteEVDTroughClipboard';
end;//TkwPopEditorPasteEVDTroughClipboard.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.