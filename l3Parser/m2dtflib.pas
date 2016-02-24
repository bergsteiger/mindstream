(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
unit    m2DTFLib;


{$I m2Define.inc}

 interface


 uses
         Windows,
        SysUtils,

        m2AddPrc;


 procedure   m2DTFSave            (
                                  );

 procedure   m2DTFLoad            (
                                  );

 procedure   m2DTFRest            (
                                  );


 function    m2DTFDateToStr       (const ADateTime: TDateTime
                                  ): AnsiString;

 function    m2DTFTimeToStr       (const ADateTime: TDateTime
                                  ): AnsiString;

 function    m2DTFDateTimeToStr   (const ADateTime: TDateTime
                                  ): AnsiString;


 function    m2DTFStrToDate       (const AString: AnsiString
                                  ): TDateTime;

 function    m2DTFStrToDateEx     (const AString: AnsiString
                                  ): TDateTime;


 function    m2DTFStrToTime       (const AString: AnsiString
                                  ): TDateTime;

 function    m2DTFStrToTimeEx     (const AString: AnsiString
                                  ): TDateTime;


 function    m2DTFStrToDateTime   (const AString: AnsiString
                                  ): TDateTime;


 implementation


 const
        CDateSeparator=           '/';
        CTimeSeparator=           ':';

        CLongDateFormat=          'dd/mm/yyyy';
        CLongTimeFormat=          'hh:nn:ss';

        CShortDateFormat=         'dd/mm/yyyy';
        CShortTimeFormat=         'hh:nn:ss';


 var
        GRTLCriticalSection:      TRTLCriticalSection;

        GDateSeparator:           Char;
        GLongDateFormat:          String;
        GLongTimeFormat:          String;
        GShortDateFormat:         String;
        GShortTimeFormat:         String;
        GTimeSeparator:           Char;


 procedure   m2DTFSave(
                      );
 begin

  EnterCriticalSection(GRTLCriticalSection);

  GDateSeparator:= {$IfDef XE}FormatSettings.{$EndIf}DateSeparator;
  GTimeSeparator:= {$IfDef XE}FormatSettings.{$EndIf}TimeSeparator;

  GLongDateFormat:= {$IfDef XE}FormatSettings.{$EndIf}LongDateFormat;
  GLongTimeFormat:= {$IfDef XE}FormatSettings.{$EndIf}LongTimeFormat;

  GShortDateFormat:= {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat;
  GShortTimeFormat:= {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat;

 end;

 procedure m2DTFLoad(
                    );
 begin

   {$IfDef XE}FormatSettings.{$EndIf}DateSeparator:=CDateSeparator;
   {$IfDef XE}FormatSettings.{$EndIf}TimeSeparator:=CTimeSeparator;

   {$IfDef XE}FormatSettings.{$EndIf}LongDateFormat:=CLongDateFormat;
   {$IfDef XE}FormatSettings.{$EndIf}LongTimeFormat:=CLongTimeFormat;

   {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat:=CShortDateFormat;
   {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat:=CShortTimeFormat;

 end;

 procedure m2DTFRest(
                    );
 begin

   {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat:=GShortTimeFormat;
   {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat:=GShortDateFormat;

   {$IfDef XE}FormatSettings.{$EndIf}LongTimeFormat:=GLongTimeFormat;
   {$IfDef XE}FormatSettings.{$EndIf}LongDateFormat:=GLongDateFormat;

   {$IfDef XE}FormatSettings.{$EndIf}TimeSeparator:=GTimeSeparator;
   {$IfDef XE}FormatSettings.{$EndIf}DateSeparator:=GDateSeparator;

  LeaveCriticalSection(GRTLCriticalSection);

 end;

 function    m2DTFDateToStr(const ADateTime: TDateTime
                           ): AnsiString;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=DateToStr(ADateTime);

   finally

    m2DTFRest();

   end;

 end;

 function    m2DTFTimeToStr(const ADateTime: TDateTime
                           ): AnsiString;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=TimeToStr(ADateTime);

   finally

    m2DTFRest();

   end;

 end;

 function    m2DTFDateTimeToStr(const ADateTime: TDateTime
                               ): AnsiString;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=DateTimeToStr(ADateTime);

   finally

    m2DTFRest();

   end;

 end;

 function    m2DTFStrToDate(const AString: AnsiString
                           ): TDateTime;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=StrToDate(AString);

   finally

    m2DTFRest();

   end;

 end;

 function    m2DTFStrToDateEx(const AString: AnsiString
                             ): TDateTime;

  function    __Correct(const AString: AnsiString
                       ): AnsiString;
  var
        LIndex:                   LongInt;
  begin

   Result:=AString;

   for LIndex:=1 to Length(Result) do
    begin

     if not(Result[LIndex] in ['0'..'9'])
      then
       begin

        Result[LIndex]:=CDateSeparator;

       end;

    end;

  end;

 begin

  Result:=m2DTFStrToDate(__Correct(AString));

 end;

 function    m2DTFStrToTime(const AString: AnsiString
                           ): TDateTime;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=StrToTime(AString);

   finally

    m2DTFRest();

   end;

 end;

 function    m2DTFStrToTimeEx(const AString: AnsiString
                             ): TDateTime;

  function    __Correct(const AString: AnsiString
                       ): AnsiString;
  var
        LIndex:                   LongInt;
  begin

   Result:=AString;

   for LIndex:=1 to Length(Result) do
    begin

     if not(Result[LIndex] in ['0'..'9'])
      then
       begin

        Result[LIndex]:=CTimeSeparator;

       end;

    end;

  end;

 begin

  Result:=m2DTFStrToTime(__Correct(AString));

 end;

 function    m2DTFStrToDateTime(const AString: AnsiString
                               ): TDateTime;
 begin

  m2DTFSave();
   try

    m2DTFLoad();

    Result:=StrToDateTime(AString);

   finally

    m2DTFRest();

   end;

 end;


 {$I *.inc}


end.

