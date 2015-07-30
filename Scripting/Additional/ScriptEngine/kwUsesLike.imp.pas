{$IfNDef kwUsesLike_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwUsesLike.imp.pas"
// Начат: 12.02.2012 19:02
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::kwUsesLike
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwUsesLike_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwIncludeLike.imp.pas}
 _kwUsesLike_ = {abstract mixin} class(_tfwIncludeLike_)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure UnknownWord(var aContext: TtfwContext); override;
 end;//_kwUsesLike_
{$Else}

 {$Include ..\ScriptEngine\tfwIncludeLike.imp.pas}
 _kwUsesLike_ = _tfwIncludeLike_;

{$IfEnd} //not NoScripts

{$Else kwUsesLike_imp}

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwIncludeLike.imp.pas}

// start class _kwUsesLike_

function _kwUsesLike_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37D458015C_var*
//#UC END# *4DB6C99F026E_4F37D458015C_var*
begin
//#UC START# *4DB6C99F026E_4F37D458015C_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37D458015C_impl*
end;//_kwUsesLike_.EndBracket

procedure _kwUsesLike_.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4F37D458015C_var*
//#UC END# *4DB6F2760023_4F37D458015C_var*
begin
//#UC START# *4DB6F2760023_4F37D458015C_impl*
 DoIncluded(aContext, l3Str(aContext.rParser.TokenLongString));
//#UC END# *4DB6F2760023_4F37D458015C_impl*
end;//_kwUsesLike_.UnknownWord

{$IfEnd} //not NoScripts

{$EndIf kwUsesLike_imp}
