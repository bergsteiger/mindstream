unit kwNodeIndexInTree;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeIndexInTree.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::NodeWords::node_IndexInTree
//
// Порядковый номер ноды в дереве
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
 TkwNodeIndexInTree = {final} class(_kwInterfacedNodeWord_)
  {* Порядковый номер ноды в дереве }
 protected
 // realized methods
   procedure DoNode(const aNode: Il3Node;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNodeIndexInTree
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

type _Instance_R_ = TkwNodeIndexInTree;

{$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}

// start class TkwNodeIndexInTree

procedure TkwNodeIndexInTree.DoNode(const aNode: Il3Node;
  const aCtx: TtfwContext);
//#UC START# *53B52FD0015A_53B5322C0162_var*
var
 l_Index: Integer;
 l_P: Il3Node;
//#UC END# *53B52FD0015A_53B5322C0162_var*
begin
//#UC START# *53B52FD0015A_53B5322C0162_impl*
 l_Index := aNode.GetNumInParent;
 l_P := aNode.ParentNode;
 try
  while Assigned(l_P) do
  begin
   l_Index := l_Index + l_P.GetNumInParent;
   l_P := l_P.ParentNode;
  end;
 finally
  l_P := nil;
 end;
 aCtx.rEngine.PushInt(l_Index);
//#UC END# *53B52FD0015A_53B5322C0162_impl*
end;//TkwNodeIndexInTree.DoNode

class function TkwNodeIndexInTree.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'node:IndexInTree';
end;//TkwNodeIndexInTree.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwInterfacedNodeWord.imp.pas}
{$IfEnd} //not NoScripts

end.