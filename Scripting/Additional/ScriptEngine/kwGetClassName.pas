unit kwGetClassName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetClassName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::GetClassName
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
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
 TkwGetClassName = {final} class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetClassName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGetClassName;

{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class TkwGetClassName

procedure TkwGetClassName.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_510AA12B0193_var*
var
 l_Buffer: array[Byte] of Char;
//#UC END# *510AA0900333_510AA12B0193_var*
begin
//#UC START# *510AA0900333_510AA12B0193_impl*
 GetClassName(aHandle, l_Buffer, SizeOf(l_Buffer));
 aCtx.rEngine.PushString(l_Buffer);
//#UC END# *510AA0900333_510AA12B0193_impl*
end;//TkwGetClassName.DoWithHandle

class function TkwGetClassName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:GetClassName';
end;//TkwGetClassName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

end.