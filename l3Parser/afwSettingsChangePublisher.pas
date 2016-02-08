unit afwSettingsChangePublisher;
 
{$Include afwDefine.inc}

interface

uses
  afwSettingsChangePublisherPrim
  ;

type
 TafwSettingsChangePublisher = class(TafwSettingsChangePublisherPrim)
 public
 // public methods
   class function Exists: Boolean;
 public
 // singleton factory method
   class function Instance: TafwSettingsChangePublisher;
    {- возвращает экземпляр синглетона. }
 end;//TafwSettingsChangePublisher

implementation

uses
  l3Base {a}
  ;


// start class TafwSettingsChangePublisher

var g_TafwSettingsChangePublisher : TafwSettingsChangePublisher = nil;

procedure TafwSettingsChangePublisherFree;
begin
 l3Free(g_TafwSettingsChangePublisher);
end;

class function TafwSettingsChangePublisher.Instance: TafwSettingsChangePublisher;
begin
 if (g_TafwSettingsChangePublisher = nil) then
 begin
  l3System.AddExitProc(TafwSettingsChangePublisherFree);
  g_TafwSettingsChangePublisher := Create;
 end;
 Result := g_TafwSettingsChangePublisher;
end;


class function TafwSettingsChangePublisher.Exists: Boolean;
//#UC START# *5242FE6200D6_5242FE0C02ED_var*
//#UC END# *5242FE6200D6_5242FE0C02ED_var*
begin
//#UC START# *5242FE6200D6_5242FE0C02ED_impl*
 Result := (g_TafwSettingsChangePublisher <> nil);
//#UC END# *5242FE6200D6_5242FE0C02ED_impl*
end;//TafwSettingsChangePublisher.Exists

end.