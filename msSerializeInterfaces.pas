unit msSerializeInterfaces;

interface

type
 ImsSerializable = interface
 ['{11C7EA88-2267-4B6B-A5E0-2A3D1B135131}']
  procedure Assign(const anOther : ImsSerializable);
  function HackInstance: TObject;
 end;//ImsSerializable

implementation

end.
