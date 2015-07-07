unit kwPopEditorParaCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Костицын М.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaCoordsToScreen.pas"
// Начат: 16.12.2011
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MoveMouseByPara::pop_editor_ParaCoordsToScreen
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
 TkwPopEditorParaCoordsToScreen = {final} class(_ParaCoordsToScreen_)
 protected
 // overridden protected methods
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaCoordsToScreen
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

type _Instance_R_ = TkwPopEditorParaCoordsToScreen;

{$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}

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
 {$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}
{$IfEnd} //not NoScripts

end.