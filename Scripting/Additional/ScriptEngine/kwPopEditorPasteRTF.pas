unit kwPopEditorPasteRTF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorPasteRTF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_PasteRTF
//
// *Формат:* rtf_file_name anEditorControl pop:editor:PasteRTF
// *Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в
// формате RTF из файла rtf_file_name.
// *Пример:*
// {code}
// Test.rtf  focused:control:push pop:editor:PasteRTF
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwInsertFromStreamCommon,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorPasteRTF = {final scriptword} class(TkwInsertFromStreamCommon)
  {* *Формат:* rtf_file_name anEditorControl pop:editor:PasteRTF
*Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в формате RTF из файла rtf_file_name.
*Пример:*
[code] 
Test.rtf  focused:control:push pop:editor:PasteRTF
[code] }
 protected
 // realized methods
   function GetFormat(const aCtx: TtfwContext): Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPasteRTF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorPasteRTF

function TkwPopEditorPasteRTF.GetFormat(const aCtx: TtfwContext): Integer;
//#UC START# *5265050903DB_5260EBCB0238_var*
//#UC END# *5265050903DB_5260EBCB0238_var*
begin
//#UC START# *5265050903DB_5260EBCB0238_impl*
 Result := cf_RTF;
//#UC END# *5265050903DB_5260EBCB0238_impl*
end;//TkwPopEditorPasteRTF.GetFormat

class function TkwPopEditorPasteRTF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PasteRTF';
end;//TkwPopEditorPasteRTF.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_PasteRTF
 TkwPopEditorPasteRTF.RegisterInEngine;
{$IfEnd} //not NoScripts

end.