unit kwImmedCompiledStereotypedStereotypedWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwImmedCompiledStereotypedStereotypedWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::TkwImmedCompiledStereotypedStereotypedWord
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
 TkwImmedCompiledStereotypedStereotypedWord = class(TkwCompiledStereotypedWord)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwImmedCompiledStereotypedStereotypedWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwImmedCompiledStereotypedStereotypedWordRunner,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwImmedCompiledStereotypedStereotypedWord

procedure TkwImmedCompiledStereotypedStereotypedWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F44474300BD_var*
var
 l_W : TkwImmedCompiledStereotypedStereotypedWordRunner;
//#UC END# *4DAEEDE10285_4F44474300BD_var*
begin
//#UC START# *4DAEEDE10285_4F44474300BD_impl*
 l_W := TkwImmedCompiledStereotypedStereotypedWordRunner.Create(Self);
 try
  l_W.Key := Self.Key;
  l_W.DoIt(aCtx);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDE10285_4F44474300BD_impl*
end;//TkwImmedCompiledStereotypedStereotypedWord.DoDoIt

function TkwImmedCompiledStereotypedStereotypedWord.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F44474300BD_var*
//#UC END# *4DB6D7F70155_4F44474300BD_var*
begin
//#UC START# *4DB6D7F70155_4F44474300BD_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F44474300BD_impl*
end;//TkwImmedCompiledStereotypedStereotypedWord.IsImmediate

{$IfEnd} //not NoScripts

end.