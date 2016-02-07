unit    m2COMLib;

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)

{$I m2Define.inc}

 interface


 uses
         Windows,

         ActiveX,
          COMObj,

        l3Base,

        m2AddRdr,
        m2MEMLib,
        m2InternalInterfaces,

        l3Except,
        l3Types
        ;

type
  Em2ErrorOnWrite = class(El3Exception)
  end;//Em2ErrorOnWrite

 const
        Cm2COMDefaultTimeOut=     2000{4000}{40000}{1000}{300000};


 function    m2COMCreateGUID      (
                                  ): TGUID;
                                  

 procedure   m2COMAllocWideBuff   (var   AResult: PWideChar;
                                   const AString: WideString
                                  );


 function    m2COMModeAccess      (const AStatStgMode: LongInt
                                  ): LongInt;

 function    m2COMModeSharing     (const AStatStgMode: LongInt
                                  ): LongInt;

 function    m2COMModeFlags       (const AStatStgMode: LongInt
                                  ): LongInt;


 function    m2COMCheckAccess     (const ACurAccess: LongInt;
                                   const ASetAccess: LongInt
                                  ): LongBool;


 function    m2COMReadBuffer      (const aStream : IStream;
                                   out aBuff     ;
                                   aSize         : LongInt
                                  ): LongInt; overload;

 function    m2COMReadBuffer      (const AStream : IStream;
                                   APosition     : Int64;
                                   out ABuff     ;
                                   aSize         : LongInt
                                  ): LongInt; overload;

procedure m2COMReadBufferSafe(const AStream : IStream;
                              APosition     : Int64;
                              out theData   ;
                              aSize         : LongInt); overload;

procedure m2COMReadBufferSafe(const AStream : IStream;
                              out theData   ;
                              aSize         : LongInt); overload;

function m2COMWriteBuffer(const AStream : IStream;
                          const aBuff   ;
                          aSize         : LongInt): LongInt;
  overload;

function m2COMWriteBuffer(const aStream : IStream;
                          aPosition     : Int64;
                          const aBuff   ;
                          aSize         : LongInt): LongInt;
  overload;


 function    m2COMSeek            (const AStream: IStream;
                                   const AOffset: Int64;
                                   const AOrigin: LongInt = STREAM_SEEK_CUR
                                  ): Int64;


 function    m2COMGetPosition     (const AStream: IStream
                                  ): Int64;


(* function    m2COMSetPosition     (const APosition: Int64;
                                   const AStream: IStream;
                                   var   AResult: Int64
                                  ): IStream; overload;*)

 function    m2COMSetPosition     (const APosition: Int64;
                                   const AStream: IStream
                                  ): IStream; //overload;


(* function    m2COMGetSize         (const AStorage: IStorage
                                  ): Int64; overload;*)

 function    m2COMGetSize         (const AStream: IStream
                                  ): Int64; //overload;

(* function    m2COMGetSize         (const AStream: IStream;
                                   const APosition: Int64
                                  ): Int64; overload;*)

 function    m2COMSetSize         (const ASize: Int64;
                                   const AStream: IStream
                                  ): Int64;


 procedure   m2COMTruncate        (const AStream: IStream
                                  );


 function m2COMTimeLock        (const AStream: IStream;
                                   AOffset: Int64;
                                   ASize: Int64;
                                   ATimeOut: LongInt = Cm2COMDefaultTimeOut;
                                   ALockType: LongInt = LOCK_EXCLUSIVE
                                  ): Boolean;

 function   m2COMTimeUnlock      (const AStream: IStream;
                                   const AOffset: Int64;
                                   const ASize: Int64;
                                   const ALockType: LongInt = LOCK_EXCLUSIVE
                                  ): Boolean;


 function    m2COMCopyData        (const ADest: IStorage;
                                   const ASour: IStorage
                                  ): IStorage; overload;

 function    m2COMCopyData        (const ADest: IStream;
                                   const ASour: IStream
                                  ): IStream; overload;


 function    m2COMDestroyData     (const AStorage: IStorage
                                  ): IStorage; overload;

 function    m2COMDestroyData     (const AStream: IStream
                                  ): IStream; overload;

 function    m2COMCreateStorage   (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryOpen: LongBool
                                  ): IStorage;

 function    m2COMCreateStream    (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryOpen: LongBool
                                  ): IStream;

 function    m2COMOpenStorage     (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryCreate: LongBool
                                  ): IStorage;

 function    m2COMSafeOpenStorage(const AStorage     : IStorage;
                                  const AName        : PWideChar;
                                  const AStatStgMode : LongInt;
                                  const ATryCreate   : LongBool;
                                  out   theStorage   : IStorage): hResult;

 function    m2COMOpenStream      (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryCreate: LongBool
                                  ): IStream;

 function    m2COMSafeOpenStream  (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryCreate: LongBool;
                                   out aStream : IStream): hResult;

 function    m2COMGetStatStgName  (const AStorage: IStorage
                                  ): WideString; overload;

 function    m2COMGetStatStgName  (const AStream: IStream
                                  ): WideString; overload;


