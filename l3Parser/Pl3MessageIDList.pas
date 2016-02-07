unit Pl3MessageIDList;
 
{$Include l3Define.inc}

interface

uses
  Pl3MessageIDListPrim
  ;

type
 TPl3MessageIDList = class(TPl3MessageIDListPrim)
 private
 // private methods
   procedure CleanupItems;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure Release; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TPl3MessageIDList;
    {- возвращает экземпляр синглетона. }
 end;//TPl3MessageIDList

implementation

uses
  l3Base {a}
  ;


// start class TPl3MessageIDList

var g_TPl3MessageIDList : TPl3MessageIDList = nil;

procedure TPl3MessageIDListFree;
begin
 l3Free(g_TPl3MessageIDList);
end;

class function TPl3MessageIDList.Instance: TPl3MessageIDList;
begin
 if (g_TPl3MessageIDList = nil) then
 begin
  l3System.AddExitProc(TPl3MessageIDListFree);
  g_TPl3MessageIDList := Create;
 end;
 Result := g_TPl3MessageIDList;
end;


procedure TPl3MessageIDList.CleanupItems;
//#UC START# *4F9BCF5401F8_4F9BCB620208_var*
var
 l_Index : Integer;
//#UC END# *4F9BCF5401F8_4F9BCB620208_var*
begin
//#UC START# *4F9BCF5401F8_4F9BCB620208_impl*
 for l_Index := 0 to Pred(Count) do
  Items[l_Index]^.Cleanup;
//#UC END# *4F9BCF5401F8_4F9BCB620208_impl*
end;//TPl3MessageIDList.CleanupItems

class function TPl3MessageIDList.Exists: Boolean;
 {-}
begin
 Result := g_TPl3MessageIDList <> nil;
end;//TPl3MessageIDList.Exists

procedure TPl3MessageIDList.Cleanup;
//#UC START# *479731C50290_4F9BCB620208_var*
//#UC END# *479731C50290_4F9BCB620208_var*
begin
//#UC START# *479731C50290_4F9BCB620208_impl*
 CleanupItems;
 inherited;
//#UC END# *479731C50290_4F9BCB620208_impl*
end;//TPl3MessageIDList.Cleanup

procedure TPl3MessageIDList.Release;
//#UC START# *479F2AFB0397_4F9BCB620208_var*
//#UC END# *479F2AFB0397_4F9BCB620208_var*
begin
//#UC START# *479F2AFB0397_4F9BCB620208_impl*
 CleanupItems;
 inherited;
//#UC END# *479F2AFB0397_4F9BCB620208_impl*
end;//TPl3MessageIDList.Release

end.