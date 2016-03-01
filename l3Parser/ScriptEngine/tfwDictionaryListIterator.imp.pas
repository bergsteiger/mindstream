{$IfNDef tfwDictionaryListIterator_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryListIterator.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwDictionaryListIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDictionaryListIterator_imp}
{$If not defined(NoScripts)}
 _tfwDictionaryListIteratorPrim_Parent_ = TtfwIteratableParent;
 {$Include ..\ScriptEngine\tfwDictionaryListIteratorPrim.imp.pas}
 _tfwDictionaryListIterator_ = {abstract mixin} class(_tfwDictionaryListIteratorPrim_)
 private
 // private fields
   f_ListToIterate : _ListType_;
 protected
 // realized methods
   function ListToIterate: _ListType_; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(const aListToIterate: _ListType_); reintroduce;
   class function Make(const aListToIterate: _ListType_): ItfwValueList; reintroduce;
     {* Сигнатура фабрики tfwDictionaryListIterator.Make }
 end;//_tfwDictionaryListIterator_
{$Else}

 _tfwDictionaryListIteratorPrim_Parent_ = TtfwIteratableParent;
 {$Include ..\ScriptEngine\tfwDictionaryListIteratorPrim.imp.pas}
 _tfwDictionaryListIterator_ = _tfwDictionaryListIteratorPrim_;

{$IfEnd} //not NoScripts

{$Else tfwDictionaryListIterator_imp}

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwDictionaryListIteratorPrim.imp.pas}

// start class _tfwDictionaryListIterator_

constructor _tfwDictionaryListIterator_.Create(const aListToIterate: _ListType_);
//#UC START# *55E9ABC00239_55E9AB2C03C3_var*
//#UC END# *55E9ABC00239_55E9AB2C03C3_var*
begin
//#UC START# *55E9ABC00239_55E9AB2C03C3_impl*
 inherited Create;
 f_ListToIterate := aListToIterate;
 //aListToIterate.SetRefTo(f_ListToIterate);
//#UC END# *55E9ABC00239_55E9AB2C03C3_impl*
end;//_tfwDictionaryListIterator_.Create

class function _tfwDictionaryListIterator_.Make(const aListToIterate: _ListType_): ItfwValueList;
var
 l_Inst : _tfwDictionaryListIterator_;
begin
 l_Inst := Create(aListToIterate);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function _tfwDictionaryListIterator_.ListToIterate: _ListType_;
//#UC START# *55AE64E00011_55E9AB2C03C3_var*
//#UC END# *55AE64E00011_55E9AB2C03C3_var*
begin
//#UC START# *55AE64E00011_55E9AB2C03C3_impl*
 Result := f_ListToIterate;
//#UC END# *55AE64E00011_55E9AB2C03C3_impl*
end;//_tfwDictionaryListIterator_.ListToIterate

procedure _tfwDictionaryListIterator_.Cleanup;
//#UC START# *479731C50290_55E9AB2C03C3_var*
//#UC END# *479731C50290_55E9AB2C03C3_var*
begin
//#UC START# *479731C50290_55E9AB2C03C3_impl*
 //FreeAndNil(f_ListToIterate);
 f_ListToIterate := nil;
 inherited;
//#UC END# *479731C50290_55E9AB2C03C3_impl*
end;//_tfwDictionaryListIterator_.Cleanup

{$IfEnd} //not NoScripts

{$EndIf tfwDictionaryListIterator_imp}
