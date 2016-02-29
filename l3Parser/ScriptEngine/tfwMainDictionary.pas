unit tfwMainDictionary;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwMainDictionary.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwMainDictionary
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryEx,
  l3Interfaces,
  tfwDictionary
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwMainDictionary = class(TtfwDictionaryEx)
 private
 // private fields
   f_CompiledCode : TtfwWord;
    {* Поле для свойства CompiledCode}
 protected
 // property methods
   procedure pm_SetCompiledCode(aValue: TtfwWord);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function FindInUsedDictionary(anOther: TtfwDictionary;
     const aName: Il3CString): TtfwKeyWord; override;
 public
 // overridden public methods
   function IsMain: Boolean; override;
 public
 // public properties
   property CompiledCode: TtfwWord
     read f_CompiledCode
     write pm_SetCompiledCode;
 end;//TtfwMainDictionary
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwMainDictionaryWordsPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwMainDictionary

procedure TtfwMainDictionary.pm_SetCompiledCode(aValue: TtfwWord);
//#UC START# *55A4E85101BA_55A0005D02CCset_var*
//#UC END# *55A4E85101BA_55A0005D02CCset_var*
begin
//#UC START# *55A4E85101BA_55A0005D02CCset_impl*
 aValue.SetRefTo(f_CompiledCode);
//#UC END# *55A4E85101BA_55A0005D02CCset_impl*
end;//TtfwMainDictionary.pm_SetCompiledCode

procedure TtfwMainDictionary.Cleanup;
//#UC START# *479731C50290_55A0005D02CC_var*
//#UC END# *479731C50290_55A0005D02CC_var*
begin
//#UC START# *479731C50290_55A0005D02CC_impl*
 CompiledCode := nil;
 inherited;
//#UC END# *479731C50290_55A0005D02CC_impl*
end;//TtfwMainDictionary.Cleanup

function TtfwMainDictionary.FindInUsedDictionary(anOther: TtfwDictionary;
  const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A3A1E7038F_55A0005D02CC_var*
//#UC END# *55A3A1E7038F_55A0005D02CC_var*
begin
//#UC START# *55A3A1E7038F_55A0005D02CC_impl*
(* if (anOther Is TtfwHLTCLikeDictionary) then
  Result := anOther.DRbyCName[aName]
 else*)
  Result := inherited FindInUsedDictionary(anOther, aName);
//#UC END# *55A3A1E7038F_55A0005D02CC_impl*
end;//TtfwMainDictionary.FindInUsedDictionary

function TtfwMainDictionary.IsMain: Boolean;
//#UC START# *55A531FA016A_55A0005D02CC_var*
//#UC END# *55A531FA016A_55A0005D02CC_var*
begin
//#UC START# *55A531FA016A_55A0005D02CC_impl*
 Result := true;
//#UC END# *55A531FA016A_55A0005D02CC_impl*
end;//TtfwMainDictionary.IsMain

{$IfEnd} //not NoScripts

end.