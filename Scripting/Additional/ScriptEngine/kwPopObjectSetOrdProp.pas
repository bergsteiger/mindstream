unit kwPopObjectSetOrdProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectSetOrdProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_SetOrdProp
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwObjectFromStackWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
 TkwPopObjectSetOrdProp = {scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectSetOrdProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация pop_object_SetOrdProp
 TkwPopObjectSetOrdProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.