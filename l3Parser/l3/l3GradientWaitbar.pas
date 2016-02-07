unit l3GradientWaitbar;

(*-----------------------------------------------------------------------------
 Название:   l3GradientWaitbar
 Автор:      Морозов М. А.
 Назначение: Элемент анимации "переход цвета". Работает с TBitmap в памяти,
             который можно копировать для отображения при наступлении события
             OnPaint;
 Версия:     $Id: l3GradientWaitbar.pas,v 1.10 2011/10/26 18:02:22 lulin Exp $

 $Log: l3GradientWaitbar.pas,v $
 Revision 1.10  2011/10/26 18:02:22  lulin
 {RequestLink:278135821}.
 - чистка кода.

 Revision 1.9  2011/10/20 17:24:49  lulin
 {RequestLink:294588730}.

 Revision 1.8  2011/09/20 15:01:40  lulin
 {RequestLink:272663344}.

 Revision 1.7  2011/05/18 17:46:00  lulin
 {RequestLink:266409354}.

 Revision 1.6  2011/05/18 12:09:16  lulin
 {RequestLink:266409354}.

 Revision 1.5  2009/02/09 11:54:19  oman
 - fix: Защищаемся от многопоточности (К-136259551)

 Revision 1.4  2007/02/27 09:55:02  lulin
 - cleanup.

 Revision 1.3  2006/12/15 11:30:48  lulin
 - добавлена картинка со счетчиком ссылок.

 Revision 1.2  2005/04/20 08:51:05  mmorozov
 - change log;

 Revision 1.1  2005/04/20 08:50:31  mmorozov
 new: Элемент анимации "переход цвета". Работает с TBitmap в памяти, который можно копировать для отображения при наступлении события OnPaint;


-----------------------------------------------------------------------------*)

{$Include l3Define.inc}

interface

uses
  Windows,
  Graphics,
  Messages,
  SysUtils,
  ExtCtrls,
  Classes,

  l3Base,
  l3ProtoObject
  ;
  
type
  Tl3GradientWaitbar = class(Tl3ProtoObject)
  private
  // internal fields
   FLeft    : Integer;
   FTop     : Integer;
   FWidth   : Integer;
   FHeight  : Integer;  
   FBackBuf : TBitmap;
   FColor1  : TColor;
   FColor2  : TColor;
   FSpeed   : Integer;
   FTimer   : TTimer;
   TmpB     : TBitmap;
   FOnPaint : TNotifyEvent;
  private
  // internal methods
   procedure DoPaint;
     {-}
   procedure BuildBackBuffer;
     {-}
   procedure OnTimer(Sender: TObject);
     {-}
   function GetActive: Boolean;
     {-}
   procedure SetActive(const Value: Boolean);
     {-}
   procedure SetColor1(const Value: TColor);
     {-}
   procedure SetColor2(const Value: TColor);
     {-}
  protected
  // protected methods
   procedure Cleanup;
     override;
     {-}
  public
  // public methods
   constructor Create;
     reintroduce;
     virtual;
     {-}
   procedure ManualProgress(Progress: Integer);
     {-}
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
     {-}
   procedure DoProgress;
     {-}
  public
  // public properties
   property Left : Integer
     read FLeft
     write FLeft;
     {-}
   property Top : Integer
     read FTop
     write FTop;
     {-}
   property Width : Integer
     read FWidth
     write FWidth;
     {-}
   property Height : Integer
     read FHeight
     write FHeight;
     {-}
   property BackBuf : TBitmap
     read FBackBuf;
     {-}
   property Active: Boolean
     read GetActive
     write SetActive;
     {-}
   property Color1: TColor
     read FColor1
     write SetColor1;
     {-}
   property Color2: TColor
     read FColor2
     write SetColor2;
     {-}
   property Speed: Integer
     read FSpeed
     write FSpeed
     default 1;
     {-}
  public
  // events
    property OnPaint : TNotifyEvent
      read FOnPaint
      write FOnPaint;
      {-}
  end;//Tl3GradientWaitbar

implementation

uses
  l3Bitmap
  ;

{ Tl3GradientWaitbar }

constructor Tl3GradientWaitbar.Create;
begin
 FSpeed := 1;
 FTimer := TTimer.Create(nil);
 FTimer.Interval := 1;
 FTimer.OnTimer := OnTimer;
 FBackBuf := Tl3Bitmap.Create;
 TmpB := Tl3Bitmap.Create;
 FColor1 := clSkyBlue;
 FColor2 := clBlue;
 SetBounds(Left, Top, 150, 25);
end;

procedure Tl3GradientWaitbar.Cleanup;
// override;
{-}
begin
 l3Free(FTimer);
 l3Free(FBackBuf);
 l3Free(TmpB);
 inherited;
end;

procedure Tl3GradientWaitbar.BuildBackBuffer;

type
 TRGB = record
  R,G,B : byte;
 end;

 function ColorToRGB(Color:TColor):TRGB;
 var
  Cl: Longint;
 Begin
  Cl := Graphics.ColorToRGB(Color);
  Result.R:=GetRValue(Cl);
  Result.G:=GetGValue(Cl);
  Result.B:=GetBValue(Cl);
 End;