(* function    m2COMGetStatStgSize  (const AStorage: IStorage
                                  ): Int64; overload;

 function    m2COMGetStatStgSize  (const AStream: IStream
                                  ): Int64; overload;*)


 function    m2COMGetStatStgMTime (const AStorage: IStorage
                                  ): TFileTime; overload;

 function    m2COMGetStatStgMTime (const AStream: IStream
                                  ): TFileTime; overload;

 function    m2COMGetStatStgCTime (const AStorage: IStorage
                                  ): TFileTime; overload;

 function    m2COMGetStatStgCTime (const AStream: IStream
                                  ): TFileTime; overload;

 function    m2COMGetStatStgATime (const AStorage: IStorage
                                  ): TFileTime; overload;

 function    m2COMGetStatStgATime (const AStream: IStream
                                  ): TFileTime; overload;


 function    m2COMGetStatStgMode  (const AStorage: IStorage
                                  ): LongInt; overload;

 function    m2COMGetStatStgMode  (const AStream: IStream
                                  ): LongInt; overload;


 function    m2COMGetStatStgLocks (const AStorage: IStorage
                                  ): LongInt; overload;

 function    m2COMGetStatStgLocks (const AStream: IStream
                                  ): LongInt; overload;


 function    m2COMGetStatStgCLSID (const AStorage: IStorage
                                  ): TCLSID; overload;

 function    m2COMGetStatStgCLSID (const AStream: IStream
                                  ): TCLSID; overload;


 function    m2COMSetStatStgCLSID (const AStorage: IStorage;
                                   const ACLSID: TCLSID
                                  ): IStorage;


 function    m2COMGetStatStgState (const AStorage: IStorage
                                  ): LongInt; overload;

 function    m2COMGetStatStgState (const AStream: IStream
                                  ): LongInt; overload;


 function    m2COMSetStatStgState (const AStorage: IStorage;
                                   const AStateBits: LongInt;
                                   const ASteteMask: LongInt
                                  ): IStorage;


function m2COMIsLocksSupported(const AStorage: IStorage;
                               ALockType: LongInt): LongBool; overload;

function m2COMIsLocksSupported(const AStream: IStream;
                               ALockType: LongInt): LongBool; overload;

 procedure   m2COMCLSIDFromStream (const AStream: IStream;
                                   var   ACLSID: AnsiString
                                  ); overload;

 function    m2COMCLSIDFromStream (const AStream: IStream
                                  ): AnsiString; overload;


 procedure   m2COMCLSIDToStream   (const AStream: IStream;
                                   const ACLSID: AnsiString
                                  );


function m2COMWriteBufferSafe(const aStream : IStream;
                              aPosition     : Int64;
                              const aBuff   ;
                              aSize         : LongInt): LongInt; overload;
                              
function m2COMWriteBufferSafe(const aStream : IStream;
                              const aBuff   ;
                              aSize         : LongInt): LongInt; overload;
implementation

