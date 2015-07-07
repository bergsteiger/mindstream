unit kwNodeCaption;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeCaption.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::NodeWords::node_Caption
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
 TkwNodeCaption = {final} class(_kwInterfacedNodeWord_)
 protected
 // realized methods
   procedure DoNode(const aNode: Il3Node;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeCaption
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

type _Instance_R_ = TkwNodeCaption;

{$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}

// start class TkwNodeCaption

procedure TkwNodeCaption.DoNode(const aNode: Il3Node;
  const aCtx: TtfwContext);
//#UC START# *53B52FD0015A_53B5304700BF_var*
//#UC END# *53B52FD0015A_53B5304700BF_var*
begin
//#UC START# *53B52FD0015A_53B5304700BF_impl*
 aCtx.rEngine.PushString(aNode.Text);
//#UC END# *53B52FD0015A_53B5304700BF_impl*
end;//TkwNodeCaption.DoNode

class function TkwNodeCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'node:Caption';
end;//TkwNodeCaption.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}
{$IfEnd} //not NoScripts

end.