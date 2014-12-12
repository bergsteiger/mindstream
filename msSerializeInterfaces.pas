unit msSerializeInterfaces;

interface

type
 ImsObjectWrap = interface
  function toObject: TObject;
  function ClassType: TClass;
  procedure SerializeTo(const aFileName: String);
  procedure DeSerializeFrom(const aFileName: String);
 end;//ImsObjectWrap

implementation

end.
