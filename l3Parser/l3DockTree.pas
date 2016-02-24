unit l3DockTree;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3DockTree - }
{ Начат: 18.09.2003 18:58 }
{ $Id: l3DockTree.pas,v 1.20 2011/05/19 10:36:07 lulin Exp $ }

// $Log: l3DockTree.pas,v $
// Revision 1.20  2011/05/19 10:36:07  lulin
// {RequestLink:266409354}.
//
// Revision 1.19  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.18  2009/07/21 15:10:18  lulin
// - bug fix: не собирался и не работал Архивариус в ветке.
//
// Revision 1.17  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.16  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.15  2007/08/13 17:23:34  lulin
// - cleanup.
//
// Revision 1.14  2007/03/28 10:41:53  lulin
// - bug fix: защищаем от зацикливания внутри обновления форм.
//
// Revision 1.13  2007/03/28 09:14:28  lulin
// - bug fix: AV при перестроении дерева докинга (CQ OIT5-24779).
//
// Revision 1.12  2007/03/27 14:28:03  lulin
// - безуспешные попытки побороться с AV.
//
// Revision 1.11  2007/01/12 13:22:46  lulin
// - cleanup.
//
// Revision 1.10  2006/12/04 15:39:41  lulin
// - модуль переименован в соответствии с его функциями.
//
// Revision 1.9  2005/04/28 15:04:11  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.8.4.1  2005/04/26 14:30:57  lulin
// - ускоряем l3Free и _l3Use.
//
// Revision 1.8  2005/04/04 14:02:15  mmorozov
// new: use l3IsDefaultCharset;
//
// Revision 1.7  2005/04/04 12:33:32  mmorozov
// new behaviour: при создании канвы в PaintSite устанавливаем русский алфавит;
//
// Revision 1.6  2004/09/08 11:22:55  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.5  2004/01/10 11:37:45  law
// - bug fix: можно было закрыть придоченную форму, которая не имела кнопки [x] (CQ OIT5-5234).
//
// Revision 1.4  2003/09/23 09:25:26  law
// - bug fix: очередная корявость докинга Delphi.
//
// Revision 1.3  2003/09/22 13:39:38  law
// - bug fix: очередной глюк докинга при возвращении сразу в Основное Меню.
//
// Revision 1.2  2003/09/19 17:43:42  law
// - bug fix: реализован свой менеджер докинга, который вроде пока работает без ошибок.
//
// Revision 1.1  2003/09/18 16:03:45  law
// - new unit: l3DockTree (для лечения докинга).
//

{$Include l3Define.inc }

interface

uses
  Types,

  Windows,
  Messages,

  SysUtils,
  Classes,
  Graphics,
  Controls,

  l3Base,
  l3ProtoObject
  ;

type
{ TDockZone }

  Tl3HackWinControl = class(TWinControl);

  Tl3DockTree = class;

  // TDockZone encapsulates a region into which other zones are contained.
  // A TDockZone can be a parent to other zones (when FChildZones <> nil) or
  // can contain only a control (when FChildControl <> nil).  A TDockZone also
  // stores pointers to previous and next siblings and its parent.  Parents
  // store a pointer to only the first child in a doubly-linked list of child
  // zones, though each child maintains a pointer to its parent.  Thus, the
  // data structure of relating TDockZones works out to a kind of a
  // doubly-linked list tree.  The FZoneLimit field of TDockZone represents
  // the coordinate of either the left or bottom of the zone, depending on
  // whether its parent zone's orientation is doVertical or doHorizontal.

  Tl3DockZone = class(Tl3ProtoObject)
  private
    FChildControl: TControl;
    FChildZones: Tl3DockZone;
    FNextSibling: Tl3DockZone;
    FOrientation: TDockOrientation;
    FParentZone: Tl3DockZone;
    FPrevSibling: Tl3DockZone;
    FTree: Tl3DockTree;
    FZoneLimit: Integer;
    FOldSize: Integer;
    f_UpdateCount : Integer;
    function GetChildCount: Integer;
    function GetControlName: string;
    function GetLimitBegin: Integer;
    function GetLimitSize: Integer;
    function GetTopLeft(Orient: Integer{TDockOrientation}): Integer;
    function GetHeightWidth(Orient: Integer{TDockOrientation}): Integer;
    function GetVisible: Boolean;
    function GetVisibleChildCount: Integer;
    function GetZoneLimit: Integer;
    function SetControlName(const Value: string): Boolean;
    procedure SetZoneLimit(const Value: Integer);
    protected
    // property methods
      procedure pm_SetChildZones(aValue: Tl3DockZone);
        {-}
      procedure pm_SetNextSibling(aValue: Tl3DockZone);
        {-}
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
  public
    constructor Create(Tree: Tl3DockTree);
      reintroduce;
      {-}
    procedure ExpandZoneLimit(NewLimit: Integer);
    function FirstVisibleChild: Tl3DockZone;
    function NextVisible: Tl3DockZone;
    function PrevVisible: Tl3DockZone;
    procedure ResetChildren;
    procedure ResetZoneLimits;
    procedure Update;
    property ChildCount: Integer read GetChildCount;
    property Height: Integer index Ord(doHorizontal) read GetHeightWidth;
    property Left: Integer index Ord(doVertical) read GetTopLeft;
    property LimitBegin: Integer read GetLimitBegin;
    property LimitSize: Integer read GetLimitSize;
    property Top: Integer index Ord(doHorizontal) read GetTopLeft;
    property Visible: Boolean read GetVisible;
    property VisibleChildCount: Integer read GetVisibleChildCount;
    property Width: Integer index Ord(doVertical) read GetHeightWidth;
    property ZoneLimit: Integer read GetZoneLimit write SetZoneLimit;
    public
    // public properties
      property ChildZones: Tl3DockZone
        read fChildZones
        write pm_SetChildZones;
        {-}
      property ParentZone: Tl3DockZone
        read fParentZone;
        {-}
      property NextSibling: Tl3DockZone
        read FNextSibling
        write pm_SetNextSibling;
        {-}
      property PrevSibling: Tl3DockZone
        read FPrevSibling;
        {-}
  end;//Tl3DockZone

{ Tl3DockTree }

  TForEachZoneProc = procedure(Zone: Tl3DockZone) of object;

  // Tl3DockTree serves as a manager for a tree of Tl3DockZones.  It is responsible
  // for inserting and removing controls (and thus zones) from the tree and
  // associated housekeeping, such as orientation, zone limits, parent zone
  // creation, and painting of controls into zone bounds.

  Tl3DockTree = class(TInterfacedObject, IDockManager)
  private
    FBorderWidth: Integer;
    FBrush: TBrush;
    FDockSite: TWinControl;
    FGrabberSize: Integer;
    FGrabbersOnTop: Boolean;
    FOldRect: TRect;
    FOldWndProc: TWndMethod;
    FReplacementZone: Tl3DockZone;
    FScaleBy: Double;
    FShiftScaleOrient: TDockOrientation;
    FShiftBy: Integer;
    FSizePos: TPoint;
    FSizingDC: HDC;
    FSizingWnd: HWND;
    FSizingZone: Tl3DockZone;
    FTopZone: Tl3DockZone;
    FTopXYLimit: Integer;
    FUpdateCount: Integer;
    FVersion: Integer;
    procedure ControlVisibilityChanged(Control: TControl; Visible: Boolean);
    procedure DrawSizeSplitter;
    function FindControlZone(Control: TControl): Tl3DockZone;
    procedure ForEachAt(Zone: Tl3DockZone; Proc: TForEachZoneProc);
    function GetNextLimit(AZone: Tl3DockZone): Integer;
    procedure InsertNewParent(NewZone, SiblingZone: Tl3DockZone;
      ParentOrientation: TDockOrientation; InsertLast: Boolean);
    procedure InsertSibling(NewZone, aSiblingZone: Tl3DockZone; InsertLast: Boolean);
  protected
    function InternalHitTest(const MousePos: TPoint; out HTFlag: Integer): Tl3DockZone;
      virtual;
      {-}
  private
    procedure RemoveZone(var Zone: Tl3DockZone);
    procedure ScaleZone(Zone: Tl3DockZone);
    procedure SetNewBounds(Zone: Tl3DockZone);
    procedure ShiftZone(Zone: Tl3DockZone);
    procedure SplitterMouseDown(OnZone: Tl3DockZone; MousePos: TPoint);
    procedure SplitterMouseUp;
    procedure UpdateZone(Zone: Tl3DockZone);
    procedure WindowProc(var Message: TMessage);
    protected
    //property methods
      procedure pm_SetTopZone(aValue: Tl3DockZone);
        {-}
      procedure pm_SetReplacementZone(aValue: Tl3DockZone);
        {-}
  protected
    procedure AdjustDockRect(Control: TControl; var ARect: TRect); virtual;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure GetControlBounds(Control: TControl; out CtlBounds: TRect);
    function HitTest(const MousePos: TPoint; out HTFlag: Integer): TControl; virtual;
    procedure InsertControl(Control: TControl; InsertAt: TAlign;
      DropCtl: TControl); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure PaintDockFrame(Canvas: TCanvas; Control: TControl;
      const ARect: TRect); virtual;
    procedure PositionDockRect(Client, DropCtl: TControl; DropAlign: TAlign;
      var DockRect: TRect); virtual;
    procedure RemoveControl(Control: TControl); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SetReplacingControl(Control: TControl);
    procedure ResetBounds(Force: Boolean); virtual;
    procedure UpdateAll;
    property DockSite: TWinControl read FDockSite write FDockSite;
    public
    // public properties
      property TopZone: Tl3DockZone
        read FTopZone
        write pm_SetTopZone;
        {-}
      property ReplacementZone: Tl3DockZone
        read FReplacementZone
        write pm_SetReplacementZone;
        {-}
  public
    constructor Create(DockSite: TWinControl); virtual;
    destructor Destroy; override;
    procedure PaintSite(DC: HDC); virtual;
  end;//Tl3DockTree

