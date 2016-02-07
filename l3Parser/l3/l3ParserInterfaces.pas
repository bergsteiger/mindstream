unit l3ParserInterfaces;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Variant
  ;

type
 Il3KeywordFinder = interface(IUnknown)
   ['{6B7313C8-EC12-43A4-9B0C-89C07EED8DA7}']
   function Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
   property KeywordByName[const aName: Il3CString]: Tl3PrimString
     read Get_KeywordByName;
 end;//Il3KeywordFinder

implementation

end.