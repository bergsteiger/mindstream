unit kwPopEditorCheckWithEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorCheckWithEtalon.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_CheckWithEtalon
//
// *Описание:*
// Перерисовывает редактор сохраняя данные об отриосванном для тестов. Сохранение данных об
// отрисовке вызвается только после выполения функции. Создается файл с именем NNN.shapes - где NNN
// - номер теста (Внимание! Имя теста дожно начинаться с TK) . Если до этого не существовало
// эталона, то он создается. О чем сообщается в конце выполнеия теста. Если эталон уже существовал,
// то производится сравнение новой версии файла с эталоном. Если сравнение не прошло, то об этом
// будет сообщено (тест будет считаться не прошедшим) и будет вызвана внешняя программа сравнения
// файлов.
// *Формат:*
// {code}
// anEditor pop:editor:CheckWithEtalon aProc
// {code}
// где anEditor - указатель на редактор, в котором нужно проверить отрисовку. aProc - процедура,
// вызывающая отрисовку.
// *Пример:*
// {code}
// focused:control:push pop:editor:CheckWithEtalon "Разделить ячейки таблицы"
// {code}
// Проверяет отрисовку в редакторе, где находится фокус после выполнения функции "Разделить ячейки
// таблицы".
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
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwPopEditorCheckWithEtalon = {final} class(_tfwWordWorker_)
  {* *Описание:*
Перерисовывает редактор сохраняя данные об отриосванном для тестов. Сохранение данных об отрисовке вызвается только после выполения функции. Создается файл с именем NNN.shapes - где NNN - номер теста (Внимание! Имя теста дожно начинаться с TK) . Если до этого не существовало эталона, то он создается. О чем сообщается в конце выполнеия теста. Если эталон уже существовал, то производится сравнение новой версии файла с эталоном. Если сравнение не прошло, то об этом будет сообщено (тест будет считаться не прошедшим) и будет вызвана внешняя программа сравнения файлов.
*Формат:*
[code]
anEditor pop:editor:CheckWithEtalon aProc
[code]
где anEditor - указатель на редактор, в котором нужно проверить отрисовку. aProc - процедура, вызывающая отрисовку.
*Пример:*
[code]
focused:control:push pop:editor:CheckWithEtalon "Разделить ячейки таблицы"
[code]
Проверяет отрисовку в редакторе, где находится фокус после выполнения функции "Разделить ячейки таблицы". }
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCheckWithEtalon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCheckWithEtalon,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorCheckWithEtalon;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwPopEditorCheckWithEtalon

function TkwPopEditorCheckWithEtalon.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_50D44F67024C_var*
//#UC END# *4DCBD67C0362_50D44F67024C_var*
begin
//#UC START# *4DCBD67C0362_50D44F67024C_impl*
 Result := TkwCompiledCheckWithEtalon;
//#UC END# *4DCBD67C0362_50D44F67024C_impl*
end;//TkwPopEditorCheckWithEtalon.CompiledWorkerClass

class function TkwPopEditorCheckWithEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CheckWithEtalon';
end;//TkwPopEditorCheckWithEtalon.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.