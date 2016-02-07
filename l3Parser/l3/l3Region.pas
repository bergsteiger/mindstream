unit l3Region;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3Region - }
{ Начат: 03.11.2004 13:20 }
{ $Id: l3Region.pas,v 1.9 2011/07/20 19:30:26 lulin Exp $ }

// $Log: l3Region.pas,v $
// Revision 1.9  2011/07/20 19:30:26  lulin
// {RequestLink:228688745}.
//
// Revision 1.8  2010/10/27 18:21:59  lulin
// {RequestLink:228688602}.
// - играемся с регионами.
//
// Revision 1.7  2009/07/02 18:34:03  lulin
// - избегаем лишней работы с регионами как с интерфейсами.
//
// Revision 1.6  2008/02/21 13:21:25  lulin
// - упрощаем наследование.
//
// Revision 1.5  2007/04/02 06:17:55  lulin
// - убрана неправильная зависимость.
//
// Revision 1.4  2007/04/02 06:14:30  lulin
// - cleanup.
//
// Revision 1.3  2007/04/02 06:09:58  lulin
// - cleanup.
//
// Revision 1.2  2005/05/24 13:08:57  lulin
// - для канвы используем интерфейс, а не объект.
//
// Revision 1.1  2004/11/03 10:39:36  lulin
// - new unit: l3Region.
//

{$Include l3Define.inc }

interface

uses
  Windows,

  Classes,
  
  l3InternalInterfaces,
  l3Types,
  l3Base,
  l3Units,
  l3ProtoObject
  ;

type
  Tl3Region = class(Tl3ProtoObject, Il3Region)
   {* - объект инкапсулирующий регион (hRegion). }
    private
    // internal fields
      f_Rgn : Tl3Rgn;
    protected
    // property methods
      function  pm_GetRgn: Tl3Rgn;
      procedure pm_SetRgn(Value: Tl3Rgn);
        {-}
      function  pm_GetEmpty: Bool;
        {-}
      function  pm_GetRect: Tl3SRect;
      procedure pm_SetRect(const Rect: Tl3SRect);
        {-}
      procedure Release;
        override;
        {-}
    public
    // public methods
      class function Make: Il3Region;
        {-}
      procedure BeforeAddToCache;
        override;
        {-}
      class function IsCacheable: Bool;
        override;
        {-}
      procedure FreeRgn;
        {-}
      function  ReleaseHandle: Tl3Rgn;
        {-}
      function  Combine(Source: Tl3Region; CombineMode: Integer): Integer;
        {-}
      function  CombineRect(const Rect: Tl3SRect; CombineMode: Integer): Integer;
        {* - комбинирует регион с прямоугольником Rect. }
      function  Offset(const P: Tl3SPoint): Integer;
        {* - осуществляет сдвиг региона. }
      function  CheckRgn: Tl3Rgn;
        {-}
      function  Invalidate(Wnd: hWnd; Erase: Bool): Bool;
        {-}
      function  Invert(DC: hDC): Bool;
        {* - инвертировать регион на DC. }
      procedure Assign(P: Tl3Region);
        {-}
      function  ContainsRect(const aRect: Tl3SRect): Bool;
        {* - определяет находится ли aRect в данном регионе. }
      // Il3Region
      function  Il3Region_Combine(const Source: Il3Region; CombineMode: Integer): Integer;
        {* - комбинирует регион с регионом Source. }
      function  Il3Region.Combine = Il3Region_Combine;
        {-}
      function  Clone: Il3Region;
        {-}
      procedure Il3Region_Assign(const Source: Il3Region);
        {* - присваивает региону Source. }
      procedure Il3Region.Assign = Il3Region_Assign;
        {-}
    public
    // public properties
      property Rgn: Tl3Rgn
        read pm_GetRgn
        write pm_SetRgn;
        {-}
      property Rect: Tl3SRect
        read pm_GetRect
        write pm_SetRect;
        {-}
      property Empty: Boolean
        read pm_GetEmpty;
        {-}
  end;//Tl3Region

function l3FreeRgn(var Rgn: Tl3Rgn): Bool;
  {-}
  
implementation

function l3FreeRgn(var Rgn: Tl3Rgn): Bool;
  {-}
begin
 if (Rgn = 0) then
  Result := true
 else
 begin
  Result := DeleteObject(Rgn);
  l3System.DecRgnCount;
  Rgn := 0;
 end;//Rgn = 0
end;

function l3CombineRgn(var Rgn1: Tl3Rgn; Rgn2: Tl3Rgn; CombineMode: Integer): Integer;
  {-}
begin
 Result := Windows.CombineRgn(Rgn1, Rgn1, Rgn2, CombineMode);
end;

function l3CombineRgnWithRect(var Rgn: Tl3Rgn; const Rect: Tl3SRect; CombineMode: Integer): Integer;
  {-}
var
 RectRgn : Tl3Rgn;
begin
 RectRgn := Rect.CreateRgn;
 try
  Result := CombineRgn(Rgn, Rgn, RectRgn, CombineMode);
 finally
  l3FreeRgn(RectRgn);
 end;{try..finally}
end;

// start class Tl3Region

class function Tl3Region.Make: Il3Region;
  {-}
var
 l_R : Tl3Region;
begin
 l_R := Create;
 try
  Result := l_R;
 finally
  l3Free(l_R);
 end;//try..finally
end;

procedure Tl3Region.Release;
  {override;}
  {-}
begin
 FreeRgn;
 inherited;
end;

procedure Tl3Region.BeforeAddToCache;
  //override;
  {-}
begin
 if not pm_GetEmpty then
  Combine(Self, RGN_DIFF);
 inherited;