uses
  SysUtils,

  l3Memory
  ;


 function    m2COMCreateGUID(
                            ): TGUID;
 begin

  OleCheck(CoCreateGUID(Result));

 end;

 procedure   m2COMAllocWideBuff(var   AResult: PWideChar;
                                const AString: WideString
                               );

  procedure   __AllocWideBuff(var   AResult: PWideChar;
                              const AString: WideString;
                              const ASize: LongInt
                             );
  begin

   m2MEMCoTaskAlloc(Pointer(AResult),ASize);
   m2MEMCopy(Pointer(AResult),PWideChar(AString),ASize);

  end;

 begin

  AResult:=PWideChar(AString);

  if (AResult <> nil) then
   __AllocWideBuff(AResult,AString,SizeOf(WideChar)*Succ(Length(AString)));
 end;

function m2COMModeAccess(const AStatStgMode: LongInt): LongInt;
begin
 Result := (AStatStgMode and $0000000f);
end;

function m2COMModeSharing(const AStatStgMode: LongInt): LongInt;
begin
 Result := (AStatStgMode and $000000f0);
end;

function m2COMModeFlags(const AStatStgMode: LongInt): LongInt;
begin
 Result := (AStatStgMode and $ffffff00);
end;

function m2COMCheckAccess(const aCurAccess: LongInt;
                          const aSetAccess: LongInt): LongBool;
begin
 Result := (aCurAccess = STGM_READWRITE);
 if not Result then
  Result := (aCurAccess = aSetAccess) OR
            ((aSetAccess = STGM_READ) AND (aCurAccess AND STGM_WRITE = 0));
end;

function m2COMReadBuffer(const aStream : IStream;
                         out aBuff     ;
                         aSize         : LongInt): LongInt;
var
 LReturn: HRESULT;
begin
 LReturn := AStream.Read(@aBuff, aSize, @Result);
 if (LReturn = S_FALSE) then
  LReturn := STG_E_READFAULT;
 OleCheck(LReturn);
end;

function m2COMReadBuffer(const aStream : IStream;
                         aPosition     : Int64;
                         out aBuff     ;
                         aSize         : LongInt): LongInt;
  {-}
begin
 m2COMSeek(aStream, aPosition, STREAM_SEEK_SET);
 Result := m2COMReadBuffer(aStream, aBuff, aSize);
end;

procedure m2COMReadBufferSafe(const AStream : IStream;
                              APosition     : Int64;
                              out theData   ;
                              aSize         : LongInt);
var
 l_Read : Integer;                              
begin
 l_Read := m2COMReadBuffer(aStream, aPosition, theData, aSize);
 Assert(l_Read = aSize, 'Проблемы при чтении данных. Считали: ' + IntToStr(l_Read) + ', а надо было: ' + IntToStr(aSize));
end;
                              
procedure m2COMReadBufferSafe(const AStream : IStream;
                              out theData   ;
                              aSize         : LongInt);
var
 l_Pos : Int64;                              
begin
 l_Pos := m2COMGetPosition(aStream);
 m2COMReadBufferSafe(aStream, l_Pos, theData, aSize);
end;

function m2COMWriteBuffer(const aStream : IStream;
                          const aBuff   ;
                          aSize         : LongInt): LongInt;
begin
 OleCheck(AStream.Write(@aBuff, aSize, @Result));
end;

function m2COMWriteBuffer(const aStream : IStream;
                          aPosition     : Int64;
                          const aBuff   ;
                          aSize         : LongInt): LongInt;
begin
 m2COMSeek(AStream, APosition, STREAM_SEEK_SET);
 Result := m2COMWriteBuffer(aStream, aBuff, aSize);
end;

function m2COMSeek(const AStream : IStream;
                   const AOffset : Int64;
                   const AOrigin : LongInt): Int64;
begin
 OleCheck(AStream.Seek(AOffset,AOrigin,Result));
end;

function m2COMGetPosition(const AStream: IStream): Int64;
var
 l_SS : Im2StoreStat;
begin
 if Supports(aStream, Im2StoreStat, l_SS) then
  try
   Result := l_SS.Position;
  finally
   l_SS := nil;
  end//try..finally
 else
  OleCheck(AStream.Seek(0, STREAM_SEEK_CUR, Result));
