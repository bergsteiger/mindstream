unit afwApplication;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3CacheableBase,
  afwInterfaces,
  afwFacade,
  l3Core
  ;

type
 TafwApplication = class(Tl3CacheableBase, IafwSettingsSource, IafwApplication)
  {* "Стандартная" реализация приложения AFW. }
 private
 // private fields
   f_PrintManager : IafwPrintManager;
   f_UserQuery : Pointer;
   f_BaseId : AnsiString;
   f_Settings : IafwSettings;
   f_LocaleInfo : IafwLocaleInfo;
   f_Data : IafwApplicationData;
   f_PermanentSettings : IafwSettingsPrim;
 private
 // private methods
   procedure DefineLocaleInfo;
 protected
 // realized methods
   function pm_GetBaseId: AnsiString;
   procedure pm_SetBaseId(const aValue: AnsiString);
   procedure ApplyActiveLanguage(const aTarget: IafwResources);
   function pm_GetCurrentMainForm: IafwMainForm;
   function pm_GetSettings: IafwSettings;
   procedure pm_SetSettings(const aValue: IafwSettings);
   function pm_GetPrintManager: IafwPrintManager;
   procedure pm_SetPrintManager(const aValue: IafwPrintManager);
   function pm_GetUserQuery: IafwUserQuery;
   procedure pm_SetUserQuery(const aValue: IafwUserQuery);
   function pm_GetIsInternal: Boolean;
   function pm_GetLocaleInfo: IafwLocaleInfo;
   function Get_Data: IafwApplicationData;
   function Get_PermanentSettings: IafwSettingsPrim;
   procedure LockKeyBoard;
   procedure UnlockKeyBoard;
   function AskClearClipboardProc: TafwAskClearClipboardProc;
   function IsTrialMode: Boolean;
   function Get_TabInterfaceType: TafwTabInterfaceType;
 public
 // realized methods
    {$If not defined(NoVCL)}
   function MakeLongProcessVisualizer(const aCaption: IafwCString;
     anAttachWnd: THandle = 0;
     anInitialTimeout: Cardinal = afw_lpwTimeout;
     anImageList: TafwCustomImageList = nil;
     anImageIndex: Integer = -1): IafwLongProcessVisualizer;
    {$IfEnd} //not NoVCL
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 protected
 // protected methods
   function DoGetIsTrialMode: Boolean; virtual;
   function DoGetTabInterfaceType: TafwTabInterfaceType; virtual;
   function MakeApplicationData: IafwApplicationData; virtual;
   function MakeSettings: IafwSettings; virtual;
   function DoGetIsInternal: Boolean; virtual;
   function MakeLocaleInfo: IafwLocaleInfo; virtual;
   procedure DoApplyActiveLanguage(const aTarget: IafwResources); virtual;
   function MakePermanentSettings: IafwSettingsPrim; virtual;
   procedure DoLockKeyboard; virtual;
   procedure DoUnLockKeyboard; virtual;
   procedure GetAskClearClipboardProc(out aProc: TafwAskClearClipboardProc); virtual;
 end;//TafwApplication

 TafwApplicationClass = class of TafwApplication;
  {* Ссылка на TafwApplication. }

 TafwImplementation = class(Tafw)
  {* Метакласс, реализующий "стандартным" образом точку входа в интерфейсы библиотеки AFW. }
 public
 // overridden public methods
   class function Application: IafwApplication; override;
     {* приложение AFW. }
 public
 // public methods
   class function GetApplicationClass: TafwApplicationClass; virtual;
     {* Класс реализации приложения. }
 end;//TafwImplementation

const
  { Строковые идентификаторы языков. dl - detailed LanguageId. }
 afw_dlDefault = 'ru_RU.CP1251';

implementation

uses
  l3LocaleInfo,
  afwLongProcessVisualizer,
  SysUtils,
  l3Base
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  afwSettingsImplSing,
  afwSettingsImplemented,
  Classes
  ;

