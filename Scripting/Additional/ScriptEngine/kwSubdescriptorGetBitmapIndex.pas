unit kwSubdescriptorGetBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubdescriptorGetBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::subdescriptor_GetBitmapIndex
//
// Помещает в стек иконки для отображения обычной метки
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetBitmapIndex
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
 TkwSubdescriptorGetBitmapIndex = {final scriptword} class(TkwSubDescriptorFromStackWord)
  {* Помещает в стек иконки для отображения обычной метки
Формат:
[code]
aSubDescrObj subdescriptor:GetBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetBitmapIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubdescriptorGetBitmapIndex

procedure TkwSubdescriptorGetBitmapIndex.DoWithSubDescriptor(aControl: TevSubDescriptor;
  const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D6601F031E_var*
//#UC END# *52D65E9502E1_52D6601F031E_var*
begin
//#UC START# *52D65E9502E1_52D6601F031E_impl*
 aCtx.rEngine.PushInt(aControl.BitmapIndex);
//#UC END# *52D65E9502E1_52D6601F031E_impl*
end;//TkwSubdescriptorGetBitmapIndex.DoWithSubDescriptor

class function TkwSubdescriptorGetBitmapIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'subdescriptor:GetBitmapIndex';
end;//TkwSubdescriptorGetBitmapIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация subdescriptor_GetBitmapIndex
 TkwSubdescriptorGetBitmapIndex.RegisterInEngine;
{$IfEnd} //not NoScripts

end.