end;

(*function m2COMSetPosition(const APosition: Int64;
                          const AStream: IStream;
                          var   AResult: Int64): IStream;
begin
 OleCheck(AStream.Seek(APosition, STREAM_SEEK_SET, AResult));
 Result := AStream;
end;*)

function m2COMSetPosition(const APosition: Int64;
                          const AStream: IStream): IStream;
var
 l_Dummy : Int64;
begin
 OleCheck(AStream.Seek(APosition, STREAM_SEEK_SET, l_Dummy));
 Result := AStream;
 //Result := m2COMSetPosition(APosition, AStream, l_Dummy);
end;

(* function    m2COMGetSize(const AStorage: IStorage
                         ): Int64;
 var
        LEnumStatStg:             IEnumStatStg;
        LResult:                  LongInt;
        LStatStg:                 TStatStg;
 begin

  Result:=0;

  OleCheck(AStorage.EnumElements(0,nil,0,LEnumStatStg));

  repeat

   OleCheck(LEnumStatStg.Next(1,LStatStg,@LResult));

   if (LResult = 0)
    then
     begin

      Break;

     end;

   with LStatStg do
    begin

     try

      Inc(Result);

     finally

      m2MEMCoTaskFree(Pointer(pwcsName));

     end;

    end;

  until False;

 end;*)

function m2COMGetSize(const AStream: IStream): Int64;
  {-}
var
 LPosition   : Int64;
 l_Dummy     : Int64;
 l_StoreStat : Im2StoreStat;
begin
 Result := 0;
 if (aStream = nil) then
  Exit;
 if l3IOk(aStream.QueryInterface(Im2StoreStat, l_StoreStat)) then
  try
   Result := l_StoreStat.Size;
  finally
   l_StoreStat := nil;
  end//try..finally
 else
 begin
  OleCheck(AStream.Seek(0, STREAM_SEEK_CUR, LPosition));
  try
   OleCheck(AStream.Seek(0, STREAM_SEEK_END, Result));
  finally
   OleCheck(AStream.Seek(LPosition, STREAM_SEEK_SET, l_Dummy));
  end;//try..finally
 end;//..Im2StoreStat..
end;

(*function m2COMGetSize(const AStream: IStream;
                      const APosition: Int64): Int64;
var
 l_Dummy : Int64;
begin
 OleCheck(AStream.Seek(0, STREAM_SEEK_END, Result));
 OleCheck(AStream.Seek(APosition, STREAM_SEEK_SET, l_Dummy));
end;*)

function m2COMSetSize(const ASize: Int64;
                      const AStream: IStream): Int64;
begin
 OleCheck(AStream.SetSize(ASize));
 Result := ASize;
end;

procedure  m2COMTruncate(const AStream: IStream);
begin
 m2COMSetSize(m2COMGetPosition(AStream),AStream);
end;

var
 g_TimeoutMultiplier : Integer = 1;

function m2COMTimeLock(const aStream: IStream;
                          aOffset: Int64;
                          aSize: Int64;
                          aTimeOut: LongInt;
                          aLockType: LongInt): Boolean;
var
 LReturn : HRESULT;
 LTickCount : LongWord;
 LTimeOut : LongInt;
begin
 Result := false;
 
 if not m2COMIsLocksSupported(aStream, aLockType) then
  Exit;

 LTickCount := GetTickCount;
 repeat
  LReturn := AStream.LockRegion(AOffset,ASize,ALockType);
  if SUCCEEDED(LReturn) then
  begin
   Result := true;
   Exit;
  end;

  if (LReturn <> STG_E_LOCKVIOLATION) then
   break;

  LTimeOut := LongInt(GetTickCount-LTickCount);

  if (LTimeOut > ATimeOut * g_TimeoutMultiplier) then
   Break;

  Sleep(Random(500));

 until False;

 l3System.Msg2Log(Format('m2COMTimeLock Error = %d aOffset = %d aSize = %d aMultiplier = %d aTimeOut = %d aDelta = %d', [LReturn, aOffset, aSize, g_TimeoutMultiplier, aTimeOut, LTimeOut]));
 if (g_TimeoutMultiplier < 10) then
  Inc(g_TimeoutMultiplier);
 try
  OleError(LReturn);
 except
  on E: Exception do
  begin
   if (LReturn <> STG_E_LOCKVIOLATION) then
    l3System.Exception2Log(E);
   raise;
  end;//on E: Exception
 end;//try..except
