unit kwSubdescriptorGetDocumentBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwSubdescriptorGetDocumentBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SubPanelWords::subdescriptor_GetDocumentBitmapIndex
//
// Помещает в стек индекс иконки для отображения метки документа.
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetDocumentBitmapIndex
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
 TkwSubdescriptorGetDocumentBitmapIndex = {final scriptword} class(TkwSubDescriptorFromStackWord)
  {* Помещает в стек индекс иконки для отображения метки документа.
Формат:
[code]
aSubDescrObj subdescriptor:GetDocumentBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetDocumentBitmapIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSubdescriptorGetDocumentBitmapIndex

procedure TkwSubdescriptorGetDocumentBitmapIndex.DoWithSubDescriptor(aControl: TevSubDescriptor;
  const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D660C703AC_var*
//#UC END# *52D65E9502E1_52D660C703AC_var*
begin
//#UC START# *52D65E9502E1_52D660C703AC_impl*
 aCtx.rEngine.PushInt(aControl.DocumentBitmapIndex);
//#UC END# *52D65E9502E1_52D660C703AC_impl*
end;//TkwSubdescriptorGetDocumentBitmapIndex.DoWithSubDescriptor

class function TkwSubdescriptorGetDocumentBitmapIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'subdescriptor:GetDocumentBitmapIndex';
end;//TkwSubdescriptorGetDocumentBitmapIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация subdescriptor_GetDocumentBitmapIndex
 TkwSubdescriptorGetDocumentBitmapIndex.RegisterInEngine;
{$IfEnd} //not NoScripts

end.