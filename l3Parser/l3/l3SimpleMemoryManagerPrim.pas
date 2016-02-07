unit l3SimpleMemoryManagerPrim;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  Refcounted,
  SyncObjs
  ;

type
 _l3CriticalSectionHolderPrim_Parent_ = TRefcounted;
 {$Include ..\L3\l3CriticalSectionHolderPrim.imp.pas}
 Tl3SimpleMemoryManagerPrim = {abstract} class(_l3CriticalSectionHolderPrim_)
 protected
 // overridden protected methods
   procedure Release; override;
 public
 // public methods
   constructor Create; reintroduce;
 end;//Tl3SimpleMemoryManagerPrim

implementation

uses
  SysUtils
  ;

{$Include ..\L3\l3CriticalSectionHolderPrim.imp.pas}

// start class Tl3SimpleMemoryManagerPrim

constructor Tl3SimpleMemoryManagerPrim.Create;
//#UC START# *54B68024012F_54B67EB9023D_var*
//#UC END# *54B68024012F_54B67EB9023D_var*
begin
//#UC START# *54B68024012F_54B67EB9023D_impl*
 CreateCS;
 inherited Create;
//#UC END# *54B68024012F_54B67EB9023D_impl*
end;//Tl3SimpleMemoryManagerPrim.Create

procedure Tl3SimpleMemoryManagerPrim.Release;
//#UC START# *479F2AFB0397_54B67EB9023D_var*
//#UC END# *479F2AFB0397_54B67EB9023D_var*
begin
//#UC START# *479F2AFB0397_54B67EB9023D_impl*
 inherited;
 FreeCS;
//#UC END# *479F2AFB0397_54B67EB9023D_impl*
end;//Tl3SimpleMemoryManagerPrim.Release

end.