unit kwPopEditorTextToFile;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorTextToFile.pas"
// Начат: 26.05.2011 13:53
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_TextToFile
//
// Сохраняет содержимое редактора в evd-файл.
// Пример:
// 'C:\MyFile.evd' editor:TextToFile
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
 TkwPopEditorTextToFile = class(_kwEditorFromStackWord_)
  {* Сохраняет содержимое редактора в evd-файл. 
Пример:
'C:\MyFile.evd' editor:TextToFile }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorTextToFile
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  l3Interfaces,
  l3Stream,
  l3Types,
  SysUtils,
  evdMarkEliminator,
  evdDocumentMarksEliminator,
  l3Variant,
  evdDocumentBookmarksEliminator,
  evdDocumentSubsEliminator,
  evDocumentSubsChildrenCountEliminator,
  evdHypelinkDocIDEliminator,
  evdEmptySubsEliminator,
  evdStartAndTimeEliminator,
  evBitmapEliminator4Tests,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorTextToFile;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorTextToFile

procedure TkwPopEditorTextToFile.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4DDE23E403D6_var*
var
 l_S : AnsiString;
 l_F : Tl3NamedTextStream;
 l_G : Ik2TagGenerator;
//#UC END# *4F4CB81200CA_4DDE23E403D6_var*
begin
//#UC START# *4F4CB81200CA_4DDE23E403D6_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 l_S := ChangeFileExt(l_S, '.evd');
 l_F := Tl3NamedTextStream.Create(l_S, l3_fmWrite);
 try
  l_G := TevdEmptySubsEliminator.Make;
  TevdMarkEliminator.SetTo(l_G);
  TevdDocumentMarksEliminator.SetTo(l_G);
  TevdDocumentBookmarksEliminator.SetTo(l_G);
  TevdDocumentSubsEliminator.SetTo(l_G);
  TevDocumentSubsChildrenCountEliminator.SetTo(l_G);
  TevBitmapEliminator4Tests.SetTo(l_G);
  {$IF Defined(Archi) and Defined(InsiderTest)}
  TevdHypelinkDocIDEliminator.SetTo(l_G);
  TevdStartAndTimeEliminator.SetTo(l_G);
  {$IFEND}
  //TevdEmptySubsEliminator.SetTo(l_G);
  try
   anEditor.TextSource.DocumentContainer.TagReader.
    ReadTag(cf_EverestTxt,
            l_F,
            l_G);
  finally
   l_G := nil;
  end;//try..finally
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *4F4CB81200CA_4DDE23E403D6_impl*
end;//TkwPopEditorTextToFile.DoWithEditor

class function TkwPopEditorTextToFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:TextToFile';
end;//TkwPopEditorTextToFile.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.