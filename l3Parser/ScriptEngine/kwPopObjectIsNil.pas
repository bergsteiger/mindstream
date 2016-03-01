unit kwPopObjectIsNil;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwPopObjectIsNil.pas"
// Начат: 26.01.2012 14:37
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::Object Info::pop_object_IsNil
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
 TkwPopObjectIsNil = {scriptword} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectIsNil
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopObjectIsNil

procedure TkwPopObjectIsNil.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F212CC00391_var*
//#UC END# *4F212BD5010E_4F212CC00391_var*
begin
//#UC START# *4F212BD5010E_4F212CC00391_impl*
 aCtx.rEngine.PushBool(anObject = nil);
//#UC END# *4F212BD5010E_4F212CC00391_impl*
end;//TkwPopObjectIsNil.DoObject

class function TkwPopObjectIsNil.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:IsNil';
end;//TkwPopObjectIsNil.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_IsNil
 TkwPopObjectIsNil.RegisterInEngine;
{$IfEnd} //not NoScripts

end.