unit    mgLngLst;

(*
//
// module:  mglnglst.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: mglnglst.pas,v 1.2 2014/08/21 07:02:08 lulin Exp $
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

 l3Types,
 l3Base,

 m0Const,
 //m0AddTyp,
 //m0MEMLib,
 //m0IDPLib,
 //mgConst,
 mgBasLst
 ;

type
 TmgLangFormHandle = class(TmgBaseHandle)
 private
  FStatus: longint;
  FValue: string;
 protected
    // internal methods
  class function IsCacheable: Bool;
   override;
        {-}
 public
  property Status: longint Read FStatus Write FStatus;
  property Value: string Read FValue Write FValue;
  procedure AssignHandle(AItem: TmgBaseHandle);
   override;
 end;//TmgLangFormHandle

 PmgLangFormHandleKey = ^TmgLangFormHandleKey;

 TmgLangFormHandleKey = packed record
  RBuff: PAnsiChar;
  RSize: longint;
 end;//TmgLangFormHandleKey

 TmgLangFormHandleList = class(TmgBaseHandleList)
 private
  function pm_GetHandle(AIndex: longint): TmgLangFormHandle; reintroduce;
 protected
  procedure AllocItem(var AItem: Pointer); override;
  function CompareKeyByItem(AKey: Pointer; AItem: Pointer): integer;
   override;
 public
  property Handles[AIndex: longint]: TmgLangFormHandle Read pm_GetHandle;
  function BinSearchByKey(ABuff: PAnsiChar; ASize: longint; var AIndex: longint): longbool;
 end;//TmgLangFormHandleList

implementation

uses
  m2MemLib
  ;

// start class TmgLangFormHandle

class function TmgLangFormHandle.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := True;
end;

procedure TmgLangFormHandle.AssignHandle(AItem: TmgBaseHandle);
var
 LItem: TmgLangFormHandle absolute AItem;
begin
 Status := LItem.Status;
 Value  := LItem.Value;
end;

// start class TmgLangFormHandleList

function TmgLangFormHandleList.pm_GetHandle(AIndex: longint): TmgLangFormHandle;
begin
 Result := TmgLangFormHandle(GetItem(AIndex));
end;

procedure TmgLangFormHandleList.AllocItem(var AItem: Pointer);
var
 LItem: TmgLangFormHandle absolute AItem;
begin
 LItem := TmgLangFormHandle.Create;
end;

function TmgLangFormHandleList.CompareKeyByItem(AKey: Pointer; AItem: Pointer): integer;
var
 LItem: TmgLangFormHandle absolute AItem;
 LKey:  PmgLangFormHandleKey absolute AKey;
begin
 with LKey^ do
  with LItem do
   Result := m2MEMCompare(Pointer(RBuff), RSize, Pointer(Value), Length(Value));
end;

function TmgLangFormHandleList.BinSearchByKey(ABuff: PAnsiChar; ASize: longint; var AIndex: longint): longbool;
var
 LKey: TmgLangFormHandleKey;
begin
 with LKey do
 begin
  RBuff := ABuff;
  RSize := ASize;
 end;
 Result := FindItemByKey( @LKey, AIndex);
end;

end.
