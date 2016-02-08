unit l3ProtoPersistentWithHandle;

{$Include l3Define.inc}

interface

uses
  l3Types,
  l3ProtoPersistent
  ;

type
 Tl3ProtoPersistentWithHandle = class(Tl3ProtoPersistent)
 protected
 // property methods
   function pm_GetHandle: Tl3Handle; virtual; abstract;
   procedure pm_SetHandle(aValue: Tl3Handle); virtual; abstract;
 public
 // public methods
   function CompareWith(anOther: Tl3ProtoPersistentWithHandle): Integer; virtual; abstract;
 public
 // public properties
   property Handle: Tl3Handle
     read pm_GetHandle
     write pm_SetHandle;
 end;//Tl3ProtoPersistentWithHandle

implementation

end.