implementation

uses
  Consts,
  Math,

  Forms,

  l3Chars,
  l3FontTools
  ;

{ Tl3DockZone }

function NextVisibleZone(StartZone: Tl3DockZone): Tl3DockZone;
begin
  Result := StartZone;
  while Assigned(Result) and not Result.Visible do
    Result := Result.NextSibling;
end;

function IsOrientationSet(Zone: Tl3DockZone): Boolean;
begin
  Result := (Assigned(Zone.ParentZone) and
             (Zone.ParentZone.FOrientation <> doNoOrient)) or
            ((Zone.FTree.TopZone = Zone) and (Zone.FOrientation <> doNoOrient));
end;

constructor Tl3DockZone.Create(Tree: Tl3DockTree);
begin
 inherited Create;
 FTree := Tree;
end;

procedure Tl3DockZone.Cleanup;
  //override;
  {-}
begin
 ChildZones := nil;
 NextSibling := nil;
 FPrevSibling := nil;
 FParentZone := nil;
 FTree := nil;
 inherited;
end;

procedure Tl3DockZone.pm_SetChildZones(aValue: Tl3DockZone);
  {-}
var
 l_Z : Tl3DockZone;
begin
 if (fChildZones <> aValue) then
 begin
  l_Z := fChildZones;
  while (l_Z <> nil) do
  begin
   if (l_Z.FParentZone = Self) then
    l_Z.FParentZone := nil;
   l_Z := l_Z.NextSibling;
  end;//while (l_Z <> nil)
  l3Set(fChildZones, aValue);
  l_Z := fChildZones;
  while (l_Z <> nil) do
  begin
   l_Z.FParentZone := Self;
   l_Z := l_Z.NextSibling;
  end;//while (l_Z <> nil)
 end;//fChildZones <> aValue
end;

procedure Tl3DockZone.pm_SetNextSibling(aValue: Tl3DockZone);
  {-}
var
 l_Z : Tl3DockZone;
begin
 if (fNextSibling <> aValue) then
 begin
  if (fNextSibling <> nil) then
   if (fNextSibling.FPrevSibling = Self) then
    fNextSibling.FPrevSibling := nil;
  l3Set(fNextSibling, aValue);
  if (fNextSibling <> nil) then
   fNextSibling.FPrevSibling := Self;
  l_Z := fNextSibling;
  while (l_Z <> nil) do
  begin
   l_Z.FParentZone := FParentZone;
   l_Z := l_Z.NextSibling;
  end;//while (l_Z <> nil)
 end;//fNextSibling <> aValue
end;

function Tl3DockZone.GetChildCount: Integer;
var
 l_Zone: Tl3DockZone;
begin
 Result := 0;
 l_Zone := ChildZones;
 while (l_Zone <> nil) do
 begin
  l_Zone := l_Zone.NextSibling;
  Inc(Result);
 end;//while (Zone <> nil)
end;

function Tl3DockZone.GetVisibleChildCount: Integer;
var
  Zone: Tl3DockZone;
begin
  Result := 0;
  Zone := FirstVisibleChild;
  while Zone <> nil do
  begin
    Zone := Zone.NextVisible;
    Inc(Result);
  end;
end;

function Tl3DockZone.GetVisible: Boolean;
var
  NextChild: Tl3DockZone;
begin
  if Assigned(FChildControl) then
    Result := FChildControl.Visible
  else
  begin
    Result := True;
    NextChild := FirstVisibleChild;
    while Assigned(NextChild) do
    begin
      if NextChild.Visible then Exit;
      NextChild := NextChild.NextSibling;
    end;
    Result := False;
  end;
end;

function Tl3DockZone.GetLimitBegin: Integer;
var
 l_CheckZone : Tl3DockZone;
begin
 if (FTree <> nil) AND (FTree.TopZone = Self) then
  l_CheckZone := Self
 else
  l_CheckZone := ParentZone;
 if (l_CheckZone.FOrientation = doHorizontal) then
  Result := Top
 else
 if l_CheckZone.FOrientation = doVertical then
  Result := Left
 else
  raise Exception.Create('');
end;

function Tl3DockZone.GetLimitSize: Integer;
var
 l_CheckZone: Tl3DockZone;
begin
 if (FTree <> nil) AND (FTree.TopZone = Self) then
  l_CheckZone := Self
 else
  l_CheckZone := ParentZone;
 if (l_CheckZone.FOrientation = doHorizontal) then
  Result := Height
 else
 if (l_CheckZone.FOrientation = doVertical) then
  Result := Width
 else
  raise Exception.Create('');
end;

function Tl3DockZone.GetTopLeft(Orient: Integer{TDockOrientation}): Integer;
var
  Zone: Tl3DockZone;
  R: TRect;
begin
 if (FTree = nil) then
  Result := 0
 else
 begin
  Zone := Self;
  while Zone <> FTree.TopZone do
  begin
    if (Zone.ParentZone.FOrientation = TDockOrientation(Orient)) and
      (Zone.PrevSibling <> nil) then
    begin
      Result := Zone.PrevSibling.ZoneLimit;
      Exit;
    end
    else
      Zone := Zone.ParentZone;
  end;
  R := FTree.FDockSite.ClientRect;
  Tl3HackWinControl(FTree.FDockSite).AdjustClientRect(R);
  case TDockOrientation(Orient) of
    doVertical: Result := R.Left;
    doHorizontal: Result := R.Top;
  else
    Result := 0;
  end;
 end;//FTree = nil
end;

function Tl3DockZone.GetHeightWidth(Orient: Integer{TDockOrientation}): Integer;
var
  Zone: Tl3DockZone;
  R: TRect;
begin
  if (Self = FTree.TopZone) or ((ParentZone = FTree.TopZone) and
    (FChildControl <> nil) and (FTree.TopZone.VisibleChildCount = 1)) then
  begin
    R := FTree.FDockSite.ClientRect;
    Tl3HackWinControl(FTree.FDockSite).AdjustClientRect(R);
    if TDockOrientation(Orient) = doHorizontal then
      Result := R.Bottom - R.Top
    else
      Result := R.Right - R.Left;
  end
  else begin
    Zone := Self;
    while Zone <> FTree.TopZone do
    begin
      if Zone.ParentZone.FOrientation = TDockOrientation(Orient) then
      begin
        Result := Zone.ZoneLimit - Zone.LimitBegin;
        Exit;
      end
      else
        Zone := Zone.ParentZone;
    end;
    if FTree.TopZone.FOrientation = TDockOrientation(Orient) then
      Result := FTree.FTopXYLimit
    else
      Result := FTree.TopZone.ZoneLimit;
  end;
end;

procedure Tl3DockZone.ResetChildren;
var
  MaxLimit: Integer;
  NewLimit: Integer;
  ChildNode: Tl3DockZone;
begin
  if (VisibleChildCount = 0) or (FOrientation = doNoOrient) then Exit;
  ChildNode := FirstVisibleChild;
  case FOrientation of
    doHorizontal: MaxLimit := Height;
    doVertical: MaxLimit := Width;
  else
    MaxLimit := 0;
  end;
  NewLimit := MaxLimit div VisibleChildCount;
  while ChildNode <> nil do
  begin
    if ChildNode.NextSibling = nil then
      ChildNode.ZoneLimit := MaxLimit
    else
      ChildNode.ZoneLimit := ChildNode.LimitBegin + NewLimit;
    ChildNode.Update;
    ChildNode := ChildNode.NextVisible;
  end;
