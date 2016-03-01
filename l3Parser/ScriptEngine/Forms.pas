unit Forms;

interface

{$If not defined(NoVCL)}
uses
  Classes,
  Controls
  ;

type
 TApplication = class(TComponent)
  {* TApplication is the type used for a GUI windowed application. }
 end;//TApplication

 TBorderStyle = (
   
 );//TBorderStyle

 TScrollingWinControl = class(TWinControl)
 end;//TScrollingWinControl

 TCloseAction = (
   
 );//TCloseAction

 TCustomForm = class(TScrollingWinControl)
 protected
 // protected methods
   procedure UpdateActions; virtual;
     {* Сигнатура метода UpdateActions }
   procedure DoClose(var Action: TCloseAction); virtual;
   function CloseQuery: Boolean; virtual;
     {* CloseQuery is called automatically when an attempt is made to close the form. CloseQuery can allow the form to close by returning true, or prevent the form from closing by returning false.

As implemented in TCustomForm, CloseQuery polls any MDI children by calling their CloseQuery methods. If no child form aborts the close, CloseQuery then calls the OnCloseQuery event handler, if it exists, to determine if the close should be allowed. If no such event handler exists, CloseQuery returns true. }
   procedure DoShow; virtual;
 public
 // public methods
   function ShowModal: Integer; virtual;
   {$If defined(l3HackedVCL) AND not defined(NoVCL)}
   function NeedAutoScroll: Boolean; virtual;
   {$IfEnd} //l3HackedVCL AND not NoVCL
   function IsRealInstance: Boolean; virtual;
   constructor CreateNew(AOwner: TComponent;
    Dummy: Integer = 0); virtual;
 end;//TCustomForm

 TWindowState = (
  {* TWindowState indicates whether a form is maximized, minimized, or normally sized. }
   wsNormal // The form is in its normal state (that is, neither minimized nor maximized).
 , wsMinimized // The form is minimized.
 , wsMaximized // The form is maximized.
 );//TWindowState

 TScreen = class(TComponent)
  {* TScreen represents the state of the screen in which an application runs. }
 end;//TScreen

 TApplication = class(TComponent)
  {* TApplication is the type used for a GUI windowed application. }
 end;//TApplication

 TScrollingWinControl = class(TWinControl)
  {* TScrollingWinControl is the base class for controls that support scrolling. }
 end;//TScrollingWinControl

 TCustomForm = class(TScrollingWinControl)
 end;//TCustomForm

 TForm = class(TCustomForm)
  {* TForm represents a standard application window (form). }
 end;//TForm

 TFormClass = class of TForm;

 TScrollBarKind = (
   
 );//TScrollBarKind

 TScrollBarInc = ;

 TCustomFrame = class
 end;//TCustomFrame

 TFrame = class(TCustomFrame)
 end;//TFrame

 TCloseQueryEvent = procedure (Sender: TObject;
  var CanClose: Boolean) of object;

 TScrollBox = class(TScrollingWinControl)
 end;//TScrollBox

 TCMHintShow = record
 end;//TCMHintShow

 TForm = class(TCustomForm)
 end;//TForm

 TBorderIcons = (
   
 );//TBorderIcons

 TFormBorderStyle = (
   
 );//TFormBorderStyle

 TFormStyle = (
   
 );//TFormStyle

procedure KeysToShiftState;
procedure Application;
   {* Сигнатура метода Application }
procedure KeyDataToShiftState;
   {* Сигнатура метода KeyDataToShiftState }
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  SysUtils
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  ScrollingWinControlWordsPack
  {$IfEnd} //not NoScripts AND not NoVCL
  
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  FormsProcessingPack
  {$IfEnd} //not NoScripts AND not NoVCL
  
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  CustomFormProcessingPack
  {$IfEnd} //not NoScripts AND not NoVCL
  
  ;

// start class TCustomForm

function TCustomForm.ShowModal: Integer;
//#UC START# *520B42AF0115_484529DC0276_var*
//#UC END# *520B42AF0115_484529DC0276_var*
begin
//#UC START# *520B42AF0115_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *520B42AF0115_484529DC0276_impl*
end;//TCustomForm.ShowModal