end;

function m2COMTimeUnlock(const AStream: IStream;
                            const AOffset: Int64;
                            const ASize: Int64;
                            const ALockType: LongInt): Boolean;
begin
 Result := false;

 if not m2COMIsLocksSupported(aStream, aLockType) then
  Exit;

 OleCheck(AStream.UnlockRegion(AOffset,ASize,ALockType));

 Result := true;
end;

 function    m2COMCopyData(const ADest: IStorage;
                           const ASour: IStorage
                          ): IStorage;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(ASour.CopyTo(0,nil,nil,ADest));
  OleCheck(ASour.Stat(LStatStg,STATFLAG_NONAME));

  with LStatStg do
   begin

    OleCheck(ADest.SetClass(clsid));
    OleCheck(ADest.SetStateBits(grfStateBits,LongInt(-1)));

   end;

  Result:=ADest;

 end;

function    m2COMCopyData(const ADest: IStream;
                          const ASour: IStream): IStream;
var
 l_Read : Int64;
 l_Written : Int64;
begin
 OleCheck(ASour.CopyTo(ADest, High(Int64), l_Read, l_Written));
 Result:=ADest;
end;

 function    m2COMDestroyData(const AStorage: IStorage
                             ): IStorage;
 var
        LEnumStatStg:             IEnumStatStg;
        LResult:                  LongInt;
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.EnumElements(0,nil,0,LEnumStatStg));

  repeat

   OleCheck(LEnumStatStg.Next(1,LStatStg,@LResult));

   if (LResult = 0)
    then
     begin

      Break;

     end;

   with LStatStg do
    begin

     try

      AStorage.DestroyElement(pwcsName);

     finally

      m2MEMCoTaskFree(Pointer(pwcsName));

     end;

    end;

  until False;

  Result:=AStorage;

 end;

 function    m2COMDestroyData(const AStream: IStream
                             ): IStream;
 begin

  m2COMSetSize(0,AStream);

  Result:=AStream;

 end;

function m2COMCreateStorage(const AStorage     : IStorage;
                            const AName        : PWideChar;
                            const AStatStgMode : LongInt;
                            const ATryOpen     : LongBool): IStorage;
var
 LReturn : HRESULT;
begin
 LReturn := AStorage.CreateStorage(AName, AStatStgMode, 0, 0, Result);
 if FAILED(LReturn) then begin
  if (ATryOpen and (LReturn = STG_E_FILEALREADYEXISTS)) then
   OleCheck(AStorage.OpenStorage(AName,
                                 nil,
                                 AStatStgMode AND not STGM_CREATE,
                                 nil, 0,
                                 Result))

  else
   OleError(LReturn);
 end;//FAILED(LReturn)
end;

function m2COMCreateStream(const AStorage     : IStorage;
                           const AName        : PWideChar;
                           const AStatStgMode : LongInt;
                           const ATryOpen     : LongBool): IStream;
var
 LReturn : HRESULT;
begin
 LReturn := AStorage.CreateStream(AName, AStatStgMode, 0, 0, Result);
 if FAILED(LReturn) then begin
  if (ATryOpen and (LReturn = STG_E_FILEALREADYEXISTS)) then
   OleCheck(AStorage.OpenStream(AName,
                                nil,
                                AStatStgMode AND not STGM_CREATE,
                                0,
                                Result))

  else
   OleError(LReturn);
 end;//FAILED(LReturn)
end;

function    m2COMOpenStorage(const AStorage     : IStorage;
                             const AName        : PWideChar;
                             const AStatStgMode : LongInt;
                             const ATryCreate   : LongBool): IStorage;
