unit kwPopEditorParaMiddleCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaMiddleCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MoveMouseByPara::pop_editor_ParaMiddleCoordsToScreen
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
  nevControl,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord,
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}
 TkwPopEditorParaMiddleCoordsToScreen = {final} class(_ParaCoordsToScreen_)
 protected
 // overridden protected methods
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaMiddleCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorParaMiddleCoordsToScreen;

{$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}

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
 {$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}
{$IfEnd} //not NoScripts

end.