end;

function Tl3DockZone.GetControlName: string;
begin
  Result := '';
  if FChildControl <> nil then
  begin
    if FChildControl.Name = '' then
      raise Exception.CreateRes(@SDockedCtlNeedsName);
    Result := FChildControl.Name;
  end;
end;

function Tl3DockZone.SetControlName(const Value: string): Boolean;
var
  Client: TControl;
begin
  Client := nil;
  with FTree do
  begin
    Tl3HackWinControl(FDockSite).ReloadDockedControl(Value, Client);
    Result := Client <> nil;
    if Result then
    begin
      ReplacementZone := Self;
      try
        Client.ManualDock(FDockSite, nil, alNone);
      finally
        ReplacementZone := nil;
      end;
    end;
  end;
end;

procedure Tl3DockZone.Update;

  function ParentNotLast: Boolean;
  var
    Parent: Tl3DockZone;
  begin
    Result := False;
    Parent := ParentZone;
    while Parent <> nil do
    begin
      if Parent.NextVisible <> nil then
      begin
        Result := True;
        Exit;
      end;
      Parent := Parent.ParentZone;
    end;
  end;

var
  NewWidth, NewHeight: Integer;
  R: TRect;
begin
 if (f_UpdateCount = 0) then
 begin
  Inc(f_UpdateCount);
  try
   if (FChildControl <> nil) and FChildControl.Visible and
      (FTree <> nil) AND (FTree.FUpdateCount = 0) then
   begin
    FChildControl.DockOrientation := ParentZone.FOrientation;
    NewWidth := Width;
    NewHeight := Height;
    if ParentNotLast then
    begin
     if (ParentZone.FOrientation = doHorizontal) then
      Dec(NewWidth, FTree.FBorderWidth)
     else
      Dec(NewHeight, FTree.FBorderWidth);
    end;//ParentNotLast
    if (NextVisible <> nil) or ((ParentZone <> FTree.TopZone) and
      ((ParentZone.FOrientation = FTree.TopZone.FOrientation) and
      (ZoneLimit < FTree.FTopXYLimit)) or
      ((ParentZone.FOrientation <> FTree.TopZone.FOrientation) and
      (ZoneLimit < FTree.TopZone.ZoneLimit))) then
    begin
     if ParentZone.FOrientation = doHorizontal then
      Dec(NewHeight, FTree.FBorderWidth)
     else
      Dec(NewWidth, FTree.FBorderWidth);
    end;//NextVisible <> nil
    R := Bounds(Left, Top, NewWidth, NewHeight);
    FTree.AdjustDockRect(FChildControl, R);
    FChildControl.BoundsRect := R;
   end;//FChildControl <> nil..
  finally
   Dec(f_UpdateCount);
  end;//try..finally
 end;//f_UpdateCount = 0
end;

function Tl3DockZone.GetZoneLimit: Integer;
begin
  if not Visible and IsOrientationSet(Self) then
    // LimitSize will be zero and zone will take up no space
    Result := GetLimitBegin
  else
    Result := FZoneLimit;
end;

procedure Tl3DockZone.SetZoneLimit(const Value: Integer);
begin
  FZoneLimit := Value;
end;

procedure Tl3DockZone.ExpandZoneLimit(NewLimit: Integer);

  function GetLastChildZone(Zone: Tl3DockZone): Tl3DockZone;
  begin
    { Assumes Zone has at least one child }
    Result := Zone.ChildZones;
    while Result.NextSibling <> nil do
      Result := Result.NextSibling;
  end;

var
  LastChild, ChildZone: Tl3DockZone;
begin
  ZoneLimit := NewLimit;
  ChildZone := ChildZones;
  while Assigned(ChildZone) do
  begin
    if ChildZone.ChildCount > 0 then
    begin
      LastChild := GetLastChildZone(ChildZone);
      LastChild.ExpandZoneLimit(NewLimit);
    end;
    ChildZone := ChildZone.NextSibling;
  end;
end;

procedure Tl3DockZone.ResetZoneLimits;
var
  ChildZone: Tl3DockZone;
begin
  ChildZone := ChildZones;
  while Assigned(ChildZone) do
  begin
    { If the ZoneLimit is too big or too small then just reset all child zones }
    if (ChildZone.ZoneLimit < ChildZone.LimitBegin) or
       (ChildZone.ZoneLimit > LimitSize) then
    begin
      ResetChildren;
      FTree.ForEachAt(Self, FTree.UpdateZone);
    end;
    ChildZone.ResetZoneLimits;
    ChildZone := ChildZone.NextSibling;
  end;
end;

function Tl3DockZone.NextVisible: Tl3DockZone;
begin
  Result := NextVisibleZone(NextSibling);
end;

function Tl3DockZone.PrevVisible: Tl3DockZone;
begin
  Result := PrevSibling;
  while Assigned(Result) and not Result.Visible do
    Result := Result.PrevSibling;
end;

function Tl3DockZone.FirstVisibleChild: Tl3DockZone;
begin
  Result := NextVisibleZone(ChildZones)
end;

{ Tl3DockTree }

const
  GrabberSize = 12;

constructor Tl3DockTree.Create(DockSite: TWinControl);
var
  I   : Integer;
  l_Z : Tl3DockZone;
begin
  inherited Create;
  {$IfDef l3TraceObjects}
  l3System.RegisterObject(Self);
  {$EndIf l3TraceObjects}
  FBorderWidth := 4;
  FDockSite := DockSite;
  FVersion := $00040000;
  FGrabberSize := GrabberSize;
  FGrabbersOnTop := (DockSite.Align <> alTop) and (DockSite.Align <> alBottom);
  l_Z := Tl3DockZone.Create(Self);
  try
   TopZone := l_Z;
  finally
   l3Free(l_Z);
  end;//try..finally
  FBrush := TBrush.Create;
  FBrush.Bitmap := AllocPatternBitmap(clBlack, clWhite);
  // insert existing controls into tree
  BeginUpdate;
  try
    for I := 0 to DockSite.ControlCount - 1 do
      InsertControl(DockSite.Controls[I], alLeft, nil);
    TopZone.ResetChildren;
  finally
    EndUpdate;
  end;
  if not (csDesigning in DockSite.ComponentState) then
  begin
    FOldWndProc := FDockSite.WindowProc;
    FDockSite.WindowProc := WindowProc;
  end;
end;

destructor Tl3DockTree.Destroy;
begin
  {$IfDef l3TraceObjects}
  l3System.UnRegisterObject(Self);
  {$EndIf l3TraceObjects}
  if @FOldWndProc <> nil then
  begin
    FDockSite.WindowProc := FOldWndProc;
    FOldWndProc := nil;
  end;
  ReplacementZone := nil;
  TopZone := nil;
  FreeAndNil(FBrush);
  inherited Destroy;
end;

procedure Tl3DockTree.pm_SetTopZone(aValue: Tl3DockZone);
  {-}
begin
 if (fTopZone <> aValue) then
 begin
  if (fTopZone <> nil) then
  begin
   fTopZone.FParentZone := nil;
   fTopZone.FPrevSibling := nil;
   fTopZone.NextSibling := nil;
   fTopZone.FTree := nil;
  end;//fTopZone <> nil
  l3Set(fTopZone, aValue);
  if (fTopZone <> nil) then
  begin
   fTopZone.FParentZone := nil;
   fTopZone.FPrevSibling := nil;
   fTopZone.NextSibling := nil;
   fTopZone.FTree := Self;
  end;//fTopZone <> nil
 end;//fTopZone <> aValue
end;

procedure Tl3DockTree.pm_SetReplacementZone(aValue: Tl3DockZone);
  {-}
begin
 l3Set(fReplacementZone, aValue);
end;

procedure Tl3DockTree.AdjustDockRect(Control: TControl; var ARect: TRect);
begin
  { Allocate room for the caption on the left if docksite is horizontally
    oriented, otherwise allocate room for the caption on the top. }
  if FDockSite.Align in [alTop, alBottom] then
    Inc(ARect.Left, GrabberSize) else
    Inc(ARect.Top, GrabberSize);
end;

procedure Tl3DockTree.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure Tl3DockTree.EndUpdate;
begin
  Dec(FUpdateCount);
  if (FUpdateCount <= 0) then
  begin
    FUpdateCount := 0;
    UpdateAll;
  end;//FUpdateCount <= 0
end;

function Tl3DockTree.FindControlZone(Control: TControl): Tl3DockZone;
var
  CtlZone: Tl3DockZone;

  procedure DoFindControlZone(StartZone: Tl3DockZone);
  begin
    if StartZone.FChildControl = Control then
      CtlZone := StartZone
    else begin
      // Recurse sibling
      if (CtlZone = nil) and (StartZone.NextSibling <> nil) then
        DoFindControlZone(StartZone.NextSibling);
      // Recurse child
      if (CtlZone = nil) and (StartZone.ChildZones <> nil) then
        DoFindControlZone(StartZone.ChildZones);
    end;
  end;

