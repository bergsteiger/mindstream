unit KeyboardInputPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "KeyboardInputPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::KeyBoardInput::KeyboardInputPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  tfwAxiomaticsResNameGetter
  ;

{$IfEnd} //not NoScripts AND not NoVCL

implementation

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  kwKey,
  kwHardKey,
  kwKeyDown,
  kwKeyUp,
  tfwScriptingTypes
  ;

type
//#UC START# *83D838C45464ci*
//#UC END# *83D838C45464ci*
 TKeyboardInputPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *83D838C45464publ*
//#UC END# *83D838C45464publ*
 end;//TKeyboardInputPackResNameGetter

// start class TKeyboardInputPackResNameGetter

class function TKeyboardInputPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'KeyboardInputPack';
end;//TKeyboardInputPackResNameGetter.ResName

 {$R KeyboardInputPack.res}
{$IfEnd} //not NoScripts AND not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация скриптованой аксиоматики
 TKeyboardInputPackResNameGetter.Register;
{$IfEnd} //not NoScripts AND not NoVCL

end.