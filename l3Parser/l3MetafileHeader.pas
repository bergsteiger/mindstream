unit l3MetafileHeader;
 
{$Include l3Define.inc}

interface

uses
  Windows
  ;

type
 Tl3MetafileHeader = packed record
   Key : LongInt;
   Handle : SmallInt;
   Box : TSmallRect;
   Inch : Word;
   Reserved : LongInt;
   CheckSum : Word;
 end;//Tl3MetafileHeader

 Pl3MetafileHeader = ^Tl3MetafileHeader;

const
  { WMF Constants }
 c_WMFKey = Integer($9AC6CDD7);
function L3IsValidMetafileHeader(const aWMFHeader: Tl3MetafileHeader): Boolean;
function L3ComputeAldusChecksum(var theWMF: Tl3MetafileHeader): Word;

implementation

// unit methods

function L3IsValidMetafileHeader(const aWMFHeader: Tl3MetafileHeader): Boolean;
//#UC START# *55262EC601CF_552616EE02DF_var*
var
 l_WH : Tl3MetafileHeader;
//#UC END# *55262EC601CF_552616EE02DF_var*
begin
//#UC START# *55262EC601CF_552616EE02DF_impl*
 l_WH := aWMFHeader;
 Result := (aWMFHeader.Key = c_WMFKEY) and (l3ComputeAldusChecksum(l_WH) = aWMFHeader.CheckSum);
//#UC END# *55262EC601CF_552616EE02DF_impl*
end;//L3IsValidMetafileHeader

function L3ComputeAldusChecksum(var theWMF: Tl3MetafileHeader): Word;
//#UC START# *55262F470207_552616EE02DF_var*
type
 PWord = ^Word;
var
 pW: PWord;
 pEnd: PWord;
//#UC END# *55262F470207_552616EE02DF_var*
begin
//#UC START# *55262F470207_552616EE02DF_impl*
 Result := 0;
 pW := @theWMF;
 pEnd := @theWMF.CheckSum;
 while Longint(pW) < Longint(pEnd) do
 begin
  Result := Result xor pW^;
  Inc(Longint(pW), SizeOf(Word));
 end;
//#UC END# *55262F470207_552616EE02DF_impl*
end;//L3ComputeAldusChecksum

end.