begin
 OleCheck(m2COMSafeOpenStorage(aStorage, aName, aStatStgMode, aTryCreate, Result));
end;

function    m2COMSafeOpenStorage(const AStorage     : IStorage;
                                 const AName        : PWideChar;
                                 const AStatStgMode : LongInt;
                                 const ATryCreate   : LongBool;
                                 out   theStorage   : IStorage): hResult;
begin
 Result := AStorage.OpenStorage(AName, nil, AStatStgMode, nil, 0, theStorage);
 if FAILED(Result) AND
    (ATryCreate and (Result = STG_E_FILENOTFOUND)) then
   Result := AStorage.CreateStorage(AName, AStatStgMode, 0, 0, theStorage);
end;

 function    m2COMOpenStream(const AStorage: IStorage;
                             const AName: PWideChar;
                             const AStatStgMode: LongInt;
                             const ATryCreate: LongBool
                            ): IStream;
 begin
  OleCheck(m2COMSafeOpenStream(aStorage, aName, aStatStgMode, aTryCreate, Result));
 end;

 function    m2COMSafeOpenStream  (const AStorage: IStorage;
                                   const AName: PWideChar;
                                   const AStatStgMode: LongInt;
                                   const ATryCreate: LongBool;
                                   out aStream : IStream): hResult;
 begin
  Result:=AStorage.OpenStream(AName,nil,AStatStgMode,0,aStream);
  if FAILED(Result) then begin
   if (ATryCreate and (Result = STG_E_FILENOTFOUND)) then
    Result := AStorage.CreateStream(AName,AStatStgMode,0,0,aStream);
  end;
 end;

function m2COMGetStatStgName(const AStorage: IStorage): WideString;
var
 LStatStg : TStatStg;
 l_SS : Im2StoreStat;
begin
 if Supports(aStorage, Im2StoreStat, l_SS) then
  try
   Result := l_SS.Name;
  finally
   l_SS := nil;
  end//try..finally
 else
 begin
  OleCheck(AStorage.Stat(LStatStg, STATFLAG_DEFAULT));
  Result := LStatStg.pwcsName;
  m2MEMCoTaskFree(Pointer(LStatStg.pwcsName));
 end;//Supports(aStorage, Im2StoreStat, l_SS)
end;

function m2COMGetStatStgName(const aStream: IStream): WideString;
var
 LStatStg : TStatStg;
 l_SS : Im2StoreStat;
begin
 if Supports(aStream, Im2StoreStat, l_SS) then
  try
   Result := l_SS.Name;
  finally
   l_SS := nil;
  end//try..finally
 else
 begin
  OleCheck(AStream.Stat(LStatStg, STATFLAG_DEFAULT));
  Result := LStatStg.pwcsName;
  m2MEMCoTaskFree(Pointer(LStatStg.pwcsName));
 end;//Supports(aStream, Im2StoreStat, l_SS)
end;

