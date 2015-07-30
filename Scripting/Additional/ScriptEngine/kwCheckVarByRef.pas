unit kwCheckVarByRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCheckVarByRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::CheckVarByRef
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCheckVarPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCheckVarByRef = {final scriptword} class(TkwCheckVarPrim)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCheckVarByRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCheckVarByRef

class function TkwCheckVarByRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '->^';
end;//TkwCheckVarByRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CheckVarByRef
 TkwCheckVarByRef.RegisterInEngine;
{$IfEnd} //not NoScripts

end.