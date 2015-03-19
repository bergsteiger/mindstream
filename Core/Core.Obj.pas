unit Core.Obj;

interface

uses
 msObject
 ;

type
 TCoreObject = class
   protected
    procedure Cleanup; virtual;
   public
    destructor Destroy; override;
 end;//TCoreObject

 TCoreInterfacedObject = class(TInterfacedObject)
  protected
   procedure Cleanup; virtual;
  public
   destructor Destroy; override;
 end;//TCoreInterfacedObject

implementation

// TCoreObject

destructor TCoreObject.Destroy;
begin
  Cleanup;
  inherited;
end;

procedure TCoreObject.Cleanup;
begin
  // - тут ничего не делаем, потомки всё сделают
end;

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
