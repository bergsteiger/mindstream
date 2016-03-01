unit tfwDictionaryDataIteratorPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryDataIteratorPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryDataIteratorPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwIteratableParent,
  tfwDictionaryEx
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDictionaryDataIteratorPrim = {abstract} class(TtfwIteratableParent)
 private
 // private fields
   f_Dictionary : TtfwDictionaryEx;
    {* Поле для свойства Dictionary}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aDictionary: TtfwDictionaryEx); reintroduce;
 protected
 // protected properties
   property Dictionary: TtfwDictionaryEx
     read f_Dictionary;
 end;//TtfwDictionaryDataIteratorPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwDictionaryDataIteratorPrim

constructor TtfwDictionaryDataIteratorPrim.Create(aDictionary: TtfwDictionaryEx);
//#UC START# *55AE5C1603DE_55AE5B950148_var*
//#UC END# *55AE5C1603DE_55AE5B950148_var*
begin
//#UC START# *55AE5C1603DE_55AE5B950148_impl*
 Assert(aDictionary <> nil);
 inherited Create;
 f_Dictionary := aDictionary;
 //aDictionary.SetRefTo(f_Dictionary);
//#UC END# *55AE5C1603DE_55AE5B950148_impl*
end;//TtfwDictionaryDataIteratorPrim.Create

procedure TtfwDictionaryDataIteratorPrim.Cleanup;
//#UC START# *479731C50290_55AE5B950148_var*
//#UC END# *479731C50290_55AE5B950148_var*
begin
//#UC START# *479731C50290_55AE5B950148_impl*
 //FreeAndNil(f_Dictionary);
 f_Dictionary := nil;
 inherited;
//#UC END# *479731C50290_55AE5B950148_impl*
end;//TtfwDictionaryDataIteratorPrim.Cleanup

{$IfEnd} //not NoScripts

end.