unit l3SimpleObject;
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObjectWithCOMQI
  ;

type
 Tl3SimpleObject = class(Tl3ProtoObjectWithCOMQI)
 public
 // public methods
   constructor Create; reintroduce; virtual;
 end;//Tl3SimpleObject

implementation

// start class Tl3SimpleObject

constructor Tl3SimpleObject.Create;
//#UC START# *4DD3B7AB0108_47BC391D0259_var*
//#UC END# *4DD3B7AB0108_47BC391D0259_var*
begin
//#UC START# *4DD3B7AB0108_47BC391D0259_impl*
 inherited Create;
//#UC END# *4DD3B7AB0108_47BC391D0259_impl*
end;//Tl3SimpleObject.Create

end.