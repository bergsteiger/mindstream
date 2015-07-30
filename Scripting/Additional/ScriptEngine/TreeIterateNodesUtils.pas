unit TreeIterateNodesUtils;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "TreeIterateNodesUtils.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi::ScriptEngine$VT::vtOutlinerWords::TreeIterateNodesUtils
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Tree_TLB,
  tfwScriptingInterfaces
  ;

var g_TreeIterateNodesWord : TtfwWord;

var g_TreeIterateNodesContext : TtfwContext;
function TreeIterateNodesMethod(const Intf: Il3Node): Boolean;
   {* Подитеративная функция для перебора элементов дерева. Если возвращает true, то процесс перебора узлов прекращается. }
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
// unit methods

function TreeIterateNodesMethod(const Intf: Il3Node): Boolean;
//#UC START# *53B28EDC0349_53B29F4701DE_var*
//#UC END# *53B28EDC0349_53B29F4701DE_var*
begin
//#UC START# *53B28EDC0349_53B29F4701DE_impl*
 g_TreeIterateNodesContext.rEngine.PushIntf(Intf);
 g_TreeIterateNodesWord.DoIt(g_TreeIterateNodesContext);
//#UC END# *53B28EDC0349_53B29F4701DE_impl*
end;//TreeIterateNodesMethod
{$IfEnd} //not NoScripts

end.