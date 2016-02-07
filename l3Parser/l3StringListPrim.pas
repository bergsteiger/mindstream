unit l3StringListPrim;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Base,
  l3CustomString,
  l3ProtoPersistentDataContainer,
  l3Variant,
  l3Types,
  l3Memory,
  l3Core,
  l3Except,
  Classes
  ;

 {$Undef l3Items_NeedsBeforeFreeItem}

 {$Define l3Items_NoOwner}

 {$Define l3Items_HasCustomSort}

type
 _l3StringList_Parent_ = Tl3ProtoPersistentDataContainer;
 {$Include l3StringList.imp.pas}
 _l3Storable_Parent_ = _l3StringList_;
 {$Include l3Storable.imp.pas}
 Tl3StringListPrim = class(_l3Storable_)
 protected
 // realized methods
   procedure SaveToStream(aStream: TStream); override; // can raise El3Exception
     {* Сохраняет в поток. }
   procedure LoadFromStream(aStream: TStream;
    aNeedSort: Boolean); override; // can raise El3Exception
     {* Загружает из потока. }
 protected
 // overridden protected methods
   procedure AssignTo(Dest: TPersistent); override;
 public
 // overridden public methods
   {$If not defined(l3Items_IsProto)}
   procedure Assign(Source: TPersistent); override;
   {$IfEnd} //not l3Items_IsProto
 protected
 // protected methods
   function WStrToItem(const aStr: Tl3WString): Tl3CustomString; virtual;
   function StringItemClass: Rl3String; virtual;
 public
 // public methods
   function Add(const Item: Tl3WString): Integer; overload; 
   function Add(anItem: Tl3PrimString): Integer; overload; 
   function IndexOf(anItem: Tl3PrimString): Integer; overload; 
 end;//Tl3StringListPrim

implementation

uses
  l3Filer,
  l3Chars,
  l3String,
  l3_String,
  l3MinMax,
  RTLConsts,
  SysUtils,
  l3Stream,
  l3IID,
  l3InterfacesMisc
  ;

type _Instance_R_ = Tl3StringListPrim;

{$Include l3StringList.imp.pas}

{$Include l3Storable.imp.pas}

// start class Tl3StringListPrim

function Tl3StringListPrim.Add(const Item: Tl3WString): Integer;
//#UC START# *47B1E3CD0239_47B1DFC40250_var*
var
 l_S : Tl3CustomString;
//#UC END# *47B1E3CD0239_47B1DFC40250_var*
begin
//#UC START# *47B1E3CD0239_47B1DFC40250_impl*
 l_S := WStrToItem(Item);
 try
  Result := Add(l_S);
 finally
  l3Free(l_S);
 end;{try..finally}
//#UC END# *47B1E3CD0239_47B1DFC40250_impl*
end;//Tl3StringListPrim.Add

function Tl3StringListPrim.WStrToItem(const aStr: Tl3WString): Tl3CustomString;
//#UC START# *47B1E47E035C_47B1DFC40250_var*
//#UC END# *47B1E47E035C_47B1DFC40250_var*
begin
//#UC START# *47B1E47E035C_47B1DFC40250_impl*
 Result := StringItemClass.Make(aStr);
//#UC END# *47B1E47E035C_47B1DFC40250_impl*
end;//Tl3StringListPrim.WStrToItem

function Tl3StringListPrim.StringItemClass: Rl3String;
//#UC START# *47B1E5230151_47B1DFC40250_var*
//#UC END# *47B1E5230151_47B1DFC40250_var*
begin
//#UC START# *47B1E5230151_47B1DFC40250_impl*
 Result := Tl3_String;
//#UC END# *47B1E5230151_47B1DFC40250_impl*
end;//Tl3StringListPrim.StringItemClass

function Tl3StringListPrim.Add(anItem: Tl3PrimString): Integer;
//#UC START# *47B1E6BF0073_47B1DFC40250_var*
//#UC END# *47B1E6BF0073_47B1DFC40250_var*
begin
//#UC START# *47B1E6BF0073_47B1DFC40250_impl*
 Result := DoAdd(anItem);
//#UC END# *47B1E6BF0073_47B1DFC40250_impl*
end;//Tl3StringListPrim.Add

function Tl3StringListPrim.IndexOf(anItem: Tl3PrimString): Integer;
//#UC START# *47B1E7D900FE_47B1DFC40250_var*
//#UC END# *47B1E7D900FE_47B1DFC40250_var*
begin
//#UC START# *47B1E7D900FE_47B1DFC40250_impl*
 Result := inherited IndexOf(anItem);
