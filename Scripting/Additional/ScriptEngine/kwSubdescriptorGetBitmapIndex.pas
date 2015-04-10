unit kwSubdescriptorGetBitmapIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSubdescriptorGetBitmapIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::subdescriptor_GetBitmapIndex
//
// Помещает в стек иконки для отображения обычной метки
// Формат:
// {code}
// aSubDescrObj subdescriptor:GetBitmapIndex
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
 TkwSubdescriptorGetBitmapIndex = {final} class(_kwSubDescriptorFromStackWord_)
  {* Помещает в стек иконки для отображения обычной метки
Формат:
[code]
aSubDescrObj subdescriptor:GetBitmapIndex
[code] }
 protected
 // realized methods
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetBitmapIndex
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

type _Instance_R_ = TkwSubdescriptorGetBitmapIndex;

{$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwSubDescriptorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.