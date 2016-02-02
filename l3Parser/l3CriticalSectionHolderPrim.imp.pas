{$IfNDef l3CriticalSectionHolderPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Модуль: "w:/common/components/rtl/Garant/L3/l3CriticalSectionHolderPrim.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::MemoryManagers::l3CriticalSectionHolderPrim
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3CriticalSectionHolderPrim_imp}
 _l3CriticalSectionHolderPrim_ = {mixin} class(_l3CriticalSectionHolderPrim_Parent_)
 private
 // private fields
   f_LockCount : Integer;
   f_CS : TCriticalSection;
 private
 // private methods
   procedure CreateCS;
   procedure FreeCS;
 public
 // public methods
   procedure Lock;
   procedure Unlock;
 end;//_l3CriticalSectionHolderPrim_

{$Else l3CriticalSectionHolderPrim_imp}

// start class _l3CriticalSectionHolderPrim_

procedure _l3CriticalSectionHolderPrim_.CreateCS;
//#UC START# *54B6860D01ED_54B6852C0241_var*
//#UC END# *54B6860D01ED_54B6852C0241_var*
begin
//#UC START# *54B6860D01ED_54B6852C0241_impl*
 f_LockCount := 0;
 Assert(f_CS = nil);
 f_CS := TCriticalSection.Create;
//#UC END# *54B6860D01ED_54B6852C0241_impl*
end;//_l3CriticalSectionHolderPrim_.CreateCS

procedure _l3CriticalSectionHolderPrim_.FreeCS;
//#UC START# *54B686270035_54B6852C0241_var*
//#UC END# *54B686270035_54B6852C0241_var*
begin
//#UC START# *54B686270035_54B6852C0241_impl*
 Assert(f_LockCount = 0, 'Похоже, что непарные вызовы критической секции');
 FreeAndNil(f_CS);
//#UC END# *54B686270035_54B6852C0241_impl*
end;//_l3CriticalSectionHolderPrim_.FreeCS

procedure _l3CriticalSectionHolderPrim_.Lock;
//#UC START# *53A039050219_54B6852C0241_var*
//#UC END# *53A039050219_54B6852C0241_var*
begin
//#UC START# *53A039050219_54B6852C0241_impl*
 Assert(f_CS <> nil);
 f_CS.Enter;
 Inc(f_LockCount);
//#UC END# *53A039050219_54B6852C0241_impl*
end;//_l3CriticalSectionHolderPrim_.Lock

procedure _l3CriticalSectionHolderPrim_.Unlock;
//#UC START# *53A039150130_54B6852C0241_var*
//#UC END# *53A039150130_54B6852C0241_var*
begin
//#UC START# *53A039150130_54B6852C0241_impl*
 Assert(f_CS <> nil);
 Dec(f_LockCount);
 f_CS.Leave;
//#UC END# *53A039150130_54B6852C0241_impl*
end;//_l3CriticalSectionHolderPrim_.Unlock

{$EndIf l3CriticalSectionHolderPrim_imp}