var
 Rect: TRect;
 DestRGB, CurrRGB, SourceRGB: TRGB;
{
 RMode, GMode, BMode: Integer;
} 
 X: Integer;
 HalfWidth: Integer;
 Discrete : real;
 RDelta,GDelta,BDelta: Real;

begin
 FBackBuf.Canvas.Lock;
 try
  Assert(FBackBuf <> nil);
  FBackBuf.Width := Width;
  Assert(FBackBuf <> nil);
  FBackBuf.Height := Height;
  Assert(FBackBuf <> nil);
  with FBackBuf.Canvas do
  begin
   SourceRGB:=ColorToRGB(FColor1);
   DestRGB:=ColorToRGB(FColor2);
   CurrRGB:=SourceRGB;

   RDelta := (DestRGB.R - SourceRGB.R) / 255;
   GDelta := (DestRGB.G - SourceRGB.G) / 255;
   BDelta := (DestRGB.B - SourceRGB.B) / 255;

   Rect.top:=0;
   Rect.bottom:=Height;

   Discrete := Width / 512;

   For X:=0 to 255 do
   begin
    Rect.Left   := Round((X) * Discrete);
    Rect.right  := Round((X+1)* Discrete);
    CurrRGB.R := SourceRGB.R + Round(X*RDelta);
    CurrRGB.G := SourceRGB.G + Round(X*GDelta);
    CurrRGB.B := SourceRGB.B + Round(X*BDelta);
    Brush.Color:=TColor(rgb(CurrRGB.R,CurrRGB.G,CurrRGB.B));
    FillRect(Rect);
   end;//For X:=0 to 255
   HalfWidth := Width div 2;
   Assert(FBackBuf <> nil);
   StretchBlt(FBackBuf.Canvas.Handle, HalfWidth, 0, HalfWidth+(Width mod 2), Height,
     FBackBuf.Canvas.Handle, HalfWidth-1, 0, -HalfWidth, Height, cmSrcCopy);
  end;//with FBackBuf.Canvas
 finally
  Assert(FBackBuf <> nil);
  Assert(FBackBuf.Canvas <> nil);
  FBackBuf.Canvas.UnLock;
 end;//try..finally
 DoPaint;
end;

procedure Tl3GradientWaitbar.OnTimer(Sender: TObject);
begin
 DoProgress;
 DoPaint;
end;

procedure Tl3GradientWaitbar.DoProgress;
{-}
begin
 TmpB.Canvas.Lock;
 try
  FBackBuf.Canvas.Lock;
  TmpB.Width  := FSpeed;
  TmpB.Height := Height;
  BitBlt(TmpB.Canvas.Handle, 0, 0, FSpeed, Height,
    FBackBuf.Canvas.Handle, Width-FSpeed,0, cmSrcCopy);
  BitBlt(FBackBuf.Canvas.Handle, FSpeed, 0, Width-FSpeed, Height,
    FBackBuf.Canvas.Handle, 0,0, cmSrcCopy);
  BitBlt(FBackBuf.Canvas.Handle, 0, 0, FSpeed, Height,
    TmpB.Canvas.Handle, 0,0, cmSrcCopy);
  FBackBuf.Canvas.UnLock;
 finally
  TmpB.Canvas.UnLock;
 end;//try..finally 
end;

function Tl3GradientWaitbar.GetActive: Boolean;
begin
 Result := FTimer.Enabled;
end;

procedure Tl3GradientWaitbar.ManualProgress(Progress: Integer);
begin
 TmpB.Canvas.Lock;
 try
  TmpB.Width  := Progress;
  TmpB.Height := Height;
  FBackBuf.Canvas.Lock;
  try
   BitBlt(TmpB.Canvas.Handle, 0, 0, Progress, Height,
     FBackBuf.Canvas.Handle, Width-Progress,0, cmSrcCopy);
   BitBlt(FBackBuf.Canvas.Handle, Progress, 0, Width-Progress, Height,
     FBackBuf.Canvas.Handle, 0,0, cmSrcCopy);
   BitBlt(FBackBuf.Canvas.Handle, 0, 0, Progress, Height,
     TmpB.Canvas.Handle, 0,0, cmSrcCopy);
  finally
   FBackBuf.Canvas.UnLock;
  end;//try..finally
 finally
  TmpB.Canvas.UnLock;
 end;//try..finally
 DoPaint;
end;

procedure Tl3GradientWaitbar.SetActive(const Value: Boolean);
begin
 FTimer.Enabled := Value;
end;

procedure Tl3GradientWaitbar.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
 Assert(Self <> nil);
 if (Self = nil) then
  Exit;
 FLeft := ALeft;
 FTop  := ATop;
 if (AWidth <> FWidth) or (AHeight <> FHeight) then
 begin
  FWidth := AWidth;
  FHeight := AHeight;
  BuildBackBuffer;
 end;
end;

procedure Tl3GradientWaitbar.SetColor1(const Value: TColor);
begin
 if FColor1 <> Value then
 begin
  FColor1 := Value;
  BuildBackBuffer;
 end;
end;

procedure Tl3GradientWaitbar.SetColor2(const Value: TColor);
begin
 if FColor2 <> Value then
 begin
  FColor2 := Value;
  BuildBackBuffer;
 end;
end;

procedure Tl3GradientWaitbar.DoPaint;
begin
 if Assigned(FOnPaint) then
  FOnPaint(Self);
end;

end.