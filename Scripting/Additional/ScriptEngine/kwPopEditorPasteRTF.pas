unit kwPopEditorPasteRTF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorPasteRTF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_PasteRTF
//
// *Формат:* rtf_file_name anEditorControl pop:editor:PasteRTF
// *Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в
// формате RTF из файла rtf_file_name.
// *Пример:*
// {code}
// Test.rtf  focused:control:push pop:editor:PasteRTF
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
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwInsertFromStreamCommon.imp.pas}
 TkwPopEditorPasteRTF = {final} class(_kwInsertFromStreamCommon_)
  {* *Формат:* rtf_file_name anEditorControl pop:editor:PasteRTF
*Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в формате RTF из файла rtf_file_name.
*Пример:*
[code] 
Test.rtf  focused:control:push pop:editor:PasteRTF
[code] }
 protected
 // realized methods
   function GetFormat(const aCtx: TtfwContext): Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPasteRTF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  ActiveX,
  l3Base,
  l3Filer,
  nevInternalInterfaces,
  l3Types,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorPasteRTF;

{$Include ..\ScriptEngine\kwInsertFromStreamCommon.imp.pas}

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
 {$Include ..\ScriptEngine\kwInsertFromStreamCommon.imp.pas}
{$IfEnd} //not NoScripts

end.