unit kwPopObjectSetOrdProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopObjectSetOrdProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::RTTI::pop_object_SetOrdProp
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
 TkwPopObjectSetOrdProp = class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectSetOrdProp
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

type _Instance_R_ = TkwPopObjectSetOrdProp;

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectSetOrdProp

procedure TkwPopObjectSetOrdProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F21340500DC_var*
var
 l_N : AnsiString;
 l_V : Integer;
//#UC END# *4F212BD5010E_4F21340500DC_var*
begin
//#UC START# *4F212BD5010E_4F21340500DC_impl*
 l_N := aCtx.rEngine.PopDelphiString;
 l_V := aCtx.rEngine.PopInt;
 SetOrdProp(anObject, l_N, l_V);
//#UC END# *4F212BD5010E_4F21340500DC_impl*
end;//TkwPopObjectSetOrdProp.DoObject

class function TkwPopObjectSetOrdProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:SetOrdProp';
end;//TkwPopObjectSetOrdProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
{$IfEnd} //not NoScripts

end.