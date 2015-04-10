unit kwFindMember;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFindMember.pas"
// Начат: 15.02.2012 21:25
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::MembersWorkingPack::FindMember
//
// Ищет слово внутри того, которое лежит на стеке
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
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwFindMember = {final} class(_tfwWordWorker_)
  {* Ищет слово внутри того, которое лежит на стеке }
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFindMember
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledFindMember,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFindMember;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwFindMember

function TkwFindMember.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F3BEA4F0240_var*
//#UC END# *4DCBD67C0362_4F3BEA4F0240_var*
begin
//#UC START# *4DCBD67C0362_4F3BEA4F0240_impl*
 Result := TkwCompiledFindMember;
//#UC END# *4DCBD67C0362_4F3BEA4F0240_impl*
end;//TkwFindMember.CompiledWorkerClass

class function TkwFindMember.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '%%';
end;//TkwFindMember.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.