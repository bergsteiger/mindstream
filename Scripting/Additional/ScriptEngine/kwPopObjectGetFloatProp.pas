unit kwPopObjectGetFloatProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopObjectGetFloatProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::RTTI::pop_object_GetFloatProp
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
 TkwPopObjectGetFloatProp = {final} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetFloatProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopObjectGetFloatProp;

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetFloatProp

procedure TkwPopObjectGetFloatProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_51387690029A_var*
//#UC END# *4F212BD5010E_51387690029A_var*
begin
//#UC START# *4F212BD5010E_51387690029A_impl*
 aCtx.rEngine.PushInt(Trunc(GetFloatProp(anObject, aCtx.rEngine.PopDelphiString)));
//#UC END# *4F212BD5010E_51387690029A_impl*
end;//TkwPopObjectGetFloatProp.DoObject

class function TkwPopObjectGetFloatProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetFloatProp';
end;//TkwPopObjectGetFloatProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
{$IfEnd} //not NoScripts

end.