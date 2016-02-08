unit m2AddPrc;

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)

// $Log: m2addprc.pas,v $
// Revision 1.4  2014/08/27 15:23:10  lulin
// - чистим код.
//
// Revision 1.3  2014/08/22 12:03:17  lulin
// - причёсываем код.
//
// Revision 1.1  2008/02/22 17:10:08  lulin
// - библиотека переехала.
//
// Revision 1.2  2007/12/10 15:33:04  lulin
// - cleanup.
//
// Revision 1.1  2007/12/07 11:51:05  lulin
// - переезд.
//
// Revision 1.2  2002/04/24 14:58:12  law
// - cleanup.
//

{$I m2Define.inc}

interface


uses
  Windows,
  SysUtils,

  m2AddRdr
  ;

type
  Tm2ClassDoneProc = procedure of object;
  Tm2ClassInitProc = Tm2ClassDoneProc;

procedure m2InitOperation(var   AStatus: LongWord;
                          const ABitMask: LongWord); overload;

procedure m2InitOperation(var   AStatus: LongWord;
                          ABitMask: LongWord;
                          aProc : Tm2ClassInitProc); overload;

procedure m2DoneOperation(var   AStatus: LongWord;
                          const ABitMask: LongWord;
                          const AClassDoneProc: Tm2ClassDoneProc);

(* function    m2MakeAnsiChar       (const AChar: WideChar
                                  ): AnsiChar;

 function    m2MakeWideChar       (const AChar: AnsiChar
                                  ): WideChar;

*)
function m2MakeAnsiString(var   ADest: AnsiString;
                          const ASour: WideString): PAnsiChar; //overload;
