unit l3MessageID;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces
  {$If not defined(NoVCL)}
  ,
  Dialogs
  {$IfEnd} //not NoVCL
  ,
  l3StringIDEx,
  Pl3StringIDExList
  ;

type
 Tl3MessageData = {$IfDef XE4}record{$Else}object{$EndIf}
 public
   {$If not defined(NoVCL)}
   rDlgType : TMsgDlgType;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   rButtons : TMsgDlgButtons;
   {$IfEnd} //not NoVCL
   rNeedCheck : Boolean;
   {$If not defined(NoVCL)}
   rDefaultButton : TMsgDlgBtn;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCL)}
   rCancelButton : TMsgDlgBtn;
   {$IfEnd} //not NoVCL
   rHelpCtx : Integer;
   rDefaultChoice : Integer;
   rCustomChoice : Integer;
   rFooterInfo : Il3CString; // Информация для вывода в подвале диалога, в формате "wiki"
   rCustomButtonCaption : AnsiString;
   rSettingsCaptionOld : AnsiString;
   rLongHintOld : AnsiString;
   rCheckCaption : Pl3StringIDEx;
   rLongHint : Pl3StringIDEx;
   rSettingsCaption : Pl3StringIDEx;
   rChoices : TPl3StringIDExList;
 end;//Tl3MessageData

 Tl3Message = {$IfDef XE4}record{$Else}object{$EndIf}
 public
   rData : Tl3MessageData;
   rMessage : Il3CString;
   rName : AnsiString;
 public
    function ChangeMessage(const aNewMessage: Il3CString): Tl3Message;
    function ChangeCheckCaption(const aNewMessage: Tl3StringIDEx): Tl3Message;
    function ChangeFooterInfo(const aNewInfo: Il3CString): Tl3Message;
    function SettingsCaption: AnsiString;
    function LongHint: AnsiString;
    function CheckCaption: AnsiString;
 end;//Tl3Message

 Tl3MessageID = object(Tl3StringIDEx)
  {* Локализуемое сообщение }
 private
    procedure DoInit;
 protected
 // property methods
   function pm_GetAsMessage: Tl3Message;
 public
   rData : Tl3MessageData;
 public
    procedure AddChoice(const aChoice: Tl3StringIDEx);
     {* Добавляет выбор у диалога }
    procedure AddCustomChoice(const aChoice: Tl3StringIDEx);
    procedure AddDefaultChoice(const aChoice: Tl3StringIDEx);
     {$If not defined(NoVCL)}
   procedure SetDlgType(aType: TMsgDlgType);
    {$IfEnd} //not NoVCL
    procedure SetCheckCaption(const aValue: Tl3StringIDEx);
    procedure SetSettingsCaption(const aValue: Tl3StringIDEx);
    procedure SetLongHint(const aValue: Tl3StringIDEx);
    procedure SetNeedCheck(aValue: Boolean);
    procedure Cleanup;
  public
   property AsMessage: Tl3Message
     read pm_GetAsMessage;
 {$IfNDef XE4}
 private
   procedure Fake; virtual; // - это нужно чтобы правильно генерировались вызовы методов доступа к свойствам
 {$EndIf XE4}
 public
   constructor Init;
 end;//Tl3MessageID

 Pl3MessageID = ^Tl3MessageID;

var
  { Локализуемые строки Local }
 str_vcmRememberChoice : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'vcmRememberChoice'; rValue : 'Запомнить выбор и больше не показывать это сообщение.');
  { 'Запомнить выбор и больше не показывать это сообщение.' }
 str_vcmNotShowDlg : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'vcmNotShowDlg'; rValue : 'Больше не показывать это сообщение.');
  { 'Больше не показывать это сообщение.' }

{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Tl3StringIDEx;
     aType: TMsgDlgType): Tl3Message; overload;
{$IfEnd} //not NoVCL
{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Il3CString;
     const aKey: AnsiString;
     aType: TMsgDlgType): Tl3Message; overload;
{$IfEnd} //not NoVCL
{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Il3CString;
     const aKey: AnsiString;
     aType: TMsgDlgType;
     aButtons: TMsgDlgButtons): Tl3Message; overload;
{$IfEnd} //not NoVCL
{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Tl3StringIDEx;
     aType: TMsgDlgType;
     aButtons: TMsgDlgButtons): Tl3Message; overload;
{$IfEnd} //not NoVCL

function Tl3Message_C(const anID: Tl3MessageID): Tl3Message; overload;

implementation

uses
  l3String,
  SysUtils,
  Pl3MessageIDList
  ;

