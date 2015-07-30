unit kwComponentFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwComponentFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::VCL bindings::TkwComponentFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Classes,
  tfwScriptingInterfaces,
  kwObjectFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _SystemWord_Parent_ = TkwObjectFromStackWord;
 {$Include ..\ScriptEngine\SystemWord.imp.pas}
 TkwComponentFromStackWord = {abstract} class(_SystemWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwComponentFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  Controls,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\SystemWord.imp.pas}

// start class TkwComponentFromStackWord

procedure TkwComponentFromStackWord.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F2148300318_var*
//#UC END# *4F212BD5010E_4F2148300318_var*
begin
//#UC START# *4F212BD5010E_4F2148300318_impl*
 DoComponent(anObject As TComponent, aCtx);
//#UC END# *4F212BD5010E_4F2148300318_impl*
end;//TkwComponentFromStackWord.DoObject

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwComponentFromStackWord
 TkwComponentFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.