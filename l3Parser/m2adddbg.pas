unit    m2AddDbg;

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
  SysUtils
  ;


 function    m2ExceptionMessage   (
                                  ): String;


 function    m2CheckValue         (const AValue: LongBool
                                  ): Boolean;


 function    m2TraceString        (const AString: AnsiString
                                  ): Boolean;


type
  Em2InvalidValue = class(Exception);

implementation

 function    m2ExceptionMessage(
                               ): String;
 const
        CMaxSize=                 1024;
 begin

  SetLength(Result,CMaxSize);
  SetLength(Result,ExceptionErrorMessage(ExceptObject(),ExceptAddr(),PChar(Result),CMaxSize));

 end;

function m2CheckValue(const AValue: LongBool): Boolean;

  function    __ReturnAddr(
                          ): Pointer;
  asm
(*{$IFDEF _m2OPTIMIZATION0}
                mov   eax,dword ptr [esp]
                mov   eax,dword ptr [eax][+$04]
{$ENDIF}
{$IFDEF _m2OPTIMIZATION1}
                mov   eax,dword ptr [esp][+$04]
{$ENDIF}*)
{$IFOpt O-}
                mov   eax,dword ptr [esp]
                mov   eax,dword ptr [eax][+$04]
{$Else}
                mov   eax,dword ptr [esp][+$04]
{$ENDIF}
  end;//__ReturnAddr

begin
 if not(AValue) then
  raise Em2InvalidValue.Create('Value is not valid') at __ReturnAddr();
 Result:=True;
end;

 function    m2TraceString(const AString: AnsiString
                          ): Boolean;
 begin

  OutputDebugStringA(PAnsiChar(Format('%s'^J,[AString])));

  Result:=True;

 end;

end.