(*
 function    m2MakeAnsiString     (var   ADest: AnsiString;
                                   const ASour: PWideChar
                                  ): PAnsiChar; overload;

(*
 function    m2MakeWideString     (var   ADest: WideString;
                                   const ASour: AnsiString
                                  ): PWideChar; overload;

 function    m2MakeWideString     (var   ADest: WideString;
                                   const ASour: PAnsiChar
                                  ): PWideChar; overload;


 function    m2CompareAnsiStrings (const AString1: AnsiString;
                                   const AString2: AnsiString;
                                   const AFlags: LongWord = 0;
                                   const ALocale: LongWord = 0
                                  ): Integer;

 function    m2CompareWideStrings (const AString1: WideString;
                                   const AString2: WideString;
                                   const AFlags: LongWord = 0;
                                   const ALocale: LongWord = 0
                                  ): Integer;


 function    m2PreFormatAnsiString(const ASour: AnsiString
                                  ): AnsiString;

 function    m2PreFormatWideString(const ASour: WideString
                                  ): WideString;*)


implementation

procedure m2InitOperation(var AStatus: LongWord;
                          const ABitMask: LongWord);
begin
 Assert((AStatus and ABitMask) = 0);
 AStatus := AStatus or ABitMask;
end;

procedure m2InitOperation(var   AStatus: LongWord;
                          ABitMask: LongWord;
                          aProc : Tm2ClassInitProc);
begin
 Assert((AStatus and ABitMask) = 0);
 Assert(Assigned(aProc));
 aProc;
 AStatus := AStatus or ABitMask;
end;

procedure m2DoneOperation(var AStatus: LongWord;
                          const ABitMask: LongWord;
                          const AClassDoneProc: Tm2ClassDoneProc);
begin
 if ((AStatus and ABitMask) <> 0) then
 begin
  try
   if Assigned(AClassDoneProc) then
    AClassDoneProc;
  except
   m2ExcErrHandler();
  end;//try..except
  AStatus := AStatus and not(ABitMask);
 end;//(AStatus and ABitMask) <> 0
end;

(* function    m2MakeAnsiChar(const AChar: WideChar
                           ): AnsiChar;
 begin

  Win32Check(WideCharToMultiByte(0,0,@AChar,1,@Result,1,nil,nil) = 1);

 end;

 function    m2MakeWideChar(const AChar: AnsiChar
                           ): WideChar;
 begin

  Win32Check(MultiByteToWideChar(0,0,@AChar,1,@Result,1) = 1);

 end;*)

function m2MakeAnsiString(var   ADest: AnsiString;
                          const ASour: WideString): PAnsiChar;
begin
 if (Length(ASour) = 0) then
 begin
  Result := nil;
  aDest := '';
 end//Length(ASour) = 0
 else
 begin
  ADest := AnsiString(ASour);
  Result := PAnsiChar(ADest);
 end;
end;

(* function    m2MakeAnsiString(var   ADest: AnsiString;
                              const ASour: PWideChar
                             ): PAnsiChar;
 begin

  Result:=m2MakeAnsiString(ADest,WideString(ASour));

 end;

(* 
 function    m2MakeWideString(var   ADest: WideString;
                              const ASour: AnsiString
                             ): PWideChar;
 begin

  if (Length(ASour) = 0)
   then
    begin

     Result:=nil;

    end
   else
    begin

     ADest:=WideString(ASour);
     Result:=PWideChar(ADest);

    end;

 end;

 function    m2MakeWideString(var   ADest: WideString;
                              const ASour: PAnsiChar
                             ): PWideChar;
 begin

  Result:=m2MakeWideString(ADest,AnsiString(ASour));

 end;

 function    m2CompareAnsiStrings(const AString1: AnsiString;
                                  const AString2: AnsiString;
                                  const AFlags: LongWord;
                                  const ALocale: LongWord
                                 ): Integer;
 begin

  Result:=CompareStringA(ALocale,AFlags,PAnsiChar(AString1),Length(AString1),PAnsiChar(AString2),Length(AString2));

  Win32Check(Result <> 0);

  Dec(Result,2);

 end;

 function    m2CompareWideStrings(const AString1: WideString;
                                  const AString2: WideString;
                                  const AFlags: LongWord;
                                  const ALocale: LongWord
                                 ): Integer;
 var
        LString1:                 AnsiString;
        LString2:                 AnsiString;
 begin

  if (Win32Platform = VER_PLATFORM_WIN32_NT)
   then
    begin

     Result:=CompareStringW(ALocale,AFlags,PWideChar(AString1),Length(AString1),PWideChar(AString2),Length(AString2));

    end
   else
    begin

     Result:=CompareStringA(ALocale,AFlags,m2MakeAnsiString(LString1,AString1),Length(LString1),m2MakeAnsiString(LString2,AString2),Length(LString2));

    end;

  Win32Check(Result <> 0);

  Dec(Result,2);

 end;
                                  
 function    m2PreFormatAnsiString(const ASour: AnsiString
                                  ): AnsiString;
 var
        LIndex:                   LongInt;
 begin

  Result:=ASour;

  for LIndex:=1 to Length(Result) do
   begin

    if (Result[LIndex] in [AnsiChar(''^I''),AnsiChar(''^J''),AnsiChar(''^M'')])
     then
      begin

       Result[LIndex]:=AnsiChar(' ');

      end;

   end;

  for LIndex:=Length(Result) downto 1 do
   begin

    if (Result[LIndex] <> AnsiChar(' '))
     then
      begin

       SetLength(Result,LIndex);
       Break;

      end;

   end;

 end;

 function    m2PreFormatWideString(const ASour: WideString
                                  ): WideString;
 var
        LIndex:                   LongInt;
 begin

  Result:=ASour;

  for LIndex:=1 to Length(Result) do
   begin

    if (Result[LIndex] in [WideChar($000a),WideChar($000d)])
     then
      begin

       Result[LIndex]:=WideChar($0020);

      end;

   end;

  for LIndex:=Length(Result) downto 1 do
   begin

    if (Result[LIndex] <> WideChar($0020))
     then
      begin

       SetLength(Result,LIndex);
       Break;

      end;

   end;

 end;*)


end.