(* function    m2COMGetStatStgSize(const AStorage: IStorage
                                ): Int64;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.cbSize;

 end;

 function    m2COMGetStatStgSize(const AStream: IStream
                                ): Int64;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.cbSize;

 end;*)

 function    m2COMGetStatStgMTime(const AStorage: IStorage
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.mtime;

 end;

 function    m2COMGetStatStgMTime(const AStream: IStream
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.mtime;

 end;

 function    m2COMGetStatStgCTime(const AStorage: IStorage
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.ctime;

 end;

 function    m2COMGetStatStgCTime(const AStream: IStream
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.ctime;

 end;

 function    m2COMGetStatStgATime(const AStorage: IStorage
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.atime;

 end;

 function    m2COMGetStatStgATime(const AStream: IStream
                                 ): TFileTime;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.atime;

 end;

function    m2COMGetStatStgMode(const AStorage: IStorage
                               ): LongInt;
var
 LStatStg    : TStatStg;
 l_StoreStat : Im2StoreStat;
begin
 if l3IOk(aStorage.QueryInterface(Im2StoreStat, l_StoreStat)) then
  try
   Result := l_StoreStat.Access;
  finally
   l_StoreStat := nil;
  end//try..finally
 else
 begin
  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));
  Result:=LStatStg.grfMode;
 end;
end;

function    m2COMGetStatStgMode(const AStream: IStream
                               ): LongInt;
var
 LStatStg    : TStatStg;
 l_StoreStat : Im2StoreStat;
begin
 if l3IOk(aStream.QueryInterface(Im2StoreStat, l_StoreStat)) then
  try
   Result := l_StoreStat.Access;
  finally
   l_StoreStat := nil;
  end//try..finally
 else
 begin
  OleCheck(aStream.Stat(LStatStg,STATFLAG_NONAME));
  Result:=LStatStg.grfMode;
 end;
end;

function m2COMGetStatStgLocks(const AStorage: IStorage): LongInt;
var
 LStatStg    : TStatStg;
 l_StoreStat : Im2StoreStat;
begin
 if l3IOk(aStorage.QueryInterface(Im2StoreStat, l_StoreStat)) then
  try
   Result := l_StoreStat.LocksSupported;
  finally
   l_StoreStat := nil;
  end//try..finally
 else begin
  OleCheck(aStorage.Stat(LStatStg,STATFLAG_NONAME));
  Result:=LStatStg.grfLocksSupported;
 end;
end;

function m2COMGetStatStgLocks(const AStream: IStream): LongInt;
var
 LStatStg    : TStatStg;
 l_StoreStat : Im2StoreStat;
begin
 if l3IOk(aStream.QueryInterface(Im2StoreStat, l_StoreStat)) then
  try
   Result := l_StoreStat.LocksSupported;
  finally
   l_StoreStat := nil;
  end//try..finally
 else begin
  OleCheck(aStream.Stat(LStatStg,STATFLAG_NONAME));
  Result:=LStatStg.grfLocksSupported;
 end;
end;

 function    m2COMGetStatStgCLSID(const AStorage: IStorage
                                 ): TCLSID;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.clsid;

 end;

 function    m2COMGetStatStgCLSID(const AStream: IStream
                                 ): TCLSID;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.clsid;

 end;

 function    m2COMSetStatStgCLSID(const AStorage: IStorage;
                                  const ACLSID: TCLSID
                                 ): IStorage;
 begin

  OleCheck(AStorage.SetClass(ACLSID));

  Result:=AStorage;

 end;

 function    m2COMGetStatStgState(const AStorage: IStorage
                                 ): LongInt;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStorage.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.grfStateBits;

 end;

 function    m2COMGetStatStgState(const AStream: IStream
                                 ): LongInt;
 var
        LStatStg:                 TStatStg;
 begin

  OleCheck(AStream.Stat(LStatStg,STATFLAG_NONAME));

  Result:=LStatStg.grfStateBits;

 end;

 function    m2COMSetStatStgState(const AStorage: IStorage;
                                  const AStateBits: LongInt;
                                  const ASteteMask: LongInt
                                 ): IStorage;
 begin

  OleCheck(AStorage.SetStateBits(AStateBits,ASteteMask));

  Result:=AStorage;

 end;

function m2COMIsLocksSupported(const AStorage: IStorage;
                               ALockType: LongInt): LongBool;
begin
 Result := ((m2COMGetStatStgLocks(AStorage) and ALockType) <> 0);
end;

function m2COMIsLocksSupported(const AStream: IStream;
                               ALockType: LongInt): LongBool;
begin
 Result := ((m2COMGetStatStgLocks(AStream) and ALockType) <> 0);
end;

procedure   m2COMCLSIDFromStream(const AStream: IStream;
                                 var   ACLSID: AnsiString
                                );

 procedure __LoadString(const aStream: IStream;
                        var   aString: AnsiString;
                        const aLength: LongInt);
 const
  cMaxTry = 10;
 var
  l_Read : AnsiString;
  l_TryCount : Integer;
  l_Pos : Int64;
 begin//__LoadString
  l_Pos := m2COMGetPosition(AStream);
  l_TryCount := 0;
  while (l_TryCount < cMaxTry) do
  begin
   Inc(l_TryCount);
   l_Read := aString;
   UniqueString(l_Read);
   try
    if (m2COMReadBuffer(aStream, l_Pos, PAnsiChar(l_Read)^, aLength) = aLength) then
     aString := l_Read;
   except
    on E: EOleSysError do
    begin
     if (E.ErrorCode = STG_E_READFAULT) then
      break
     else
     if (E.ErrorCode = E_UNEXPECTED) OR (E.ErrorCode = STG_E_LOCKVIOLATION) then
     begin
      if (l_TryCount < cMaxTry) then
      begin
       l3System.Msg2Log('Попытка чтения GUID номер ' + IntToStr(l_TryCount));
       continue;
      end//l_TryCount < cMaxTry
      else
      begin
       l3System.Exception2Log(E);
       raise;
      end;//l_TryCount < cMaxTry
     end//E.ErrorCode = E_UNEXPECTED
     else
     begin
      l3System.Exception2Log(E);
      raise;
     end;//E.ErrorCode <> STG_E_READFAULT
    end;//on E: EOleSysError
   end;//try..except
   break;
  end;//while (l_TryCount < cMaxTry)
(*  if ((m2COMGetSize(AStream)-m2COMGetPosition(AStream)) >= aLength) then
{ TODO -oЛюлин А. В. -cОптимизация : здесь надо что-то делать без Size и Pos }
     m2COMReadBuffer(AStream, PAnsiChar(AString)^, aLength);*)
 end;//__LoadString

begin
 ACLSID := GUIDToString(TCLSID(GUID_NULL));
 __LoadString(AStream, ACLSID, Length(ACLSID));
end;

function m2COMCLSIDFromStream(const AStream: IStream): AnsiString;
begin
 m2COMCLSIDFromStream(AStream,Result);
end;

 procedure   m2COMCLSIDToStream(const AStream: IStream;
                                const ACLSID: AnsiString
                               );
 begin

  m2COMWriteBuffer(AStream,PAnsiChar(ACLSID)^,Length(ACLSID));

 end;


function m2COMWriteBufferSafe(const aStream : IStream;
                              aPosition     : Int64;
                              const aBuff   ;
                              aSize         : LongInt): LongInt;
var
 l_Ptr      : Pointer;

 procedure DoWrite;
 const
  cMaxTryCount = 5;
 var 
  l_TryCount : Integer;
 begin//DoWrite
  l_TryCount := cMaxTryCount;
  while (l_TryCount > 0) do
  begin
   Result := m2COMWriteBuffer(aStream, aPosition, aBuff, aSize);
   Assert(Result = aSize);
   Result := m2COMReadBuffer(aStream, aPosition, l_Ptr^, aSize);
   Assert(Result = aSize);
   if (m2MEMCompare(l_Ptr, @aBuff, aSize) = 0) then
    Exit;
   Dec(l_TryCount);
  end;//while (l_TryCount > 0)
  raise Em2ErrorOnWrite.Create('Ошибка при записи данных');
 end;//DoWrite

var
 l_ToRead : Tl3Ptr;
 l_Buff   : array [0..255] of AnsiChar;
begin
 if (aSize <= SizeOf(l_Buff)) then
 begin
  l_Ptr := @l_Buff;
  DoWrite;
 end//aSize <= SizeOf(l_Buff)
 else
 begin
  l3FillChar(l_ToRead, SizeOf(l_ToRead));
  l_ToRead.SetSize(aSize);
  try
   l_Ptr := l_ToRead.AsPointer;
   DoWrite;
  finally
   l_ToRead.SetSize(0);
  end;//try..finally
 end;//aSize <= SizeOf(l_Buff)
end;

function m2COMWriteBufferSafe(const aStream : IStream;
                              const aBuff   ;
                              aSize         : LongInt): LongInt;
var
 l_Pos : Int64;                              
begin
 l_Pos := m2COMGetPosition(aStream);
 Result := m2COMWriteBufferSafe(aStream, l_Pos, aBuff, aSize);
(* Result := m2COMWriteBuffer(aStream, aBuff, aSize);
 Assert(Result = aSize);*)
end;

end.
