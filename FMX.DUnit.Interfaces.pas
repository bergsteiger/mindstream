unit FMX.DUnit.Interfaces;

interface

type
 ImsLog = interface
 end;//ImsLog

 ImsEtalonsHolder = interface
 ['{1758A741-7AB3-404C-ADC0-FF6DDD815535}']
  procedure DeleteEtalonFile(const aLog: ImsLog);
  function RunDiff(const aLog: ImsLog): Boolean;
  function pm_GetIsUseDiffer : Boolean;
  procedure pm_SetIsUseDiffer(const aValue : Boolean);
  property IsUseDiffer: Boolean
   read pm_GetIsUseDiffer
   write pm_SetIsUseDiffer;
 end;//ImsEtalonsHolder

implementation

end.
