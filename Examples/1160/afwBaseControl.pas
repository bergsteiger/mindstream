unit afwBaseControl;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "AFW"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/gui/Garant/AFW/implementation/Visual/afwBaseControl.pas"
// Начат: 01.09.2008
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<GuiControl::Class>> Shared Delphi::AFW::afwControl::TafwBaseControl
//
// Реализует интерфейс IUnknown и подсчет количества ссылок. Также предоставляет свойство Canvas
// для реализации процедуры рисования - Paint. Предоставляет реализацию интерфейсов для поддержки
// drag and drop
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3Interfaces,
  l3Types,
  afwInterfaces,
  l3InternalInterfaces,
  l3Units,
  afwTypes,
  Messages,
  Classes,
  l3IID
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  afwControlPrim,
  l3WinControlCanvas
  {$If not defined(NoVCL)}
  ,
  StdCtrls
  {$IfEnd} //not NoVCL
  ,
  l3LongintList,
  Windows
  ;

type
//#UC START# *48BD1975029Bci*
//#UC END# *48BD1975029Bci*
 _afwToolOwner_Parent_ = TafwControlPrim;
 {$Include ..\Visual\afwToolOwner.imp.pas}
 _afwVGSceneUpdater_Parent_ = _afwToolOwner_;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwVGSceneUpdater.imp.pas}
 TafwBaseControl = class(_afwVGSceneUpdater_, Il3CommandTarget, Il3DropTarget, Il3ChangeRecipient, IafwControl, IafwMenuUnlockedPostBuild)
  {* Реализует интерфейс IUnknown и подсчет количества ссылок. Также предоставляет свойство Canvas для реализации процедуры рисования - Paint. Предоставляет реализацию интерфейсов для поддержки drag and drop }
 private
 // private fields
   fUpdateCount : Integer;
   fStopChangeNotify : Boolean;
   fUpdateNeed : Boolean;
   fDoChangedCount : Integer;
    {* флаг, используемый для разрешения коллизий вложенных вызовов DoChanged}
   f_SetDragDrop : Boolean;
   f_PaintCount : Integer;
   f_LastHint : AnsiString;
   f_LastHintPt : TPoint;
   f_DragImageList : TDragImageList;
    {* Поле для свойства DragImageList}
   f_InDrop : Boolean;
    {* Поле для свойства InDrop}
   f_IsActiveDropSource : Boolean;
    {* Поле для свойства IsActiveDropSource}
   f_DrawSpecial : Boolean;
    {* Поле для свойства DrawSpecial}
   f_OnDrawSpecialChange : TNotifyEvent;
    {* Поле для свойства OnDrawSpecialChange}
   f_BorderStyle : TBorderStyle;
    {* Поле для свойства BorderStyle}
   f_ScrollStyle : TScrollStyle;
    {* Поле для свойства ScrollStyle}
   f_InPopup : Integer;
    {* Поле для свойства InPopup}
 private
 // private methods
   procedure RevokeDragDrop;
   procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
   procedure CMCOLORCHANGED(var Msg: TMessage); message CM_COLORCHANGED;
   procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
   procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
   procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
 protected
 // property methods
   function pm_GetCanvas: Tl3WinControlCanvas;
   procedure pm_SetCanvas(aValue: Tl3WinControlCanvas);
   procedure pm_SetDrawSpecial(aValue: Boolean);
   procedure pm_SetBorderStyle(aValue: TBorderStyle);
   procedure pm_SetScrollStyle(aValue: TScrollStyle); virtual;
 protected
 // realized methods
   function GetAcceptableFormats: Tl3ClipboardFormats;
     {* Список приемлимых форматов. }
   function DoDrop(aFormat: Tl3ClipboardFormat;
    const aMedium: Tl3StoragePlace;
    var dwEffect: Integer): Boolean;
   function DoDragOver(const aData: IDataObject;
    const aPoint: TPoint): Boolean;
   procedure DoDragEnter(const aData: IDataObject;
    const aPoint: TPoint);
   procedure DoDragLeave;
   function Keys2Effect(aKeys: Integer): Integer;
   function ProcessCommand(Cmd: Tl3OperationCode;
    aForce: Boolean;
    aCount: Integer): Boolean;
   procedure UpdateScrollRange(WhatUpdate: TafwScrollBars = afw_sbBoth);
   procedure MenuUnlockedFixUp;
   function IsA(anObj: TObject): Boolean;
 public
 // realized methods
   procedure Changing;
     {* нотификация о начале изменения состояния объекта. Для перекрытия и использования в потомках. }
   procedure Changed;
     {* нотификация о завершении изменения состояния объекта. Для перекрытия и использования в потомках. }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; override;
   {$If not defined(NoVCL)}
   procedure WndProc(var Message: TMessage); override;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   procedure CreateWindowHandle(const Params: TCreateParams); override;
     {* Creates a Windows control to represent the control }
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   procedure DestroyWindowHandle; override;
     {* Destroys the window created in the CreateWindowHandle method }
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   procedure PaintWindow(DC: hDC); override;
     {* Renders the image of a windowed control }
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   procedure CreateParams(var Params: TCreateParams); override;
   {$IfEnd} //not NoVCL
   {$If defined(l3HackedVCL) AND not defined(NoVCL)}
   function LockPainting: Boolean; override;
   {$IfEnd} //l3HackedVCL AND not NoVCL
    {$If defined(l3HackedVCL) AND not defined(DesignTimeLibrary) AND not defined(NoVCL)}
   procedure SelectNext(CurControl: TWinControl;
     GoForward: Boolean;
     CheckTabStop: Boolean); override;
    {$IfEnd} //l3HackedVCL AND not DesignTimeLibrary AND not NoVCL
 public
 // overridden public methods
   constructor Create(AOwner: TComponent); override;
   {$If not defined(NoVCL)}
   procedure Invalidate; override;
     {* Completely repaint control }
   {$IfEnd} //not NoVCL
 protected
 // protected fields
   f_Canvas : Tl3WinControlCanvas;
 protected
 // protected methods
   function GetCommands: TafwCommands; virtual;
   function ProcessMessage(var aMessage: TMessage;
    aTime: Cardinal): Boolean;
   function DoProcessCommand(Cmd: Tl3OperationCode;
    aForce: Boolean;
    aCount: Integer): Boolean; virtual;
   procedure DoChanging; virtual;
   procedure DoChanged; virtual;
   function IsInChange: Boolean;
   procedure UpdateDragImage(const aPoint: TPoint);
   function DoDoDragOver(const aData: IDataObject;
    const aPoint: TPoint): Boolean; virtual;
   function DoGetAcceptableFormats: Tl3ClipboardFormats; virtual;
   function DoDoDrop(aFormat: Tl3ClipboardFormat;
    const aMedium: Tl3StoragePlace;
    var dwEffect: Integer): Boolean; virtual;
   function DoKeys2Effect(aKeys: Integer): Integer; virtual;
   procedure DoDoDragLeave; virtual;
   procedure DoUpdateScrollRange(WhatUpdate: TafwScrollBars); virtual;
   procedure FreeCanvas;
   function GetCaret: Il3Caret; virtual;
   procedure DoDrawSpecialChange(Sender: TObject); virtual;
   procedure Paint(const CN: Il3Canvas); virtual;
     {* процедура рисования внешнего вида управляющего элемента }
   function InUpdating: Boolean; virtual;
   procedure ShowMenu(const aPoint: TPoint); overload; 
   procedure AdjustColors(Bevel: TBevelCut;
    var TopColor: Tl3Color;
    var BottomColor: Tl3Color);
   function DataCodePage: Integer; virtual;
     {* Кодировка данных в том месте, куда происходит вставка }
   function DropFormattedData(aFormat: Tl3ClipboardFormat;
    const aData: IDataObject): Boolean;
   function GetAcceptableFormatsFor(const aData: IDataObject): Tl3ClipboardFormats;
   procedure SetCommands(const aCommands: array of AnsiString;
    out theCommands: TafwCommands);
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; virtual;
   procedure CancelHint;
   procedure ActivateHint(const aPt: TPoint); overload; 
   procedure ActivateHint; overload; 
   procedure DoMenuUnlockedFixUp; virtual;
   function IsMenuLocked: Boolean;
   procedure DoAfterCreateCanvas; virtual;
     {* Вызыввается после создания канвы для установки, например, Zoom'а в наследниках. }
 public
 // public methods
   procedure ChangeNotifyOff;
     {* заблокировать нотификацию об изменении хранилища. }
   procedure ChangeNotifyOn(aChange: Boolean = True);
     {* разблокировать нотификацию об изменении хранилища. }
   function DoDragDrop(const aDataObject: IDataObject;
    anEffect: Integer;
    out theEffect: Integer): Integer;
   procedure DoDrawSub(aSubTarget: TObject;
    const Canvas: Il3Canvas;
    const R: Tl3Rect;
    SubType: Tl3Handle;
    aSub: TObject); virtual;
   procedure ShowMenu; overload; 
   function PasteFromClipboard(aFormat: Tl3ClipboardFormat;
    const aData: IDataObject): Boolean; virtual;
     {* вставить текст из буфера обмена в формате aFormat }
   function Paste: Boolean; virtual;
     {* вставить из буфера обмена. }
 protected
 // protected properties
   property DragImageList: TDragImageList
     read f_DragImageList;
   property InDrop: Boolean
     read f_InDrop;
   property IsActiveDropSource: Boolean
     read f_IsActiveDropSource;
   property InPopup: Integer
     read f_InPopup;
 public
 // public properties
   property Canvas: Tl3WinControlCanvas
     read pm_GetCanvas
     write pm_SetCanvas;
   property DrawSpecial: Boolean
     read f_DrawSpecial
     write pm_SetDrawSpecial
     default false;
   property OnDrawSpecialChange: TNotifyEvent
     read f_OnDrawSpecialChange
     write f_OnDrawSpecialChange;
   property BorderStyle: TBorderStyle
     read f_BorderStyle
     write pm_SetBorderStyle
     default Forms.bsNone;
     {* стиль рамки }
   property ScrollStyle: TScrollStyle
     read f_ScrollStyle
     write pm_SetScrollStyle
     default ssNone;
     {* какие ScrollBar'ы нужны }
//#UC START# *48BD1975029Bpubl*
    protected
      property ParentFont
        default false;
        {-}    
//#UC END# *48BD1975029Bpubl*
 end;//TafwBaseControl

implementation

uses
  l3Operations,
  l3Bitmap,
  l3SysUtils,
  l3DropTarget,
  l3DropSource,
  l3Base,
  afwFacade,
  afwVCL,
  Graphics,
  l3Chars,
  afwHintManager,
  k2OperationContainer,
  l3CustomControlCanvas
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  ,
  SysUtils
  ;

{$Include ..\Visual\afwToolOwner.imp.pas}

{$Include w:\common\components\gui\Garant\AFW\implementation\afwVGSceneUpdater.imp.pas}

// start class TafwBaseControl

function TafwBaseControl.pm_GetCanvas: Tl3WinControlCanvas;
//#UC START# *48C6B5BB03B4_48BD1975029Bget_var*
//#UC END# *48C6B5BB03B4_48BD1975029Bget_var*
begin
//#UC START# *48C6B5BB03B4_48BD1975029Bget_impl*
 if (f_Canvas = nil) then
 begin
  f_Canvas := Tl3CustomControlCanvas.Create(Self, GetCaret);
  f_Canvas.OnDrawSub := DoDrawSub;
  f_Canvas.DrawSpecial := DrawSpecial;
  f_Canvas.OnDrawSpecialChange := DoDrawSpecialChange;
  f_Canvas.BackColor := Color;
  DoAfterCreateCanvas;
 end//f_Canvas = nil
 else
 if not f_Canvas.Drawing then
  f_Canvas.WindowOrg := l3Point0;
 Result := f_Canvas; 
//#UC END# *48C6B5BB03B4_48BD1975029Bget_impl*
end;//TafwBaseControl.pm_GetCanvas

procedure TafwBaseControl.pm_SetCanvas(aValue: Tl3WinControlCanvas);
//#UC START# *48C6B5BB03B4_48BD1975029Bset_var*
//#UC END# *48C6B5BB03B4_48BD1975029Bset_var*
begin
//#UC START# *48C6B5BB03B4_48BD1975029Bset_impl*
 l3Set(f_Canvas, aValue);
//#UC END# *48C6B5BB03B4_48BD1975029Bset_impl*
end;//TafwBaseControl.pm_SetCanvas

procedure TafwBaseControl.pm_SetDrawSpecial(aValue: Boolean);
//#UC START# *48C6B85801F8_48BD1975029Bset_var*
//#UC END# *48C6B85801F8_48BD1975029Bset_var*
begin
//#UC START# *48C6B85801F8_48BD1975029Bset_impl*
 if f_DrawSpecial <> aValue then
 begin
  if Assigned(f_Canvas) then
   f_Canvas.DrawSpecial := aValue
  else
  begin
   f_DrawSpecial := aValue;
   DoDrawSpecialChange(Self);
  end;
 end;
//#UC END# *48C6B85801F8_48BD1975029Bset_impl*
end;//TafwBaseControl.pm_SetDrawSpecial

procedure TafwBaseControl.pm_SetBorderStyle(aValue: TBorderStyle);
//#UC START# *48C78DC303A9_48BD1975029Bset_var*
//#UC END# *48C78DC303A9_48BD1975029Bset_var*
begin
//#UC START# *48C78DC303A9_48BD1975029Bset_impl*
 if (aValue <> f_BorderStyle) then
 begin
  f_BorderStyle := aValue;
  if HandleAllocated then
   RecreateWnd;
 end;//aValue <> f_BorderStyle
//#UC END# *48C78DC303A9_48BD1975029Bset_impl*
end;//TafwBaseControl.pm_SetBorderStyle

procedure TafwBaseControl.pm_SetScrollStyle(aValue: TScrollStyle);
//#UC START# *48C79014036C_48BD1975029Bset_var*
//#UC END# *48C79014036C_48BD1975029Bset_var*
begin
//#UC START# *48C79014036C_48BD1975029Bset_impl*
 if (aValue <> f_ScrollStyle) then
 begin
  f_ScrollStyle := aValue;
  if HandleAllocated then
   RecreateWnd;
 end;//aValue <> f_ScrollStyle..
//#UC END# *48C79014036C_48BD1975029Bset_impl*
end;//TafwBaseControl.pm_SetScrollStyle

function TafwBaseControl.GetCommands: TafwCommands;
//#UC START# *48BD1E3C03B5_48BD1975029B_var*
//#UC END# *48BD1E3C03B5_48BD1975029B_var*
begin
//#UC START# *48BD1E3C03B5_48BD1975029B_impl*
 Result := nil;
//#UC END# *48BD1E3C03B5_48BD1975029B_impl*
end;//TafwBaseControl.GetCommands

function TafwBaseControl.ProcessMessage(var aMessage: TMessage;
  aTime: Cardinal): Boolean;
//#UC START# *48BD21CE01C0_48BD1975029B_var*
//#UC END# *48BD21CE01C0_48BD1975029B_var*
begin
//#UC START# *48BD21CE01C0_48BD1975029B_impl*
 Result := ProcessCommand(Controller.EntryCommands.TranslateUsing(GetCommands, aMessage, aTime, Self), false, Lo(TWMKey(aMessage).KeyData));
//#UC END# *48BD21CE01C0_48BD1975029B_impl*
end;//TafwBaseControl.ProcessMessage

function TafwBaseControl.DoProcessCommand(Cmd: Tl3OperationCode;
  aForce: Boolean;
  aCount: Integer): Boolean;
//#UC START# *48BD22E601F2_48BD1975029B_var*
//#UC END# *48BD22E601F2_48BD1975029B_var*
begin
//#UC START# *48BD22E601F2_48BD1975029B_impl*
 Result := (Cmd = l3_ocShortCut);
//#UC END# *48BD22E601F2_48BD1975029B_impl*
end;//TafwBaseControl.DoProcessCommand

procedure TafwBaseControl.DoChanging;
//#UC START# *48BD5F73035B_48BD1975029B_var*
//#UC END# *48BD5F73035B_48BD1975029B_var*
begin
//#UC START# *48BD5F73035B_48BD1975029B_impl*
//#UC END# *48BD5F73035B_48BD1975029B_impl*
end;//TafwBaseControl.DoChanging

procedure TafwBaseControl.DoChanged;
//#UC START# *48BD5F8303C4_48BD1975029B_var*
//#UC END# *48BD5F8303C4_48BD1975029B_var*
begin
//#UC START# *48BD5F8303C4_48BD1975029B_impl*
//#UC END# *48BD5F8303C4_48BD1975029B_impl*
end;//TafwBaseControl.DoChanged

function TafwBaseControl.IsInChange: Boolean;
//#UC START# *48BD624A0306_48BD1975029B_var*
//#UC END# *48BD624A0306_48BD1975029B_var*
begin
//#UC START# *48BD624A0306_48BD1975029B_impl*
 Result := (FUpdateCount > 0);
//#UC END# *48BD624A0306_48BD1975029B_impl*
end;//TafwBaseControl.IsInChange

procedure TafwBaseControl.ChangeNotifyOff;
//#UC START# *48BD632F0215_48BD1975029B_var*
//#UC END# *48BD632F0215_48BD1975029B_var*
begin
//#UC START# *48BD632F0215_48BD1975029B_impl*
 fStopChangeNotify := true;
 Inc(FUpdateCount);
//#UC END# *48BD632F0215_48BD1975029B_impl*
end;//TafwBaseControl.ChangeNotifyOff

procedure TafwBaseControl.ChangeNotifyOn(aChange: Boolean = True);
//#UC START# *48BD634C0086_48BD1975029B_var*
//#UC END# *48BD634C0086_48BD1975029B_var*
begin
//#UC START# *48BD634C0086_48BD1975029B_impl*
 fStopChangeNotify := false;
 Dec(FUpdateCount);
 if (FUpdateCount = 0) and fUpdateNeed then
 begin
  if aChange then
  begin
   Changing;
   Changed;
  end;//aChange
  fUpdateNeed := False;
 end;//FUpdateCount = 0
//#UC END# *48BD634C0086_48BD1975029B_impl*
end;//TafwBaseControl.ChangeNotifyOn

procedure TafwBaseControl.UpdateDragImage(const aPoint: TPoint);
//#UC START# *48BF9F4802D3_48BD1975029B_var*
//#UC END# *48BF9F4802D3_48BD1975029B_var*
begin
//#UC START# *48BF9F4802D3_48BD1975029B_impl*
 if (f_DragImageList <> nil) AND (f_DragImageList.Count > 0) then
  with aPoint do
   f_DragImageList.DragMove(X, Y);
//#UC END# *48BF9F4802D3_48BD1975029B_impl*
end;//TafwBaseControl.UpdateDragImage

function TafwBaseControl.DoDoDragOver(const aData: IDataObject;
  const aPoint: TPoint): Boolean;
//#UC START# *48BFA1300211_48BD1975029B_var*
//#UC END# *48BFA1300211_48BD1975029B_var*
begin
//#UC START# *48BFA1300211_48BD1975029B_impl*
 Result := false;
//#UC END# *48BFA1300211_48BD1975029B_impl*
end;//TafwBaseControl.DoDoDragOver

function TafwBaseControl.DoGetAcceptableFormats: Tl3ClipboardFormats;
//#UC START# *48BFB42C002A_48BD1975029B_var*
//#UC END# *48BFB42C002A_48BD1975029B_var*
begin
//#UC START# *48BFB42C002A_48BD1975029B_impl*
 Result := nil;
//#UC END# *48BFB42C002A_48BD1975029B_impl*
end;//TafwBaseControl.DoGetAcceptableFormats

function TafwBaseControl.DoDoDrop(aFormat: Tl3ClipboardFormat;
  const aMedium: Tl3StoragePlace;
  var dwEffect: Integer): Boolean;
//#UC START# *48BFB6D800B3_48BD1975029B_var*
//#UC END# *48BFB6D800B3_48BD1975029B_var*
begin
//#UC START# *48BFB6D800B3_48BD1975029B_impl*
 Result := false;
//#UC END# *48BFB6D800B3_48BD1975029B_impl*
end;//TafwBaseControl.DoDoDrop

function TafwBaseControl.DoKeys2Effect(aKeys: Integer): Integer;
//#UC START# *48BFB75F01ED_48BD1975029B_var*
//#UC END# *48BFB75F01ED_48BD1975029B_var*
begin
//#UC START# *48BFB75F01ED_48BD1975029B_impl*
 if ((aKeys AND MK_Control) <> 0) then
  Result := DROPEFFECT_COPY
 else
  Result := DROPEFFECT_MOVE;
//#UC END# *48BFB75F01ED_48BD1975029B_impl*
end;//TafwBaseControl.DoKeys2Effect

procedure TafwBaseControl.DoDoDragLeave;
//#UC START# *48BFBC8002CB_48BD1975029B_var*
//#UC END# *48BFBC8002CB_48BD1975029B_var*
begin
//#UC START# *48BFBC8002CB_48BD1975029B_impl*
//#UC END# *48BFBC8002CB_48BD1975029B_impl*
end;//TafwBaseControl.DoDoDragLeave

procedure TafwBaseControl.DoUpdateScrollRange(WhatUpdate: TafwScrollBars);
//#UC START# *48BFC47D00F4_48BD1975029B_var*
//#UC END# *48BFC47D00F4_48BD1975029B_var*
begin
//#UC START# *48BFC47D00F4_48BD1975029B_impl*
//#UC END# *48BFC47D00F4_48BD1975029B_impl*
end;//TafwBaseControl.DoUpdateScrollRange

procedure TafwBaseControl.RevokeDragDrop;
//#UC START# *48C67F6500BD_48BD1975029B_var*
//#UC END# *48C67F6500BD_48BD1975029B_var*
begin
//#UC START# *48C67F6500BD_48BD1975029B_impl*
 if HandleAllocated AND f_SetDragDrop then
 begin
  f_SetDragDrop := false;
  l3RevokeDragDrop(Handle);
 end;//HandleAllocated
//#UC END# *48C67F6500BD_48BD1975029B_impl*
end;//TafwBaseControl.RevokeDragDrop

procedure TafwBaseControl.WMDestroy(var Message: TWMDestroy);
//#UC START# *48C67F7C0343_48BD1975029B_var*
//#UC END# *48C67F7C0343_48BD1975029B_var*
begin
//#UC START# *48C67F7C0343_48BD1975029B_impl*
 RevokeDragDrop;
 inherited;
//#UC END# *48C67F7C0343_48BD1975029B_impl*
end;//TafwBaseControl.WMDestroy

function TafwBaseControl.DoDragDrop(const aDataObject: IDataObject;
  anEffect: Integer;
  out theEffect: Integer): Integer;
//#UC START# *48C685E600A1_48BD1975029B_var*
var
 l_DropSource : IDropSource;
//#UC END# *48C685E600A1_48BD1975029B_var*
begin
//#UC START# *48C685E600A1_48BD1975029B_impl*
 l_DropSource := Tl3DropSource.Make;
 try
  f_IsActiveDropSource := true;
  try
   theEffect := 0;
   Result := l3DoDragDrop(aDataObject, l_DropSource, anEffect, theEffect);
  finally
   f_IsActiveDropSource := false;
  end;//try..finally
 finally
  l_DropSource := nil;
 end;//try..finally
//#UC END# *48C685E600A1_48BD1975029B_impl*
end;//TafwBaseControl.DoDragDrop

procedure TafwBaseControl.FreeCanvas;
//#UC START# *48C68B0D0146_48BD1975029B_var*
//#UC END# *48C68B0D0146_48BD1975029B_var*
begin
//#UC START# *48C68B0D0146_48BD1975029B_impl*
 FreeAndNil(f_Canvas);
//#UC END# *48C68B0D0146_48BD1975029B_impl*
end;//TafwBaseControl.FreeCanvas

function TafwBaseControl.GetCaret: Il3Caret;
//#UC START# *48C6B7E80104_48BD1975029B_var*
//#UC END# *48C6B7E80104_48BD1975029B_var*
begin
//#UC START# *48C6B7E80104_48BD1975029B_impl*
 Result := nil;
//#UC END# *48C6B7E80104_48BD1975029B_impl*
end;//TafwBaseControl.GetCaret

procedure TafwBaseControl.DoDrawSub(aSubTarget: TObject;
  const Canvas: Il3Canvas;
  const R: Tl3Rect;
  SubType: Tl3Handle;
  aSub: TObject);
//#UC START# *48C6B7FF01F8_48BD1975029B_var*
//#UC END# *48C6B7FF01F8_48BD1975029B_var*
begin
//#UC START# *48C6B7FF01F8_48BD1975029B_impl*
//#UC END# *48C6B7FF01F8_48BD1975029B_impl*
end;//TafwBaseControl.DoDrawSub

procedure TafwBaseControl.DoDrawSpecialChange(Sender: TObject);
//#UC START# *48C6B82C028B_48BD1975029B_var*
//#UC END# *48C6B82C028B_48BD1975029B_var*
begin
//#UC START# *48C6B82C028B_48BD1975029B_impl*
 if Assigned(f_Canvas) then
  f_DrawSpecial := f_Canvas.DrawSpecial;
 if Assigned(f_OnDrawSpecialChange) then
  f_OnDrawSpecialChange(Self);
//#UC END# *48C6B82C028B_48BD1975029B_impl*
end;//TafwBaseControl.DoDrawSpecialChange

procedure TafwBaseControl.Paint(const CN: Il3Canvas);
//#UC START# *48C6C044025E_48BD1975029B_var*
//#UC END# *48C6C044025E_48BD1975029B_var*
begin
//#UC START# *48C6C044025E_48BD1975029B_impl*
//#UC END# *48C6C044025E_48BD1975029B_impl*
end;//TafwBaseControl.Paint

function TafwBaseControl.InUpdating: Boolean;
//#UC START# *48C6C421015B_48BD1975029B_var*
//#UC END# *48C6C421015B_48BD1975029B_var*
begin
//#UC START# *48C6C421015B_48BD1975029B_impl*
 Result := HandleAllocated AND Visible AND afw.IsObjectLocked(Self);
 // без проверки на видимость, WM_PAINT'ы приходят невидимым контролам, в результате
 // имеем прогрузку дерева при ненужной отрисовке, например.
//#UC END# *48C6C421015B_48BD1975029B_impl*
end;//TafwBaseControl.InUpdating

procedure TafwBaseControl.ShowMenu(const aPoint: TPoint);
//#UC START# *48C7AF9D0203_48BD1975029B_var*
//#UC END# *48C7AF9D0203_48BD1975029B_var*
begin
//#UC START# *48C7AF9D0203_48BD1975029B_impl*
 Inc(f_InPopup);
 try
  with aPoint do
   Perform(WM_ContextMenu,
           WParam(Handle),
           LParam(PointToSmallPoint(aPoint)));
 finally
  Dec(f_InPopup);
 end;//try..finally
//#UC END# *48C7AF9D0203_48BD1975029B_impl*
end;//TafwBaseControl.ShowMenu

procedure TafwBaseControl.ShowMenu;
//#UC START# *48C7AFAA014B_48BD1975029B_var*
var
 l_Pt : TPoint;
//#UC END# *48C7AFAA014B_48BD1975029B_var*
begin
//#UC START# *48C7AFAA014B_48BD1975029B_impl*
 GetCursorPos(l_Pt);
 ShowMenu(l_Pt);
//#UC END# *48C7AFAA014B_48BD1975029B_impl*
end;//TafwBaseControl.ShowMenu

procedure TafwBaseControl.CMCOLORCHANGED(var Msg: TMessage);
//#UC START# *48C7B81100B7_48BD1975029B_var*
//#UC END# *48C7B81100B7_48BD1975029B_var*
begin
//#UC START# *48C7B81100B7_48BD1975029B_impl*
 inherited;
 if (f_Canvas <> nil) then
  f_Canvas.BackColor := Color;
//#UC END# *48C7B81100B7_48BD1975029B_impl*
end;//TafwBaseControl.CMCOLORCHANGED

procedure TafwBaseControl.CMCtl3DChanged(var Message: TMessage);
//#UC START# *48C7B821034E_48BD1975029B_var*
//#UC END# *48C7B821034E_48BD1975029B_var*
begin
//#UC START# *48C7B821034E_48BD1975029B_impl*
 if HandleAllocated then
  RecreateWnd;
 inherited;
//#UC END# *48C7B821034E_48BD1975029B_impl*
end;//TafwBaseControl.CMCtl3DChanged

procedure TafwBaseControl.AdjustColors(Bevel: TBevelCut;
  var TopColor: Tl3Color;
  var BottomColor: Tl3Color);
//#UC START# *48C7B9F200D9_48BD1975029B_var*
//#UC END# *48C7B9F200D9_48BD1975029B_var*
begin
//#UC START# *48C7B9F200D9_48BD1975029B_impl*
 TopColor := clBtnHighlight;
 if Bevel = bvLowered then
  TopColor := clBtnShadow;
 BottomColor := clBtnShadow;
 if Bevel = bvLowered then
  BottomColor := clBtnHighlight;
//#UC END# *48C7B9F200D9_48BD1975029B_impl*
end;//TafwBaseControl.AdjustColors

function TafwBaseControl.DataCodePage: Integer;
//#UC START# *48C7BB490341_48BD1975029B_var*
//#UC END# *48C7BB490341_48BD1975029B_var*
begin
//#UC START# *48C7BB490341_48BD1975029B_impl*
 Result := CP_ANSI;
//#UC END# *48C7BB490341_48BD1975029B_impl*
end;//TafwBaseControl.DataCodePage

function TafwBaseControl.DropFormattedData(aFormat: Tl3ClipboardFormat;
  const aData: IDataObject): Boolean;
//#UC START# *48C7BD7B0257_48BD1975029B_var*
var
 l_DropTarget : Tl3DropTarget;
 l_dwEffect   : Integer;
//#UC END# *48C7BD7B0257_48BD1975029B_var*
begin
//#UC START# *48C7BD7B0257_48BD1975029B_impl*
 l_DropTarget := Tl3DropTarget.Create(Self);
 try
  l_dwEffect := DROPEFFECT_COPY;
  Result := l_DropTarget.DropFormattedData(aFormat, aData, l_dwEffect);
 finally
  l3Free(l_DropTarget);
 end;//try..finally
//#UC END# *48C7BD7B0257_48BD1975029B_impl*
end;//TafwBaseControl.DropFormattedData

function TafwBaseControl.GetAcceptableFormatsFor(const aData: IDataObject): Tl3ClipboardFormats;
//#UC START# *48C7BEDC01A7_48BD1975029B_var*
var
 l_Res   : Tl3ClipboardFormats;
 l_Enum  : IEnumFormatEtc;
 l_Fmt   : TFormatEtc;
 l_Len   : Integer;
 l_Set   : Boolean;
 l_Index : Integer;
//#UC END# *48C7BEDC01A7_48BD1975029B_var*
begin
//#UC START# *48C7BEDC01A7_48BD1975029B_impl*
 l_Res := GetAcceptableFormats;
{$IF not Defined(EverestLite) and not Defined(ARCHI)}
 if (Length(l_Res) > 0) AND (aData <> nil) then
 begin
  if l3IOk(aData.EnumFormatEtc(DATADIR_GET, l_Enum)) AND (l_Enum <> nil) then
  // - далее будем упорядочивать форматы в том порядке, который советует тот
  //   кто клал в буфер обмена, чтобы воспользоваться наиболее точным
  begin
   l_Set := false;
   while (l_Enum.Next(1, l_Fmt, nil) = S_Ok) do
   begin
    l_Set := true;
    for l_Index := Low(l_Res) to High(l_Res) do
    begin
     if (l_Res[l_Index] = l_Fmt.cfFormat) then
     begin
      l_Len := Length(Result);
      SetLength(Result, l_Len + 1);
      Result[l_Len] := l_Fmt.cfFormat;
      break;
     end;//l_Res[l_Index] = l_Fmt.cfFormat
    end;//for l_Index
   end;//while (l_Enum.Next(1, l_Fmt, nil) = S_Ok)
   if l_Set then
    Exit;
  end;//l3IOk(aData.EnumFormatEtc(DATADIR_GET, l_Enum))
 end;//Length(l_Res) > 0
{$IFEND} 
 Result := l_Res;
//#UC END# *48C7BEDC01A7_48BD1975029B_impl*
end;//TafwBaseControl.GetAcceptableFormatsFor

procedure TafwBaseControl.SetCommands(const aCommands: array of AnsiString;
  out theCommands: TafwCommands);
//#UC START# *48C7BFA30058_48BD1975029B_var*
var
 l_Len   : Integer;
 l_Index : Integer;
//#UC END# *48C7BFA30058_48BD1975029B_var*
begin
//#UC START# *48C7BFA30058_48BD1975029B_impl*
 l_Len := High(aCommands) + 1;
 SetLength(theCommands, l_Len);
 for l_Index := 0 to Pred(l_Len) do
  theCommands[l_Index] := aCommands[l_Index];
//#UC END# *48C7BFA30058_48BD1975029B_impl*
end;//TafwBaseControl.SetCommands

function TafwBaseControl.PasteFromClipboard(aFormat: Tl3ClipboardFormat;
  const aData: IDataObject): Boolean;
//#UC START# *48C7C15B012E_48BD1975029B_var*
var
 l_Data : IDataObject;
//#UC END# *48C7C15B012E_48BD1975029B_var*
begin
//#UC START# *48C7C15B012E_48BD1975029B_impl*
 Result := false;
 if (aData = nil) then
  OleCheck(OleGetClipboard(l_Data))
 else
  l_Data := aData;
 try
  if (l_Data <> nil) then
   Result := DropFormattedData(aFormat, l_Data);
 finally
  l_Data := nil;
 end;//try..finally
//#UC END# *48C7C15B012E_48BD1975029B_impl*
end;//TafwBaseControl.PasteFromClipboard

function TafwBaseControl.Paste: Boolean;
//#UC START# *48C7C1A2010C_48BD1975029B_var*
var
 l_Formats : Tl3ClipboardFormats;
 l_Index   : Integer;
 l_Data    : IDataObject;
//#UC END# *48C7C1A2010C_48BD1975029B_var*
begin
//#UC START# *48C7C1A2010C_48BD1975029B_impl*
 Result := false;
 OleCheck(OleGetClipboard(l_Data));
 if (l_Data = nil) then
  l_Formats := nil
  // - чтобы компилятор не выебывался
 else
  try
   l_Formats := GetAcceptableFormatsFor(l_Data);
   for l_Index := Low(l_Formats) to High(l_Formats) do
   begin
    Case l_Formats[l_Index] of
     cf_Text,
     cf_UnicodeText :
      if (DataCodePage = CP_OEM) AND
         PasteFromClipboard(cf_OEMText, l_Data) then
      begin
       Result := true;
       break;
      end;//DataCodePage = CP_OEM..
    end;//Case l_Formats[l_Index]
    if PasteFromClipboard(l_Formats[l_Index], l_Data) then
    begin
     Result := true;
     break;
    end;//PasteFromClipboard(l_Formats[l_Index])
   end;//l_Index
  finally
   l_Data := nil
  end;//try..finally
//#UC END# *48C7C1A2010C_48BD1975029B_impl*
end;//TafwBaseControl.Paste

function TafwBaseControl.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *48C7C4990287_48BD1975029B_var*
//#UC END# *48C7C4990287_48BD1975029B_var*
begin
//#UC START# *48C7C4990287_48BD1975029B_impl*
 Pointer(Obj) := nil;
 Result.SetNOINTERFACE;
//#UC END# *48C7C4990287_48BD1975029B_impl*
end;//TafwBaseControl.COMQueryInterface

procedure TafwBaseControl.CancelHint;
//#UC START# *48C7CD7103B1_48BD1975029B_var*
//#UC END# *48C7CD7103B1_48BD1975029B_var*
begin
//#UC START# *48C7CD7103B1_48BD1975029B_impl*
 ShowHint := false;
 TafwHintManager.Instance.CancelHint;
//#UC END# *48C7CD7103B1_48BD1975029B_impl*
end;//TafwBaseControl.CancelHint

procedure TafwBaseControl.ActivateHint(const aPt: TPoint);
//#UC START# *48C7CD7F00EE_48BD1975029B_var*
//#UC END# *48C7CD7F00EE_48BD1975029B_var*
begin
//#UC START# *48C7CD7F00EE_48BD1975029B_impl*
 if (Hint = '') then
  CancelHint
 else
 begin
  if not ShowHint OR
     (f_LastHint <> Hint) OR
     (Abs(f_LastHintPt.X - aPt.X) > 2) OR (Abs(f_LastHintPt.Y - aPt.Y) > 2) then
  begin
   f_LastHint := Hint;
   f_LastHintPt := aPt;
   THackApplication(Application).FHintControl := Self;
   ShowHint := true;
   TafwHintManager.Instance.ActivateHint(aPt);
  end;//f_LastHint <> Hint
 end;//Hint = ''
//#UC END# *48C7CD7F00EE_48BD1975029B_impl*
end;//TafwBaseControl.ActivateHint

procedure TafwBaseControl.ActivateHint;
//#UC START# *48C7CD920267_48BD1975029B_var*
var
 l_Pt : TPoint;
//#UC END# *48C7CD920267_48BD1975029B_var*
begin
//#UC START# *48C7CD920267_48BD1975029B_impl*
 GetCursorPos(l_Pt);
 ActivateHint(l_Pt);
//#UC END# *48C7CD920267_48BD1975029B_impl*
end;//TafwBaseControl.ActivateHint

procedure TafwBaseControl.DoMenuUnlockedFixUp;
//#UC START# *4B05241502C5_48BD1975029B_var*
//#UC END# *4B05241502C5_48BD1975029B_var*
begin
//#UC START# *4B05241502C5_48BD1975029B_impl*
// Do nothing
//#UC END# *4B05241502C5_48BD1975029B_impl*
end;//TafwBaseControl.DoMenuUnlockedFixUp

function TafwBaseControl.IsMenuLocked: Boolean;
//#UC START# *4B0524AF024C_48BD1975029B_var*
//#UC END# *4B0524AF024C_48BD1975029B_var*
begin
//#UC START# *4B0524AF024C_48BD1975029B_impl*
 Result := HandleAllocated AND Visible AND afw.IsMenuLocked(Self);
//#UC END# *4B0524AF024C_48BD1975029B_impl*
end;//TafwBaseControl.IsMenuLocked

procedure TafwBaseControl.DoAfterCreateCanvas;
//#UC START# *4D3974AB02E5_48BD1975029B_var*
//#UC END# *4D3974AB02E5_48BD1975029B_var*
begin
//#UC START# *4D3974AB02E5_48BD1975029B_impl*
//#UC END# *4D3974AB02E5_48BD1975029B_impl*
end;//TafwBaseControl.DoAfterCreateCanvas

procedure TafwBaseControl.WMSetFocus(var Msg: TWMSetFocus);
//#UC START# *4D8B85A10073_48BD1975029B_var*
//#UC END# *4D8B85A10073_48BD1975029B_var*
begin
//#UC START# *4D8B85A10073_48BD1975029B_impl*
 inherited;
 if Assigned(afwFacade.g_FocusHook) then
  afwFacade.g_FocusHook(Self, true);
//#UC END# *4D8B85A10073_48BD1975029B_impl*
end;//TafwBaseControl.WMSetFocus

procedure TafwBaseControl.WMKillFocus(var Msg: TWMKillFocus);
//#UC START# *4D8B85C3018D_48BD1975029B_var*
//#UC END# *4D8B85C3018D_48BD1975029B_var*
begin
//#UC START# *4D8B85C3018D_48BD1975029B_impl*
 inherited;
 if Assigned(afwFacade.g_FocusHook) then
  afwFacade.g_FocusHook(Self, false);
//#UC END# *4D8B85C3018D_48BD1975029B_impl*
end;//TafwBaseControl.WMKillFocus

function TafwBaseControl.GetAcceptableFormats: Tl3ClipboardFormats;
//#UC START# *46A5B20202BD_48BD1975029B_var*
//#UC END# *46A5B20202BD_48BD1975029B_var*
begin
//#UC START# *46A5B20202BD_48BD1975029B_impl*
 Result := DoGetAcceptableFormats;
//#UC END# *46A5B20202BD_48BD1975029B_impl*
end;//TafwBaseControl.GetAcceptableFormats

function TafwBaseControl.DoDrop(aFormat: Tl3ClipboardFormat;
  const aMedium: Tl3StoragePlace;
  var dwEffect: Integer): Boolean;
//#UC START# *46A5B27A01C5_48BD1975029B_var*
//#UC END# *46A5B27A01C5_48BD1975029B_var*
begin
//#UC START# *46A5B27A01C5_48BD1975029B_impl*
 Result := DoDoDrop(aFormat, aMedium, dwEffect);
//#UC END# *46A5B27A01C5_48BD1975029B_impl*
end;//TafwBaseControl.DoDrop

function TafwBaseControl.DoDragOver(const aData: IDataObject;
  const aPoint: TPoint): Boolean;
//#UC START# *46A5B330031B_48BD1975029B_var*
//#UC END# *46A5B330031B_48BD1975029B_var*
begin
//#UC START# *46A5B330031B_48BD1975029B_impl*
 UpdateDragImage(aPoint);
 Result := DoDoDragOver(aData, aPoint);
//#UC END# *46A5B330031B_48BD1975029B_impl*
end;//TafwBaseControl.DoDragOver

procedure TafwBaseControl.DoDragEnter(const aData: IDataObject;
  const aPoint: TPoint);
//#UC START# *46A5B35A0249_48BD1975029B_var*
var
 l_ImageSource : Il3DragImageSource;
 l_Image       : Il3Bitmap;
 l_Bmp         : Tl3Bitmap;
//#UC END# *46A5B35A0249_48BD1975029B_var*
begin
//#UC START# *46A5B35A0249_48BD1975029B_impl*
 f_InDrop := true;
 if Supports(aData, Il3DragImageSource, l_ImageSource) then
 begin
  l_Image := l_ImageSource.Image;
  if (l_Image <> nil) then
  begin
   if (f_DragImageList = nil) then
    f_DragImageList := TDragImageList.Create(Self)
   else
    f_DragImageList.Clear;
   l_Bmp := Tl3Bitmap.Create;
   try
    l_Image.AssignTo(l_Bmp);
    f_DragImageList.Width := l_Bmp.Width;
    f_DragImageList.Height := l_Bmp.Height;
    f_DragImageList.AddMasked(l_Bmp, Tl3Color($00FFFFFF));
    f_DragImageList.SetDragImage(0, 2, 2);
   finally
    FreeAndNil(l_Bmp);
   end;//try..finally 
  end;//l_Image <> nil
  if (f_DragImageList <> nil) AND (f_DragImageList.Count > 0) then
  begin
   with aPoint do
    f_DragImageList.BeginDrag(GetDeskTopWindow, X, Y);
   ShowCursor(true);
   UpdateDragImage(aPoint);
  end;//f_DragImageList.Count > 0
 end;//Supports(aData, Il3DragImageSource, l_ImageSource)
//#UC END# *46A5B35A0249_48BD1975029B_impl*
end;//TafwBaseControl.DoDragEnter

procedure TafwBaseControl.DoDragLeave;
//#UC START# *46A5B3750107_48BD1975029B_var*
//#UC END# *46A5B3750107_48BD1975029B_var*
begin
//#UC START# *46A5B3750107_48BD1975029B_impl*
 DoDoDragLeave;
 if (f_DragImageList <> nil) AND (f_DragImageList.Count > 0) then
 begin
  f_DragImageList.EndDrag;
  f_DragImageList.Clear;
  Invalidate;
 end;//f_DragImageList <> nil
 f_InDrop := false;
//#UC END# *46A5B3750107_48BD1975029B_impl*
end;//TafwBaseControl.DoDragLeave

function TafwBaseControl.Keys2Effect(aKeys: Integer): Integer;
//#UC START# *46A5B38701B8_48BD1975029B_var*
//#UC END# *46A5B38701B8_48BD1975029B_var*
begin
//#UC START# *46A5B38701B8_48BD1975029B_impl*
 Result := DoKeys2Effect(aKeys);
//#UC END# *46A5B38701B8_48BD1975029B_impl*
end;//TafwBaseControl.Keys2Effect

function TafwBaseControl.ProcessCommand(Cmd: Tl3OperationCode;
  aForce: Boolean;
  aCount: Integer): Boolean;
//#UC START# *476F76A90267_48BD1975029B_var*
//#UC END# *476F76A90267_48BD1975029B_var*
begin
//#UC START# *476F76A90267_48BD1975029B_impl*
 Result := DoProcessCommand(Cmd, aForce, aCount) or (Cmd = l3_ccPartial);
 Assert(not Tk2OperationContainer.CheckWasExceptionInFreeInOwner);
//#UC END# *476F76A90267_48BD1975029B_impl*
end;//TafwBaseControl.ProcessCommand

procedure TafwBaseControl.UpdateScrollRange(WhatUpdate: TafwScrollBars = afw_sbBoth);
//#UC START# *47D64DFA00B3_48BD1975029B_var*
//#UC END# *47D64DFA00B3_48BD1975029B_var*
begin
//#UC START# *47D64DFA00B3_48BD1975029B_impl*
 DoUpdateScrollRange(WhatUpdate);
//#UC END# *47D64DFA00B3_48BD1975029B_impl*
end;//TafwBaseControl.UpdateScrollRange

procedure TafwBaseControl.Changing;
//#UC START# *4A5CBFFE0157_48BD1975029B_var*
//#UC END# *4A5CBFFE0157_48BD1975029B_var*
begin
//#UC START# *4A5CBFFE0157_48BD1975029B_impl*
 if fStopChangeNotify then
  fUpdateNeed := true
 else
 if (FUpdateCount = 0) then
 begin
  // Игнорируем DoChanging, если вызов произошел во время обработки операции
  // DoChanged
  // автор Тучнин Д.А.
  if (FDoChangedCount = 0) then
   DoChanging;
 end;//FUpdateCount = 0
 Inc(FUpdateCount);
//#UC END# *4A5CBFFE0157_48BD1975029B_impl*
end;//TafwBaseControl.Changing

procedure TafwBaseControl.Changed;
//#UC START# *4A5CC00B03D5_48BD1975029B_var*
//#UC END# *4A5CC00B03D5_48BD1975029B_var*
begin
//#UC START# *4A5CC00B03D5_48BD1975029B_impl*
 Dec(FUpdateCount);
 if (FUpdateCount < 0) then
  FUpdateCount := 0;
 if fStopChangeNotify then
  fUpdateNeed := true
 else
 if (FUpdateCount = 0) then
 begin
  // Нижеследующая обработка, с использованием дополнительного флага FDoChangedCount,
  // направлена на борьбу с ситуацией, когда в процессе обработки DoChanged
  // дерево вновь притерпит изменения и вновь вызовутся скобки Changing/_Changed
  // автор Тучнин Д.А.
  Inc(FDoChangedCount);
  try
   try
    DoChanged;
   except
    on EDoChangedAlreadyDone do;
   end;
   if (FDoChangedCount > 1) then
    raise EDoChangedAlreadyDone.Create('');
  finally
   Dec(FDoChangedCount);
  end;
  // Завершение обработки с использованием флага FDoChangedCount
 end;//FUpdateCount = 0
//#UC END# *4A5CC00B03D5_48BD1975029B_impl*
end;//TafwBaseControl.Changed

procedure TafwBaseControl.MenuUnlockedFixUp;
//#UC START# *4B052245037A_48BD1975029B_var*
//#UC END# *4B052245037A_48BD1975029B_var*
begin
//#UC START# *4B052245037A_48BD1975029B_impl*
 DoMenuUnlockedFixUp;
//#UC END# *4B052245037A_48BD1975029B_impl*
end;//TafwBaseControl.MenuUnlockedFixUp

function TafwBaseControl.IsA(anObj: TObject): Boolean;
//#UC START# *4CADECFB0114_48BD1975029B_var*
//#UC END# *4CADECFB0114_48BD1975029B_var*
begin
//#UC START# *4CADECFB0114_48BD1975029B_impl*
 Result := (Self = anObj);
//#UC END# *4CADECFB0114_48BD1975029B_impl*
end;//TafwBaseControl.IsA

procedure TafwBaseControl.Cleanup;
//#UC START# *479731C50290_48BD1975029B_var*
//#UC END# *479731C50290_48BD1975029B_var*
begin
//#UC START# *479731C50290_48BD1975029B_impl*
 afw.ControlDestroying(Self);
 FreeCanvas;
 FreeAndNil(f_DragImageList);
 inherited;
//#UC END# *479731C50290_48BD1975029B_impl*
end;//TafwBaseControl.Cleanup

constructor TafwBaseControl.Create(AOwner: TComponent);
//#UC START# *47D1602000C6_48BD1975029B_var*
//#UC END# *47D1602000C6_48BD1975029B_var*
begin
//#UC START# *47D1602000C6_48BD1975029B_impl*
 inherited;
 f_ScrollStyle := ssNone;
 afwHackControlFont(Self);
//#UC END# *47D1602000C6_48BD1975029B_impl*
end;//TafwBaseControl.Create

function TafwBaseControl.QueryInterface(const IID: TGUID;
  out Obj): HResult;
//#UC START# *47D160620295_48BD1975029B_var*
var
 l_Res : Tl3HResult;
//#UC END# *47D160620295_48BD1975029B_var*
begin
//#UC START# *47D160620295_48BD1975029B_impl*
 if TObject(Self).GetInterface(IID, Obj) then
  Result := S_Ok
 else
 begin
  l_Res := COMQueryInterface(Tl3GUID_C(IID), Obj);
  if l_Res.Fail then
   Result := inherited QueryInterface(IID, Obj)
  else
   Result := l_Res.Res; 
 end;//TObject(Self).GetInterface(IID, Obj)
//#UC END# *47D160620295_48BD1975029B_impl*
end;//TafwBaseControl.QueryInterface

{$If not defined(NoVCL)}
procedure TafwBaseControl.WndProc(var Message: TMessage);
//#UC START# *47E136A80191_48BD1975029B_var*
var
 PS: TPaintStruct;
//#UC END# *47E136A80191_48BD1975029B_var*
begin
//#UC START# *47E136A80191_48BD1975029B_impl*
 // Два case тут для удобства отладки
 case Message.Msg of
  WM_ERASEBKGND,
  WM_NCPAINT,
  WM_PAINT:
  begin
   case Message.Msg of
    WM_ERASEBKGND:
     if InUpdating then
     begin
      Message.Result := 1;  {don't erase background}
      Exit;
     end;//InUpdating
    WM_NCPAINT:
     if InUpdating then
      Exit;
    WM_PAINT:
     if InUpdating then
     begin
      BeginPaint(Handle, PS);
      EndPaint(Handle, PS);
      Exit;
     end;//InUpdating
   end;//case Message.Msg
   inherited;
  end;//WM_ERASEBKGND
  else
   inherited;
 end;//case Message.Msg
//#UC END# *47E136A80191_48BD1975029B_impl*
end;//TafwBaseControl.WndProc
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
procedure TafwBaseControl.CreateWindowHandle(const Params: TCreateParams);
//#UC START# *48C67EB000EE_48BD1975029B_var*
//#UC END# *48C67EB000EE_48BD1975029B_var*
begin
//#UC START# *48C67EB000EE_48BD1975029B_impl*
 inherited;
 if HandleAllocated then
 begin
  l3RegisterDragDrop(Handle, Tl3DropTarget.Make(Self));
  f_SetDragDrop := true;
 end;//HandleAllocated
//#UC END# *48C67EB000EE_48BD1975029B_impl*
end;//TafwBaseControl.CreateWindowHandle
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
procedure TafwBaseControl.DestroyWindowHandle;
//#UC START# *48C67EDF01C8_48BD1975029B_var*
//#UC END# *48C67EDF01C8_48BD1975029B_var*
begin
//#UC START# *48C67EDF01C8_48BD1975029B_impl*
 RevokeDragDrop;
 inherited;
//#UC END# *48C67EDF01C8_48BD1975029B_impl*
end;//TafwBaseControl.DestroyWindowHandle
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
procedure TafwBaseControl.PaintWindow(DC: hDC);
//#UC START# *48C6BFF80313_48BD1975029B_var*
var
 CN : Il3Canvas;
//#UC END# *48C6BFF80313_48BD1975029B_var*
begin
//#UC START# *48C6BFF80313_48BD1975029B_impl*
 if (csDestroying in ComponentState) then Exit;
 if InUpdating then
  Exit;
 CN := Canvas;
 CN.BeginPaint;
 try
  Inc(f_PaintCount);
  try
   if (f_PaintCount = 1) then
   begin
    CN.Lock;
    try
     CN.DC := DC;
     try
      CN.DrawEnabled := true;
      Paint(CN);
     finally
      CN.DC := 0;
     end;//try..finally
    finally
     CN.Unlock;
    end;
   end;//f_PaintCount = 1
  finally
   Dec(f_PaintCount);
  end;//try..finally 
 finally
  CN.EndPaint;
 end;//try..finally
//#UC END# *48C6BFF80313_48BD1975029B_impl*
end;//TafwBaseControl.PaintWindow
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
procedure TafwBaseControl.Invalidate;
//#UC START# *48C6CC4A0395_48BD1975029B_var*
//#UC END# *48C6CC4A0395_48BD1975029B_var*
begin
//#UC START# *48C6CC4A0395_48BD1975029B_impl*
 // Нет смысла рисоваться без Handle-а (вызов invalidate возможен даже во время
 // создания компонента, например по причине вызова в TComponent процедуры
 // Notification):
 if HandleAllocated then
  inherited;
//#UC END# *48C6CC4A0395_48BD1975029B_impl*
end;//TafwBaseControl.Invalidate
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
procedure TafwBaseControl.CreateParams(var Params: TCreateParams);
//#UC START# *48C7925A02E5_48BD1975029B_var*
const
  l3BorderStyles    : array[TBorderStyle] of LongInt =
                    (0, WS_BORDER);
  l3ScrollBarStyles : array [TScrollStyle] of LongInt =
                    (0, WS_HSCROLL, WS_VSCROLL, WS_HSCROLL or WS_VSCROLL);
//#UC END# *48C7925A02E5_48BD1975029B_var*
begin
//#UC START# *48C7925A02E5_48BD1975029B_impl*
 inherited;
 with Params do
 begin
  Style := Style or Cardinal(l3ScrollBarStyles[ScrollStyle])
                 or Cardinal(l3BorderStyles[BorderStyle]);

  if (BorderStyle = bsNone) then
  begin
   Style := Style and not WS_BORDER;
   ExStyle := ExStyle and not WS_EX_CLIENTEDGE;
  end//BorderStyle = bsNone
  else
  begin
   if Ctl3D then
   begin
    Style := Style and not WS_BORDER;
    ExStyle := ExStyle or WS_EX_CLIENTEDGE;
   end//Ctl3D
   else
   begin
    Style := Style or WS_BORDER;
    ExStyle := ExStyle and not WS_EX_CLIENTEDGE;
   end;//Ctl3D
  end;//BorderStyle = bsNone
 end;//with Params
//#UC END# *48C7925A02E5_48BD1975029B_impl*
end;//TafwBaseControl.CreateParams
{$IfEnd} //not NoVCL

{$If defined(l3HackedVCL) AND not defined(NoVCL)}
function TafwBaseControl.LockPainting: Boolean;
//#UC START# *49CB9A6403B5_48BD1975029B_var*
//#UC END# *49CB9A6403B5_48BD1975029B_var*
begin
//#UC START# *49CB9A6403B5_48BD1975029B_impl*
 Result := InUpdating;
//#UC END# *49CB9A6403B5_48BD1975029B_impl*
end;//TafwBaseControl.LockPainting
{$IfEnd} //l3HackedVCL AND not NoVCL

{$If defined(l3HackedVCL) AND not defined(DesignTimeLibrary) AND not defined(NoVCL)}
procedure TafwBaseControl.SelectNext(CurControl: TWinControl;
  GoForward: Boolean;
  CheckTabStop: Boolean);
//#UC START# *4D5D1505007A_48BD1975029B_var*
//#UC END# *4D5D1505007A_48BD1975029B_var*
begin
//#UC START# *4D5D1505007A_48BD1975029B_impl*
// if not vgDoTab(CurControl, not GoForward) then
  inherited;
//#UC END# *4D5D1505007A_48BD1975029B_impl*
end;//TafwBaseControl.SelectNext
{$IfEnd} //l3HackedVCL AND not DesignTimeLibrary AND not NoVCL

//#UC START# *48BD1975029Bimpl*
//#UC END# *48BD1975029Bimpl*

initialization
{$If not defined(NoScripts)}
// Регистрация TafwBaseControl
 TtfwClassRef.Register(TafwBaseControl);
{$IfEnd} //not NoScripts

end.