procedure TCustomForm.UpdateActions;
//#UC START# *533AA4B4006B_484529DC0276_var*
//#UC END# *533AA4B4006B_484529DC0276_var*
begin
//#UC START# *533AA4B4006B_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *533AA4B4006B_484529DC0276_impl*
end;//TCustomForm.UpdateActions

procedure TCustomForm.DoClose(var Action: TCloseAction);
//#UC START# *5576E05C0204_484529DC0276_var*
//#UC END# *5576E05C0204_484529DC0276_var*
begin
//#UC START# *5576E05C0204_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *5576E05C0204_484529DC0276_impl*
end;//TCustomForm.DoClose

function TCustomForm.CloseQuery: Boolean;
//#UC START# *4980403E021E_484529DC0276_var*
//#UC END# *4980403E021E_484529DC0276_var*
begin
//#UC START# *4980403E021E_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *4980403E021E_484529DC0276_impl*
end;//TCustomForm.CloseQuery

{$If defined(l3HackedVCL) AND not defined(NoVCL)}
function TCustomForm.NeedAutoScroll: Boolean;
//#UC START# *4B0E845502C1_484529DC0276_var*
//#UC END# *4B0E845502C1_484529DC0276_var*
begin
//#UC START# *4B0E845502C1_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B0E845502C1_484529DC0276_impl*
end;//TCustomForm.NeedAutoScroll
{$IfEnd} //l3HackedVCL AND not NoVCL

function TCustomForm.IsRealInstance: Boolean;
//#UC START# *4B0E846D022B_484529DC0276_var*
//#UC END# *4B0E846D022B_484529DC0276_var*
begin
//#UC START# *4B0E846D022B_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B0E846D022B_484529DC0276_impl*
end;//TCustomForm.IsRealInstance

procedure TCustomForm.DoShow;
//#UC START# *4B321D1301DD_484529DC0276_var*
//#UC END# *4B321D1301DD_484529DC0276_var*
begin
//#UC START# *4B321D1301DD_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B321D1301DD_484529DC0276_impl*
end;//TCustomForm.DoShow

constructor TCustomForm.CreateNew(AOwner: TComponent;
  Dummy: Integer = 0);
//#UC START# *4F9007B20376_484529DC0276_var*
//#UC END# *4F9007B20376_484529DC0276_var*
begin
//#UC START# *4F9007B20376_484529DC0276_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F9007B20376_484529DC0276_impl*
end;//TCustomForm.CreateNew
// unit methods

procedure Application;
//#UC START# *4C8A2ADD01B1_47E13C6B0341_var*
//#UC END# *4C8A2ADD01B1_47E13C6B0341_var*
begin
//#UC START# *4C8A2ADD01B1_47E13C6B0341_impl*
 !!! Needs to be implemented !!!
//#UC END# *4C8A2ADD01B1_47E13C6B0341_impl*
end;//Application

procedure KeyDataToShiftState;
//#UC START# *4F75B95B02BD_47E13C6B0341_var*
//#UC END# *4F75B95B02BD_47E13C6B0341_var*
begin
//#UC START# *4F75B95B02BD_47E13C6B0341_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F75B95B02BD_47E13C6B0341_impl*
end;//KeyDataToShiftState
// unit methods

procedure KeysToShiftState;
//#UC START# *47E13C7301D2_47E13C6B0341_var*
//#UC END# *47E13C7301D2_47E13C6B0341_var*
begin
//#UC START# *47E13C7301D2_47E13C6B0341_impl*
 !!! Needs to be implemented !!!
//#UC END# *47E13C7301D2_47E13C6B0341_impl*
end;//KeysToShiftState
{$IfEnd} //not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация TScrollingWinControl
 TtfwClassRef.Register(TScrollingWinControl);
{$IfEnd} //not NoScripts AND not NoVCL
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация TCustomForm
 TtfwClassRef.Register(TCustomForm);
{$IfEnd} //not NoScripts AND not NoVCL
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация TScrollBox
 TtfwClassRef.Register(TScrollBox);
{$IfEnd} //not NoScripts AND not NoVCL
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация TForm
 TtfwClassRef.Register(TForm);
{$IfEnd} //not NoScripts AND not NoVCL

end.