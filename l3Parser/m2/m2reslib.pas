(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
unit    m2RESLib;


{$I m2Define.inc}

interface


 uses
         Windows,
        SysUtils,

        m2AddDbg,
        m2AddPrc;


 function    m2RESAllocRCDATA     (var   AHandle: THandle;
                                   const AName: WideString;
                                   const ASize: PLongInt = nil
                                  ): Pointer;

 function    m2RESFreeRCDATA      (var   AHandle: THandle
                                  ): Pointer;


 implementation


 function    m2RESAllocRCDATA(var   AHandle: THandle;
                              const AName: WideString;
                              const ASize: PLongInt
                             ): Pointer;

  function    __NameUpperCase(const AName: WideString
                             ): WideString;
  var
        LString:                  AnsiString;
  begin

   if (Win32Platform = VER_PLATFORM_WIN32_NT) then
   begin
    Result := AName;
    Result := WideString(CharUpperW(PWideChar(Result)));
   end//Win32Platform = VER_PLATFORM_WIN32_NT
   else
    Result:=WideString(CharUpperA(m2MakeAnsiString(LString,AName)));

  end;

 var
        LHInstance:               THandle;
        LRInstance:               THandle;
 begin

  LHInstance:=FindResourceHInstance(HInstance);
  m2CheckValue(LHInstance <> 0);

  LRInstance:=FindResourceW(LHInstance,PWideChar(__NameUpperCase(AName)),MakeIntResourceW(10));
  m2CheckValue(LRInstance <> 0);

  if (ASize <> nil)
   then
    begin

     ASize^:=LongInt(SizeOfResource(LHInstance,LRInstance));

    end;

  AHandle:=LoadResource(LHInstance,LRInstance);
  m2CheckValue(AHandle <> 0);

  Result:=Pointer(LockResource(AHandle));

 end;

 function    m2RESFreeRCDATA(var   AHandle: THandle
                            ): Pointer;
 begin

  AHandle:=0;
  Result:=nil;

 end;


end.

