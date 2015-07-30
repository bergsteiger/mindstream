unit kwPopEditorParaMiddleCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorParaMiddleCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::MoveMouseByPara::pop_editor_ParaMiddleCoordsToScreen
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
 TkwPopEditorParaMiddleCoordsToScreen = {final scriptword} class(TkwParaCoordsToScreen)
 protected
 // overridden protected methods
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaMiddleCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorParaMiddleCoordsToScreen

function TkwPopEditorParaMiddleCoordsToScreen.GetPoint(const aMap: InevMap): Tl3Point;
//#UC START# *4C3C927B027E_4F95434701ED_var*
//#UC END# *4C3C927B027E_4F95434701ED_var*
begin
//#UC START# *4C3C927B027E_4F95434701ED_impl*
 Result := l3Point((aMap.Bounds.Left + aMap.Bounds.Right) div 2, aMap.Bounds.Top);
//#UC END# *4C3C927B027E_4F95434701ED_impl*
end;//TkwPopEditorParaMiddleCoordsToScreen.GetPoint

class function TkwPopEditorParaMiddleCoordsToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaMiddleCoordsToScreen';
end;//TkwPopEditorParaMiddleCoordsToScreen.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaMiddleCoordsToScreen
 TkwPopEditorParaMiddleCoordsToScreen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.