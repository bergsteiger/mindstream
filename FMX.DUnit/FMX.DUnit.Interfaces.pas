unit FMX.DUnit.Interfaces;

interface

type
 ImsLog = interface
 end;//ImsLog

 ImsEtalonsHolder = interface
 ['{1758A741-7AB3-404C-ADC0-FF6DDD815535}']
  procedure DeleteEtalonFile;
  function RunDiff: Boolean;
 end;//ImsEtalonsHolder

implementation

end.
