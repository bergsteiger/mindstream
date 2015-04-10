unit kwPopObjectRTTIInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopObjectRTTIInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::RTTI::pop_object_RTTIInfo
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
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
 TkwPopObjectRTTIInfo = {final} class(_kwObjectFromStackWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectRTTIInfo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3RTTI,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopObjectRTTIInfo;

{$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}

// start class TkwPopObjectRTTIInfo

procedure TkwPopObjectRTTIInfo.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_5012CB7D0204_var*
//#UC END# *4F212BD5010E_5012CB7D0204_var*
begin
//#UC START# *4F212BD5010E_5012CB7D0204_impl*
 aCtx.rEngine.PushString(L3FormatRTTIInfo(anObject));
//#UC END# *4F212BD5010E_5012CB7D0204_impl*
end;//TkwPopObjectRTTIInfo.DoObject

class function TkwPopObjectRTTIInfo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:RTTIInfo';
end;//TkwPopObjectRTTIInfo.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.