var
  g_Application : TafwApplication;

// unit methods

procedure FreeApp;
//#UC START# *4B72F1360176_47764DEC01A7_var*
//#UC END# *4B72F1360176_47764DEC01A7_var*
begin
//#UC START# *4B72F1360176_47764DEC01A7_impl*
 FreeAndNil(g_Application);
//#UC END# *4B72F1360176_47764DEC01A7_impl*
end;//FreeApp
// start class TafwApplication

function TafwApplication.DoGetIsTrialMode: Boolean;
//#UC START# *5232DF6F008F_47764DD601C3_var*
//#UC END# *5232DF6F008F_47764DD601C3_var*
begin
//#UC START# *5232DF6F008F_47764DD601C3_impl*
 Result := false;
//#UC END# *5232DF6F008F_47764DD601C3_impl*
end;//TafwApplication.DoGetIsTrialMode

function TafwApplication.DoGetTabInterfaceType: TafwTabInterfaceType;
//#UC START# *54EFFE25008D_47764DD601C3_var*
//#UC END# *54EFFE25008D_47764DD601C3_var*
begin
//#UC START# *54EFFE25008D_47764DD601C3_impl*
 Result := afw_titNoTabs;
//#UC END# *54EFFE25008D_47764DD601C3_impl*
end;//TafwApplication.DoGetTabInterfaceType

function TafwApplication.MakeApplicationData: IafwApplicationData;
//#UC START# *47765163007D_47764DD601C3_var*
//#UC END# *47765163007D_47764DD601C3_var*
begin
//#UC START# *47765163007D_47764DD601C3_impl*
  Result := nil;
//#UC END# *47765163007D_47764DD601C3_impl*
end;//TafwApplication.MakeApplicationData

function TafwApplication.MakeSettings: IafwSettings;
//#UC START# *4776517E01C2_47764DD601C3_var*
//#UC END# *4776517E01C2_47764DD601C3_var*
begin
//#UC START# *4776517E01C2_47764DD601C3_impl*
 {$If not Defined(Nemesis) OR Defined(NewGen)}
 Result := TafwSettingsImplemented.Make;
 //Result := TafwSettingsImplemented.Make;
 {$Else}
 Result := nil;
 {$IfENd}
//#UC END# *4776517E01C2_47764DD601C3_impl*
end;//TafwApplication.MakeSettings

function TafwApplication.DoGetIsInternal: Boolean;
//#UC START# *477651920385_47764DD601C3_var*
//#UC END# *477651920385_47764DD601C3_var*
begin
//#UC START# *477651920385_47764DD601C3_impl*
 Result := True;
//#UC END# *477651920385_47764DD601C3_impl*
end;//TafwApplication.DoGetIsInternal

function TafwApplication.MakeLocaleInfo: IafwLocaleInfo;
//#UC START# *4776519F03A3_47764DD601C3_var*
//#UC END# *4776519F03A3_47764DD601C3_var*
begin
//#UC START# *4776519F03A3_47764DD601C3_impl*
 Result := Tl3UnixLocaleInfo.Make(afw_dlDefault, afw_dlDefault);
//#UC END# *4776519F03A3_47764DD601C3_impl*
end;//TafwApplication.MakeLocaleInfo

procedure TafwApplication.DefineLocaleInfo;
//#UC START# *4787714C0379_47764DD601C3_var*
//#UC END# *4787714C0379_47764DD601C3_var*
begin
//#UC START# *4787714C0379_47764DD601C3_impl*
 if f_LocaleInfo = nil then
  f_LocaleInfo := MakeLocaleInfo;
//#UC END# *4787714C0379_47764DD601C3_impl*
end;//TafwApplication.DefineLocaleInfo

