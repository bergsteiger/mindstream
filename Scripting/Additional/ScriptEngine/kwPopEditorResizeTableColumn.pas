unit kwPopEditorResizeTableColumn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorResizeTableColumn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_ResizeTableColumn
//
// Изменить размер колонки таблицы. Пример:
// {code}   aDelta aCol aRow editor:ResizeTableColumn {code}
// {panel}
// * aCol - номер ячейки, которую тянем
// * aRow - номер строки
// * aDelta - смещение колонки (положительное - вправо, отрицательное - влево).
// {panel}
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
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord,
  l3Units,
  nevGUIInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackTableColumnResize.imp.pas}
 TkwPopEditorResizeTableColumn = class(_kwEditorFromStackTableColumnResize_)
  {* Изменить размер колонки таблицы. Пример:
[code]   aDelta aCol aRow editor:ResizeTableColumn [code]
[panel]
 * aCol - номер ячейки, которую тянем
 * aRow - номер строки
 * aDelta - смещение колонки (положительное - вправо, отрицательное - влево).
[panel] }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorResizeTableColumn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Table_Const,
  evConst,
  TextPara_Const,
  CommentPara_Const,
  Windows,
  evParaTools,
  evOp,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorResizeTableColumn;

{$Include ..\ScriptEngine\kwEditorFromStackTableColumnResize.imp.pas}

// start class TkwPopEditorResizeTableColumn

class function TkwPopEditorResizeTableColumn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ResizeTableColumn';
end;//TkwPopEditorResizeTableColumn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackTableColumnResize.imp.pas}
{$IfEnd} //not NoScripts

end.