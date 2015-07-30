unit kwSubdescriptorGetBlockBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubdescriptorGetBlockBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::subdescriptor_GetBlockBitmapIndex
//
// Помещает в стек индекс иконки для отображения метки блока
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetBlockBitmapIndex
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
 TkwSubdescriptorGetBlockBitmapIndex = {final scriptword} class(TkwSubDescriptorFromStackWord)
  {* Помещает в стек индекс иконки для отображения метки блока
Формат:
[code]
aSubDescrObj subdescriptor:GetBlockBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetBlockBitmapIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubdescriptorGetBlockBitmapIndex

procedure TkwSubdescriptorGetBlockBitmapIndex.DoWithSubDescriptor(aControl: TevSubDescriptor;
  const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D660670205_var*
//#UC END# *52D65E9502E1_52D660670205_var*
begin
//#UC START# *52D65E9502E1_52D660670205_impl*
 aCtx.rEngine.PushInt(aControl.BlockBitmapIndex);
//#UC END# *52D65E9502E1_52D660670205_impl*
end;//TkwSubdescriptorGetBlockBitmapIndex.DoWithSubDescriptor

class function TkwSubdescriptorGetBlockBitmapIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'subdescriptor:GetBlockBitmapIndex';
end;//TkwSubdescriptorGetBlockBitmapIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация subdescriptor_GetBlockBitmapIndex
 TkwSubdescriptorGetBlockBitmapIndex.RegisterInEngine;
{$IfEnd} //not NoScripts

end.