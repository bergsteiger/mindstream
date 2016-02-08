unit l3StrRecList;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Бабанин Вова                 }
{ Модуль: l3StrRecList  - Tl3FieldSortRecList с динамической строкой }
{ Начат: 25.04.2006 09:30             }
{ $Id: l3StrRecList.pas,v 1.6 2014/10/09 13:54:40 voba Exp $ }

// $Log: l3StrRecList.pas,v $
// Revision 1.6  2014/10/09 13:54:40  voba
//  k:565492100
//
// Revision 1.5  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.4  2010/02/26 17:34:00  lulin
// {RequestLink:190677208}.
// - финальный аккорд.
//
// Revision 1.3  2010/02/15 14:39:19  voba
// - K : 190679759
//
// Revision 1.2  2010/02/02 14:16:09  voba
// - add comment&
//
// Revision 1.1  2010/02/02 14:13:16  voba
// - add Tl3StrRecList (наследник Tl3FieldSortRecList) список записей со строковым первым полем
//

{$Include l3Define.inc }

interface

uses
  l3Types,
  l3ProtoPtrRecListPrim,
  l3FieldSortRecList,
  l3NotifyPtrList,
  l3Interfaces
  ;

type

 // RecList c поддержкой нотификации

 //_l3NotifierBase_Parent_ = Tl3FieldSortRecList;
 //{$Include l3NotifierBase.imp.pas}
 //_l3ChangingChangedNotifier_Parent_ = _l3NotifierBase_;


 _l3ChangingChangedNotifier_Parent_ = Tl3FieldSortRecList;
 {$Include l3ChangingChangedNotifier.imp.pas}
 _l3LockedChange_Parent_ = _l3ChangingChangedNotifier_;
 {$Include l3LockedChange.imp.pas}
 {_l3LockedChange_}


 // RecList c поддержкой нотификации
 Tl3IntfRecList = class(_l3LockedChange_ {_l3NotifierBase_}{ , Il3ChangeNotifier})
  protected
   procedure DoDelete(Index: Integer); override;
   procedure DirectInsert(anIndex: Integer; const aData : VOID); override;

 end;

  // первое поле рекорда всегда Tl3InterfacedString
  Tl3StrRecList = class(Tl3IntfRecList)
    protected
    // internal methods
       procedure BeforeFreeItem(var aPlace: VOID); override;
       //Tl3InterfacedString.Make(aString.AsWStr);
      //
    public

  end; //Tl3StrRecList

implementation

uses
  SysUtils,
  Math,
  l3Base,
  l3MinMax,
  m2MemLib,
  l3InterfacedString
  ;


{$Include l3ChangingChangedNotifier.imp.pas}

{$Include l3LockedChange.imp.pas}

//{$Include l3NotifierBase.imp.pas}

// start class Tl3IntfRecList

procedure Tl3IntfRecList.DoDelete(Index: Integer);
begin
 Inherited;
 CallNotify(ntDelete, Index);
end;

procedure Tl3IntfRecList.DirectInsert(anIndex: Integer; const aData : VOID); 
begin
 Inherited;
 CallNotify(ntInsert, anIndex);
end;

// start class Tl3StrRecList

type
 Pl3InterfacedString = ^Tl3InterfacedString;

procedure Tl3StrRecList.BeforeFreeItem(var aPlace: VOID);
begin
 FreeAndNil(Pl3InterfacedString(@aPlace)^);
 Inherited;
end;

// нужно переписать DoCompare для сортировки по первому (строковому) полю. Пока не используется 
(*
function Tl3FieldSortRecList.DoCompare(const A;
                                       const B;
                                       aFldCount : Cardinal): Integer;
  //override;
  {-}

function lCompareField(const A;
                       const B;
                       aSize  : Integer): Integer;
  {-}
begin
 Case aSize of
  SizeOf(Byte) :
   Result := Integer(Byte(A)) - Integer(Byte(B));
  SizeOf(SmallInt) :
   Result := Integer(Word(A)) - Integer(Word(B));
  SizeOf(LongInt) :
   Result := Sign(Int64(Cardinal(A)) - Int64(Cardinal(B)));
  SizeOf(Int64) :
   Result := Sign(Int64(A) - Int64(B));
  else
   Result := m2MEMCompare(@A, @B, aSize);
 end;//Case aSize
end;

var
 l_Index  : Integer;
 l_MaxIndex : Integer;

 l_Offs   : Integer;
 l_Size   : SmallInt;
 l_InvSort: TValueSign;
 l_A, l_B : PAnsiChar;
 l_FldID  : SmallInt;

begin
 Result := 0;
 l_A := @A;
 l_B := @B;

 if aFldCount = 0 then
  l_MaxIndex := High(f_SortFields)
 else
  l_MaxIndex := Min(High(f_SortFields), Pred(aFldCount));

 for l_Index := Low(f_SortFields) to l_MaxIndex do
 begin
  l_FldID := f_SortFields[l_Index];
  l_InvSort := IfThen(l_FldID < 0, -1, 1); //Sign(l_FldID);
  l_FldID := Pred(Abs(l_FldID));
  l_Size := f_FieldSize[l_FldID];
  l_Offs := f_FieldOffs[l_FldID];
  Assert(l_Size > 0);
  Result := l_InvSort * lCompareField((l_A + l_Offs)^,
                          (l_B + l_Offs)^,
                          l_Size);
  if (Result <> 0) then
   Exit;
 end;//for l_Index
end;
*)


end.
