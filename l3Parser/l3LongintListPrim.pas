unit l3LongintListPrim;
 
{$Include l3Define.inc}

interface

uses
  Classes,
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except
  ;

type
//#UC START# *4773DC930147ci*
 {$Define l3Items_NoChanging}
//#UC END# *4773DC930147ci*
 _ItemType_ = Integer;
 _l3AtomicList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3AtomicList.imp.pas}
 _l3Storable_Parent_ = _l3AtomicList_;
 {$Include l3Storable.imp.pas}
 Tl3LongintListPrim = class(_l3Storable_)
  {* Список целых чисел. }
 protected
 // realized methods
   procedure SaveToStream(aStream: TStream); override; // can raise El3Exception
     {* Сохраняет в поток. }
   procedure LoadFromStream(aStream: TStream;
    aNeedSort: Boolean); override; // can raise El3Exception
     {* Загружает из потока. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   procedure Load(aStream: TStream);
   procedure Save(aStream: TStream);
   function Delete(anIndex: Integer): Integer;
     {* удалить элемент с индексом Index. }
//#UC START# *4773DC930147publ*
//#UC END# *4773DC930147publ*
 end;//Tl3LongintListPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils,
  l3Stream
  ;

type _Instance_R_ = Tl3LongintListPrim;

{$Include ..\L3\l3AtomicList.imp.pas}

{$Include ..\L3\l3Storable.imp.pas}

// start class Tl3LongintListPrim

procedure Tl3LongintListPrim.Load(aStream: TStream);
//#UC START# *47AAC5B30149_4773DC930147_var*
var
 l_Size : Longint;
 l_Count : Long;
//#UC END# *47AAC5B30149_4773DC930147_var*
begin
//#UC START# *47AAC5B30149_4773DC930147_impl*
 with aStream do
 begin
  aStream.Read(l_Count, SizeOf(l_Count));
  Count := l_Count;
  if Count > 0 then
  begin
   l_Size := Count*SizeOf(Longint);
   Read(ItemSlot(0)^, l_Size);
   if Sorted then Sort;
  end; // Count > 0
 end;//with aStream
//#UC END# *47AAC5B30149_4773DC930147_impl*
end;//Tl3LongintListPrim.Load

procedure Tl3LongintListPrim.Save(aStream: TStream);
//#UC START# *47AAC5BE01E3_4773DC930147_var*
var
 l_Count: Long;
//#UC END# *47AAC5BE01E3_4773DC930147_var*
begin
//#UC START# *47AAC5BE01E3_4773DC930147_impl*
 l_Count := Count;
 aStream.Write(l_Count, SizeOf(l_Count));
 SaveToStream(aStream);
//#UC END# *47AAC5BE01E3_4773DC930147_impl*
end;//Tl3LongintListPrim.Save

function Tl3LongintListPrim.Delete(anIndex: Integer): Integer;
//#UC START# *47AAC7E50323_4773DC930147_var*
var
 l_P : PItemType;
//#UC END# *47AAC7E50323_4773DC930147_var*
begin
//#UC START# *47AAC7E50323_4773DC930147_impl*
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf  l3Items_NoChanging}
  CheckIndex(anIndex);
  l_P := ItemSlot(anIndex);
  Result := l_P^;
  Dec(f_Count);
  if (anIndex = f_Count) then
   l_P^ := 0
  else
   MoveItems(anIndex, Succ(anIndex), f_Count-anIndex, Self);
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf  l3Items_NoChanging}
//#UC END# *47AAC7E50323_4773DC930147_impl*
end;//Tl3LongintListPrim.Delete

procedure Tl3LongintListPrim.SaveToStream(aStream: TStream); // can raise El3Exception
//#UC START# *47B17EEC020C_4773DC930147_var*

 function _WriteInteger(aWord: PObject; anIndex: Long): Bool;
 begin
  Result := true;
  aStream.Write(PLong(aWord)^, SizeOf(PLong(aWord)^));
 end;

//#UC END# *47B17EEC020C_4773DC930147_var*
begin
//#UC START# *47B17EEC020C_4773DC930147_impl*
 IterateAllF(l3L2IA(@_WriteInteger));
//#UC END# *47B17EEC020C_4773DC930147_impl*
end;//Tl3LongintListPrim.SaveToStream

procedure Tl3LongintListPrim.LoadFromStream(aStream: TStream;
  aNeedSort: Boolean); // can raise El3Exception
//#UC START# *47B19BBB00BA_4773DC930147_var*

 procedure LoadFromStreamError;
 begin
  raise El3Exception.Create('Длина потока не кратна размеру элемента');
 end;

var
 l_Size : Longint;
//#UC END# *47B19BBB00BA_4773DC930147_var*
begin
//#UC START# *47B19BBB00BA_4773DC930147_impl*
 with aStream do
 begin
  l_Size := Size - Position;
  if (l_Size > 0) then
  begin
   if (l_Size mod SizeOf(LongInt) <> 0) then
    LoadFromStreamError
   else
   begin
    Count := l_Size div SizeOf(LongInt);
    Read(ItemSlot(0)^, l_Size);
    if Sorted and aNeedSort then Sort;
   end;//l_Size mod SizeOf(LongInt)..
  end;//l_Size > 0
 end;//with aStream
//#UC END# *47B19BBB00BA_4773DC930147_impl*
end;//Tl3LongintListPrim.LoadFromStream

{$If not defined(DesignTimeLibrary)}
class function Tl3LongintListPrim.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DC930147_var*
//#UC END# *47A6FEE600FC_4773DC930147_var*
begin
//#UC START# *47A6FEE600FC_4773DC930147_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4773DC930147_impl*
end;//Tl3LongintListPrim.IsCacheable
{$IfEnd} //not DesignTimeLibrary

//#UC START# *4773DC930147impl*
//#UC END# *4773DC930147impl*

end.