// start class Tl3Message

function Tl3Message.ChangeMessage(const aNewMessage: Il3CString): Tl3Message;
//#UC START# *4E09C8E1001E_4E08A63701DB_var*
//#UC END# *4E09C8E1001E_4E08A63701DB_var*
begin
//#UC START# *4E09C8E1001E_4E08A63701DB_impl*
 Result := Self;
 Result.rMessage := aNewMessage;
//#UC END# *4E09C8E1001E_4E08A63701DB_impl*
end;//Tl3Message.ChangeMessage

function Tl3Message.ChangeCheckCaption(const aNewMessage: Tl3StringIDEx): Tl3Message;
//#UC START# *4E09FB8101AB_4E08A63701DB_var*
//#UC END# *4E09FB8101AB_4E08A63701DB_var*
begin
//#UC START# *4E09FB8101AB_4E08A63701DB_impl*
 Result := Self;
 Result.rData.rCheckCaption := @aNewMessage;
//#UC END# *4E09FB8101AB_4E08A63701DB_impl*
end;//Tl3Message.ChangeCheckCaption

{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Tl3StringIDEx;
        aType: TMsgDlgType): Tl3Message;
//#UC START# *4E0A09990038_4E08A63701DB_var*
//#UC END# *4E0A09990038_4E08A63701DB_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4E0A09990038_4E08A63701DB_impl*
 Result := Tl3Message_C(aString.AsCStr, aString.rKey, aType);
//#UC END# *4E0A09990038_4E08A63701DB_impl*
end;//Tl3Message.C

{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Il3CString;
        const aKey: AnsiString;
        aType: TMsgDlgType): Tl3Message;
//#UC START# *4E0A10B2022E_4E08A63701DB_var*
//#UC END# *4E0A10B2022E_4E08A63701DB_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4E0A10B2022E_4E08A63701DB_impl*
 Result.rData.rDlgType := aType;
 if (Result.rData.rDlgType = mtConfirmation) then
  Result.rData.rButtons := [mbYes, mbNo]
 else
  Result.rData.rButtons := [mbOk];
 Result.rData.rDefaultButton := mbOk;
 Result.rData.rCancelButton := mbCancel;
 Result.rName := aKey;
 Result.rMessage := aString;
//#UC END# *4E0A10B2022E_4E08A63701DB_impl*
end;//Tl3Message.C

{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Il3CString;
        const aKey: AnsiString;
        aType: TMsgDlgType;
        aButtons: TMsgDlgButtons): Tl3Message;
//#UC START# *4E0A1B0E03A6_4E08A63701DB_var*
//#UC END# *4E0A1B0E03A6_4E08A63701DB_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4E0A1B0E03A6_4E08A63701DB_impl*
 Result := Tl3Message_C(aString, aKey, aType);
 Result.rData.rButtons := aButtons;
//#UC END# *4E0A1B0E03A6_4E08A63701DB_impl*
end;//Tl3Message.C

{$IfEnd} //not NoVCL


{$If not defined(NoVCL)}
function Tl3Message_C(const aString: Tl3StringIDEx;
        aType: TMsgDlgType;
        aButtons: TMsgDlgButtons): Tl3Message;
//#UC START# *4E0A1C590137_4E08A63701DB_var*
//#UC END# *4E0A1C590137_4E08A63701DB_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4E0A1C590137_4E08A63701DB_impl*
 Result := Tl3Message_C(aString, aType);
 Result.rData.rButtons := aButtons;
//#UC END# *4E0A1C590137_4E08A63701DB_impl*
end;//Tl3Message.C

{$IfEnd} //not NoVCL

// start class Tl3Message

function Tl3Message.ChangeFooterInfo(const aNewInfo: Il3CString): Tl3Message;
//#UC START# *4E0B39BC0383_4E08A63701DB_var*
//#UC END# *4E0B39BC0383_4E08A63701DB_var*
begin
//#UC START# *4E0B39BC0383_4E08A63701DB_impl*
 Result := Self;
 Result.rData.rFooterInfo := aNewInfo;
//#UC END# *4E0B39BC0383_4E08A63701DB_impl*
end;//Tl3Message.ChangeFooterInfo

function Tl3Message.SettingsCaption: AnsiString;
//#UC START# *4E7CACC301BC_4E08A63701DB_var*
//#UC END# *4E7CACC301BC_4E08A63701DB_var*
begin
//#UC START# *4E7CACC301BC_4E08A63701DB_impl*
 if (rData.rSettingsCaptionOld <> '') then
  Result := rData.rSettingsCaptionOld
 else
 if (rData.rSettingsCaption = nil) then
  Result := ''
 else
  Result := rData.rSettingsCaption.AsStr;
 if (Result = '') then
  Result := l3Str(rMessage);
