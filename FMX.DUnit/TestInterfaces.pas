unit TestInterfaces;

interface
type
 ImsEtalonsHolder = interface
 ['{1758A741-7AB3-404C-ADC0-FF6DDD815535}']
  procedure DeleteEtalonFile;
  function TestResultsFileName: String;
  function FileExtension: String;
 end;

implementation

end.
