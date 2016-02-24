unit l3StorableDataObject;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3DataObject,
  Classes
  ;

type
 Tl3StorableDataObject = class(Tl3DataObject)
  {* Класс для реализации интерфейса IDataObject для выделения текста редактора. }
 protected
 // overridden protected methods
   function DoGetData(const aFormatEtcIn: TFormatEtc;
    var medium: Tl3StoragePlace): HResult; override;
   function DoGetDataHere(const aFormatEtcIn: TFormatEtc;
    const medium: Tl3StoragePlace): HResult; override;
 public
 // overridden public methods
   function AcceptableTymed: Integer; override;
 protected
 // protected methods
   function Store(aFormat: Tl3ClipboardFormat;
    aPool: TStream): Boolean; overload; 
   function Store(aFormat: Tl3ClipboardFormat;
    const aPool: IStream): Boolean; overload;  virtual; abstract;
 end;//Tl3StorableDataObject

implementation

uses
  l3Stream,
  l3Memory,
  l3Base,
  l3Chars
  ;

// start class Tl3StorableDataObject

function Tl3StorableDataObject.Store(aFormat: Tl3ClipboardFormat;
  aPool: TStream): Boolean;
//#UC START# *48F37AAF012F_4680F7E70110_var*
var
 l_Pool : IStream;
//#UC END# *48F37AAF012F_4680F7E70110_var*
begin
//#UC START# *48F37AAF012F_4680F7E70110_impl*
 l_Pool := l3Stream2IStream(aPool);
 try
  Result := Store(aFormat, l_Pool);
 finally
  l_Pool := nil;
 end;//try..finally
//#UC END# *48F37AAF012F_4680F7E70110_impl*
end;//Tl3StorableDataObject.Store

function Tl3StorableDataObject.DoGetData(const aFormatEtcIn: TFormatEtc;
  var medium: Tl3StoragePlace): HResult;
//#UC START# *48F3495D0398_4680F7E70110_var*
var
 l_Handle       : THandle;
 l_MemoryStream : Tl3MemoryStream;
//#UC END# *48F3495D0398_4680F7E70110_var*
begin
//#UC START# *48F3495D0398_4680F7E70110_impl*
 Result := inherited DoGetData(aFormatEtcIn, medium);
 if (Result <> S_Ok) then
  with aFormatEtcIn do
  begin
   if (tymed AND TYMED_HGLOBAL <> 0) then
   begin
    medium.tymed := TYMED_HGLOBAL;
    l_MemoryStream := Tl3MemoryStream.Make(false);
    try
     l_Handle := l3System.GlobalAlloc(GMEM_SHARE, 32);
     try
      l_MemoryStream.MemoryPool.AsHandle := l_Handle;
      if Store(cfFormat, l_MemoryStream) then
      begin
       while (l_MemoryStream.Position < l_MemoryStream.Size) do
        l_MemoryStream.Write(cc_NullVar, SizeOf(AnsiChar));
       l_Handle := l3System.ReleaseHandle(l_MemoryStream.MemoryPool.ReleaseHandle);
       medium.hGlobal := l_Handle;
       Result := S_Ok;
      end//Store(cfFormat, l_MemoryStream)
      else
       Result := DV_E_FormatEtc;
     except
      l3System.GlobalFree(l_Handle);
      Result := E_OutOfMemory;
     end;//try..except
    finally
     l3Free(l_MemoryStream);
    end;//try
   end//tymed AND TYMED_HGLOBAL <> 0
   else
   if (tymed AND TYMED_ISTREAM <> 0) then
   begin
    medium.tymed := TYMED_ISTREAM;
    l_MemoryStream := Tl3MemoryStream.Create;
    try
     if Store(cfFormat, l_MemoryStream) then
     begin
      //l_MemoryStream.Seek(0, soBeginning);
      IStream(medium.stm) := l_MemoryStream;
      Result := S_Ok;
     end//Store(cfFormat, l_MemoryStream)
     else
      Result := DV_E_FormatEtc;
    finally
     l3Free(l_MemoryStream);
    end;//try
   end//tymed AND TYMED_ISTREAM <> 0
   else
    Result := DV_E_FormatEtc;
  end;
//#UC END# *48F3495D0398_4680F7E70110_impl*
end;//Tl3StorableDataObject.DoGetData

function Tl3StorableDataObject.DoGetDataHere(const aFormatEtcIn: TFormatEtc;
  const medium: Tl3StoragePlace): HResult;
//#UC START# *48F349AE00F1_4680F7E70110_var*
var
 l_MemoryStream : Tl3MemoryStream;
 l_Stream       : TStream;
//#UC END# *48F349AE00F1_4680F7E70110_var*
begin
//#UC START# *48F349AE00F1_4680F7E70110_impl*
 Result := inherited DoGetDataHere(aFormatEtcIn, medium);
 if (Result <> S_Ok) then
  with aFormatEtcIn do
  begin
   if (tymed AND TYMED_HGLOBAL <> 0) AND (medium.tymed = TYMED_HGLOBAL) then
   begin
    l_MemoryStream := Tl3MemoryStream.Make(false);
    try
     l_MemoryStream.MemoryPool.AsHandle := medium.hGlobal;
     try
      if Store(cfFormat, l_MemoryStream) then
       Result := S_Ok
      else
       Result := DV_E_FormatEtc;
     finally
      l_MemoryStream.MemoryPool.ReleaseHandle
     end;//try..finally
    finally
     l3Free(l_MemoryStream);
    end;//try..finally
   end//tymed AND TYMED_HGLOBAL <> 0) AND (medium.tymed = TYMED_HGLOBAL)
   else
   if (tymed AND TYMED_ISTREAM <> 0) AND (medium.tymed = TYMED_ISTREAM) then
   begin
    l3IStream2Stream(IStream(Medium.Stm), l_Stream);
    try
     if Store(cfFormat, l_Stream) then
     begin
      //l_Stream.Seek(0, soBeginning);
      Result := S_Ok;
     end//Store
     else
      Result := DV_E_FormatEtc;
    finally
     l3Free(l_Stream);
    end;//try..finally
   end//(tymed AND TYMED_ISTREAM <> 0) AND (medium.tymed = TYMED_ISTREAM)
   else
    Result := DV_E_FormatEtc;
  end;
//#UC END# *48F349AE00F1_4680F7E70110_impl*
end;//Tl3StorableDataObject.DoGetDataHere

function Tl3StorableDataObject.AcceptableTymed: Integer;
//#UC START# *48F351BE0015_4680F7E70110_var*
//#UC END# *48F351BE0015_4680F7E70110_var*
begin
//#UC START# *48F351BE0015_4680F7E70110_impl*
 Result := inherited AcceptableTymed or TYMED_HGLOBAL or TYMED_ISTREAM;
//#UC END# *48F351BE0015_4680F7E70110_impl*
end;//Tl3StorableDataObject.AcceptableTymed

end.