//#UC END# *47B1E7D900FE_47B1DFC40250_impl*
end;//Tl3StringListPrim.IndexOf

procedure Tl3StringListPrim.SaveToStream(aStream: TStream); // can raise El3Exception
//#UC START# *47B17EEC020C_47B1DFC40250_var*
  
 function _WriteWord(aWord: PItemType; anIndex: Long): Bool;
 begin
  Result := true;
  if not aWord^.Empty then
   with aWord^.AsWStr do
    aStream.Write(S^, SLen);
  aStream.Write(cc_EOL, cc_EOL_Len);
 end;

//#UC END# *47B17EEC020C_47B1DFC40250_var*
begin
//#UC START# *47B17EEC020C_47B1DFC40250_impl*
 IterateAllF(l3L2IA(@_WriteWord));
//#UC END# *47B17EEC020C_47B1DFC40250_impl*
end;//Tl3StringListPrim.SaveToStream

procedure Tl3StringListPrim.LoadFromStream(aStream: TStream;
  aNeedSort: Boolean); // can raise El3Exception
//#UC START# *47B19BBB00BA_47B1DFC40250_var*
var
 l_Filer : Tl3CustomFiler;
//#UC END# *47B19BBB00BA_47B1DFC40250_var*
begin
//#UC START# *47B19BBB00BA_47B1DFC40250_impl*
 l_Filer := Tl3CustomFiler.Create;
 try
  Changing;
  try
   with l_Filer do begin
    Stream := aStream;
    while not EOF do
     Add(l3RTrim(ReadLn));
   end;//with l_Filer
  finally
   Changed;
  end;//try..finally
 finally
  l3Free(l_Filer);
 end;//try..finally
//#UC END# *47B19BBB00BA_47B1DFC40250_impl*
end;//Tl3StringListPrim.LoadFromStream

procedure Tl3StringListPrim.AssignTo(Dest: TPersistent);
//#UC START# *478CF372010B_47B1DFC40250_var*

 function AssignString(pObj: PObject; Index: Long): Bool;
 begin//AssignString
  Result := true;
  if (pObj^ Is Tl3CustomString) then
   TStrings(Dest).Add(Tl3CustomString(pObj^).AsString);
 end;//AssignString

//#UC END# *478CF372010B_47B1DFC40250_var*
begin
//#UC START# *478CF372010B_47B1DFC40250_impl*
 if (Dest Is TStrings) then
 begin
  TStrings(Dest).Clear;
  if (Dest Is TStringList) then
  begin
   TStringList(Dest).Sorted := Sorted;
   Case Duplicates of
    l3_dupIgnore,
    l3_dupAssign,
    l3_dupChange:
     TStringList(Dest).Duplicates := dupIgnore;
    l3_dupAccept:
     TStringList(Dest).Duplicates := dupAccept;
    l3_dupError:
     TStringList(Dest).Duplicates := dupError;
   end;//Case Duplicates
  end;//Dest Is TStringList
  IterateAllF(l3L2IA(@AssignString));
 end//Dest Is TStrings
 else
  inherited;
//#UC END# *478CF372010B_47B1DFC40250_impl*
end;//Tl3StringListPrim.AssignTo

{$If not defined(l3Items_IsProto)}
procedure Tl3StringListPrim.Assign(Source: TPersistent);
//#UC START# *47B09CD5029B_47B1DFC40250_var*
var
 i : Long;
//#UC END# *47B09CD5029B_47B1DFC40250_var*
begin
//#UC START# *47B09CD5029B_47B1DFC40250_impl*
 if (Source Is TStrings) then
 begin
  Clear;
  if (Source Is TStringList) then
  begin
   Sorted := TStringList(Source).Sorted;
   Case TStringList(Source).Duplicates of
    dupIgnore :
     Duplicates := l3_dupIgnore;
    dupAccept :
     Duplicates := l3_dupAccept;
    dupError :
     Duplicates := l3_dupError;
   end;//Case TStringList(P).Duplicates
  end;//P Is TStringList
  for i := 0 to Pred(TStrings(Source).Count) do
   Add(l3PCharLen(TStrings(Source)[i]));
 end//P Is TStrings
 else
  inherited;
//#UC END# *47B09CD5029B_47B1DFC40250_impl*
end;//Tl3StringListPrim.Assign
{$IfEnd} //not l3Items_IsProto

end.