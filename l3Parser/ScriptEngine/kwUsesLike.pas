unit kwUsesLike;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwUsesLike.pas"
// Начат: 12.02.2012 19:02
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::TkwUsesLike
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwIncludeLike,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwUsesLike = {abstract} class(TtfwIncludeLike)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure UnknownWord(var aContext: TtfwContext;
     aWordNumber: Integer); override;
 end;//TkwUsesLike
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwStandardProcedureCloseBracket,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwUsesLike

function TkwUsesLike.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37D458015C_var*
//#UC END# *4DB6C99F026E_4F37D458015C_var*
begin
//#UC START# *4DB6C99F026E_4F37D458015C_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37D458015C_impl*
end;//TkwUsesLike.EndBracket

procedure TkwUsesLike.UnknownWord(var aContext: TtfwContext;
  aWordNumber: Integer);
//#UC START# *4DB6F2760023_4F37D458015C_var*
//#UC END# *4DB6F2760023_4F37D458015C_var*
begin
//#UC START# *4DB6F2760023_4F37D458015C_impl*
 DoIncluded(aContext, l3Str(aContext.rParser.TokenLongString));
//#UC END# *4DB6F2760023_4F37D458015C_impl*
end;//TkwUsesLike.UnknownWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwUsesLike
 TkwUsesLike.RegisterClass;
{$IfEnd} //not NoScripts

end.