begin
  CtlZone := nil;
  if (Control <> nil) and (TopZone <> nil) then DoFindControlZone(TopZone);
  Result := CtlZone;
end;

procedure Tl3DockTree.ForEachAt(Zone: Tl3DockZone; Proc: TForEachZoneProc);

  procedure DoForEach(aZone: Tl3DockZone);
  var
   l_Zone : Tl3DockZone;
  begin
   l_Zone := aZone.Use;
   try // law - заплатка к ненайденному AV
    Proc(l_Zone);
    if (l_Zone.RefCount <= 1) then
     Exit;
    // Recurse sibling
    if l_Zone.NextSibling <> nil then
     DoForEach(l_Zone.NextSibling);
    // Recurse child
    if (l_Zone.ChildZones <> nil) then
     DoForEach(l_Zone.ChildZones);
   finally
    l3Free(l_Zone);
   end;//try..finally
  end;

begin
 if (Zone = nil) then
  Zone := TopZone;
 DoForEach(Zone);
end;

procedure Tl3DockTree.GetControlBounds(Control: TControl; out CtlBounds: TRect);
var
  Z: Tl3DockZone;
begin
  Z := FindControlZone(Control);
  if Z = nil then
    l3FillChar(CtlBounds, SizeOf(CtlBounds), 0)
  else
    with Z do
      CtlBounds := Bounds(Left, Top, Width, Height);
end;

function Tl3DockTree.HitTest(const MousePos: TPoint; out HTFlag: Integer): TControl;
var
  Zone: Tl3DockZone;
begin
  Zone := InternalHitTest(MousePos, HTFlag);
  if Zone <> nil then Result := Zone.FChildControl
  else Result := nil;
end;

procedure Tl3DockTree.InsertControl(Control: TControl; InsertAt: TAlign;
  DropCtl: TControl);
const
  OrientArray: array[TAlign] of TDockOrientation = (doNoOrient, doHorizontal,
    doHorizontal, doVertical, doVertical, doNoOrient, doNoOrient); { alCustom }
  MakeLast: array[TAlign] of Boolean = (False, False, True, False, True, False, False);  { alCustom }
var
  Sibling            : Tl3DockZone;
  Me                 : Tl3DockZone;
  InsertOrientation  : TDockOrientation;
  CurrentOrientation : TDockOrientation;
  NewWidth           : Integer;
  NewHeight          : Integer;
  R                  : TRect;
begin
  if not Control.Visible then
   Exit;
  if (ReplacementZone <> nil) then
  begin
    ReplacementZone.FChildControl := Control;
    ReplacementZone.Update;
  end//ReplacementZone <> nil
  else
  if (TopZone.ChildZones = nil) then
  begin
    // Tree is empty, so add first child
    R := FDockSite.ClientRect;
    Tl3HackWinControl(FDockSite).AdjustClientRect(R);
    NewWidth := R.Right - R.Left;
    NewHeight := R.Bottom - R.Top;
    if Tl3HackWinControl(FDockSite).AutoSize then
    begin
     if (NewWidth = 0) then
      NewWidth := Control.UndockWidth;
     if (NewHeight = 0) then
      NewHeight := Control.UndockHeight;
    end;//Tl3HackWinControl(FDockSite).AutoSize
    R := Bounds(R.Left, R.Top, NewWidth, NewHeight);
    AdjustDockRect(Control, R);
    Control.BoundsRect := R;
    Me := Tl3DockZone.Create(Self);
    try
     TopZone.ChildZones := Me;
     Me.FChildControl := Control;
    finally
     l3Free(Me);
    end;//try..finally
  end//TopZone.ChildZones = nil
  else
  begin
    // Default to right-side docking
    if InsertAt in [alClient, alNone] then
     InsertAt := alRight;
    Me := FindControlZone(Control);
    if (Me <> nil) then
     RemoveZone(Me);
    Sibling := FindControlZone(DropCtl);
    InsertOrientation := OrientArray[InsertAt];
    if (TopZone.ChildCount = 1) then
    begin
     // Tree only has one child, and a second is being added, so orientation and
     // limits must be set up
     TopZone.FOrientation := InsertOrientation;
     case InsertOrientation of
       doHorizontal:
         begin
           TopZone.ZoneLimit := TopZone.ChildZones.Width;
           FTopXYLimit := TopZone.ChildZones.Height;
         end;//doHorizontal
       doVertical:
         begin
           TopZone.ZoneLimit := TopZone.ChildZones.Height;
           FTopXYLimit := TopZone.ChildZones.Width;
         end;//doVertical
     end;//case InsertOrientation
    end;//TopZone.ChildCount = 1
    Me := Tl3DockZone.Create(Self);
    try
     Me.FChildControl := Control;
     if (Sibling <> nil) then
      CurrentOrientation := Sibling.ParentZone.FOrientation
     else
      CurrentOrientation := TopZone.FOrientation;
     if (InsertOrientation = doNoOrient) then
       InsertOrientation := CurrentOrientation;
     // Control is being dropped into a zone with the same orientation we
     // are requesting, so we just need to add ourselves to the sibling last
     if (InsertOrientation = CurrentOrientation) then
      InsertSibling(Me, Sibling, MakeLast[InsertAt])
     // Control is being dropped into a zone with a different orientation than
     // we are requesting
     else
      InsertNewParent(Me, Sibling, InsertOrientation, MakeLast[InsertAt]);
    finally
     l3Free(Me);
    end;//try..finally
  end;//TopZone.ChildZones = nil
  { Redraw client dock frames }
  FDockSite.Invalidate;
end;

procedure Tl3DockTree.InsertNewParent(NewZone, SiblingZone: Tl3DockZone;
  ParentOrientation: TDockOrientation; InsertLast: Boolean);
var
  NewParent: Tl3DockZone;
begin
  NewParent := Tl3DockZone.Create(Self);
  try
   NewParent.FOrientation := ParentOrientation;
   if SiblingZone = nil then
   begin
     // if SiblingZone is nil, then we need to insert zone as a child of the top
     NewParent.ZoneLimit := FTopXYLimit;
     FTopXYLimit := TopZone.ZoneLimit;
     FShiftScaleOrient := ParentOrientation;
     FScaleBy := 0.5;
     if InsertLast then
     begin
       NewParent.ChildZones := TopZone;
       TopZone.NextSibling := NewZone;
       NewParent := NewParent.Use;
       try
        TopZone := NewParent;
       finally
        NewParent := NewParent.Free;
       end;//try..finally
       ForEachAt(NewParent.ChildZones, ScaleZone);
     end
     else begin
       NewParent.ChildZones := NewZone;
       NewZone.NextSibling := TopZone;
       NewParent := NewParent.Use;
       try
        TopZone := NewParent;
       finally
        NewParent := NewParent.Free;
       end;//try..finally
       ForEachAt(NewParent.ChildZones, ScaleZone);
       FShiftBy := TopZone.ZoneLimit div 2;
       ForEachAt(NewParent.ChildZones, ShiftZone);
       NewZone.ZoneLimit := TopZone.ZoneLimit div 2;
     end;
     ForEachAt(nil, UpdateZone);
   end
   else begin
     // if SiblingZone is not nil, we need to insert a new parent zone for me
     // and my SiblingZone
     NewParent.ZoneLimit := SiblingZone.ZoneLimit;
     if NewParent.PrevSibling <> nil then
       NewParent.PrevSibling.NextSibling := NewParent;
     NewParent.NextSibling := SiblingZone.NextSibling;
     if NewParent.ParentZone.ChildZones = SiblingZone then
       NewParent.ParentZone.ChildZones := NewParent;
     if InsertLast then
     begin
       // insert after SiblingZone
       NewParent.ChildZones := SiblingZone;
       SiblingZone.NextSibling := NewZone;
     end
     else begin
       // insert before SiblingZone
       NewParent.ChildZones := NewZone;
       SiblingZone.NextSibling := nil;
       NewZone.NextSibling := SiblingZone;
     end;
     // Set bounds of new children
   end;
   NewParent.ResetChildren;
   NewParent.ResetZoneLimits;
   ForEachAt(nil, UpdateZone);
  finally
   l3Free(NewParent);
  end;//try..finally
end;

procedure Tl3DockTree.InsertSibling(NewZone, aSiblingZone: Tl3DockZone;
  InsertLast: Boolean);
var
 l_SiblingZone : Tl3DockZone;  
