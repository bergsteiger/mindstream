unit msSerializeInterfaces;

interface

type
 ImsObjectWrap = interface
 ['{7DA972A2-E4F6-49A2-AF6C-5C005367FBB5}']
  function HackInstance: TObject;
 end;//ImsObjectWrap

 ImsSerializable = interface(ImsObjectWrap)
 ['{11C7EA88-2267-4B6B-A5E0-2A3D1B135131}']
  procedure Assign(const anOther : ImsSerializable);
 end;//ImsSerializable

implementation

end.
