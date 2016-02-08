unit l3ProtoObjectWithHandle;

{$Include l3Define.inc}

interface

uses
  l3Types,
  l3ProtoObject
  ;

type
 Tl3ProtoObjectWithHandle = class(Tl3ProtoObject)
 protected
 // property methods
   function pm_GetHandle: Tl3Handle; virtual; abstract;
   procedure pm_SetHandle(aValue: Tl3Handle); virtual; abstract;
 public
 // public methods
   function CompareWith(anOther: Tl3ProtoObjectWithHandle): Integer; virtual; abstract;
 public
 // public properties
   property Handle: Tl3Handle
     read pm_GetHandle
     write pm_SetHandle;
 end;//Tl3ProtoObjectWithHandle

implementation

end.