begin
 l_SiblingZone := nil;
 try
  if (aSiblingZone = nil) then
  begin
    // If sibling is nil then make me the a child of the top
    l_SiblingZone := TopZone.ChildZones.Use;
    if InsertLast then
      while (l_SiblingZone.NextSibling <> nil) do
        l3Set(l_SiblingZone, l_SiblingZone.NextSibling);
  end//aSiblingZone = nil
  else
   l_SiblingZone := aSiblingZone.Use;
  if InsertLast then
  begin
    // Insert me after sibling
    l_SiblingZone.NextSibling := NewZone;
  end
  else
  begin
    // insert before sibling
    if (l_SiblingZone.PrevSibling = nil) then
     l_SiblingZone.ParentZone.ChildZones := NewZone
    else
     l_SiblingZone.PrevSibling.NextSibling := NewZone;
    NewZone.NextSibling := l_SiblingZone;
  end;//InsertLast
  // Set up zone limits for all siblings
  l_SiblingZone.ParentZone.ResetChildren;
  l_SiblingZone.ParentZone.ResetZoneLimits;
 finally
  l3Free(l_SiblingZone);
 end;//try..finally
end;

function Tl3DockTree.InternalHitTest(const MousePos: TPoint; out HTFlag: Integer): Tl3DockZone;
var
  ResultZone: Tl3DockZone;

  procedure DoFindZone(Zone: Tl3DockZone);
  var
    ZoneTop, ZoneLeft: Integer;
  begin
    // Check for hit on bottom splitter...
    if (Zone.ParentZone.FOrientation = doHorizontal) and
      ((MousePos.Y <= Zone.ZoneLimit) and
      (MousePos.Y >= Zone.ZoneLimit - FBorderWidth)) then
    begin
      HTFlag := HTBORDER;
      ResultZone := Zone;
    end
    // Check for hit on left splitter...
    else if (Zone.ParentZone.FOrientation = doVertical) and
      ((MousePos.X <= Zone.ZoneLimit) and
      (MousePos.X >= Zone.ZoneLimit - FBorderWidth)) then
    begin
      HTFlag := HTBORDER;
      ResultZone := Zone;
    end
    // Check for hit on grabber...
    else if Zone.FChildControl <> nil then
    begin
      ZoneTop := Zone.Top;
      ZoneLeft := Zone.Left;
      if FGrabbersOnTop then
      begin
        if (MousePos.Y >= ZoneTop) and (MousePos.Y <= ZoneTop + FGrabberSize) and
          (MousePos.X >= ZoneLeft) and (MousePos.X <= ZoneLeft + Zone.Width) then
        begin
          ResultZone := Zone;
          with Zone.FChildControl do
            if MousePos.X > Left + Width - 15 then HTFlag := HTCLOSE
            else HTFlag := HTCAPTION;
        end;
      end
      else begin
        if (MousePos.X >= ZoneLeft) and (MousePos.X <= ZoneLeft + FGrabberSize) and
          (MousePos.Y >= ZoneTop) and (MousePos.Y <= ZoneTop + Zone.Height) then
        begin
          ResultZone := Zone;
          if MousePos.Y < Zone.FChildControl.Top + 15 then HTFlag := HTCLOSE
          else HTFlag := HTCAPTION;
        end;
      end;
    end;
    // Recurse to next zone...
    if (ResultZone = nil) and (Zone.NextVisible <> nil) then
      DoFindZone(Zone.NextVisible);
    if (ResultZone = nil) and (Zone.FirstVisibleChild <> nil) then
      DoFindZone(Zone.FirstVisibleChild);
  end;

  function FindControlAtPos(const Pos: TPoint): TControl;
  var
    I: Integer;
    P: TPoint;
  begin
    for I := FDockSite.ControlCount - 1 downto 0 do
    begin
      Result := FDockSite.Controls[I];
      with Result do
      begin
        { Control must be Visible and Showing }
        if not Result.Visible or ((Result is TWinControl) and
           not TWinControl(Result).Showing) then continue;
        P := Point(Pos.X - Left, Pos.Y - Top);
        if PtInRect(ClientRect, P) then Exit;
      end;
    end;
    Result := nil;
  end;

var
  CtlAtPos: TControl;
begin
  ResultZone := nil;
  HTFlag := HTNOWHERE;
  CtlAtPos := FindControlAtPos(MousePos);
  if (CtlAtPos <> nil) and (CtlAtPos.HostDockSite = FDockSite) then
  begin
    ResultZone := FindControlZone(CtlAtPos);
    if ResultZone <> nil then HTFlag := HTCLIENT;
  end
  else if (TopZone.FirstVisibleChild <> nil) and (CtlAtPos = nil) then
    DoFindZone(TopZone.FirstVisibleChild);
  Result := ResultZone;
end;

var
  TreeStreamEndFlag: Integer = -1;

procedure Tl3DockTree.LoadFromStream(Stream: TStream);

  procedure ReadControlName(var ControlName: string);
  var
    Size: Integer;
  begin
    ControlName := '';
    Stream.Read(Size, SizeOf(Size));
    if Size > 0 then
    begin
      SetLength(ControlName, Size);
      Stream.Read(Pointer(ControlName)^, Size);
    end;
  end;

var
  CompName: string;
  Client: TControl;
  Level, LastLevel, I, InVisCount: Integer;
  l_Zone, LastZone, NextZone: Tl3DockZone;
begin
  TopZone := nil;
  BeginUpdate;
  try
    // read stream version
    Stream.Read(I, SizeOf(I));
    // read invisible dock clients
    Stream.Read(InVisCount, SizeOf(InVisCount));
    for I := 0 to InVisCount - 1 do
    begin
      ReadControlName(CompName);
      if CompName <> '' then
      begin
        Tl3HackWinControl(FDockSite).ReloadDockedControl(CompName, Client);
        if Client <> nil then
        begin
          Client.Visible := False;
          Client.ManualDock(FDockSite);
        end;
      end;
    end;
    // read top zone data
    Stream.Read(FTopXYLimit, SizeOf(FTopXYLimit));
    LastLevel := 0;
    LastZone := nil;
    // read dock zone tree
    while True do
    begin
     l_Zone := nil;
     try
      with Stream do
      begin
        Read(Level, SizeOf(Level));
        if Level = TreeStreamEndFlag then Break;
        l_Zone := Tl3DockZone.Create(Self);
        Read(l_Zone.FOrientation, SizeOf(l_Zone.FOrientation));
        Read(l_Zone.FZoneLimit, SizeOf(l_Zone.FZoneLimit));
        ReadControlName(CompName);
        if CompName <> '' then
          if not l_Zone.SetControlName(CompName) then
          begin
            {Remove dock zone if control cannot be found}
            l3Free(l_Zone);
            Continue;
          end;
      end;
      if (Level = 0) then
       TopZone := l_Zone
      else
      if (Level = LastLevel) then
       LastZone.NextSibling := l_Zone
      else
      if (Level > LastLevel) then
       LastZone.ChildZones := l_Zone;
      if (Level < LastLevel) then
      begin
        NextZone := LastZone;
        for I := 1 to LastLevel - Level do NextZone := NextZone.ParentZone;
        NextZone.NextSibling := l_Zone;
      end;//Level < LastLevel
      LastLevel := Level;
      LastZone := l_Zone;
     finally
      l3Free(l_Zone);
     end;//try..finally
    end;//while True
  finally
    EndUpdate;
  end;
end;

procedure Tl3DockTree.PaintDockFrame(Canvas: TCanvas; Control: TControl;
  const ARect: TRect);

  procedure DrawCloseButton(Left, Top: Integer);
  begin
    DrawFrameControl(Canvas.Handle, Rect(Left, Top, Left+FGrabberSize-2,
      Top+FGrabberSize-2), DFC_CAPTION, DFCS_CAPTIONCLOSE);
  end;

  procedure DrawGrabberLine(Left, Top, Right, Bottom: Integer);
  begin
    with Canvas do
    begin
      Pen.Color := clBtnHighlight;
      MoveTo(Right, Top);
      LineTo(Left, Top);
      LineTo(Left, Bottom);
      Pen.Color := clBtnShadow;
      LineTo(Right, Bottom);
      LineTo(Right, Top-1);
    end;
  end;

begin
  with ARect do
    if FDockSite.Align in [alTop, alBottom] then
    begin
      DrawCloseButton(Left+1, Top+1);
      DrawGrabberLine(Left+3, Top+FGrabberSize+1, Left+5, Bottom-2);
      DrawGrabberLine(Left+6, Top+FGrabberSize+1, Left+8, Bottom-2);
    end
    else
    begin
      DrawCloseButton(Right-FGrabberSize+1, Top+1);
      DrawGrabberLine(Left+2, Top+3, Right-FGrabberSize-2, Top+5);
      DrawGrabberLine(Left+2, Top+6, Right-FGrabberSize-2, Top+8);
    end;
