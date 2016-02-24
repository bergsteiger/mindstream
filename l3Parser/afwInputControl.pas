unit afwInputControl;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3Interfaces,
  afwControl,
  l3InternalInterfaces,
  l3Units,
  Classes,
  Messages
  ;

type
 TafwInputControl = class(TafwControl)
 protected
 // overridden protected methods
   {$If not defined(NoVCL)}
   procedure WndProc(var Message: TMessage); override;
   {$IfEnd} //not NoVCL
 protected
 // protected methods
   function MouseAction(const aPt: Tl3Point;
    aButton: Tl3MouseButton;
    anAction: Tl3MouseAction;
    aKeys: TShiftState): Tl3MouseResult; virtual;
 end;//TafwInputControl

implementation

uses
  SysUtils
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  
  ;

// start class TafwInputControl

function TafwInputControl.MouseAction(const aPt: Tl3Point;
  aButton: Tl3MouseButton;
  anAction: Tl3MouseAction;
  aKeys: TShiftState): Tl3MouseResult;
//#UC START# *47E138F90081_47E1382301A5_var*
//#UC END# *47E138F90081_47E1382301A5_var*
begin
//#UC START# *47E138F90081_47E1382301A5_impl*
 Result := l3_mrNotHandled;  //do nothing
//#UC END# *47E138F90081_47E1382301A5_impl*
end;//TafwInputControl.MouseAction

{$If not defined(NoVCL)}
procedure TafwInputControl.WndProc(var Message: TMessage);
//#UC START# *47E136A80191_47E1382301A5_var*

 //WM_MOUSEMOVE
 //WM_MOUSEWHEEL

const
 Cl3MouseDown = [WM_LBUTTONDOWN-WM_MOUSEFIRST, WM_MBUTTONDOWN-WM_MOUSEFIRST, WM_RBUTTONDOWN-WM_MOUSEFIRST];
 Cl3MouseUp   = [WM_LBUTTONUP-WM_MOUSEFIRST, WM_MBUTTONUP-WM_MOUSEFIRST, WM_RBUTTONUP-WM_MOUSEFIRST];
 Cl3MouseDbl  = [WM_LBUTTONDBLCLK-WM_MOUSEFIRST, WM_MBUTTONDBLCLK-WM_MOUSEFIRST, WM_RBUTTONDBLCLK-WM_MOUSEFIRST];

 Cl3LMouse = [WM_LBUTTONDOWN-WM_MOUSEFIRST, WM_LBUTTONUP-WM_MOUSEFIRST, WM_LBUTTONDBLCLK-WM_MOUSEFIRST];
 Cl3MMouse = [WM_RBUTTONDOWN-WM_MOUSEFIRST, WM_RBUTTONUP-WM_MOUSEFIRST, WM_RBUTTONDBLCLK-WM_MOUSEFIRST];
 Cl3RMouse = [WM_MBUTTONDOWN-WM_MOUSEFIRST, WM_MBUTTONUP-WM_MOUSEFIRST, WM_MBUTTONDBLCLK-WM_MOUSEFIRST];

var
 lMouseButton : Tl3MouseButton;
 lMouseAction : Tl3MouseAction;
//#UC END# *47E136A80191_47E1382301A5_var*
begin
//#UC START# *47E136A80191_47E1382301A5_impl*
  if //False and //заглушка
  not (csDesigning in ComponentState) then

  //if (Message.Msg >= WM_KEYFIRST) and (Message.Msg <= WM_KEYLAST) then
  //begin
  //  Form := GetParentForm(Self);
  //  if (Form <> nil) and Form.WantChildKey(Self, Message) then Exit;
  //end
  //else

  if (Message.Msg >= WM_MOUSEFIRST) and
     (Message.Msg <= WM_MOUSELAST)  and
     (Message.Msg <> WM_MOUSEWHEEL) and
     (Message.Msg <> WM_MOUSEMOVE) then
  begin
   (*if Message.Msg = WM_MOUSEMOVE then
    lMouseAction := l3_maMove
   else
   if Message.Msg = WM_MOUSEWHEEL then
    lMouseAction := l3_maWheel
   else *)
   if (Message.Msg-WM_MOUSEFIRST) in Cl3MouseDown then
    lMouseAction := l3_maDown
   else
   if (Message.Msg-WM_MOUSEFIRST) in Cl3MouseUp then
    lMouseAction := l3_maUp
   else
   if (Message.Msg-WM_MOUSEFIRST) in Cl3MouseDbl then
    lMouseAction := l3_maDouble
   else
   begin
    lMouseAction := l3_maDown;
    Assert(false);
   end;//(Message.Msg-WM_MOUSEFIRST) in Cl3MouseDbl


   //lMouseButton := l3_mbLeft; //default

   if (Message.Msg-WM_MOUSEFIRST) in Cl3LMouse then
    lMouseButton := l3_mbLeft
   else
   if (Message.Msg-WM_MOUSEFIRST) in Cl3MMouse then
    lMouseButton := l3_mbMiddle
   else
   if (Message.Msg-WM_MOUSEFIRST) in Cl3RMouse then
    lMouseButton := l3_mbRight
   else
   begin
    lMouseButton := l3_mbLeft;
    Assert(false);
   end;//(Message.Msg-WM_MOUSEFIRST) in Cl3RMouse


   if MouseAction(l3Point(TWMMouse(Message).XPos, TWMMouse(Message).YPos),
                  lMouseButton, lMouseAction, KeysToShiftState(TWMMouse(Message).Keys)) <> l3_mrNotHandled then
    Exit;
  end;

  inherited WndProc(Message);

//#UC END# *47E136A80191_47E1382301A5_impl*
end;//TafwInputControl.WndProc
{$IfEnd} //not NoVCL

initialization
{$If not defined(NoScripts)}
// Регистрация TafwInputControl
 TtfwClassRef.Register(TafwInputControl);
{$IfEnd} //not NoScripts

end.