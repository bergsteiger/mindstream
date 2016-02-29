unit tfwCodeIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwCodeIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwCodeIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordsIterator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCodeIterator = class(TtfwWordsIterator)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 end;//TtfwCodeIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwCodeIterator

procedure TtfwCodeIterator.Cleanup;
//#UC START# *479731C50290_52E7D66E02FF_var*
//#UC END# *479731C50290_52E7D66E02FF_var*
begin
//#UC START# *479731C50290_52E7D66E02FF_impl*
 //FreeAndNil(f_Code);
 //f_Code := nil;
 inherited;
//#UC END# *479731C50290_52E7D66E02FF_impl*
end;//TtfwCodeIterator.Cleanup

{$IfEnd} //not NoScripts

end.