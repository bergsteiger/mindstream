unit mgBasLst;

(*
//
// module:  mgbaslst.pas
// author:  Mickael P. Golovin
//
// $Id: mgbaslst.pas,v 1.2 2014/08/21 07:02:08 lulin Exp $
//
*)

{$Include m0Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  l3Types,
  l3Except,
  l3Base,
  l3ProtoObjectRefList,
  l3ProtoObject,

  m0Const,
  m0S32Lib
  ;

type
 TmgBaseList = class(Tl3ProtoObjectRefList)
 protected
  procedure Cleanup; override;
 end;//TmgBaseList

 EmgBasePointerList = class(El3Exception);

 TmgBasePointerList = class(TmgBaseList)
 protected
  procedure pm_SetCount(ACount: Longint); override;
  procedure DoSetItem(AIndex: Longint; const AItem: Tl3ProtoObject); override;
  procedure AllocItem(var AItem: Pointer); virtual; abstract;
  procedure AssignItem(AItem1: Pointer; AItem2: Pointer); virtual; abstract;
  function CompareKeyByItem(AKey: Pointer; AItem: Pointer): Integer; virtual;
  function FindItemByKey(AKey: Pointer; var AIndex: Longint): LongBool;
 public
  procedure DirectInsert(AIndex: Longint; const AItem: Tl3ProtoObject); override;
 end;//TmgBasePointerList

 EmgBaseHandle = class(El3Exception);

 TmgBaseHandle = class(Tl3ProtoObject)
 public
  procedure AssignHandle(AItem: TmgBaseHandle); virtual;
 end;//TmgBaseHandle

 TmgBaseHandleList = class(TmgBasePointerList)
 protected
  procedure AssignItem(AItem1: Pointer; AItem2: Pointer); override;
 end;//TmgBaseHandleList

implementation

resourcestring
  SEAssignHandle = 'Ќе могу присвоить описатель (метод не определен)';

// start class TmgBaseList

procedure TmgBaseList.Cleanup;
begin
 inherited;
end;

// start class TmgBasePointerList

procedure TmgBasePointerList.pm_SetCount(ACount: Longint);
var
 LCount: Longint;
 LIndex: Longint;
 LItem:  Pointer;
begin
 LCount := Count;
 if (LCount < ACount) then
 begin
  inherited pm_SetCount(ACount);
  for LIndex := LCount to Pred(ACount) do
  begin
   AllocItem(LItem);
   try
    inherited DoSetItem(LIndex, LItem);
   finally
    l3Free(LItem);
   end;//try..finally
  end;
 end//LCount < ACount
 else
 if (LCount > ACount) then
  inherited pm_SetCount(ACount);
end;

procedure TmgBasePointerList.DoSetItem(AIndex: Longint; const AItem: Tl3ProtoObject);
var
 LItem: Pointer;
begin
 AllocItem(LItem);
 try
  AssignItem(LItem, Pointer(AItem));
  inherited DoSetItem(AIndex, LItem);
 finally
  l3Free(LItem);
 end;//try..finally
end;

function TmgBasePointerList.CompareKeyByItem(AKey: Pointer; AItem: Pointer): Integer;
begin
 Result := 1;
end;

function TmgBasePointerList.FindItemByKey(AKey: Pointer; var AIndex: Longint): LongBool;
var
 LIndex1: Longint;
 LIndex2: Longint;
 LIndex3: Longint;
 LResult: Integer;
begin
 Result  := False;
 LIndex1 := 1;
 LIndex2 := Count;
 if (LIndex2 <> 0) then
 begin
  repeat
   if (LIndex2 < LIndex1) then
    Break;
   LIndex3 := (LIndex1 + LIndex2) shr 1;
   LResult := CompareKeyByItem(AKey, GetItem(Pred(LIndex3)));
   if (LResult < 0) then
    LIndex2 := Pred(LIndex3)
   else
   begin
    if (LResult > 0) then
     LIndex1 := Succ(LIndex3)
    else
    begin
     LIndex1 := LIndex3;
     Result  := True;
     Break;
    end;
   end;
  until False;
 end;
 AIndex := Pred(LIndex1);
end;

procedure TmgBasePointerList.DirectInsert(AIndex: Longint; const AItem: Tl3ProtoObject);
var
 LItem: Pointer;
begin
 AllocItem(LItem);
 try
  AssignItem(LItem, Pointer(AItem));
  inherited DirectInsert(AIndex, LItem);
 finally
  l3Free(LItem);
 end;//try..finally
end;

// start class TmgBaseHandle

procedure TmgBaseHandle.AssignHandle(AItem: TmgBaseHandle);
begin
 raise EmgBaseHandle.Create(SEAssignHandle);
end;

// start class TmgBaseHandleList

procedure TmgBaseHandleList.AssignItem(AItem1: Pointer; AItem2: Pointer);
var
 LItem1: TmgBaseHandle absolute AItem1;
 LItem2: TmgBaseHandle absolute AItem2;
begin
 LItem1.AssignHandle(LItem2);
end;

end.