end;

procedure Tl3DockTree.PaintSite(DC: HDC);
var
  Canvas  : TControlCanvas;
  Control : TControl;
  I       : Integer;
  R       : TRect;
begin
  Canvas := TControlCanvas.Create;
  try
    Canvas.Control := FDockSite;
    Canvas.Lock;
    try
      Canvas.Handle := DC;
      try
        with Canvas.Font do
         if l3IsDefaultCharset(Charset) then
          Charset := CS_Effective;
        for I := 0 to FDockSite.ControlCount - 1 do
        begin
          Control := FDockSite.Controls[I];
          if Control.Visible and (Control.HostDockSite = FDockSite) then
          begin
            R := Control.BoundsRect;
            AdjustDockRect(Control, R);
            Dec(R.Left, 2 * (R.Left - Control.Left));
            Dec(R.Top, 2 * (R.Top - Control.Top));
            Dec(R.Right, 2 * (Control.Width - (R.Right - R.Left)));
            Dec(R.Bottom, 2 * (Control.Height - (R.Bottom - R.Top)));
            PaintDockFrame(Canvas, Control, R);
          end;
        end;
      finally
        Canvas.Handle := 0;
      end;
    finally
      Canvas.Unlock;
    end;
  finally
    FreeAndNil(Canvas);
  end;
end;

procedure Tl3DockTree.PositionDockRect(Client, DropCtl: TControl;
  DropAlign: TAlign; var DockRect: TRect);
var
  VisibleClients,
  NewX, NewY, NewWidth, NewHeight: Integer;
begin
  VisibleClients := FDockSite.VisibleDockClientCount;
  { When docksite has no controls in it, or 1 or less clients then the
    dockrect should only be based on the client area of the docksite }
  if (DropCtl = nil) or (DropCtl.DockOrientation = doNoOrient) or
     {(DropCtl = Client) or }(VisibleClients < 2) then
  begin
    DockRect := Rect(0, 0, FDockSite.ClientWidth, FDockSite.ClientHeight);
    { When there is exactly 1 client we divide the docksite client area in half}
    if VisibleClients > 0 then
    with DockRect do
      case DropAlign of
        alLeft: Right := Right div 2;
        alRight: Left := Right div 2;
        alTop: Bottom := Bottom div 2;
        alBottom: Top := Bottom div 2;
      end;
  end
  else begin
  { Otherwise, if the docksite contains more than 1 client, set the coordinates
    for the dockrect based on the control under the mouse }
    NewX := DropCtl.Left;
    NewY := DropCtl.Top;
    NewWidth := DropCtl.Width;
    NewHeight := DropCtl.Height;
    if DropAlign in [alLeft, alRight] then
      NewWidth := DropCtl.Width div 2
    else if DropAlign in [alTop, alBottom] then
      NewHeight := DropCtl.Height div 2;
    case DropAlign of
      alRight: Inc(NewX, NewWidth);
      alBottom: Inc(NewY, NewHeight);
    end;
    DockRect := Bounds(NewX, NewY, NewWidth, NewHeight);
  end;
  MapWindowPoints(FDockSite.Handle, 0, DockRect, 2);
end;

procedure Tl3DockTree.RemoveControl(Control: TControl);
var
  Z: Tl3DockZone;
begin
  Z := FindControlZone(Control);
  if (Z <> nil) then
  begin
    if (Z = ReplacementZone) then
     Z.FChildControl := nil
    else
     RemoveZone(Z);
    Control.DockOrientation := doNoOrient;
    { Redraw client dock frames }
    FDockSite.Invalidate;
  end;
end;

procedure Tl3DockTree.RemoveZone(var Zone: Tl3DockZone);
var
  l_Sibling,
  l_LastChild      : Tl3DockZone;
  l_ZoneChildCount : Integer;
  l_TempZone       : Tl3DockZone;
  l_TempPrev       : Tl3DockZone;
  l_ParentZone     : Tl3DockZone;
begin
  if Zone = nil then
    raise Exception.Create(SDockTreeRemoveError + SDockZoneNotFound);
  if Zone.FChildControl = nil then
    raise Exception.Create(SDockTreeRemoveError + SDockZoneHasNoCtl);
  l_Sibling := nil;
  try
   l_ZoneChildCount := Zone.ParentZone.ChildCount;
   if l_ZoneChildCount = 1 then
   begin
     TopZone.ChildZones := nil;
     TopZone.FOrientation := doNoOrient;
   end
   else if l_ZoneChildCount = 2 then
   begin
     // This zone has only one sibling zone
     if Zone.PrevSibling = nil then
      l3Set(l_Sibling, Zone.NextSibling)
     else
      l3Set(l_Sibling, Zone.PrevSibling);
     if l_Sibling.FChildControl <> nil then
     begin
       // Sibling is a zone with one control and no child zones
       l_ParentZone := Zone.ParentZone.Use;
       try
        if l_ParentZone = TopZone then
        begin
          // If parent is top zone, then just remove the zone
          TopZone.ChildZones := l_Sibling;
          l_Sibling.NextSibling := nil;
          l_Sibling.ZoneLimit := TopZone.LimitSize;
          l_Sibling.Update;
        end
        else begin
          // Otherwise, _move sibling's control up into parent zone and dispose of sibling
          l_ParentZone.FOrientation := doNoOrient;
          l_ParentZone.FChildControl := l_Sibling.FChildControl;
          l_ParentZone.ChildZones := nil;
        end;
        ForEachAt(l_ParentZone, UpdateZone);
       finally
        l3Free(l_ParentZone);
       end;//try..finally
     end
     else begin
       // Sibling is a zone with child zones, so sibling must be made topmost
       // or collapsed into higher zone.
       if Zone.ParentZone = TopZone then
       begin
         // Zone is a child of topmost zone, so sibling becomes topmost
         l_Sibling.ExpandZoneLimit(FTopXYLimit);
         FTopXYLimit := TopZone.ZoneLimit;
         TopZone := l_Sibling;
         l_Sibling.NextSibling := nil;
         UpdateAll;
       end
       else begin
         // Zone's parent is not the topmost zone, so child zones must be
         // collapsed into parent zone
         if l_Sibling.ChildZones.PrevSibling = nil then
           Zone.ParentZone.ParentZone.ChildZones := l_Sibling.ChildZones
         else
           l_Sibling.ChildZones.PrevSibling.NextSibling := l_Sibling.ChildZones;
         l_LastChild := l_Sibling.ChildZones;
         repeat
           l_LastChild := l_LastChild.NextSibling;
         until l_LastChild.NextSibling = nil;
         l_LastChild.NextSibling := Zone.ParentZone.NextSibling;
         ForEachAt(l_LastChild.ParentZone, UpdateZone);
         //l3Free(Zone.ParentZone);
       end;
     end;
   end
   else begin
     // This zone has multiple sibling zones
     l_ParentZone := Zone.ParentZone.Use;
     try
      if (Zone.PrevSibling = nil) then
      begin
        // First zone in parent's child list, so make next one first and remove
        // from list
        l_TempZone := Zone.NextSibling.Use;
        try
         l_ParentZone.ChildZones := l_TempZone;
         if (l_TempZone <> nil) then
          l_TempZone.Update;
        finally
         l3Free(l_TempZone);
        end;//try..finally
      end//Zone.PrevSibling = nil
      else
      begin
        // Not first zone in parent's child list, so remove zone from list and fix
        // up adjacent siblings
        l_TempZone := Zone.Use;
        try
         l_TempPrev := l_TempZone.PrevSibling.Use;
         try
          l_TempPrev.NextSibling := l_TempZone.NextSibling;
          l_TempPrev.ExpandZoneLimit(l_TempZone.ZoneLimit);
          l_TempPrev.Update;
         finally
          l3Free(l_TempPrev);
         end;//try..finally
        finally
         l3Free(l_TempZone);
        end;//try..finally
      end;//Zone.PrevSibling = nil
      ForEachAt(l_ParentZone, UpdateZone);
     finally
      l3Free(l_ParentZone);
     end;//try..finally
   end;
  finally
   l3Free(l_Sibling);
  end;//try..finally
  Zone := nil; //l3Free(Zone);
end;

procedure Tl3DockTree.ResetBounds(Force: Boolean);
var
  R: TRect;
