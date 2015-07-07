unit kwTreeGetCurrentNode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeGetCurrentNode.pas"
// Начат: 21.12.2011 21:33
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeGetCurrentNode
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
 TkwTreeGetCurrentNode = {final} class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeGetCurrentNode
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

type _Instance_R_ = TkwTreeGetCurrentNode;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeGetCurrentNode

procedure TkwTreeGetCurrentNode.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_4EF2186D0058_var*
//#UC END# *4E01B8F1008E_4EF2186D0058_var*
begin
//#UC START# *4E01B8F1008E_4EF2186D0058_impl*
 aCtx.rEngine.PushIntf(aTreeControl.GetCurrentNode);
//#UC END# *4E01B8F1008E_4EF2186D0058_impl*
end;//TkwTreeGetCurrentNode.DoTreeContol

class function TkwTreeGetCurrentNode.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CurrentNode';
end;//TkwTreeGetCurrentNode.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.