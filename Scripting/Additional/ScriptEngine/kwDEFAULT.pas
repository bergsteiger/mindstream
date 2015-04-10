unit kwDEFAULT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDEFAULT.pas"
// Начат: 29.04.2011 21:23
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeBranchingWords::DEFAULT
//
// Внутреннее слово для определения ветки по умолчанию в скомпилированном Case. Не предназначено
// для прямого вызова.
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwDEFAULT = class(_tfwAutoregisteringWord_)
  {* Внутреннее слово для определения ветки по умолчанию в скомпилированном Case. Не предназначено для прямого вызова. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
   function IsDefaultBranch: Boolean; override;
 end;//TkwDEFAULT
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDEFAULT;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDEFAULT

procedure TkwDEFAULT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBAF3D60039_var*
//#UC END# *4DAEEDE10285_4DBAF3D60039_var*
begin
//#UC START# *4DAEEDE10285_4DBAF3D60039_impl*
 RunnerAssert(false, 'Слово DEFAULT не должно вызываться', aCtx);
//#UC END# *4DAEEDE10285_4DBAF3D60039_impl*
end;//TkwDEFAULT.DoDoIt

class function TkwDEFAULT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DEFAULT';
end;//TkwDEFAULT.GetWordNameForRegister

function TkwDEFAULT.IsDefaultBranch: Boolean;
//#UC START# *4DBAF4630154_4DBAF3D60039_var*
//#UC END# *4DBAF4630154_4DBAF3D60039_var*
begin
//#UC START# *4DBAF4630154_4DBAF3D60039_impl*
 Result := true;
//#UC END# *4DBAF4630154_4DBAF3D60039_impl*
end;//TkwDEFAULT.IsDefaultBranch

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.