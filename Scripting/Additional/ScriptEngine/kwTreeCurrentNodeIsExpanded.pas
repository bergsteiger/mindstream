unit kwTreeCurrentNodeIsExpanded;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeCurrentNodeIsExpanded.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::TreeCurrentNodeIsExpanded
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
 TkwTreeCurrentNodeIsExpanded = class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeCurrentNodeIsExpanded
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

type _Instance_R_ = TkwTreeCurrentNodeIsExpanded;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeCurrentNodeIsExpanded

procedure TkwTreeCurrentNodeIsExpanded.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_4F27FDB4016E_var*
//#UC END# *4E01B8F1008E_4F27FDB4016E_var*
begin
//#UC START# *4E01B8F1008E_4F27FDB4016E_impl*
 aCtx.rEngine.PushBool(aTreeControl.TreeStruct.IsExpanded(aTreeControl.GetCurrentNode));
//#UC END# *4E01B8F1008E_4F27FDB4016E_impl*
end;//TkwTreeCurrentNodeIsExpanded.DoTreeContol

class function TkwTreeCurrentNodeIsExpanded.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CurrentNode:IsExpanded';
end;//TkwTreeCurrentNodeIsExpanded.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.