unit kwPopEditorInsertStream;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorInsertStream.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_InsertStream
//
// *Формат:* aFromat file_name anEditorControl pop:editor:InsertStream
// *Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в
// формате aFromat  из файла file_name.
// *Пример:*
// {code}
// Test.rtf CF_RTF  focused:control:push pop:editor:InsertStream
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
 TkwPopEditorInsertStream = {final scriptword} class(TkwInsertFromStreamCommon)
  {* *Формат:* aFromat file_name anEditorControl pop:editor:InsertStream
*Описание:* Эмулирует вставку из буфера обмена данных из внешних приложений, например, текст в формате aFromat  из файла file_name.
*Пример:*
[code] 
Test.rtf CF_RTF  focused:control:push pop:editor:InsertStream
[code] }
 protected
 // realized methods
   function GetFormat(const aCtx: TtfwContext): Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorInsertStream
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация pop_editor_InsertStream
 TkwPopEditorInsertStream.RegisterInEngine;
{$IfEnd} //not NoScripts

end.