begin
  if not (csLoading in FDockSite.ComponentState) and
    (TopZone <> nil) and (FDockSite.VisibleDockClientCount > 0) then
  begin
    R := FDockSite.ClientRect;
    Tl3HackWinControl(FDockSite).AdjustClientRect(R);
    if Force or (not CompareMem(@R, @FOldRect, SizeOf(TRect))) then
    begin
      FOldRect := R;
      case TopZone.FOrientation of
        doHorizontal:
          begin
            TopZone.ZoneLimit := R.Right - R.Left;
            FTopXYLimit := R.Bottom - R.Top;
          end;
        doVertical:
          begin
            TopZone.ZoneLimit := R.Bottom - R.Top;
            FTopXYLimit := R.Right - R.Left;
          end;
      end;
      if FDockSite.DockClientCount > 0 then
      begin
        SetNewBounds(nil);
        if (FUpdateCount = 0) then
         ForEachAt(nil, UpdateZone);
      end;
    end;
  end;
end;

procedure Tl3DockTree.ScaleZone(Zone: Tl3DockZone);
begin
  if Zone = nil then Exit;
  if (Zone <> nil) and (Zone.ParentZone.FOrientation = FShiftScaleOrient) then
    with Zone do
      ZoneLimit := Integer(Round(ZoneLimit * FScaleBy));
end;

procedure Tl3DockTree.SaveToStream(Stream: TStream);

  procedure WriteControlName(ControlName: string);
  var
    NameLen: Integer;
  begin
    NameLen := Length(ControlName);
    Stream.Write(NameLen, SizeOf(NameLen));
    if NameLen > 0 then Stream.Write(Pointer(ControlName)^, NameLen);
  end;

  procedure DoSaveZone(Zone: Tl3DockZone; Level: Integer);
  begin
    with Stream do
    begin
      Write(Level, SizeOf(Level));
      Write(Zone.FOrientation, SizeOf(Zone.FOrientation));
      Write(Zone.FZoneLimit, SizeOf(Zone.FZoneLimit));
      WriteControlName(Zone.GetControlName);
    end;
    // Recurse child
    if Zone.ChildZones <> nil then
      DoSaveZone(Zone.ChildZones, Level + 1);
    // Recurse sibling
    if Zone.NextSibling <> nil then
      DoSaveZone(Zone.NextSibling, Level);
  end;

var
  I, NVCount: Integer;
  Ctl: TControl;
  NonVisList: TStringList;
begin
  // write stream version
  Stream.Write(FVersion, SizeOf(FVersion));
  // get list of non-visible dock clients
  NonVisList := TStringList.Create;
  try
    for I := 0 to FDockSite.DockClientCount - 1 do
    begin
      Ctl := FDockSite.DockClients[I];
      if (not Ctl.Visible) and (Ctl.Name <> '') then
        NonVisList.Add(Ctl.Name);
    end;
    // write non-visible dock client list
    NVCount := NonVisList.Count;
    Stream.Write(NVCount, SizeOf(NVCount));
    for I := 0 to NVCount - 1 do WriteControlName(NonVisList[I]);
  finally
    FreeAndNil(NonVisList);
  end;
  // write top zone data
  Stream.Write(FTopXYLimit, SizeOf(FTopXYLimit));
  // write all zones from tree
  DoSaveZone(TopZone, 0);
  Stream.Write(TreeStreamEndFlag, SizeOf(TreeStreamEndFlag));
end;

procedure Tl3DockTree.SetNewBounds(Zone: Tl3DockZone);

  procedure DoSetNewBounds(Zone: Tl3DockZone);
  begin
    if Zone <> nil then
    begin
      if (Zone.NextVisible = nil) and (Zone <> TopZone) and (Zone.Visible) then
      begin
        if Zone.ParentZone = TopZone then
          Zone.ZoneLimit := FTopXYLimit
        else
          Zone.ZoneLimit := Zone.ParentZone.ParentZone.ZoneLimit;
      end;
      DoSetNewBounds(Zone.FirstVisibleChild);
      DoSetNewBounds(Zone.NextVisible);
    end;
  end;

begin
  if Zone = nil then Zone := TopZone.ChildZones;
  DoSetNewBounds(Zone);
  { Redraw client dock frames }
  FDockSite.Invalidate;
end;

procedure Tl3DockTree.SetReplacingControl(Control: TControl);
begin
 ReplacementZone := FindControlZone(Control);
end;

procedure Tl3DockTree.ShiftZone(Zone: Tl3DockZone);
begin
  if (Zone <> nil) and (Zone <> TopZone) and
     (Zone.ParentZone.FOrientation = FShiftScaleOrient) then
    Zone.ZoneLimit := Zone.ZoneLimit + FShiftBy;
end;

procedure Tl3DockTree.SplitterMouseDown(OnZone: Tl3DockZone; MousePos: TPoint);
begin
  FSizingZone := OnZone;
  Mouse.Capture := FDockSite.Handle;
  FSizingWnd := FDockSite.Handle;
  FSizingDC := GetDCEx(FSizingWnd, 0, DCX_CACHE or DCX_CLIPSIBLINGS or
    DCX_LOCKWINDOWUPDATE);
  FSizePos := MousePos;
  DrawSizeSplitter;
end;

procedure Tl3DockTree.SplitterMouseUp;
begin
  Mouse.Capture := 0;
  DrawSizeSplitter;
  ReleaseDC(FSizingWnd, FSizingDC);
  if FSizingZone.ParentZone.FOrientation = doHorizontal then
    FSizingZone.ZoneLimit := FSizePos.y + (FBorderWidth div 2) else
    FSizingZone.ZoneLimit := FSizePos.x + (FBorderWidth div 2);
  SetNewBounds(FSizingZone.ParentZone);
  ForEachAt(FSizingZone.ParentZone, UpdateZone);
  FSizingZone := nil;
end;

procedure Tl3DockTree.UpdateAll;
begin
 if (FUpdateCount = 0) and (FDockSite.DockClientCount > 0) then
 begin
  ForEachAt(nil, UpdateZone);
 end;//FUpdateCount = 0
end;

procedure Tl3DockTree.UpdateZone(Zone: Tl3DockZone);
begin
 if (FUpdateCount = 0) then
  Zone.Update;
end;

procedure Tl3DockTree.DrawSizeSplitter;
var
  R: TRect;
  PrevBrush: HBrush;
begin
  if FSizingZone <> nil then
  begin
    with R do
    begin
      if FSizingZone.ParentZone.FOrientation = doHorizontal then
      begin
        Left := FSizingZone.Left;
        Top := FSizePos.Y - (FBorderWidth div 2);
        Right := Left + FSizingZone.Width;
        Bottom := Top + FBorderWidth;
      end
      else begin
        Left := FSizePos.X - (FBorderWidth div 2);
        Top := FSizingZone.Top;
        Right := Left + FBorderWidth;
        Bottom := Top + FSizingZone.Height;
      end;
    end;
    PrevBrush := SelectObject(FSizingDC, FBrush.Handle);
    with R do
      PatBlt(FSizingDC, Left, Top, Right - Left, Bottom - Top, PATINVERT);
    SelectObject(FSizingDC, PrevBrush);
  end;
end;

function Tl3DockTree.GetNextLimit(AZone: Tl3DockZone): Integer;
var
  LimitResult: Integer;

  procedure DoGetNextLimit(Zone: Tl3DockZone);
  begin
    if (Zone <> AZone) and
      (Zone.ParentZone.FOrientation = AZone.ParentZone.FOrientation) and
      (Zone.ZoneLimit > AZone.ZoneLimit) and ((Zone.FChildControl = nil) or
      ((Zone.FChildControl <> nil) and (Zone.FChildControl.Visible))) then
      LimitResult := Min(LimitResult, Zone.ZoneLimit);
    if Zone.NextSibling <> nil then DoGetNextLimit(Zone.NextSibling);
    if Zone.ChildZones <> nil then DoGetNextLimit(Zone.ChildZones);
  end;

begin
  if AZone.NextSibling <> nil then
    LimitResult := AZone.NextSibling.ZoneLimit
  else
    LimitResult := AZone.ZoneLimit + AZone.LimitSize;
  DoGetNextLimit(TopZone.ChildZones);
  Result := LimitResult;
end;

