unit afwFacade;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}
 
{$Include afwDefine.inc}

interface

uses
  afwInterfaces,
  Messages
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  l3ProtoObject,
  l3MessagesService
  {$If not defined(NoVCL)}
  ,
  l3FormsService
  {$IfEnd} //not NoVCL
  ,
  l3KeyboardLayoutService,
  l3TabService,
  Classes
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  ;

type
 {$If not defined(NoVCL)}
 TafwCustomForm = afwInterfaces.TafwCustomForm;
 {$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
 TafwControlFocusHook = procedure (aControl: TWinControl;
  aGot: Boolean);
{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
 TafwControlMessageHook = procedure (aControl: TWinControl;
  const aMessage: TMessage);
{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
 TafwIsAcceptableControlForTabNavigationHook = function (aControl: TWinControl): Boolean;
{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
 TafwDoTabHook = function (aControl: TControl;
  aShift: Boolean): Boolean;
{$IfEnd} //not NoVCL

 TafwMessagesService = {final} class(Tl3ProtoObject, Il3MessagesService)
 public
 // realized methods
   procedure ProcessMessages;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwMessagesService;
    {- возвращает экземпляр синглетона. }
 end;//TafwMessagesService


{$If not defined(NoVCL)}
 TafwFormsService = {final} class(Tl3ProtoObject, Il3FormsService)
 public
 // realized methods
   function GetAnotherParentForm(Component: TPersistent): TCustomForm;
   function GetMainForm(Component: TPersistent): TCustomForm;
   function GetParentForm(Component: TPersistent): TCustomForm;
   function GetTopParentForm(Component: TPersistent): TCustomForm;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwFormsService;
    {- возвращает экземпляр синглетона. }
 end;//TafwFormsService
{$IfEnd} //not NoVCL

 TafwKeyboardLayoutService = {final} class(Tl3ProtoObject, Il3KeyboardLayoutService)
 public
 // realized methods
   procedure TryActivateKeyboardLayout;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwKeyboardLayoutService;
    {- возвращает экземпляр синглетона. }
 end;//TafwKeyboardLayoutService

 TafwTabService = {final} class(Tl3ProtoObject, Il3TabService)
 public
 // realized methods
   function HasTabs: Boolean;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwTabService;
    {- возвращает экземпляр синглетона. }
 end;//TafwTabService

 Tafw = class
  {* Метакласс, реализующий точку входа в интерфейсы библиотеки AFW. }
 public
 // public methods
    {$If not defined(DesignTimeLibrary) AND not defined(NoVCL)}
   class function NeedFixWMSIZE(aControl: TWinControl): Boolean;
    {$IfEnd} //not DesignTimeLibrary AND not NoVCL
   class procedure TryActivateKeyboardLayout;
   class function Application: IafwApplication; virtual;
     {* приложение AFW. }
   class procedure BeginOp; virtual;
     {* начать операцию, внутри которой нельзя убивать контролы. }
   class procedure EndOp; virtual;
     {* закончить операцию, внутри которой нельзя убивать контролы. }
   class function InOp: Boolean;
   class function IsObjectLocked(aControl: TObject = nil): Boolean; virtual;
   {$If not defined(NoVCL)}
   class function GetParentForm(Component: TPersistent): TafwCustomForm;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   class function GetAnotherParentForm(Component: TPersistent): TafwCustomForm;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   class function GetTopParentForm(Component: TPersistent): TafwCustomForm;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   class function GetMainForm(Component: TPersistent): TafwCustomForm;
   {$IfEnd} //not NoVCL
   class procedure ProcessMessages;
   class function Settings: IafwSettings;
     {* для работы с настройками системы. }
   class procedure LockActionUpdate;
     {* Запретить обновление операций }
   class procedure UnlockActionUpdate;
     {* Разрешить обновление операций }
   class function IsActionUpdateLocked: Boolean;
     {* Обновление операций запрещено }
   class function PermanentSettings: IafwSettingsPrim;
   class function IsMenuLocked(const aControl: IafwMenuUnlockedPostBuild): Boolean; virtual;
   class procedure ControlDestroying(const aControl: IafwMenuUnlockedPostBuild); virtual;
 end;//Tafw

var
   g_DisableMessageHook : Integer = 0;
  {$If not defined(NoVCL)}
var
   g_FocusHook : TafwControlFocusHook = nil;
  {$IfEnd} //not NoVCL
  {$If not defined(NoVCL)}
var
   g_MessageHook : TafwControlMessageHook = nil;
  {$IfEnd} //not NoVCL
  {$If not defined(NoVCL)}
var
   g_IsAcceptableControlForTabNavigationHook : TafwIsAcceptableControlForTabNavigationHook = nil;
  {$IfEnd} //not NoVCL
  {$If not defined(NoVCL)}
var
   g_DoTabHook : TafwDoTabHook = nil;
  {$IfEnd} //not NoVCL

type
 Rafw = class of Tafw;
  {* Ссылка на класс Tafw. }

var afw : Rafw = Tafw;
 {* Экземпляр фасада.}

implementation

uses
  Windows,
  SysUtils,
  l3Base {a},
  afwSettingsImplSing,
  afwSettingsImplemented
  ;

var g_InOp : Integer = 0;
 {* Счетчик вложенных операций.}

var g_LockActionUpdate : Integer = 0;

  {$If not defined(DesignTimeLibrary)}
var
   g_IsWin2000 : Boolean = false;
  {$IfEnd} //not DesignTimeLibrary

type
  TafwHackPersistent = class(TPersistent)
   {* Для доступа к скрытой части TPersistent. }
  end;//TafwHackPersistent

// start class Tafw

{$If not defined(DesignTimeLibrary) AND not defined(NoVCL)}
class function Tafw.NeedFixWMSIZE(aControl: TWinControl): Boolean;
//#UC START# *4B6C58480346_477515240332_var*
//#UC END# *4B6C58480346_477515240332_var*
begin
//#UC START# *4B6C58480346_477515240332_impl*
 Result := g_IsWin2000;
//#UC END# *4B6C58480346_477515240332_impl*
end;//Tafw.NeedFixWMSIZE
{$IfEnd} //not DesignTimeLibrary AND not NoVCL

class procedure Tafw.TryActivateKeyboardLayout;
//#UC START# *4E2FE68C032B_477515240332_var*
var
 i,
 l_LanguageId,
 l_LayoutsCount  : Integer;
 l_Buffer        : array [0..KL_NAMELENGTH] of Char;
 l_CurrentLayout : HKL;
 l_LayoutsArray  : array of HKL;
//#UC END# *4E2FE68C032B_477515240332_var*
begin
//#UC START# *4E2FE68C032B_477515240332_impl*
 if (Application = nil) then
  l_LanguageId := 1049
 else
  l_LanguageId := Application.LocaleInfo.ID;
// мы пишем так. потому как под отладчиком VC падаем с AV из-за ненулевого второго
// параметра.
// Ноги тут - http://mdp.garant.ru/pages/viewpage.action?pageId=227972114 .
 l_LayoutsCount := GetKeyboardLayoutList(0, (nil)^);
 if l_LayoutsCount > 1 then
 begin
  SetLength(l_LayoutsArray, l_LayoutsCount);
  l_LayoutsCount := GetKeyboardLayoutList(l_LayoutsCount, l_LayoutsArray[0]);
  for i := 0 to l_LayoutsCount - 1 do
   if ((l_LayoutsArray[i] and $FFFF) = l_LanguageId) then
   ActivateKeyboardLayout(l_LayoutsArray[i], 0);
 end
 else
  if l_LayoutsCount = 0 then // если ошибка при загрузке списка (в Win98 всегда)
   ActivateKeyboardLayout(LoadKeyBoardLayout(PChar(Format('%.8x',[l_LanguageId])), 0), 0);
//#UC END# *4E2FE68C032B_477515240332_impl*
end;//Tafw.TryActivateKeyboardLayout

// start class TafwMessagesService

var g_TafwMessagesService : TafwMessagesService = nil;

procedure TafwMessagesServiceFree;
begin
 l3Free(g_TafwMessagesService);
end;

class function TafwMessagesService.Instance: TafwMessagesService;
begin
 if (g_TafwMessagesService = nil) then
 begin
  l3System.AddExitProc(TafwMessagesServiceFree);
  g_TafwMessagesService := Create;
 end;
 Result := g_TafwMessagesService;
end;


class function TafwMessagesService.Exists: Boolean;
 {-}
begin
 Result := g_TafwMessagesService <> nil;
end;//TafwMessagesService.Exists

procedure TafwMessagesService.ProcessMessages;
//#UC START# *B6C92677BBF7_5506D47E01D2_var*
//#UC END# *B6C92677BBF7_5506D47E01D2_var*
begin
//#UC START# *B6C92677BBF7_5506D47E01D2_impl*
 afw.ProcessMessages;
//#UC END# *B6C92677BBF7_5506D47E01D2_impl*
end;//TafwMessagesService.ProcessMessages
{$If not defined(NoVCL)}


// start class TafwFormsService

var g_TafwFormsService : TafwFormsService = nil;

procedure TafwFormsServiceFree;
begin
 l3Free(g_TafwFormsService);
end;

class function TafwFormsService.Instance: TafwFormsService;
begin
 if (g_TafwFormsService = nil) then
 begin
  l3System.AddExitProc(TafwFormsServiceFree);
  g_TafwFormsService := Create;
 end;
 Result := g_TafwFormsService;
end;


class function TafwFormsService.Exists: Boolean;
 {-}
begin
 Result := g_TafwFormsService <> nil;
end;//TafwFormsService.Exists

function TafwFormsService.GetAnotherParentForm(Component: TPersistent): TCustomForm;
//#UC START# *1077E9580F6F_5506D5FB0019_var*
//#UC END# *1077E9580F6F_5506D5FB0019_var*
begin
//#UC START# *1077E9580F6F_5506D5FB0019_impl*
 Result := afw.GetAnotherParentForm(Component);
//#UC END# *1077E9580F6F_5506D5FB0019_impl*
end;//TafwFormsService.GetAnotherParentForm

function TafwFormsService.GetMainForm(Component: TPersistent): TCustomForm;
//#UC START# *207716257CFB_5506D5FB0019_var*
//#UC END# *207716257CFB_5506D5FB0019_var*
begin
//#UC START# *207716257CFB_5506D5FB0019_impl*
 Result := afw.GetMainForm(Component);
//#UC END# *207716257CFB_5506D5FB0019_impl*
end;//TafwFormsService.GetMainForm

function TafwFormsService.GetParentForm(Component: TPersistent): TCustomForm;
//#UC START# *32D6965B86E7_5506D5FB0019_var*
//#UC END# *32D6965B86E7_5506D5FB0019_var*
begin
//#UC START# *32D6965B86E7_5506D5FB0019_impl*
 Result := afw.GetParentForm(Component);
//#UC END# *32D6965B86E7_5506D5FB0019_impl*
end;//TafwFormsService.GetParentForm

function TafwFormsService.GetTopParentForm(Component: TPersistent): TCustomForm;
//#UC START# *D9663D6CD433_5506D5FB0019_var*
//#UC END# *D9663D6CD433_5506D5FB0019_var*
begin
//#UC START# *D9663D6CD433_5506D5FB0019_impl*
 Result := afw.GetTopParentForm(Component);
//#UC END# *D9663D6CD433_5506D5FB0019_impl*
end;//TafwFormsService.GetTopParentForm

{$IfEnd} //not NoVCL

// start class TafwKeyboardLayoutService

var g_TafwKeyboardLayoutService : TafwKeyboardLayoutService = nil;

procedure TafwKeyboardLayoutServiceFree;
begin
 l3Free(g_TafwKeyboardLayoutService);
end;

class function TafwKeyboardLayoutService.Instance: TafwKeyboardLayoutService;
begin
 if (g_TafwKeyboardLayoutService = nil) then
 begin
  l3System.AddExitProc(TafwKeyboardLayoutServiceFree);
  g_TafwKeyboardLayoutService := Create;
 end;
 Result := g_TafwKeyboardLayoutService;
end;


class function TafwKeyboardLayoutService.Exists: Boolean;
 {-}
begin
 Result := g_TafwKeyboardLayoutService <> nil;
end;//TafwKeyboardLayoutService.Exists

procedure TafwKeyboardLayoutService.TryActivateKeyboardLayout;
//#UC START# *747558CBA739_55099AE90101_var*
//#UC END# *747558CBA739_55099AE90101_var*
begin
//#UC START# *747558CBA739_55099AE90101_impl*
 afw.TryActivateKeyboardLayout;
//#UC END# *747558CBA739_55099AE90101_impl*
end;//TafwKeyboardLayoutService.TryActivateKeyboardLayout

// start class TafwTabService

var g_TafwTabService : TafwTabService = nil;

procedure TafwTabServiceFree;
begin
 l3Free(g_TafwTabService);
end;

class function TafwTabService.Instance: TafwTabService;
begin
 if (g_TafwTabService = nil) then
 begin
  l3System.AddExitProc(TafwTabServiceFree);
  g_TafwTabService := Create;
 end;
 Result := g_TafwTabService;
end;


class function TafwTabService.Exists: Boolean;
 {-}
begin
 Result := g_TafwTabService <> nil;
end;//TafwTabService.Exists

function TafwTabService.HasTabs: Boolean;
//#UC START# *A8AF111E1F35_550AE9D40363_var*
//#UC END# *A8AF111E1F35_550AE9D40363_var*
begin
//#UC START# *A8AF111E1F35_550AE9D40363_impl*
 if (afw.Application <> nil) then
  Result := (afw.Application.TabInterfaceType = afw_titTabs)
 else
  Result := false; 
//#UC END# *A8AF111E1F35_550AE9D40363_impl*
end;//TafwTabService.HasTabs

class function Tafw.Application: IafwApplication;
//#UC START# *4775153A0006_477515240332_var*
//#UC END# *4775153A0006_477515240332_var*
begin
//#UC START# *4775153A0006_477515240332_impl*
 Result := nil;
//#UC END# *4775153A0006_477515240332_impl*
end;//Tafw.Application

class procedure Tafw.BeginOp;
//#UC START# *4775163F024C_477515240332_var*
//#UC END# *4775163F024C_477515240332_var*
begin
//#UC START# *4775163F024C_477515240332_impl*
 Inc(g_InOp);
//#UC END# *4775163F024C_477515240332_impl*
end;//Tafw.BeginOp

class procedure Tafw.EndOp;
//#UC START# *4775165403AE_477515240332_var*
//#UC END# *4775165403AE_477515240332_var*
begin
//#UC START# *4775165403AE_477515240332_impl*
 Dec(g_InOp);
//#UC END# *4775165403AE_477515240332_impl*
end;//Tafw.EndOp

class function Tafw.InOp: Boolean;
//#UC START# *4775166D031F_477515240332_var*
//#UC END# *4775166D031F_477515240332_var*
begin
//#UC START# *4775166D031F_477515240332_impl*
 Result := (g_InOp > 0);
//#UC END# *4775166D031F_477515240332_impl*
end;//Tafw.InOp

class function Tafw.IsObjectLocked(aControl: TObject = nil): Boolean;
//#UC START# *47751681028E_477515240332_var*
//#UC END# *47751681028E_477515240332_var*
begin
//#UC START# *47751681028E_477515240332_impl*
 Result := false;
//#UC END# *47751681028E_477515240332_impl*
end;//Tafw.IsObjectLocked

{$If not defined(NoVCL)}
class function Tafw.GetParentForm(Component: TPersistent): TafwCustomForm;
//#UC START# *4775169B0334_477515240332_var*
//#UC END# *4775169B0334_477515240332_var*
begin
//#UC START# *4775169B0334_477515240332_impl*
 Result := nil;
 if (Component Is TControl) then
  while (Component <> nil) AND (Result = nil) do
   if (Component Is TCustomForm) then
    Result := TCustomForm(Component)
   else
    Component := TControl(Component).Parent;
 while (Component <> nil) AND (Result = nil) do begin
  if (Component Is TCustomForm) then
   Result := TCustomForm(Component)
  else
   Component := TafwHackPersistent(Component).GetOwner;
 end;{C <> nil..}
//#UC END# *4775169B0334_477515240332_impl*
end;//Tafw.GetParentForm
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
class function Tafw.GetAnotherParentForm(Component: TPersistent): TafwCustomForm;
//#UC START# *477530450083_477515240332_var*
//#UC END# *477530450083_477515240332_var*
begin
//#UC START# *477530450083_477515240332_impl*
 Result := nil;
 if not Assigned(Component) then
  Exit;
 Result := GetParentForm(Component);
 if (Result = Component) then begin
  if TForm(Result).FormStyle = fsMDIChild then
   Result := Forms.Application.MainForm
  else if (Result.Parent <> nil) then
   Result := GetParentForm(Result.Parent)
  else if (Result.Owner <> nil) then
   Result := GetParentForm(Result.Owner)
  else
   Result := nil;
 end;
//#UC END# *477530450083_477515240332_impl*
end;//Tafw.GetAnotherParentForm
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
class function Tafw.GetTopParentForm(Component: TPersistent): TafwCustomForm;
//#UC START# *4775305B0003_477515240332_var*
var
 l_Form : TCustomForm;
//#UC END# *4775305B0003_477515240332_var*
begin
//#UC START# *4775305B0003_477515240332_impl*
 Result := nil;
 l_Form := GetAnotherParentForm(Component);
 while true do
 begin
  if (l_Form = nil) or Supports(l_Form, IafwMainFormContainer) then
   break
  else
  begin
   Result := l_Form;
   l_Form := GetAnotherParentForm(l_Form);
  end;//l_Form = nil
 end;//while true
//#UC END# *4775305B0003_477515240332_impl*
end;//Tafw.GetTopParentForm
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
class function Tafw.GetMainForm(Component: TPersistent): TafwCustomForm;
//#UC START# *4775306A03AC_477515240332_var*
var
 l_MainFormContainer: IafwMainFormContainer;
//#UC END# *4775306A03AC_477515240332_var*
begin
//#UC START# *4775306A03AC_477515240332_impl*
 Result := GetTopParentForm(Component);
 if Supports(Result, IafwMainFormContainer, l_MainFormContainer) then
  Result := l_MainFormContainer.CurrentMainForm;
//#UC END# *4775306A03AC_477515240332_impl*
end;//Tafw.GetMainForm
{$IfEnd} //not NoVCL

class procedure Tafw.ProcessMessages;
//#UC START# *4775307B00B7_477515240332_var*
{$IfNDef afwNoProcessMessages}
{$IfNDef DesignTimeLibrary}
var
 Msg : TMsg;
 l_Cnt : Cardinal;
 l_PntCnt : Cardinal;
{$EndIf  DesignTimeLibrary}
{$EndIf  afwNoProcessMessages}
//#UC END# *4775307B00B7_477515240332_var*
begin
//#UC START# *4775307B00B7_477515240332_impl*
 {$IfNDef afwNoProcessMessages}
 {$IfNDef DesignTimeLibrary}
 {$IfDef XE}
 {$IfNDef NoVCL}
 Forms.Application.ProcessMessages;
 {$Else   NoVCL}
 Assert(false);
 {$EndIf  NoVCL}
 {$Else  XE}
 {$IfDef OVP}
 Forms.Application.ProcessMessages;
 {$Else  OVP}
 // !!! Есть тут одна засада - http://mdp.garant.ru/pages/viewpage.action?pageId=226005144&focusedCommentId=226006336#comment-226006336
 l_Cnt := 0;
 l_PntCnt := 0;
 {$IfNDef NoVCL}
 while Forms.Application.CallProcessMessage(Msg) AND (l_Cnt < 3000) do
 begin
  Inc(l_Cnt);
  if (Msg.Message = 0{WM_NULL}) OR (Msg.Message = 15{WM_PAINT}) then
  begin
   // http://mdp.garant.ru/pages/viewpage.action?pageId=226005144&focusedCommentId=226006362#comment-226006362
   Inc(l_PntCnt);
   if (l_PntCnt > 1000) then
   begin
    Assert(false);
    break;
   end;//l_PntCnt > 500
  end;//Msg.Message = 0{WM_NULL}
 end;//while Forms.Application.CallProcessMessage(Msg)
 {$Else  NoVCL}
 Assert(false);
 {$EndIf NoVCL}
 {$EndIf OVP}
 {$EndIf XE}
 {$Else  DesignTimeLibrary}
 Forms.Application.ProcessMessages;
 {$EndIf DesignTimeLibrary}
 {$EndIf  afwNoProcessMessages}
//#UC END# *4775307B00B7_477515240332_impl*
end;//Tafw.ProcessMessages

class function Tafw.Settings: IafwSettings;
//#UC START# *47753A3300D9_477515240332_var*
//#UC END# *47753A3300D9_477515240332_var*
begin
//#UC START# *47753A3300D9_477515240332_impl*
 if (Self <> nil) AND (Application <> nil) then
  Result := Application.Settings
 else
  Result := nil;
//#UC END# *47753A3300D9_477515240332_impl*
end;//Tafw.Settings

class procedure Tafw.LockActionUpdate;
//#UC START# *4A362F8A01C0_477515240332_var*
//#UC END# *4A362F8A01C0_477515240332_var*
begin
//#UC START# *4A362F8A01C0_477515240332_impl*
 Inc(g_LockActionUpdate);
//#UC END# *4A362F8A01C0_477515240332_impl*
end;//Tafw.LockActionUpdate

class procedure Tafw.UnlockActionUpdate;
//#UC START# *4A362FB70028_477515240332_var*
//#UC END# *4A362FB70028_477515240332_var*
begin
//#UC START# *4A362FB70028_477515240332_impl*
 Dec(g_LockActionUpdate);
//#UC END# *4A362FB70028_477515240332_impl*
end;//Tafw.UnlockActionUpdate

class function Tafw.IsActionUpdateLocked: Boolean;
//#UC START# *4A362FC603AF_477515240332_var*
//#UC END# *4A362FC603AF_477515240332_var*
begin
//#UC START# *4A362FC603AF_477515240332_impl*
 Result := (g_LockActionUpdate > 0);
//#UC END# *4A362FC603AF_477515240332_impl*
end;//Tafw.IsActionUpdateLocked

class function Tafw.PermanentSettings: IafwSettingsPrim;
//#UC START# *4AB73320020A_477515240332_var*
//#UC END# *4AB73320020A_477515240332_var*
begin
//#UC START# *4AB73320020A_477515240332_impl*
 if (Self <> nil) then
  Result := Application.PermanentSettings
 else
  Result := nil;
//#UC END# *4AB73320020A_477515240332_impl*
end;//Tafw.PermanentSettings

class function Tafw.IsMenuLocked(const aControl: IafwMenuUnlockedPostBuild): Boolean;
//#UC START# *4B05260901E6_477515240332_var*
//#UC END# *4B05260901E6_477515240332_var*
begin
//#UC START# *4B05260901E6_477515240332_impl*
 Result := false;
//#UC END# *4B05260901E6_477515240332_impl*
end;//Tafw.IsMenuLocked

class procedure Tafw.ControlDestroying(const aControl: IafwMenuUnlockedPostBuild);
//#UC START# *4B0535ED02A1_477515240332_var*
//#UC END# *4B0535ED02A1_477515240332_var*
begin
//#UC START# *4B0535ED02A1_477515240332_impl*
//Do Nothiong;
//#UC END# *4B0535ED02A1_477515240332_impl*
end;//Tafw.ControlDestroying

initialization
// Регистрация TafwMessagesService
 Tl3MessagesService.Instance.Alien := TafwMessagesService.Instance;
{$If not defined(NoVCL)}
// Регистрация TafwFormsService
 {$If not defined(NoVCL)}
 Tl3FormsService.Instance.Alien := TafwFormsService.Instance;
 {$IfEnd} //not NoVCL

{$IfEnd} //not NoVCL
// Регистрация TafwKeyboardLayoutService
 Tl3KeyboardLayoutService.Instance.Alien := TafwKeyboardLayoutService.Instance;
// Регистрация TafwTabService
 Tl3TabService.Instance.Alien := TafwTabService.Instance;
{$If not defined(DesignTimeLibrary)}
//#UC START# *4B6C57D9019A*
 g_IsWin2000 := (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion = 5) and (Win32MinorVersion = 0); 
//#UC END# *4B6C57D9019A*
{$IfEnd} //not DesignTimeLibrary

end.