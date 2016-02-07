unit    m0DTFLib;

(*
//
// module:  m0dtflib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0dtflib.pas,v 1.1 2014/08/20 16:31:25 lulin Exp $
//
*)

{$I m0Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  m0Const{,
  m0AddTyp}
  ;


procedure m0DTFSave();

procedure m0DTFLoad();

procedure m0DTFRest();


function m0DTFDateToStr(ADateTime: TDateTime): string;

function m0DTFTimeToStr(ADateTime: TDateTime): string;

function m0DTFDateTimeToStr(ADateTime: TDateTime): string;


function m0DTFStrToDate(const AString: string): TDateTime;

function m0IsValidStrDate(const AString: string): Boolean;
{ Проверяет переданное строковое представление даты на правильность }

function m0DTFStrToTime(const AString: string): TDateTime;

function m0DTFStrToDateTime(const AString: string): TDateTime;


implementation


 { -- unit.private -- }

var
  GThreadSafe: TRTLCriticalSection;

  GDateSeparator:   Char;
  GLongDateFormat:  string;
  GLongTimeFormat:  string;
  GShortDateFormat: string;
  GShortTimeFormat: string;
  GTimeSeparator:   Char;


procedure _Initialization();
begin

  InitializeCriticalSection(GThreadSafe);

end;

procedure _Finalization();
begin

  DeleteCriticalSection(GThreadSafe);

end;


 { -- unit.public -- }

procedure m0DTFSave();
begin

  if IsMultiThread then
  begin

    EnterCriticalSection(GThreadSafe);

  end;

  GDateSeparator := {$ifDef XE}FormatSettings.{$EndIf}DateSeparator;
  GTimeSeparator := {$ifDef XE}FormatSettings.{$EndIf}TimeSeparator;

  GLongDateFormat := {$ifDef XE}FormatSettings.{$EndIf}LongDateFormat;
  GLongTimeFormat := {$ifDef XE}FormatSettings.{$EndIf}LongTimeFormat;

  GShortDateFormat := {$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat;
  GShortTimeFormat := {$ifDef XE}FormatSettings.{$EndIf}ShortTimeFormat;

end;

procedure m0DTFLoad();
begin

  {$ifDef XE}FormatSettings.{$EndIf}DateSeparator := Cm0DateSeparator;
  {$ifDef XE}FormatSettings.{$EndIf}TimeSeparator := Cm0TimeSeparator;

  {$ifDef XE}FormatSettings.{$EndIf}LongDateFormat := Cm0LongDateFormat;
  {$ifDef XE}FormatSettings.{$EndIf}LongTimeFormat := Cm0LongTimeFormat;

  {$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat := Cm0ShortDateFormat;
  {$ifDef XE}FormatSettings.{$EndIf}ShortTimeFormat := Cm0ShortTimeFormat;

end;

procedure m0DTFRest();
begin

  {$ifDef XE}FormatSettings.{$EndIf}ShortTimeFormat := GShortTimeFormat;
  {$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat := GShortDateFormat;

  {$ifDef XE}FormatSettings.{$EndIf}LongTimeFormat := GLongTimeFormat;
  {$ifDef XE}FormatSettings.{$EndIf}LongDateFormat := GLongDateFormat;

  {$ifDef XE}FormatSettings.{$EndIf}TimeSeparator := GTimeSeparator;
  {$ifDef XE}FormatSettings.{$EndIf}DateSeparator := GDateSeparator;

  if IsMultiThread then
  begin

    LeaveCriticalSection(GThreadSafe);

  end;

end;

function m0DTFDateToStr(ADateTime: TDateTime): string;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := DateToStr(ADateTime);

  finally

    m0DTFRest();

  end;

end;

function m0DTFTimeToStr(ADateTime: TDateTime): string;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := TimeToStr(ADateTime);

  finally

    m0DTFRest();

  end;

end;

function m0DTFDateTimeToStr(ADateTime: TDateTime): string;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := DateTimeToStr(ADateTime);

  finally

    m0DTFRest();

  end;

end;

function m0IsValidStrDate(const AString: string): Boolean;
var
 l_D: TDateTime;
begin
  m0DTFSave;
  try
    m0DTFLoad;
    l_D:= 0;
    Result:= StrToDateDef(AString, l_D) <> l_D;
  finally
    m0DTFRest();
  end;
end;

function m0DTFStrToDate(const AString: string): TDateTime;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := StrToDate(AString);

  finally

    m0DTFRest();

  end;

end;

function m0DTFStrToTime(const AString: string): TDateTime;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := StrToTime(AString);

  finally

    m0DTFRest();

  end;

end;

function m0DTFStrToDateTime(const AString: string): TDateTime;
begin

  m0DTFSave();
  try

    m0DTFLoad();

    Result := StrToDateTime(AString);

  finally

    m0DTFRest();

  end;

end;


initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0dtflib.pas initialization enter'); {$EndIf}
  _Initialization();

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0dtflib.pas initialization leave'); {$EndIf}
finalization
  _Finalization();


end.