//#UC END# *4E7CACC301BC_4E08A63701DB_impl*
end;//Tl3Message.SettingsCaption

function Tl3Message.LongHint: AnsiString;
//#UC START# *4E7CACE1000D_4E08A63701DB_var*
//#UC END# *4E7CACE1000D_4E08A63701DB_var*
begin
//#UC START# *4E7CACE1000D_4E08A63701DB_impl*
 if (rData.rLongHintOld <> '') then
  Result := rData.rLongHintOld
 else
 if (rData.rLongHint = nil) then
  Result := ''
 else
  Result := rData.rLongHint.AsStr;
 if (Result = '') then
  Result := l3Str(rMessage);
//#UC END# *4E7CACE1000D_4E08A63701DB_impl*
end;//Tl3Message.LongHint

function Tl3Message.CheckCaption: AnsiString;
//#UC START# *4F8EA27801A4_4E08A63701DB_var*
//#UC END# *4F8EA27801A4_4E08A63701DB_var*
begin
//#UC START# *4F8EA27801A4_4E08A63701DB_impl*
 if (rData.rCheckCaption = nil) then
  Result := ''
 else
  Result := rData.rCheckCaption.AsStr;
// if (Result = '') then
//  Result := l3Str(rMessage);
//#UC END# *4F8EA27801A4_4E08A63701DB_impl*
end;//Tl3Message.CheckCaption
// start class Tl3MessageID

procedure Tl3MessageID.DoInit;
//#UC START# *4E01D26702F9_4E01D1E002AE_var*
//#UC END# *4E01D26702F9_4E01D1E002AE_var*
begin
//#UC START# *4E01D26702F9_4E01D1E002AE_impl*
 FillChar(rData, SizeOf(rData), 0);
 inherited Init;
 {$IfNDef NoVCL}
 rData.rDefaultButton := mbOk;
 rData.rCancelButton := mbCancel;
 SetDlgType(mtCustom);
 {$EndIf  NoVCL}
//#UC END# *4E01D26702F9_4E01D1E002AE_impl*
end;//Tl3MessageID.DoInit

procedure Tl3MessageID.AddChoice(const aChoice: Tl3StringIDEx);
//#UC START# *4E09C6930204_4E01D1E002AE_var*
//#UC END# *4E09C6930204_4E01D1E002AE_var*
begin
//#UC START# *4E09C6930204_4E01D1E002AE_impl*
 if (rData.rChoices = nil) then
  rData.rChoices := TPl3StringIDExList.Create;
 rData.rChoices.Add(@aChoice);
//#UC END# *4E09C6930204_4E01D1E002AE_impl*
end;//Tl3MessageID.AddChoice

procedure Tl3MessageID.AddCustomChoice(const aChoice: Tl3StringIDEx);
//#UC START# *4E09D6DA034C_4E01D1E002AE_var*
var
 l_Index : Integer;
//#UC END# *4E09D6DA034C_4E01D1E002AE_var*
begin
//#UC START# *4E09D6DA034C_4E01D1E002AE_impl*
 l_Index := rData.rChoices.IndexOf(@aChoice);
 Assert(l_Index >= 0);
 rData.rCustomChoice := -(l_Index + 1);
//#UC END# *4E09D6DA034C_4E01D1E002AE_impl*
end;//Tl3MessageID.AddCustomChoice

procedure Tl3MessageID.AddDefaultChoice(const aChoice: Tl3StringIDEx);
//#UC START# *4E0A010A0200_4E01D1E002AE_var*
var
 l_Index : Integer;
//#UC END# *4E0A010A0200_4E01D1E002AE_var*
begin
//#UC START# *4E0A010A0200_4E01D1E002AE_impl*
 l_Index := rData.rChoices.IndexOf(@aChoice);
 Assert(l_Index >= 0);
 rData.rDefaultChoice := -(l_Index + 1);
//#UC END# *4E0A010A0200_4E01D1E002AE_impl*
end;//Tl3MessageID.AddDefaultChoice

