unit kwSubdescriptorGetColumn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubdescriptorGetColumn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::subdescriptor_GetColumn
//
// Помещает в стек номер колонки.
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetColumn
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
 TkwSubdescriptorGetColumn = {final scriptword} class(TkwSubDescriptorFromStackWord)
  {* Помещает в стек номер колонки.
Формат:
[code]
aSubDescrObj subdescriptor:GetColumn
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetColumn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubdescriptorGetColumn

procedure TkwSubdescriptorGetColumn.DoWithSubDescriptor(aControl: TevSubDescriptor;
  const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D6622F0148_var*
//#UC END# *52D65E9502E1_52D6622F0148_var*
begin
//#UC START# *52D65E9502E1_52D6622F0148_impl*
 aCtx.rEngine.PushInt(aControl.Column);
//#UC END# *52D65E9502E1_52D6622F0148_impl*
end;//TkwSubdescriptorGetColumn.DoWithSubDescriptor

class function TkwSubdescriptorGetColumn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'subdescriptor:GetColumn';
end;//TkwSubdescriptorGetColumn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация subdescriptor_GetColumn
 TkwSubdescriptorGetColumn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.