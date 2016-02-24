unit l3DwmUtils;
 
{$Include l3Define.inc}

interface

uses
  Types,
  Messages
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  ;

procedure ShowSystemMenu(aForm: TForm;
  const aMessage: TWMNCHitMessage);
   {* ѕоказать системное меню окна }
function GetDwmBorderIconsRect(aForm: TForm): TRect;
   {* ¬озвращает границы системных кнопок заголовка окна }

implementation

uses
  Windows,
  l3DwmApi,
  SysUtils
  ;

// unit methods

procedure ShowSystemMenu(aForm: TForm;
  const aMessage: TWMNCHitMessage);
//#UC START# *53395B1F0193_53395AF50223_var*
var
 l_Cmd: WPARAM;
 l_Menu: HMENU;

 procedure lp_UpdateItem(anID: UINT; aEnable: Boolean;
  aMakeDefaultIfEnabled: Boolean = False);
 const
  cFlags: array [Boolean] of UINT = (MF_GRAYED, MF_ENABLED);
 begin
  EnableMenuItem(l_Menu, anID, MF_BYCOMMAND or cFlags[aEnable]);
  if aMakeDefaultIfEnabled and aEnable then
   SetMenuDefaultItem(l_Menu, anID, MF_BYCOMMAND);
 end;//lp_UpdateItem


//#UC END# *53395B1F0193_53395AF50223_var*
begin
//#UC START# *53395B1F0193_53395AF50223_impl*
 l_Menu := GetSystemMenu(aForm.Handle, FALSE);
 if (aForm.BorderStyle in [bsSingle, bsSizeable, bsToolWindow, bsSizeToolWin]) then
 begin
  SetMenuDefaultItem(l_Menu, UINT(-1), 0);
  lp_UpdateItem(SC_RESTORE, aForm.WindowState <> wsNormal, True);
  lp_UpdateItem(SC_MOVE, aForm.WindowState <> wsMaximized);
  lp_UpdateItem(SC_SIZE, (aForm.WindowState <> wsMaximized) and
   (aForm.BorderStyle in [bsSizeable, bsSizeToolWin]));
  lp_UpdateItem(SC_MINIMIZE, (biMinimize in aForm.BorderIcons) and
   (aForm.BorderStyle in [bsSingle, bsSizeable]));
  lp_UpdateItem(SC_MAXIMIZE, (biMaximize in aForm.BorderIcons) and
   (aForm.BorderStyle in [bsSingle, bsSizeable]) and
   (aForm.WindowState <> wsMaximized), True);
 end;
 if (aMessage.HitTest = HTSYSMENU) then
  SetMenuDefaultItem(l_Menu, SC_CLOSE, MF_BYCOMMAND);
 l_Cmd := WPARAM(TrackPopupMenu(l_Menu, TPM_RETURNCMD or
  GetSystemMetrics(SM_MENUDROPALIGNMENT), aMessage.XCursor, aMessage.YCursor,
  0, aForm.Handle, nil));
 PostMessage(aForm.Handle, WM_SYSCOMMAND, l_Cmd, 0)
//#UC END# *53395B1F0193_53395AF50223_impl*
end;//ShowSystemMenu

function GetDwmBorderIconsRect(aForm: TForm): TRect;
//#UC START# *53395B500390_53395AF50223_var*
//#UC END# *53395B500390_53395AF50223_var*
begin
//#UC START# *53395B500390_53395AF50223_impl*
 if (Win32MajorVersion >= 6) then
 begin
  if (DwmGetWindowAttribute(aForm.Handle, DWMWA_CAPTION_BUTTON_BOUNDS,
   @Result, SizeOf(Result)) <> S_OK) then
   SetRectEmpty(Result);
 end
 else
  SetRectEmpty(Result);
//#UC END# *53395B500390_53395AF50223_impl*
end;//GetDwmBorderIconsRect

end.