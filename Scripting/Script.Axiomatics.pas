unit Script.Axiomatics;

interface

uses
 Script.Dictionary
 ;

type
 TscriptAxiomatics = class(TscriptDictionary)
  strict private
   class var f_Instance : TscriptAxiomatics;
  public
   class function Instance: TscriptAxiomatics;
   class destructor Destroy;
 end;//TscriptAxiomatics

implementation

uses
 System.SysUtils
 ;

class destructor TscriptAxiomatics.Destroy;
begin
  FreeAndNil(f_Instance);
  inherited;
end;

class function TscriptAxiomatics.Instance: TscriptAxiomatics;
begin
 if (f_Instance = nil) then
  f_Instance := TscriptAxiomatics.Create;
 Result := f_Instance;
end;

end.
