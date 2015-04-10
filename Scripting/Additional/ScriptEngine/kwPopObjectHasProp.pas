unit kwPopObjectHasProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopObjectHasProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::RTTI::pop_object_HasProp
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
 TkwPopObjectHasProp = {final} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectHasProp
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

type _Instance_R_ = TkwPopObjectHasProp;

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectHasProp

procedure TkwPopObjectHasProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_51B99E050377_var*
//#UC END# *4F212BD5010E_51B99E050377_var*
begin
//#UC START# *4F212BD5010E_51B99E050377_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано название свойства!', aCtx);
 aCtx.rEngine.PushBool(IsPublishedProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_51B99E050377_impl*
end;//TkwPopObjectHasProp.DoObject

class function TkwPopObjectHasProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:HasProp';
end;//TkwPopObjectHasProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
{$IfEnd} //not NoScripts

end.