{$If not defined(NoVCL)}
procedure Tl3MessageID.SetDlgType(aType: TMsgDlgType);
//#UC START# *4E0A074B000E_4E01D1E002AE_var*
//#UC END# *4E0A074B000E_4E01D1E002AE_var*
begin
//#UC START# *4E0A074B000E_4E01D1E002AE_impl*
 rData.rDlgType := aType;
 Case aType of
  mtWarning,
  mtInformation,
  mtError,
  mtCustom :
   rData.rButtons := [mbOk];
  mtConfirmation :
   rData.rButtons := [mbYes, mbNo];
  else
   rData.rButtons := [mbOk];
 end;//Case aType
//#UC END# *4E0A074B000E_4E01D1E002AE_impl*
end;//Tl3MessageID.SetDlgType
{$IfEnd} //not NoVCL

procedure Tl3MessageID.SetCheckCaption(const aValue: Tl3StringIDEx);
//#UC START# *4E9E81D40059_4E01D1E002AE_var*
//#UC END# *4E9E81D40059_4E01D1E002AE_var*
begin
//#UC START# *4E9E81D40059_4E01D1E002AE_impl*
 rData.rCheckCaption := @aValue;
//#UC END# *4E9E81D40059_4E01D1E002AE_impl*
end;//Tl3MessageID.SetCheckCaption

procedure Tl3MessageID.SetSettingsCaption(const aValue: Tl3StringIDEx);
//#UC START# *4EB14B8A010B_4E01D1E002AE_var*
//#UC END# *4EB14B8A010B_4E01D1E002AE_var*
begin
//#UC START# *4EB14B8A010B_4E01D1E002AE_impl*
 rData.rSettingsCaption := @aValue;
//#UC END# *4EB14B8A010B_4E01D1E002AE_impl*
end;//Tl3MessageID.SetSettingsCaption

procedure Tl3MessageID.SetLongHint(const aValue: Tl3StringIDEx);
//#UC START# *4EB14BAB00E3_4E01D1E002AE_var*
//#UC END# *4EB14BAB00E3_4E01D1E002AE_var*
begin
//#UC START# *4EB14BAB00E3_4E01D1E002AE_impl*
 rData.rLongHint := @aValue;
//#UC END# *4EB14BAB00E3_4E01D1E002AE_impl*
end;//Tl3MessageID.SetLongHint

procedure Tl3MessageID.SetNeedCheck(aValue: Boolean);
//#UC START# *4EB157EE021C_4E01D1E002AE_var*
//#UC END# *4EB157EE021C_4E01D1E002AE_var*
begin
//#UC START# *4EB157EE021C_4E01D1E002AE_impl*
 rData.rNeedCheck := aValue;
//#UC END# *4EB157EE021C_4E01D1E002AE_impl*
end;//Tl3MessageID.SetNeedCheck

procedure Tl3MessageID.Cleanup;
//#UC START# *4F9BCBC101F7_4E01D1E002AE_var*
//#UC END# *4F9BCBC101F7_4E01D1E002AE_var*
begin
//#UC START# *4F9BCBC101F7_4E01D1E002AE_impl*
 FreeAndNil(rData.rChoices);
 Finalize(Self);
//#UC END# *4F9BCBC101F7_4E01D1E002AE_impl*
end;//Tl3MessageID.Cleanup

function Tl3MessageID.pm_GetAsMessage: Tl3Message;
//#UC START# *4E0B01570024_4E01D1E002AEget_var*
//#UC END# *4E0B01570024_4E01D1E002AEget_var*
begin
//#UC START# *4E0B01570024_4E01D1E002AEget_impl*
 Result := Tl3Message_C(Self);
//#UC END# *4E0B01570024_4E01D1E002AEget_impl*
end;//Tl3MessageID.pm_GetAsMessage

{$IfNDef XE4}
procedure Tl3MessageID.Fake;
begin
 Assert(false);
end;
{$EndIf XE4}

constructor Tl3MessageID.Init;
begin
//#UC START# *4E01D1E002AEInit*
 DoInit;
 TPl3MessageIDList.Instance.Add(@Self);
//#UC END# *4E01D1E002AEInit*
end;

function Tl3Message_C(const anID: Tl3MessageID): Tl3Message;
//#UC START# *4E08A68B0019_4E0B04C801EC_var*
//#UC END# *4E08A68B0019_4E0B04C801EC_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4E08A68B0019_4E0B04C801EC_impl*
 Result.rData := anID.rData;
 Result.rName := anID.rKey;
 Result.rMessage := anID.AsCStr;
//#UC END# *4E08A68B0019_4E0B04C801EC_impl*
end;//Tl3MessageC.C


initialization
// Инициализация str_vcmRememberChoice
 str_vcmRememberChoice.Init;
// Инициализация str_vcmNotShowDlg
 str_vcmNotShowDlg.Init;

end.