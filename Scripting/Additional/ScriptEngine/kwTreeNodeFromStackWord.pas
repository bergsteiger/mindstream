unit kwTreeNodeFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwTreeNodeFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::TreeViewWords::TkwTreeNodeFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  ComCtrls,
  tfwScriptingInterfaces,
  kwObjectFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwTreeNodeFromStackWord = {abstract} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwTreeNodeFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwTreeNodeFromStackWord

procedure TkwTreeNodeFromStackWord.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_512F49B603E6_var*
//#UC END# *4F212BD5010E_512F49B603E6_var*
begin
//#UC START# *4F212BD5010E_512F49B603E6_impl*
 DoWithTTreeNode(anObject as TTreeNode, aCtx);
//#UC END# *4F212BD5010E_512F49B603E6_impl*
end;//TkwTreeNodeFromStackWord.DoObject

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwTreeNodeFromStackWord
 TkwTreeNodeFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.