procedure TafwApplication.DoApplyActiveLanguage(const aTarget: IafwResources);
//#UC START# *478781490206_47764DD601C3_var*
//#UC END# *478781490206_47764DD601C3_var*
begin
//#UC START# *478781490206_47764DD601C3_impl*
 DefineLocaleInfo;
//#UC END# *478781490206_47764DD601C3_impl*
end;//TafwApplication.DoApplyActiveLanguage

function TafwApplication.MakePermanentSettings: IafwSettingsPrim;
//#UC START# *4AB72C3B0094_47764DD601C3_var*
//#UC END# *4AB72C3B0094_47764DD601C3_var*
begin
//#UC START# *4AB72C3B0094_47764DD601C3_impl*
 {$If not Defined(Nemesis) OR Defined(NewGen)}
 Result := TafwSettingsImplemented.Make;
 {$Else}
 Result := nil;
 {$IfENd}
//#UC END# *4AB72C3B0094_47764DD601C3_impl*
end;//TafwApplication.MakePermanentSettings

procedure TafwApplication.DoLockKeyboard;
//#UC START# *4BFE60CB0000_47764DD601C3_var*
//#UC END# *4BFE60CB0000_47764DD601C3_var*
begin
//#UC START# *4BFE60CB0000_47764DD601C3_impl*
// Do nothing
//#UC END# *4BFE60CB0000_47764DD601C3_impl*
end;//TafwApplication.DoLockKeyboard

procedure TafwApplication.DoUnLockKeyboard;
//#UC START# *4BFE60DE0020_47764DD601C3_var*
//#UC END# *4BFE60DE0020_47764DD601C3_var*
begin
//#UC START# *4BFE60DE0020_47764DD601C3_impl*
// Do nothing
//#UC END# *4BFE60DE0020_47764DD601C3_impl*
end;//TafwApplication.DoUnLockKeyboard

procedure TafwApplication.GetAskClearClipboardProc(out aProc: TafwAskClearClipboardProc);
//#UC START# *4C9875080352_47764DD601C3_var*
//#UC END# *4C9875080352_47764DD601C3_var*
begin
//#UC START# *4C9875080352_47764DD601C3_impl*
 aProc := nil;
//#UC END# *4C9875080352_47764DD601C3_impl*
end;//TafwApplication.GetAskClearClipboardProc

function TafwApplication.pm_GetBaseId: AnsiString;
//#UC START# *473DA15800E2_47764DD601C3get_var*
//#UC END# *473DA15800E2_47764DD601C3get_var*
begin
//#UC START# *473DA15800E2_47764DD601C3get_impl*
 Result := f_BaseId;
//#UC END# *473DA15800E2_47764DD601C3get_impl*
end;//TafwApplication.pm_GetBaseId

procedure TafwApplication.pm_SetBaseId(const aValue: AnsiString);
//#UC START# *473DA15800E2_47764DD601C3set_var*
//#UC END# *473DA15800E2_47764DD601C3set_var*
begin
//#UC START# *473DA15800E2_47764DD601C3set_impl*
 f_BaseId := aValue;
//#UC END# *473DA15800E2_47764DD601C3set_impl*
end;//TafwApplication.pm_SetBaseId

procedure TafwApplication.ApplyActiveLanguage(const aTarget: IafwResources);
//#UC START# *473DA1B10131_47764DD601C3_var*
//#UC END# *473DA1B10131_47764DD601C3_var*
begin
//#UC START# *473DA1B10131_47764DD601C3_impl*
 DoApplyActiveLanguage(aTarget);
//#UC END# *473DA1B10131_47764DD601C3_impl*
end;//TafwApplication.ApplyActiveLanguage