end;

class function Tl3Region.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := true;
end;

function Tl3Region.pm_GetRgn: Tl3Rgn;
  {-}
begin
 if (Self = nil) then
  Result := 0
 else
  Result := f_Rgn;
end;

procedure Tl3Region.pm_SetRgn(Value: Tl3Rgn);
begin
 if (f_Rgn <> Value) then
 begin
  FreeRgn;
  f_Rgn := Value;
 end;//f_Rgn <> Value
end;

function Tl3Region.pm_GetEmpty: Bool;
  {-}
var
 l_Rect : Tl3SRect;
begin
 Result := (f_Rgn = 0) OR (l_Rect.GetRgn(f_Rgn) = NULLREGION);
end;

procedure Tl3Region.FreeRgn;
  {-}
begin
 l3FreeRgn(f_Rgn);
end;

function Tl3Region.ReleaseHandle: Tl3Rgn;
  {-}
begin
 if (Self = nil) then
  Result := 0
 else
 begin
  Result := f_Rgn;
  f_Rgn := 0;
 end;//Self = nil
end;

function Tl3Region.pm_GetRect: Tl3SRect;
begin
 if (Self = nil) then
  Result := l3SRect0
 else
  Result.GetRgn(Rgn);
end;

procedure Tl3Region.pm_SetRect(const Rect: Tl3SRect);
  {-}
begin
 if (Self <> nil) then
 begin
  FreeRgn;
  f_Rgn := Rect.CreateRgn;
 end;//Self <> nil
end;

function Tl3Region.Combine(Source: Tl3Region; CombineMode: Integer): Integer;
  {-}
begin
 if (Source = nil) OR (Source.f_Rgn = 0) then
 begin
  if (CombineMode = RGN_AND) then
  begin
   Rect := l3SRect0;
   Result := Windows.NULLREGION;
  end//CombineMode = RGN_AND
  else
   Result := Windows.Error;
 end//Source = nil
 else
 begin
  CheckRgn;
  Result := l3CombineRgn(f_Rgn, Source.f_Rgn, CombineMode);
 end;//Source = nil..
end;

function Tl3Region.Il3Region_Combine(const Source: Il3Region; CombineMode: Integer): Integer;
  {* - комбинирует регион с регионом Source. }
begin
 if (Source = nil) OR (Source.Rgn = 0) then
 begin
  if (CombineMode = RGN_AND) then
  begin
   Rect := l3SRect0;
   Result := Windows.NULLREGION;
  end//CombineMode = RGN_AND
  else
   Result := Windows.Error;
 end//Source = nil
 else
 begin
  CheckRgn;
  Result := l3CombineRgn(f_Rgn, Source.Rgn, CombineMode);
 end;//Source = nil..
end;

function Tl3Region.CombineRect(const Rect: Tl3SRect; CombineMode: Integer): Integer;
  {-}
begin
 if not Rect.IsEmpty then
 begin
  CheckRgn;
  Result := l3CombineRgnWithRect(f_Rgn, Rect, CombineMode);
 end//not Rect.IsEmpty
 else
  Result := Windows.Error;
end;

function Tl3Region.Offset(const P: Tl3SPoint): Integer;
  {-}
begin
 if (Self = nil) OR (f_Rgn = 0) then
  Result := Windows.NULLREGION
 else
 if ((Abs(P.X) >= High(SmallInt)) OR (Abs(P.Y) >= High(SmallInt))) then
 begin
  Rgn := 0;
  Result := Windows.NULLREGION;
 end//(Abs(P.X) >= High(SmallInt)..
 else
  Result := Windows.OffsetRgn(f_Rgn, P.X, P.Y);
end;

function Tl3Region.CheckRgn: Tl3Rgn;
  {-}
begin
 if (f_Rgn = 0) then
  f_Rgn := l3SRect0.CreateRgn;
 Result := f_Rgn;
end;

function Tl3Region.Invalidate(Wnd: hWnd; Erase: Bool): Bool;
  {-}
begin
 if (Self <> nil) AND (f_Rgn <> 0) then
 begin
  Windows.InvalidateRgn(Wnd, f_Rgn, Erase);
  Result := true;
 end//Self <> nil
 else
  Result := false;
end;

function Tl3Region.Invert(DC: hDC): Bool;
  {-инвертировать регион на DC}
begin
 if (Self <> nil) AND (f_Rgn <> 0) then
  Result := Windows.InvertRgn(DC, f_Rgn)
 else
  Result := false;
end;

procedure Tl3Region.Assign(P: Tl3Region);
  {override;}
  {-}
begin
 FreeRgn;
 if (P <> nil) AND not P.pm_GetEmpty then
  Combine(P, RGN_OR);
end;

function Tl3Region.Clone: Il3Region;
  {-}
type
 Rl3Region = class of Tl3Region;
var
 l_Reg : Tl3Region;
begin
 l_Reg := Rl3Region(ClassType).Create;
 try
  l_Reg.Assign(Self);
  Result := l_Reg;
 finally
  l3Free(l_Reg);
 end;//try..finally
end;

procedure Tl3Region.Il3Region_Assign(const Source: Il3Region);
  {* - присваивает региону Source. }
begin
 FreeRgn;
 Il3Region_Combine(Source, RGN_OR);
end;

function Tl3Region.ContainsRect(const aRect: Tl3SRect): Bool;
  {* - определяет находится ли aRect в данном регионе }
begin
 if pm_GetEmpty then
  Result := false
 else
  Result := Windows.RectInRegion(Rgn, aRect.R.WR);
end;
  
end.

