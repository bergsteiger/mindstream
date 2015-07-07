unit kwSubdescriptorGetBlockBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSubdescriptorGetBlockBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::subdescriptor_GetBlockBitmapIndex
//
// Помещает в стек индекс иконки для отображения метки блока
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetBlockBitmapIndex
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
 TkwSubdescriptorGetBlockBitmapIndex = {final} class(_kwSubDescriptorFromStackWord_)
  {* Помещает в стек индекс иконки для отображения метки блока
Формат:
[code]
aSubDescrObj subdescriptor:GetBlockBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetBlockBitmapIndex
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

type _Instance_R_ = TkwSubdescriptorGetBlockBitmapIndex;

{$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.