function TafwApplication.pm_GetCurrentMainForm: IafwMainForm;
//#UC START# *473DA22A0383_47764DD601C3get_var*

 function _GetMain(aForm: TCustomForm): IafwMainForm;
 var
  l_Form : TCustomForm;
  l_Container: IafwMainFormContainer;
 begin//_GetMain
  Result := nil;
  l_Form := aForm;

  if Assigned(l_Form) and not (csDestroying in l_Form.ComponentState) then
   if Supports(aForm, IafwMainFormContainer, l_Container) then
    try
     l_Form := l_Container.CurrentMainForm;
    finally
     l_Container := nil;
    end//try..finally
   else
   begin
    while (l_Form <> nil) AND (Result = nil) do
     if Supports(l_Form, IafwMainForm, Result) then
      break
     else
      l_Form := afw.GetAnotherParentForm(l_Form);
   end;
  
  if (Result = nil) then
  begin
//   l_Form := aForm;
   while (l_Form <> nil) AND (Result = nil) do
    if Supports(l_Form, IafwMainForm, Result) then
     break
    else
     l_Form := afw.GetParentForm(l_Form.Owner);
  end;//Result = nil
 end;//_GetMain

//#UC END# *473DA22A0383_47764DD601C3get_var*
begin
//#UC START# *473DA22A0383_47764DD601C3get_impl*
 Result := _GetMain(Screen.ActiveForm);
 if (Result = nil) then
  Result := _GetMain(Screen.ActiveCustomForm);
 if (Result = nil) then
  Result := _GetMain(Application.MainForm);
//#UC END# *473DA22A0383_47764DD601C3get_impl*
end;//TafwApplication.pm_GetCurrentMainForm

function TafwApplication.pm_GetSettings: IafwSettings;
//#UC START# *473DA23B0085_47764DD601C3get_var*
//#UC END# *473DA23B0085_47764DD601C3get_var*
begin
//#UC START# *473DA23B0085_47764DD601C3get_impl*
 if (f_Settings = nil) then
  f_Settings := MakeSettings;
 Result := f_Settings;
//#UC END# *473DA23B0085_47764DD601C3get_impl*
end;//TafwApplication.pm_GetSettings

procedure TafwApplication.pm_SetSettings(const aValue: IafwSettings);
//#UC START# *473DA23B0085_47764DD601C3set_var*
//#UC END# *473DA23B0085_47764DD601C3set_var*
begin
//#UC START# *473DA23B0085_47764DD601C3set_impl*
 f_Settings := aValue;
//#UC END# *473DA23B0085_47764DD601C3set_impl*
end;//TafwApplication.pm_SetSettings

function TafwApplication.pm_GetPrintManager: IafwPrintManager;
//#UC START# *473DA24E0353_47764DD601C3get_var*
//#UC END# *473DA24E0353_47764DD601C3get_var*
begin
//#UC START# *473DA24E0353_47764DD601C3get_impl*
 Result := f_PrintManager;
//#UC END# *473DA24E0353_47764DD601C3get_impl*
end;//TafwApplication.pm_GetPrintManager

procedure TafwApplication.pm_SetPrintManager(const aValue: IafwPrintManager);
//#UC START# *473DA24E0353_47764DD601C3set_var*
//#UC END# *473DA24E0353_47764DD601C3set_var*
begin
//#UC START# *473DA24E0353_47764DD601C3set_impl*
 f_PrintManager := aValue;
//#UC END# *473DA24E0353_47764DD601C3set_impl*
end;//TafwApplication.pm_SetPrintManager

function TafwApplication.pm_GetUserQuery: IafwUserQuery;
//#UC START# *473DA53603AD_47764DD601C3get_var*
//#UC END# *473DA53603AD_47764DD601C3get_var*
begin
//#UC START# *473DA53603AD_47764DD601C3get_impl*
 Result := IafwUserQuery(f_UserQuery)
//#UC END# *473DA53603AD_47764DD601C3get_impl*
end;//TafwApplication.pm_GetUserQuery

procedure TafwApplication.pm_SetUserQuery(const aValue: IafwUserQuery);
//#UC START# *473DA53603AD_47764DD601C3set_var*
//#UC END# *473DA53603AD_47764DD601C3set_var*
begin
//#UC START# *473DA53603AD_47764DD601C3set_impl*
 f_UserQuery := Pointer(aValue);
