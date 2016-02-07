unit l3MultipartTextNode;

// Простая нода с многокусочным текстом (для использования в многоколоночном дереве)

{ $Id: l3MultipartTextNode.pas,v 1.2 2006/03/27 13:20:13 lulin Exp $}

// $Log: l3MultipartTextNode.pas,v $
// Revision 1.2  2006/03/27 13:20:13  lulin
// - cleanup.
//
// Revision 1.1  2005/06/10 13:33:26  fireton
// - новый объект - Tl3MultipartTextNode
//

interface
uses l3Base, l3InternalInterfaces, l3Nodes, l3Types;

type
 Tl3MultipartTextNode = class(Tl3UsualNode, Il3MultipartText)
 private
  f_StringList: Tl3StringList;
 protected
  function GetTextPart(aIndex: Integer): Tl3PCharLen;
 public
  constructor Create(anOwner: TObject = nil);
  procedure Cleanup; override;
  property StringList: Tl3StringList read f_StringList;
 end;

implementation

uses l3String;

constructor Tl3MultipartTextNode.Create(anOwner: TObject = nil);
begin
 inherited;
 f_StringList := Tl3StringList.Create;
end;

procedure Tl3MultipartTextNode.Cleanup;
begin
 l3Free(f_StringList);
 inherited;
end;

function Tl3MultipartTextNode.GetTextPart(aIndex: Integer): Tl3PCharLen;
begin
 if (aIndex < 0) or (aIndex > f_StringList.Count-1) then
  Result := l3PCharLen('')
 else
  Result := f_StringList.Items[aIndex].AsPCharLen;
end;

end.
