unit kwSubDescriptorFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubDescriptorFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::TkwSubDescriptorFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwObjectFromStackWord,
  evSubPn
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSubDescriptorFromStackWord = {abstract} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwSubDescriptorFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubDescriptorFromStackWord

procedure TkwSubDescriptorFromStackWord.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_52D65E6902A8_var*
//#UC END# *4F212BD5010E_52D65E6902A8_var*
begin
//#UC START# *4F212BD5010E_52D65E6902A8_impl*
 DoWithSubDescriptor(anObject as TevSubDescriptor, aCtx);
//#UC END# *4F212BD5010E_52D65E6902A8_impl*
end;//TkwSubDescriptorFromStackWord.DoObject

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSubDescriptorFromStackWord
 TkwSubDescriptorFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.