unit kwPopObjectClassName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwPopObjectClassName.pas"
// Начат: 26.02.2012 14:41
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::Object Info::pop_object_ClassName
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
 TkwPopObjectClassName = {scriptword} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectClassName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopObjectClassName

procedure TkwPopObjectClassName.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F212DBF027D_var*
//#UC END# *4F212BD5010E_4F212DBF027D_var*
begin
//#UC START# *4F212BD5010E_4F212DBF027D_impl*
 if (anObject = nil) then
  aCtx.rEngine.PushString('Запросили имя класса у nil')
 else
  aCtx.rEngine.PushString(anObject.ClassName);
//#UC END# *4F212BD5010E_4F212DBF027D_impl*
end;//TkwPopObjectClassName.DoObject

class function TkwPopObjectClassName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:ClassName';
end;//TkwPopObjectClassName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_ClassName
 TkwPopObjectClassName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.