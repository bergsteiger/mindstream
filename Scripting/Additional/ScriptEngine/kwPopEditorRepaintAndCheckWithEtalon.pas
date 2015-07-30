unit kwPopEditorRepaintAndCheckWithEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorRepaintAndCheckWithEtalon.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_RepaintAndCheckWithEtalon
//
// *Описание:*
// Перерисовывает редактор сохраняя данные об отриосванном для тестов. Пересовка вызвается
// принудительно. Все отрисованные до этого данные стираются! Создается файл с именем NNN.shapes -
// где NNN - номер теста (Внимание! Имя теста дожно начинаться с TK) . Если до этого не
// существовало эталона, то он создается. О чем сообщается в конце выполнеия теста. Если эталон уже
// существовал, то производится сравнение новой версии файла с эталоном. Если сравнение не прошло,
// то об этом будет сообщено (тест будет считаться не прошедшим) и будет вызвана внешняя программа
// сравнения файлов.
// *Формат:*
// {code}
// anEditor pop:editor:RepaintCheckWithEtalon
// {code}
// где anEditor - указатель на редактор, в котором нужно вызвать перерисовку.
// *Пример:*
// {code}
// focused:control:push pop:editor:RepaintCheckWithEtalon
// {code}
// Вызывает перисовку в редакторе, где находится фокус.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  nevTools,
  nevShapesPaintedSpy
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 _kwCheckWithEtalonCommon_Parent_ = TkwEditorFromStackWord;
 {$Include ..\ScriptEngine\kwCheckWithEtalonCommon.imp.pas}
 TkwPopEditorRepaintAndCheckWithEtalon = {scriptword} class(_kwCheckWithEtalonCommon_)
  {* *Описание:*
Перерисовывает редактор сохраняя данные об отриосванном для тестов. Пересовка вызвается принудительно. Все отрисованные до этого данные стираются! Создается файл с именем NNN.shapes - где NNN - номер теста (Внимание! Имя теста дожно начинаться с TK) . Если до этого не существовало эталона, то он создается. О чем сообщается в конце выполнеия теста. Если эталон уже существовал, то производится сравнение новой версии файла с эталоном. Если сравнение не прошло, то об этом будет сообщено (тест будет считаться не прошедшим) и будет вызвана внешняя программа сравнения файлов.
*Формат:*
[code]
anEditor pop:editor:RepaintCheckWithEtalon 
[code]
где anEditor - указатель на редактор, в котором нужно вызвать перерисовку.
*Пример:*
[code]
focused:control:push pop:editor:RepaintCheckWithEtalon 
[code]
Вызывает перисовку в редакторе, где находится фокус. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorRepaintAndCheckWithEtalon
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  SysUtils,
  StrUtils
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCheckWithEtalonCommon.imp.pas}

// start class TkwPopEditorRepaintAndCheckWithEtalon

procedure TkwPopEditorRepaintAndCheckWithEtalon.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E1B0DEA0240_var*
//#UC END# *4F4CB81200CA_4E1B0DEA0240_var*
begin
//#UC START# *4F4CB81200CA_4E1B0DEA0240_impl*
 anEditor.View.ClearShapes;
 ExecuteWithEditor(aCtx, anEditor);
//#UC END# *4F4CB81200CA_4E1B0DEA0240_impl*
end;//TkwPopEditorRepaintAndCheckWithEtalon.DoWithEditor

class function TkwPopEditorRepaintAndCheckWithEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:RepaintAndCheckWithEtalon';
end;//TkwPopEditorRepaintAndCheckWithEtalon.GetWordNameForRegister

{$IfEnd} //nsTest AND not NoScripts

initialization
{$If defined(nsTest) AND not defined(NoScripts)}
// Регистрация pop_editor_RepaintAndCheckWithEtalon
 TkwPopEditorRepaintAndCheckWithEtalon.RegisterInEngine;
{$IfEnd} //nsTest AND not NoScripts

end.