//#UC END# *473DA53603AD_47764DD601C3set_impl*
end;//TafwApplication.pm_SetUserQuery

function TafwApplication.pm_GetIsInternal: Boolean;
//#UC START# *473DA5480182_47764DD601C3get_var*
//#UC END# *473DA5480182_47764DD601C3get_var*
begin
//#UC START# *473DA5480182_47764DD601C3get_impl*
 Result := DoGetIsInternal;
//#UC END# *473DA5480182_47764DD601C3get_impl*
end;//TafwApplication.pm_GetIsInternal

function TafwApplication.pm_GetLocaleInfo: IafwLocaleInfo;
//#UC START# *473DA5AE02FB_47764DD601C3get_var*
//#UC END# *473DA5AE02FB_47764DD601C3get_var*
begin
//#UC START# *473DA5AE02FB_47764DD601C3get_impl*
 DefineLocaleInfo;
 Result := f_LocaleInfo;
//#UC END# *473DA5AE02FB_47764DD601C3get_impl*
end;//TafwApplication.pm_GetLocaleInfo

function TafwApplication.Get_Data: IafwApplicationData;
//#UC START# *4768DE18030F_47764DD601C3get_var*
//#UC END# *4768DE18030F_47764DD601C3get_var*
begin
//#UC START# *4768DE18030F_47764DD601C3get_impl*
 if f_Data = nil then
  f_Data := MakeApplicationData;
 Result := f_Data;
//#UC END# *4768DE18030F_47764DD601C3get_impl*
end;//TafwApplication.Get_Data

{$If not defined(NoVCL)}
function TafwApplication.MakeLongProcessVisualizer(const aCaption: IafwCString;
  anAttachWnd: THandle = 0;
  anInitialTimeout: Cardinal = afw_lpwTimeout;
  anImageList: TafwCustomImageList = nil;
  anImageIndex: Integer = -1): IafwLongProcessVisualizer;
//#UC START# *49E85D4A0016_47764DD601C3_var*
//#UC END# *49E85D4A0016_47764DD601C3_var*
begin
//#UC START# *49E85D4A0016_47764DD601C3_impl*
 Result := TafwLongProcessVisualizer.Make(aCaption, anAttachWnd, anInitialTimeout,
  anImageList, anImageIndex);
//#UC END# *49E85D4A0016_47764DD601C3_impl*
end;//TafwApplication.MakeLongProcessVisualizer
{$IfEnd} //not NoVCL

function TafwApplication.Get_PermanentSettings: IafwSettingsPrim;
//#UC START# *4AB72A090253_47764DD601C3get_var*
//#UC END# *4AB72A090253_47764DD601C3get_var*
begin
//#UC START# *4AB72A090253_47764DD601C3get_impl*
 if (f_PermanentSettings = nil) then
  f_PermanentSettings := MakePermanentSettings;
 Result := f_PermanentSettings;
//#UC END# *4AB72A090253_47764DD601C3get_impl*
end;//TafwApplication.Get_PermanentSettings

procedure TafwApplication.LockKeyBoard;
//#UC START# *4BFE5ED5019D_47764DD601C3_var*
//#UC END# *4BFE5ED5019D_47764DD601C3_var*
begin
//#UC START# *4BFE5ED5019D_47764DD601C3_impl*
 DoLockKeyboard;
//#UC END# *4BFE5ED5019D_47764DD601C3_impl*
end;//TafwApplication.LockKeyBoard

procedure TafwApplication.UnlockKeyBoard;
//#UC START# *4BFE5EE60134_47764DD601C3_var*
//#UC END# *4BFE5EE60134_47764DD601C3_var*
begin
//#UC START# *4BFE5EE60134_47764DD601C3_impl*
 DoUnLockKeyboard;
