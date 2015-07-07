unit kwNodeIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::NodeWords::node_Index
//
// Порядковый номер ноды в родительской
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
  l3Tree_TLB,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}
 TkwNodeIndex = {final} class(_kwInterfacedNodeWord_)
  {* Порядковый номер ноды в родительской }
 protected
 // realized methods
   procedure DoNode(const aNode: Il3Node;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNodeIndex;

{$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}

// start class TkwNodeIndex

procedure TkwNodeIndex.DoNode(const aNode: Il3Node;
  const aCtx: TtfwContext);
//#UC START# *53B52FD0015A_53B5309D0321_var*
//#UC END# *53B52FD0015A_53B5309D0321_var*
begin
//#UC START# *53B52FD0015A_53B5309D0321_impl*
 aCtx.rEngine.PushInt(aNode.GetNumInParent);
//#UC END# *53B52FD0015A_53B5309D0321_impl*
end;//TkwNodeIndex.DoNode

class function TkwNodeIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'node:Index';
end;//TkwNodeIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}
{$IfEnd} //not NoScripts

end.