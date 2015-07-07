unit kwTreeIterateNodes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeIterateNodes.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::tree_IterateNodes
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
 TkwTreeIterateNodes = {final} class(_kwTreeControlWord_)
 protected
 // realized methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTreeIterateNodes
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TreeIterateNodesUtils,
  l3Nodes,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTreeIterateNodes;

{$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}

// start class TkwTreeIterateNodes

procedure TkwTreeIterateNodes.DoTreeContol(const aTreeControl: TvtCustomOutliner;
  const aCtx: TtfwContext);
//#UC START# *4E01B8F1008E_53B28D5403C1_var*
var
 l_Obj: TObject;
//#UC END# *4E01B8F1008E_53B28D5403C1_var*
begin
//#UC START# *4E01B8F1008E_53B28D5403C1_impl*
 RunnerAssert(aCtx.rEngine.IsTopObj, 'В итератор не передано слово.', aCtx);
 l_Obj := aCtx.rEngine.PopObj;
 RunnerAssert(l_Obj is TtfwWord, 'В итератор не передано слово.', aCtx);

 g_TreeIterateNodesWord := l_Obj as TtfwWord;
 g_TreeIterateNodesContext := aCtx;
 try
  try
   aTreeControl.IterateF(l3L2NA(@TreeIterateNodesMethod), 0);
  except
   on EtfwBreakIterator do ;
  end;
 finally
  g_TreeIterateNodesWord := nil;
  Finalize(g_TreeIterateNodesContext);
 end;
//#UC END# *4E01B8F1008E_53B28D5403C1_impl*
end;//TkwTreeIterateNodes.DoTreeContol

class function TkwTreeIterateNodes.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:IterateNodes';
end;//TkwTreeIterateNodes.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwTreeControlWord.imp.pas}
{$IfEnd} //not NoScripts

end.