//#UC END# *4BFE5EE60134_47764DD601C3_impl*
end;//TafwApplication.UnlockKeyBoard

function TafwApplication.AskClearClipboardProc: TafwAskClearClipboardProc;
//#UC START# *4C9873450385_47764DD601C3_var*
//#UC END# *4C9873450385_47764DD601C3_var*
begin
//#UC START# *4C9873450385_47764DD601C3_impl*
 GetAskClearClipboardProc(Result);
//#UC END# *4C9873450385_47764DD601C3_impl*
end;//TafwApplication.AskClearClipboardProc

function TafwApplication.IsTrialMode: Boolean;
//#UC START# *5232DF2E0192_47764DD601C3_var*
//#UC END# *5232DF2E0192_47764DD601C3_var*
begin
//#UC START# *5232DF2E0192_47764DD601C3_impl*
 Result := DoGetIsTrialMode;
//#UC END# *5232DF2E0192_47764DD601C3_impl*
end;//TafwApplication.IsTrialMode

function TafwApplication.Get_TabInterfaceType: TafwTabInterfaceType;
//#UC START# *54F0063B0015_47764DD601C3get_var*
//#UC END# *54F0063B0015_47764DD601C3get_var*
begin
//#UC START# *54F0063B0015_47764DD601C3get_impl*
 Result := DoGetTabInterfaceType;
//#UC END# *54F0063B0015_47764DD601C3get_impl*
end;//TafwApplication.Get_TabInterfaceType

procedure TafwApplication.Cleanup;
//#UC START# *479731C50290_47764DD601C3_var*
//#UC END# *479731C50290_47764DD601C3_var*
begin
//#UC START# *479731C50290_47764DD601C3_impl*
 f_PermanentSettings := nil;
 pm_SetUserQuery(nil);
 pm_SetPrintManager(nil);
 pm_SetSettings(nil);
 inherited;
//#UC END# *479731C50290_47764DD601C3_impl*
end;//TafwApplication.Cleanup

procedure TafwApplication.ClearFields;
 {-}
begin
 f_PrintManager := nil;
 f_Settings := nil;
 f_LocaleInfo := nil;
 f_Data := nil;
 inherited;
end;//TafwApplication.ClearFields
// start class TafwImplementation

class function TafwImplementation.GetApplicationClass: TafwApplicationClass;
//#UC START# *47764F8A02D1_47764F3F0064_var*
//#UC END# *47764F8A02D1_47764F3F0064_var*
begin
//#UC START# *47764F8A02D1_47764F3F0064_impl*
 Result := TafwApplication;
//#UC END# *47764F8A02D1_47764F3F0064_impl*
end;//TafwImplementation.GetApplicationClass

class function TafwImplementation.Application: IafwApplication;
//#UC START# *4775153A0006_47764F3F0064_var*
var
 l_AC : TafwApplicationClass;
//#UC END# *4775153A0006_47764F3F0064_var*
begin
//#UC START# *4775153A0006_47764F3F0064_impl*
{$IfNDef DesignTimeLibrary}
 l_AC := GetApplicationClass;
 if (g_Application <> nil) AND not l3SystemDown then
 begin
  if not g_Application.InheritsFrom(l_AC) then
  begin
   FreeAndNil(g_Application);
   g_Application := l_AC.Create;
  end;//not g_Application.InheritsFrom(l_AC)
 end;//g_Application <> nil
 if (g_Application = nil) AND not l3SystemDown then
 begin
  l3System.AddExitProc(FreeApp);
  g_Application := l_AC.Create;
 end;//g_Application = nil
 Result := g_Application;
{$Else}
 Result := nil;
{$EndIf  DesignTimeLibrary}
//#UC END# *4775153A0006_47764F3F0064_impl*
end;//TafwImplementation.Application

initialization
//#UC START# *4B72FD1102AB*
 afw := TafwImplementation;
//#UC END# *4B72FD1102AB*

end.