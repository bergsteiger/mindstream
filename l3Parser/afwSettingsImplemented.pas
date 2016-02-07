unit afwSettingsImplemented;
 
{$Include ..\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  afwSettings
  ;

type
 TafwSettingsImplemented = class(TafwSettings)
 public
 // public methods
   constructor Create; reintroduce;
   class function Make: IafwSettings; reintroduce;
     {* Сигнатура фабрики TafwSettingsImplemented.Make }
 end;//TafwSettingsImplemented

implementation

uses
  afwSettingsImplSing
  ;

// start class TafwSettingsImplemented

constructor TafwSettingsImplemented.Create;
//#UC START# *4F6C8EF600AE_4F6C6F250398_var*
//#UC END# *4F6C8EF600AE_4F6C6F250398_var*
begin
//#UC START# *4F6C8EF600AE_4F6C6F250398_impl*
 inherited Create(TafwSettingsImplSing.Instance);
//#UC END# *4F6C8EF600AE_4F6C6F250398_impl*
end;//TafwSettingsImplemented.Create

class function TafwSettingsImplemented.Make: IafwSettings;
var
 l_Inst : TafwSettingsImplemented;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

end.