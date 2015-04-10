unit kwImmedCompiledStereotypedWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwImmedCompiledStereotypedWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::TkwImmedCompiledStereotypedWord
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
  kwCompiledStereotypedWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwImmedCompiledStereotypedWord = class(TkwCompiledStereotypedWord)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwImmedCompiledStereotypedWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwImmedCompiledStereotypedWordRunner,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwImmedCompiledStereotypedWord

procedure TkwImmedCompiledStereotypedWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4434B603CC_var*
var
 l_W : TkwImmedCompiledStereotypedWordRunner;
//#UC END# *4DAEEDE10285_4F4434B603CC_var*
begin
//#UC START# *4DAEEDE10285_4F4434B603CC_impl*
 l_W := TkwImmedCompiledStereotypedWordRunner.Create(Self);
 try
  l_W.Key := Self.Key;
  l_W.DoIt(aCtx);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDE10285_4F4434B603CC_impl*
end;//TkwImmedCompiledStereotypedWord.DoDoIt

function TkwImmedCompiledStereotypedWord.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F4434B603CC_var*
//#UC END# *4DB6D7F70155_4F4434B603CC_var*
begin
//#UC START# *4DB6D7F70155_4F4434B603CC_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F4434B603CC_impl*
end;//TkwImmedCompiledStereotypedWord.IsImmediate

{$IfEnd} //not NoScripts

end.