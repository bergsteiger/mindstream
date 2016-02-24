unit l3ImageList;


{$Include l3Define.inc}

interface

uses
  l3InternalInterfaces
  {$If not defined(NoVCL)}
  ,
  ImgList
  {$IfEnd} //not NoVCL
  ,
  l3CProtoObject,
  l3Interfaces,
  l3Units,
  l3Core
  ;

type
 Tl3ImageList = class(Tl3CProtoObject, Il3ImageList)
 private
 // private fields
   f_List : TCustomImageList;
 protected
 // realized methods
   procedure Draw(const aCanvas: Il3Canvas;
    const aRect: Tl3SRect;
    aFillColor: Tl3Color;
    Index: Integer;
    Enabled: Boolean = True); overload; 
   procedure Draw(const aCanvas: Il3Canvas;
    X: Integer;
    Y: Integer;
    Index: Integer;
    Enabled: Boolean = True); overload; 
   procedure Draw(const aCanvas: Il3Canvas;
    X: Integer;
    Y: Integer;
    Index: Integer;
    ADrawingStyle: Tl3DrawingStyle;
    AImageType: Tl3ImageType;
    Enabled: Boolean = True); overload; 
   function Hack: pointer;
   function pm_GetWidth: Integer;
   function pm_GetHeight: Integer;
   function pm_GetCount: Integer;
   function pm_GetHandle: THandle;
   function pm_GetBigSize: Boolean;
   procedure pm_SetBigSize(aValue: Boolean);
 protected
 // protected methods
   function DoGetBigSize: Boolean; virtual;
   procedure DoSetBigSize(aValue: Boolean); virtual;
 public
 // public methods
   constructor Create(aList: TCustomImageList); reintroduce; virtual;
   class function Make(aList: TCustomImageList): Il3ImageList; reintroduce;
 end;//Tl3ImageList

implementation

uses
  l3Bitmap,
  Graphics,
  Types
  ;

// start class Tl3ImageList

constructor Tl3ImageList.Create(aList: TCustomImageList);
//#UC START# *47D14ADF03A0_47D02E5F022F_var*
//#UC END# *47D14ADF03A0_47D02E5F022F_var*
begin
//#UC START# *47D14ADF03A0_47D02E5F022F_impl*
 Assert(aList <> nil);
 inherited Create;
 f_List := aList;
//#UC END# *47D14ADF03A0_47D02E5F022F_impl*
end;//Tl3ImageList.Create

class function Tl3ImageList.Make(aList: TCustomImageList): Il3ImageList;
var
 l_Inst : Tl3ImageList;
