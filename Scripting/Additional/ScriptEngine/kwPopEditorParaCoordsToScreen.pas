unit kwPopEditorParaCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Костицын М.
// Модуль: "kwPopEditorParaCoordsToScreen.pas"
// Начат: 16.12.2011
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::MoveMouseByPara::pop_editor_ParaCoordsToScreen
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwParaCoordsToScreen,
  l3Units,
  nevTools
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorParaCoordsToScreen = {final scriptword} class(TkwParaCoordsToScreen)
 protected
 // overridden protected methods
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorParaCoordsToScreen

function TkwPopEditorParaCoordsToScreen.GetPoint(const aMap: InevMap): Tl3Point;
//#UC START# *4C3C927B027E_4EEB66D703A9_var*
//#UC END# *4C3C927B027E_4EEB66D703A9_var*
begin
//#UC START# *4C3C927B027E_4EEB66D703A9_impl*
 Result := l3Point(aMap.Bounds.Left, aMap.Bounds.Top);
//#UC END# *4C3C927B027E_4EEB66D703A9_impl*
end;//TkwPopEditorParaCoordsToScreen.GetPoint

class function TkwPopEditorParaCoordsToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaCoordsToScreen';
end;//TkwPopEditorParaCoordsToScreen.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaCoordsToScreen
 TkwPopEditorParaCoordsToScreen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.