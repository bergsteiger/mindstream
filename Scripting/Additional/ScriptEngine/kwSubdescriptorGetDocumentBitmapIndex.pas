unit kwSubdescriptorGetDocumentBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSubdescriptorGetDocumentBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::subdescriptor_GetDocumentBitmapIndex
//
// Помещает в стек индекс иконки для отображения метки документа.
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetDocumentBitmapIndex
// {code}
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
  evSubPn,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}
 TkwSubdescriptorGetDocumentBitmapIndex = {final} class(_kwSubDescriptorFromStackWord_)
  {* Помещает в стек индекс иконки для отображения метки документа.
Формат:
[code]
aSubDescrObj subdescriptor:GetDocumentBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetDocumentBitmapIndex
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSubdescriptorGetDocumentBitmapIndex;

{$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.