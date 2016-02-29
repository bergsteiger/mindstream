unit tfwMembersIteratorPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwMembersIteratorPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwMembersIteratorPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryPrim,
  tfwIteratableParent
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwMembersIteratorPrim = {abstract} class(TtfwIteratableParent)
 private
 // private fields
   f_Dictionary : TtfwDictionaryPrim;
    {* Поле для свойства Dictionary}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aDictionary: TtfwDictionaryPrim); reintroduce;
 protected
 // protected properties
   property Dictionary: TtfwDictionaryPrim
     read f_Dictionary;
 end;//TtfwMembersIteratorPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwMembersIteratorPrim

constructor TtfwMembersIteratorPrim.Create(aDictionary: TtfwDictionaryPrim);
//#UC START# *52E29FCF00BC_55ED4AE00282_var*
//#UC END# *52E29FCF00BC_55ED4AE00282_var*
begin
//#UC START# *52E29FCF00BC_55ED4AE00282_impl*
 inherited Create;
 f_Dictionary := aDictionary;
 //aDictionary.SetRefTo(f_Dictionary);
//#UC END# *52E29FCF00BC_55ED4AE00282_impl*
end;//TtfwMembersIteratorPrim.Create

procedure TtfwMembersIteratorPrim.Cleanup;
//#UC START# *479731C50290_55ED4AE00282_var*
//#UC END# *479731C50290_55ED4AE00282_var*
begin
//#UC START# *479731C50290_55ED4AE00282_impl*
 //FreeAndNil(f_Dictionary);
 f_Dictionary := nil;
 inherited;
//#UC END# *479731C50290_55ED4AE00282_impl*
end;//TtfwMembersIteratorPrim.Cleanup

{$IfEnd} //not NoScripts

end.