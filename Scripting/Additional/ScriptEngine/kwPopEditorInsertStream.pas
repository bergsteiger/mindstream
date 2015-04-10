unit kwPopEditorInsertStream;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorInsertStream.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_InsertStream
//
// *Формат:* aFromat file_name anEditorControl pop:editor:InsertStream
// *Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в
// формате aFromat  из файла file_name.
// *Пример:*
// {code}
// Test.rtf CF_RTF  focused:control:push pop:editor:InsertStream
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
 TkwPopEditorInsertStream = {final} class(_kwInsertFromStreamCommon_)
  {* *Формат:* aFromat file_name anEditorControl pop:editor:InsertStream
*Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в формате aFromat  из файла file_name.
*Пример:*
[code] 
Test.rtf CF_RTF  focused:control:push pop:editor:InsertStream
[code] }
 protected
 // realized methods
   function GetFormat(const aCtx: TtfwContext): Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorInsertStream
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

type _Instance_R_ = TkwPopEditorInsertStream;

{$Include ..\ScriptEngine\kwInsertFromStreamCommon.imp.pas}

// start class TkwPopEditorInsertStream

function TkwPopEditorInsertStream.GetFormat(const aCtx: TtfwContext): Integer;
//#UC START# *5265050903DB_5265029302FC_var*
//#UC END# *5265050903DB_5265029302FC_var*
begin
//#UC START# *5265050903DB_5265029302FC_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан формат файла!', aCtx);
 Result := aCtx.rEngine.PopInt
//#UC END# *5265050903DB_5265029302FC_impl*
end;//TkwPopEditorInsertStream.GetFormat

class function TkwPopEditorInsertStream.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:InsertStream';
end;//TkwPopEditorInsertStream.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwInsertFromStreamCommon.imp.pas}
{$IfEnd} //not NoScripts

end.