procedure Tl3DockTree.ControlVisibilityChanged(Control: TControl;
  Visible: Boolean);

  function GetDockAlign(Client, DropCtl: TControl): TAlign;
  var
    CRect, DRect: TRect;
  begin
    Result := alRight;
    if DropCtl <> nil then
    begin
      CRect := Client.BoundsRect;
      DRect := DropCtl.BoundsRect;
      if (CRect.Top <= DRect.Top) and (CRect.Bottom < DRect.Bottom) and
         (CRect.Right >= DRect.Right) then
        Result := alTop
      else if (CRect.Left <= DRect.Left) and (CRect.Right < DRect.Right) and
         (CRect.Bottom >= DRect.Bottom) then
        Result := alLeft
      else if CRect.Top >= ((DRect.Top + DRect.Bottom) div 2) then
        Result := alBottom;
    end;
  end;

  procedure HideZone(const Zone: Tl3DockZone);
  begin
    if IsOrientationSet(Zone) then
      Zone.FOldSize := Zone.FZoneLimit - Zone.LimitBegin
    else
      Zone.FOldSize := 0;

    if Assigned(Zone.ParentZone) and not (Zone.ParentZone.Visible) then
      HideZone(Zone.ParentZone);
    { When hiding, increase ZoneLimit for the zone before us }
    if Zone.PrevVisible <> nil then
      Zone.PrevVisible.ExpandZoneLimit(Zone.FZoneLimit);
    ForEachAt(Zone.ParentZone, UpdateZone);
  end;

  procedure ShowZone(const Zone: Tl3DockZone);
  var
    ResetAll: Boolean;
    MinSibSize: Integer;
  begin
    if Assigned(Zone.ParentZone) and (Zone.ParentZone <> TopZone) and
       (Zone.ParentZone.VisibleChildCount = 1) then
      ShowZone(Zone.ParentZone);
    if (Zone.ParentZone.VisibleChildCount = 1) or (Zone.FOldSize = 0) then
      ResetAll := True
    else
    begin
      ResetAll := False;
      MinSibSize := FGrabberSize + FBorderWidth + 14;
      if (Zone.PrevVisible <> nil) then
        with Zone.PrevVisible do
        begin
          if ((ZoneLimit - LimitBegin) - Zone.FOldSize) < MinSibSize then
            { Resizing the previous sibling will make it too small, resize all }
            ResetAll := True
          else
          begin
            { Make room before us as needed }
            ZoneLimit := ZoneLimit - Zone.FOldSize;
            { and adjust our own zone limit to reflect the previous size }
            Zone.ZoneLimit := ZoneLimit + Zone.FOldSize;
            Zone.PrevVisible.ResetZoneLimits;
          end;
        end
      else if (Zone.NextVisible <> nil) then
      begin
        if (Zone.NextVisible.ZoneLimit - Zone.FOldSize) < MinSibSize then
          { Resizing the next sibling will make it too small, resize all }
          ResetAll := True
        else
        begin
          { Adjust zone limit to make room for controls following this one }
          Zone.ZoneLimit := Zone.LimitBegin + Zone.FOldSize;
          Zone.NextVisible.ResetZoneLimits;
        end;
      end;
    end;
    if ResetAll then
      Zone.ParentZone.ResetChildren;
    ForEachAt(Zone.ParentZone, UpdateZone);
  end;

var
  HitTest: Integer;
  CtlZone, DropCtlZone: Tl3DockZone;
  DropCtl: TControl;
begin
  CtlZone := FindControlZone(Control);
  if Assigned(CtlZone) then
  begin
    if Visible then
      ShowZone(CtlZone)
    else
      HideZone(CtlZone);
    FDockSite.Invalidate;
  end
  { Existing control that was never docked, create a new dock zone for it }
  else if Visible then
  begin
    DropCtlZone := InternalHitTest(Point(Control.Left, Control.Top), HitTest);
    if DropCtlZone <> nil then
      DropCtl := DropCtlZone.FChildControl
    else
      DropCtl := nil;
    InsertControl(Control, GetDockAlign(Control, DropCtl), DropCtl);
  end;
end;

procedure Tl3DockTree.WindowProc(var Message: TMessage);

  procedure CalcSplitterPos;
  var
    MinWidth,
    TestLimit: Integer;
  begin
    MinWidth := FGrabberSize;
    if (FSizingZone.ParentZone.FOrientation = doHorizontal) then
    begin
      TestLimit := FSizingZone.Top + MinWidth;
      if FSizePos.y <= TestLimit then FSizePos.y := TestLimit;
      TestLimit := GetNextLimit(FSizingZone) - MinWidth;
      if FSizePos.y >= TestLimit then FSizePos.y := TestLimit;
    end
    else begin
      TestLimit := FSizingZone.Left + MinWidth;
      if FSizePos.x <= TestLimit then FSizePos.x := TestLimit;
      TestLimit := GetNextLimit(FSizingZone) - MinWidth;
      if FSizePos.x >= TestLimit then FSizePos.x := TestLimit;
    end;
  end;

const
  SizeCursors: array[TDockOrientation] of TCursor = (crDefault, crVSplit, crHSplit);
var
  TempZone: Tl3DockZone;
  Control: TControl;
  P: TPoint;
  R: TRect;
  HitTestValue: Integer;
  Msg: TMsg;
begin
  case Message.Msg of
    CM_DOCKNOTIFICATION:
      with TCMDockNotification(Message) do
        if (NotifyRec.ClientMsg = CM_VISIBLECHANGED) then
          ControlVisibilityChanged(Client, Boolean(NotifyRec.MsgWParam));
    WM_MOUSEMOVE:
      if FSizingZone <> nil then
      begin
        DrawSizeSplitter;
        FSizePos := SmallPointToPoint(TWMMouse(Message).Pos);
        CalcSplitterPos;
        DrawSizeSplitter;
      end;
    WM_LBUTTONDBLCLK:
      begin
        TempZone := InternalHitTest(SmallPointToPoint(TWMMouse(Message).Pos),
          HitTestValue);
        if TempZone <> nil then
          with TempZone do
            if (FChildControl <> nil) and (HitTestValue = HTCAPTION) then
            begin
              CancelDrag;
              FChildControl.ManualDock(nil, nil, alTop);
            end;
      end;
    WM_LBUTTONDOWN:
      begin
        P := SmallPointToPoint(TWMMouse(Message).Pos);
        TempZone := InternalHitTest(P, HitTestValue);
        if (TempZone <> nil) then
        begin
          if HitTestValue = HTBORDER then
            SplitterMouseDown(TempZone, P)
          else if HitTestValue = HTCAPTION then
          begin
            if (not PeekMessage(Msg, FDockSite.Handle, WM_LBUTTONDBLCLK,
               WM_LBUTTONDBLCLK, PM_NOREMOVE)) and
               (TempZone.FChildControl is TWinControl) then
              TWinControl(TempZone.FChildControl).SetFocus;
            if (Tl3HackWinControl(TempZone.FChildControl).DragKind = dkDock) and
               (Tl3HackWinControl(TempZone.FChildControl).DragMode = dmAutomatic)then
              TempZone.FChildControl.BeginDrag(False);
            Exit;
          end;
        end;
      end;
    WM_LBUTTONUP:
      if FSizingZone = nil then
      begin
        P := SmallPointToPoint(TWMMouse(Message).Pos);
        TempZone := InternalHitTest(P, HitTestValue);
        if (TempZone <> nil) and (HitTestValue = HTCLOSE) then
        begin
          if TempZone.FChildControl is TCustomForm then
            TCustomForm(TempZone.FChildControl).Close
          else
            TempZone.FChildControl.Visible := False;
        end;
      end
      else
        SplitterMouseUp;
    WM_SETCURSOR:
      begin
        GetCursorPos(P);
        P := FDockSite.ScreenToClient(P);
        with TWMSetCursor(Message) do
          if (Smallint(HitTest) = HTCLIENT) and (CursorWnd = FDockSite.Handle)
            and (FDockSite.VisibleDockClientCount > 0) then
          begin
            TempZone := InternalHitTest(P, HitTestValue);
            if (TempZone <> nil) and (HitTestValue = HTBORDER) then
            begin
              Windows.SetCursor(Screen.Cursors[SizeCursors[TempZone.ParentZone.FOrientation]]);
              Result := 1;
              Exit;
            end;
          end;
      end;
    CM_HINTSHOW:
      with TCMHintShow(Message) do
      begin
        FOldWndProc(Message);
        if Result = 0 then
        begin
          Control := HitTest(HintInfo^.CursorPos, HitTestValue);
          if HitTestValue = HTBORDER then
            HintInfo^.HintStr := ''
          else if (Control <> nil) and (HitTestValue in [HTCAPTION, HTCLOSE]) then
          begin
            R := Control.BoundsRect;
            AdjustDockRect(Control, R);
            Dec(R.Left, 2 * (R.Left - Control.Left));
            Dec(R.Top, 2 * (R.Top - Control.Top));
            Dec(R.Right, 2 * (Control.Width - (R.Right - R.Left)));
            Dec(R.Bottom, 2 * (Control.Height - (R.Bottom - R.Top)));
            HintInfo^.HintStr := Tl3HackWinControl(Control).Caption;
            HintInfo^.CursorRect := R;
          end;
        end;
        Exit;
      end;
  end;
  if Assigned(FOldWndProc) then
    FOldWndProc(Message);
end;

(*initialization
 DefaultDockTreeClass := TDockTreeClass(Tl3DockTree);*)

end.

