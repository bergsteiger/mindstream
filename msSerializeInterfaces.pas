unit msSerializeInterfaces;

interface

type
 ImsObjectWrap = interface
  function toObject: TObject;
  function ClassType: TClass;
  procedure SaveTo(const aFileName: String);
  procedure LoadFrom(const aFileName: String);
 end;//ImsObjectWrap

implementation

end.
