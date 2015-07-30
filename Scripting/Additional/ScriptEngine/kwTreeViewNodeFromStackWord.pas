unit kwTreeViewNodeFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwTreeViewNodeFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::TreeViewWords::TkwTreeViewNodeFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  ComCtrls,
  tfwScriptingInterfaces,
  Controls,
  kwComponentFromStackWord,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 TkwTreeViewNodeFromStackWord = {abstract} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithTreeView(const aTreeView: TTreeView;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwTreeViewNodeFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class TkwTreeViewNodeFromStackWord

procedure TkwTreeViewNodeFromStackWord.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_512F4794030D_var*
//#UC END# *4F212C3A015A_512F4794030D_var*
begin
//#UC START# *4F212C3A015A_512F4794030D_impl*
 DoWithTreeView(aControl as TTreeView, aCtx);
//#UC END# *4F212C3A015A_512F4794030D_impl*
end;//TkwTreeViewNodeFromStackWord.DoControl

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwTreeViewNodeFromStackWord
 TkwTreeViewNodeFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.