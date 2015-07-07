unit kwTreeDeleteAllChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeDeleteAllChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_DeleteAllChildren
//
// aControl tree:DeleteAllChildren
// Удаляет все дочерние у текущего выбранного узла в дереве контрола aContol
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
 TkwTreeDeleteAllChildren = {final} class(_kwTreeControlWord_)
  {* aControl tree:DeleteAllChildren
Удаляет все дочерние у текущего выбранного узла в дереве контрола aContol }
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeDeleteAllChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3TreeInterfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeDeleteAllChildren;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeDeleteAllChildren

procedure TkwTreeDeleteAllChildren.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_51F7796C010E_var*
var
 l_Node   : Il3SimpleNode;
 l_Current: Il3SimpleNode;
//#UC END# *4E01B8F1008E_51F7796C010E_var*
begin
//#UC START# *4E01B8F1008E_51F7796C010E_impl*
 l_Current := aTreeControl.CurrentCNode;
 while l_Current.HasChild do
 begin
  l_Node := l_Current.Child;
  l_Node.Delete;
 end; // while l_Current.HasChld do
//#UC END# *4E01B8F1008E_51F7796C010E_impl*
end;//TkwTreeDeleteAllChildren.DoTreeContol

class function TkwTreeDeleteAllChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:DeleteAllChildren';
end;//TkwTreeDeleteAllChildren.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.