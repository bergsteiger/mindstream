unit kwTreeGetItem;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetItem.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_GetItem
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
 TkwTreeGetItem = {final} class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetItem
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

type _Instance_R_ = TkwTreeGetItem;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeGetItem

procedure TkwTreeGetItem.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_506C41C402C8_var*
//#UC END# *4E01B8F1008E_506C41C402C8_var*
begin
//#UC START# *4E01B8F1008E_506C41C402C8_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не передан номер элемента', aCtx);
 aCtx.rEngine.PushIntf(aTreeControl.TreeStruct.Nodes[aCtx.rEngine.PopInt]);
//#UC END# *4E01B8F1008E_506C41C402C8_impl*
end;//TkwTreeGetItem.DoTreeContol

class function TkwTreeGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem';
end;//TkwTreeGetItem.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.