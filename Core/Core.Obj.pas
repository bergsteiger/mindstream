unit Core.Obj;

interface

uses
 msObject
 ;

type
 TCoreObject = class(TmsObject)
 end;//TCoreObject

 TCoreInterfacedObject = class(TInterfacedObject)
  protected
   procedure Cleanup; virtual;
  public
   destructor Destroy; override;
 end;//TCoreInterfacedObject

implementation

// TCoreInterfacedObject

destructor TCoreInterfacedObject.Destroy;
begin
  Cleanup;
  inherited;
end;

procedure TCoreInterfacedObject.Cleanup;
begin
  // - тут ничего не делаем, потомки всё сделают
end;

end.
