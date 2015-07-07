...

class procedure TArray.Copy&lt;T&gt;(const Source: array of T; var Destination: array of T; SourceIndex, DestIndex, Count: NativeInt);
begin
  CheckArrays(Pointer(@Source[0]), Pointer(@Destination[0]), SourceIndex, Length(Source), DestIndex, Length(Destination), Count);
  if IsManagedType(T) then
    System.CopyArray(Pointer(@Destination[DestIndex]), Pointer(@Source[SourceIndex]), TypeInfo(T), Count)
  else
    System.Move(Pointer(@Source[SourceIndex])^, Pointer(@Destination[DestIndex])^, Count * SizeOf(T));
end;

...

function TListHelper.GetElSize: Integer;
begin
  Result := PDynArrayTypeInfo(PByte(FTypeInfo) + PDynArrayTypeInfo(FTypeInfo).name).elSize;
end;

function TListHelper.GetElType: Pointer;
begin
  Result := PDynArrayTypeInfo(PByte(FTypeInfo) + PDynArrayTypeInfo(FTypeInfo).name).elType^;
end;

...

procedure TListHelper.InternalExchangeMRef(Index1, Index2: Integer; Kind: TTypeKind);
begin
  case Kind of
    TTypeKind.tkUString: DoExchangeString(Index1, Index2);
    TTypeKind.tkInterface: DoExchangeInterface(Index1, Index2);
    TTypeKind.tkVariant: DoExchangeVariant(Index1, Index2);
    TTypeKind.tkDynArray: DoExchangeDynArray(Index1, Index2);
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass: DoExchangeObject(Index1, Index2);
{$ENDIF}
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkLString: DoExchangeAnsiString(Index1, Index2);
    TTypeKind.tkWString: DoExchangeWideString(Index1, Index2);
{$ENDIF}
  end;
end;

...

procedure TListHelper.InternalExtractItemMRef(const Value; Kind: TTypeKind; out Item; Direction: Byte);
begin
  case Kind of
    TTypeKind.tkUString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdString(Value, Item)
      else
        DoExtractItemRevString(Value, Item);
    TTypeKind.tkInterface:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdInterface(Value, Item)
      else
        DoExtractItemRevInterface(Value, Item);
{$IF not Defined(NEXTGEN)}
    TTypeKind.tkString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdAnsiString(Value, Item)
      else
        DoExtractItemRevAnsiString(Value, Item);
    TTypeKind.tkWString:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdWideString(Value, Item)
      else
        DoExtractItemRevWideString(Value, Item);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
    TTypeKind.tkClass:
      if Direction = Byte(TDirection.FromBeginning) then
        DoExtractItemFwdObject(Value, Item)
      else
        DoExtractItemRevObject(Value, Item);
{$ENDIF}
  end;
end;

...

procedure TListHelper.DoReverseMRef(Kind: TTypeKind);
var
  b, e: Integer;
begin
  b := 0;
  e := FCount - 1;
  while b &lt; e do
  begin
    case Kind of
      TTypeKind.tkUString: DoExchangeStringInline(b, e);
      TTypeKind.tkInterface: DoExchangeInterfaceInline(b, e);
      TTypeKind.tkDynArray: DoExchangeDynArrayInline(b, e);
      TTypeKind.tkVariant: DoExchangeVariantInline(b, e);
{$IF not Defined(NEXTGEN)}
      TTypeKind.tkLString: DoExchangeAnsiStringInline(b, e);
      TTypeKind.tkWString: DoExchangeWideStringInline(b, e);
{$ENDIF}
{$IF Defined(AUTOREFCOUNT)}
      TTypeKind.tkClass: DoExchangeObjectInline(b, e);
{$ENDIF}
    end;
    Inc(b);
    Dec(e);
  end;
end;

...

function TList&lt;T&gt;.InternalCompare(const Left, Right): Integer;
begin
  Result := FComparer.Compare(T(Left), T(Right));
end;

procedure TList&lt;T&gt;.InternalNotify(const Item; Action: TCollectionNotification);
begin
  Notify(T(Item), Action);
end;

function TList&lt;T&gt;.ItemValue(const Item: T): NativeInt;
begin
  case SizeOf(T) of
    1: Result := PByte(@Item)[0] shl 0;
    2: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8;
    3: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16;
{$IF SizeOf(Pointer) &lt;= 4}
    4: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24;
{$ELSE}
    4: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24;
    5: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32;
    6: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40;
    7: Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40 + NativeInt(PByte(@Item)[6]) shl 48;
  else
    Result := PByte(@Item)[0] shl 0 + PByte(@Item)[1] shl 8 + PByte(@Item)[2] shl 16 + PByte(@Item)[3] shl 24 +
       NativeInt(PByte(@Item)[4]) shl 32 + NativeInt(PByte(@Item)[5]) shl 40 + NativeInt(PByte(@Item)[6]) shl 48 +
       NativeInt(PByte(@Item)[7]) shl 56;
{$ENDIF}
  end;
end;

...

