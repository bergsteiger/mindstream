unit kwPopEditorResizeTableColumnEX;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorResizeTableColumnEX.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ResizeTableColumnEX
//
// Изменить размер колонки таблицы. Пример:
// {code}   aDelta aKeys aCol aRow editor:ResizeTableColumnEX{code}
// {panel}
// * aCol - номер ячейки, которую тянем
// * aRow - номер строки
// * aKeys - клавиша, нажатая при изменении размеров.
// * aDelta - смещение колонки (положительное - вправо, отрицательное - влево).
// {panel}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackTableColumnResize,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorResizeTableColumnEX = {scriptword} class(TkwEditorFromStackTableColumnResize)
  {* Изменить размер колонки таблицы. Пример:
[code]   aDelta aKeys aCol aRow editor:ResizeTableColumnEX[code]
[panel]
 * aCol - номер ячейки, которую тянем
 * aRow - номер строки
 * aKeys - клавиша, нажатая при изменении размеров.
 * aDelta - смещение колонки (положительное - вправо, отрицательное - влево).
[panel] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function GetKeys: TShiftState; override;
 end;//TkwPopEditorResizeTableColumnEX
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorResizeTableColumnEX

class function TkwPopEditorResizeTableColumnEX.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ResizeTableColumnEX';
end;//TkwPopEditorResizeTableColumnEX.GetWordNameForRegister

function TkwPopEditorResizeTableColumnEX.GetKeys: TShiftState;
//#UC START# *4E32CA120170_4E37BEF102EE_var*
var
 l_Value: Integer;
//#UC END# *4E32CA120170_4E37BEF102EE_var*
begin
//#UC START# *4E32CA120170_4E37BEF102EE_impl*
 l_Value := ItfwScriptEngine(f_Engine).PopInt;
 case l_Value of
  0: Result := [];
  1: Result := [ssShift];
  2: Result := [ssAlt];
  3: Result := [ssCtrl];
  else
   Assert(False, 'Другие значения не поддерживаются.')
 end;
//#UC END# *4E32CA120170_4E37BEF102EE_impl*
end;//TkwPopEditorResizeTableColumnEX.GetKeys

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ResizeTableColumnEX
 TkwPopEditorResizeTableColumnEX.RegisterInEngine;
{$IfEnd} //not NoScripts

end.