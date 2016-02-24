unit afwSettingsImplSing;
 
{$Include afwDefine.inc}

interface

uses
  afwSettingsImplPersistent
  ;

type
 TafwSettingsImplSing = class(TafwSettingsImplPersistent)
 protected
 // overridden protected methods
   procedure InitFields; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwSettingsImplSing;
    {- возвращает экземпляр синглетона. }
 end;//TafwSettingsImplSing

implementation

uses
  l3Base {a}
  ;


// start class TafwSettingsImplSing

var g_TafwSettingsImplSing : TafwSettingsImplSing = nil;

procedure TafwSettingsImplSingFree;
begin
 l3Free(g_TafwSettingsImplSing);
end;

class function TafwSettingsImplSing.Instance: TafwSettingsImplSing;
begin
 if (g_TafwSettingsImplSing = nil) then
 begin
  l3System.AddExitProc(TafwSettingsImplSingFree);
  g_TafwSettingsImplSing := Create;
 end;
 Result := g_TafwSettingsImplSing;
end;


class function TafwSettingsImplSing.Exists: Boolean;
 {-}
begin
 Result := g_TafwSettingsImplSing <> nil;
end;//TafwSettingsImplSing.Exists

procedure TafwSettingsImplSing.InitFields;
//#UC START# *47A042E100E2_4F6C7DC2022A_var*
//#UC END# *47A042E100E2_4F6C7DC2022A_var*
begin
//#UC START# *47A042E100E2_4F6C7DC2022A_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4F6C7DC2022A_impl*
end;//TafwSettingsImplSing.InitFields

end.