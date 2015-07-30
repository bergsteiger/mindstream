unit kwSubdescriptorGetVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubdescriptorGetVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::subdescriptor_GetVisible
//
// Помещает в стек видмость метки.
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetVisible
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwSubDescriptorFromStackWord,
  tfwScriptingInterfaces,
  evSubPn
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSubdescriptorGetVisible = {final scriptword} class(TkwSubDescriptorFromStackWord)
  {* Помещает в стек видмость метки.
Формат:
[code]
aSubDescrObj subdescriptor:GetVisible
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetVisible
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubdescriptorGetVisible

procedure TkwSubdescriptorGetVisible.DoWithSubDescriptor(aControl: TevSubDescriptor;
  const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D661D4008D_var*
//#UC END# *52D65E9502E1_52D661D4008D_var*
begin
//#UC START# *52D65E9502E1_52D661D4008D_impl*
 aCtx.rEngine.PushBool(aControl.Visible);
//#UC END# *52D65E9502E1_52D661D4008D_impl*
end;//TkwSubdescriptorGetVisible.DoWithSubDescriptor

class function TkwSubdescriptorGetVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'subdescriptor:GetVisible';
end;//TkwSubdescriptorGetVisible.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация subdescriptor_GetVisible
 TkwSubdescriptorGetVisible.RegisterInEngine;
{$IfEnd} //not NoScripts

end.