begin
 l_Inst := Create(aList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3ImageList.DoGetBigSize: Boolean;
//#UC START# *47D14E0C0120_47D02E5F022F_var*
//#UC END# *47D14E0C0120_47D02E5F022F_var*
begin
//#UC START# *47D14E0C0120_47D02E5F022F_impl*
 Result := false;
//#UC END# *47D14E0C0120_47D02E5F022F_impl*
end;//Tl3ImageList.DoGetBigSize

procedure Tl3ImageList.DoSetBigSize(aValue: Boolean);
//#UC START# *47D14E1A009A_47D02E5F022F_var*
//#UC END# *47D14E1A009A_47D02E5F022F_var*
begin
//#UC START# *47D14E1A009A_47D02E5F022F_impl*
//#UC END# *47D14E1A009A_47D02E5F022F_impl*
end;//Tl3ImageList.DoSetBigSize

procedure Tl3ImageList.Draw(const aCanvas: Il3Canvas;
  const aRect: Tl3SRect;
  aFillColor: Tl3Color;
  Index: Integer;
  Enabled: Boolean = True);
//#UC START# *4728C6D400FA_47D02E5F022F_var*
var
 l_ImgX, l_ImgY: Integer;
 l_Bitmap: Tl3Bitmap;
//#UC END# *4728C6D400FA_47D02E5F022F_var*
begin
//#UC START# *4728C6D400FA_47D02E5F022F_impl*
 l_Bitmap := Tl3Bitmap.Create;
 try
  with l_Bitmap do
  begin
   Width := aRect.Right - aRect.Left;
   Height := aRect.Bottom - aRect.Top;
   Canvas.Brush.Style := bsSolid;
   Canvas.Brush.Color := aFillColor;
   Canvas.FillRect(Rect(0,0,Width,Height));
   l_ImgX := (Width - f_List.Width) div 2;
   l_ImgY := (Height - f_List.Height) div 2;
   f_List.Draw(Canvas, l_ImgX, l_ImgY, Index, Enabled);
  end;
  aCanvas.Canvas.Draw(aRect.Left, aRect.Top, l_Bitmap);
 finally
  l_Bitmap.Free;
 end;
//#UC END# *4728C6D400FA_47D02E5F022F_impl*
end;//Tl3ImageList.Draw

procedure Tl3ImageList.Draw(const aCanvas: Il3Canvas;
  X: Integer;
  Y: Integer;
  Index: Integer;
  Enabled: Boolean = True);
//#UC START# *4728C6F401E6_47D02E5F022F_var*
//#UC END# *4728C6F401E6_47D02E5F022F_var*
begin
//#UC START# *4728C6F401E6_47D02E5F022F_impl*
 f_List.Draw(aCanvas.Canvas, X, Y, Index, Enabled);
//#UC END# *4728C6F401E6_47D02E5F022F_impl*
end;//Tl3ImageList.Draw

procedure Tl3ImageList.Draw(const aCanvas: Il3Canvas;
  X: Integer;
  Y: Integer;
  Index: Integer;
  ADrawingStyle: Tl3DrawingStyle;
  AImageType: Tl3ImageType;
  Enabled: Boolean = True);
//#UC START# *4728C76E03C2_47D02E5F022F_var*
//#UC END# *4728C76E03C2_47D02E5F022F_var*
begin
//#UC START# *4728C76E03C2_47D02E5F022F_impl*
 f_List.Draw(aCanvas.Canvas,
             X, Y,
             Index,
             TDrawingStyle(ADrawingStyle),
             TImageType(AImageType),
             Enabled);
//#UC END# *4728C76E03C2_47D02E5F022F_impl*
end;//Tl3ImageList.Draw

function Tl3ImageList.Hack: pointer;
//#UC START# *4728C79B0269_47D02E5F022F_var*
//#UC END# *4728C79B0269_47D02E5F022F_var*
begin
//#UC START# *4728C79B0269_47D02E5F022F_impl*
 Result := f_List;
//#UC END# *4728C79B0269_47D02E5F022F_impl*
end;//Tl3ImageList.Hack

function Tl3ImageList.pm_GetWidth: Integer;
//#UC START# *4728C7A90345_47D02E5F022Fget_var*
//#UC END# *4728C7A90345_47D02E5F022Fget_var*
begin
//#UC START# *4728C7A90345_47D02E5F022Fget_impl*
 Result := f_List.Width;
//#UC END# *4728C7A90345_47D02E5F022Fget_impl*
end;//Tl3ImageList.pm_GetWidth

function Tl3ImageList.pm_GetHeight: Integer;
//#UC START# *4728C7B50144_47D02E5F022Fget_var*
//#UC END# *4728C7B50144_47D02E5F022Fget_var*
begin
//#UC START# *4728C7B50144_47D02E5F022Fget_impl*
 Result := f_List.Height;
//#UC END# *4728C7B50144_47D02E5F022Fget_impl*
end;//Tl3ImageList.pm_GetHeight

function Tl3ImageList.pm_GetCount: Integer;
//#UC START# *4728C7C7006D_47D02E5F022Fget_var*
//#UC END# *4728C7C7006D_47D02E5F022Fget_var*
begin
//#UC START# *4728C7C7006D_47D02E5F022Fget_impl*
 Result := f_List.Count;
//#UC END# *4728C7C7006D_47D02E5F022Fget_impl*
end;//Tl3ImageList.pm_GetCount

function Tl3ImageList.pm_GetHandle: THandle;
//#UC START# *4728C7D202A4_47D02E5F022Fget_var*
//#UC END# *4728C7D202A4_47D02E5F022Fget_var*
begin
//#UC START# *4728C7D202A4_47D02E5F022Fget_impl*
 Result := f_List.Handle;
//#UC END# *4728C7D202A4_47D02E5F022Fget_impl*
end;//Tl3ImageList.pm_GetHandle

function Tl3ImageList.pm_GetBigSize: Boolean;
//#UC START# *4728C7DC01EA_47D02E5F022Fget_var*
//#UC END# *4728C7DC01EA_47D02E5F022Fget_var*
begin
//#UC START# *4728C7DC01EA_47D02E5F022Fget_impl*
 Result := DoGetBigSize;
//#UC END# *4728C7DC01EA_47D02E5F022Fget_impl*
end;//Tl3ImageList.pm_GetBigSize

procedure Tl3ImageList.pm_SetBigSize(aValue: Boolean);
//#UC START# *4728C7DC01EA_47D02E5F022Fset_var*
//#UC END# *4728C7DC01EA_47D02E5F022Fset_var*
begin
//#UC START# *4728C7DC01EA_47D02E5F022Fset_impl*
 DoSetBigSize(aValue);
//#UC END# *4728C7DC01EA_47D02E5F022Fset_impl*
end;//Tl3ImageList.pm_SetBigSize

end.