unit kwTreeGetItemsCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetItemsCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_GetItemsCount
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
  vtOutliner,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
 TkwTreeGetItemsCount = {final} class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetItemsCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeGetItemsCount;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeGetItemsCount

procedure TkwTreeGetItemsCount.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_506C41A30359_var*
//#UC END# *4E01B8F1008E_506C41A30359_var*
begin
//#UC START# *4E01B8F1008E_506C41A30359_impl*
 aCtx.rEngine.PushInt(aTreeControl.TreeStruct.CountView);
//#UC END# *4E01B8F1008E_506C41A30359_impl*
end;//TkwTreeGetItemsCount.DoTreeContol

class function TkwTreeGetItemsCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItemsCount';
end;//TkwTreeGetItemsCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.