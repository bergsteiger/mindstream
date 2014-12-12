unit msSerializeInterfaces;

interface

type
 ImsObjectWrap = interface
  function toObject: TObject;
  function ClassType: TClass;
  function EQ(const anOther: ImsObjectWrap): Boolean;
 end;//ImsObjectWrap

 ImsPersistent = interface(ImsObjectWrap)
  procedure SaveTo(const aFileName: String);
  procedure LoadFrom(const aFileName: String);
 end;//ImsPersistent

implementation

end.
