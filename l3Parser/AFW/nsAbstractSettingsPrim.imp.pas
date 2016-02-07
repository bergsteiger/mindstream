{$IfNDef nsAbstractSettingsPrim_imp}

 
{$Define nsAbstractSettingsPrim_imp}
 _nsAbstractSettingsPrim_ = {abstract mixin} class(_nsAbstractSettingsPrim_Parent_)
 private
 // private fields
   f_Settings : _SettingsClass_;
    {* Поле для свойства Settings}
 public
 // realized methods
   function LoadInteger(const aSettingId: TafwSettingId;
    aDefault: Integer = 0;
    aRestoreDefault: Boolean = False): Integer;
   function LoadParam(const aSettingId: TafwSettingId;
    aType: byte;
    out aValue;
    const aDefault;
    aRestoreDefault: Boolean): Boolean;
   function LoadString(const aSettingId: TafwSettingId;
    const aDefault: AnsiString = '';
    aRestoreDefault: Boolean = False): IafwCString;
   procedure SaveBoolean(const aSettingId: TafwSettingId;
    aValue: Boolean;
    aDefault: Boolean = False;
    aSetAsDefault: Boolean = False);
   procedure SaveInteger(const aSettingId: TafwSettingId;
    aValue: Integer;
    aDefault: Integer = 0;
    aSetAsDefault: Boolean = False);
     {* aValue - текущее значение, aDefault - значение по умолчанию, устанавливается для восстанвления настроек. }
   procedure SaveParam(const aSettingId: TafwSettingId;
    aType: byte;
    const aValue;
    const aDefault;
    aSetAsDefault: Boolean);
   procedure SaveString(const aSettingId: TafwSettingId;
    const aValue: IafwCString;
    const aDefault: AnsiString = '';
    aSetAsDefault: Boolean = False);
   function LoadBoolean(const aSettingId: TafwSettingId;
    aDefault: Boolean = False;
    aRestoreDefault: Boolean = False): Boolean;
   function LoadStrings(const aSettingId: TafwSettingId;
    aRestoreDefault: Boolean = False): IafwStrings;
   procedure SaveStrings(const aSettingId: TafwSettingId;
    const aValue: IafwStrings;
    aSetAsDefault: Boolean = False);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected methods
   procedure NotifySettingChanged(const aSettingID: TafwSettingId); virtual;
   function TryToRestore(const aSettingID: TafwSettingId): Boolean; virtual;
   procedure DoSaveParam(const aTarget: _SettingsClass_;
    const aSettingId: TafwSettingId;
    aType: byte;
    const aValue;
    const aDefault;
    aSetAsDefault: Boolean); virtual;
   procedure DoSetAsDefault(const aTarget: _SettingsClass_;
    const aSettingId: TafwSettingId); virtual;
 public
 // public methods
   constructor Create(const aSettings: _SettingsClass_); reintroduce;
 public
 // public properties
   property Settings: _SettingsClass_
     read f_Settings
     write f_Settings;
 end;//_nsAbstractSettingsPrim_

{$Else nsAbstractSettingsPrim_imp}

// start class _nsAbstractSettingsPrim_

constructor _nsAbstractSettingsPrim_.Create(const aSettings: _SettingsClass_);
//#UC START# *4AD5913102A1_4AD58B6C0289_var*
//#UC END# *4AD5913102A1_4AD58B6C0289_var*
begin
//#UC START# *4AD5913102A1_4AD58B6C0289_impl*
 inherited Create;
 f_Settings := aSettings;
//#UC END# *4AD5913102A1_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.Create

procedure _nsAbstractSettingsPrim_.NotifySettingChanged(const aSettingID: TafwSettingId);
//#UC START# *4AD5979E01BB_4AD58B6C0289_var*
//#UC END# *4AD5979E01BB_4AD58B6C0289_var*
begin
//#UC START# *4AD5979E01BB_4AD58B6C0289_impl*
// DoNothing
//#UC END# *4AD5979E01BB_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.NotifySettingChanged

function _nsAbstractSettingsPrim_.TryToRestore(const aSettingID: TafwSettingId): Boolean;
//#UC START# *4AD597CE0390_4AD58B6C0289_var*
//#UC END# *4AD597CE0390_4AD58B6C0289_var*
begin
//#UC START# *4AD597CE0390_4AD58B6C0289_impl*
 Result := False;
//#UC END# *4AD597CE0390_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.TryToRestore

procedure _nsAbstractSettingsPrim_.DoSaveParam(const aTarget: _SettingsClass_;
  const aSettingId: TafwSettingId;
  aType: byte;
  const aValue;
  const aDefault;
  aSetAsDefault: Boolean);
//#UC START# *4AD59C2C027D_4AD58B6C0289_var*

 procedure PutDouble(const aValue : Double);
 begin//PutDouble
  aTarget.SetString(SettingIDtoKeyType(aSettingId), StringToPChar(FloatToStr(aValue)));
 end;//PutDouble

 procedure lpSaveParam(const aValue);
 begin//lpSaveParam
  with aTarget do
   case aType of
    vtInteger:
     SetLong(SettingIDtoKeyType(aSettingId), LongInt(aValue));
    vtBoolean:
     SetBool(SettingIDtoKeyType(aSettingId), _BooleanType_(aValue));
    vtAnsiString:
     SetString(SettingIDtoKeyType(aSettingId), Il3CStringToAString(Il3CString(aValue)).S);
    vtString:
     SetString(SettingIDtoKeyType(aSettingId), Il3CStringToAString(Il3CString(aValue)).S);
    vtExtended:
     PutDouble(Double(aValue));
    else
     Assert(False);
   end;//case aType
 end;//lpSaveParam

var
 l_S : Il3CString;
//#UC END# *4AD59C2C027D_4AD58B6C0289_var*
begin
//#UC START# *4AD59C2C027D_4AD58B6C0289_impl*
 // По умолчанию
 if (aType = vtString) then
 begin
  l_S := l3CStr(String(aDefault));
  lpSaveParam(l_S);
 end//aType = vtString
 else
 if (aType = vtAnsiString) then
 begin
  l_S := l3CStr(ANSIString(aDefault));
  lpSaveParam(l_S);
 end//aType = vtString
 else
  lpSaveParam(aDefault);
 // Текущее
 lpSaveParam(aValue);
 if aSetAsDefault then
  DoSetAsDefault(aTarget, aSettingId);
//#UC END# *4AD59C2C027D_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.DoSaveParam

procedure _nsAbstractSettingsPrim_.DoSetAsDefault(const aTarget: _SettingsClass_;
  const aSettingId: TafwSettingId);
//#UC START# *4AD5AA940324_4AD58B6C0289_var*
//#UC END# *4AD5AA940324_4AD58B6C0289_var*
begin
//#UC START# *4AD5AA940324_4AD58B6C0289_impl*
// Do nothing
//#UC END# *4AD5AA940324_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.DoSetAsDefault

function _nsAbstractSettingsPrim_.LoadInteger(const aSettingId: TafwSettingId;
  aDefault: Integer = 0;
  aRestoreDefault: Boolean = False): Integer;
//#UC START# *4AD59EBE0044_4AD58B6C0289_var*
//#UC END# *4AD59EBE0044_4AD58B6C0289_var*
begin
//#UC START# *4AD59EBE0044_4AD58B6C0289_impl*
 LoadParam(aSettingId, vtInteger, Result, aDefault, aRestoreDefault);
//#UC END# *4AD59EBE0044_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.LoadInteger

function _nsAbstractSettingsPrim_.LoadParam(const aSettingId: TafwSettingId;
  aType: byte;
  out aValue;
  const aDefault;
  aRestoreDefault: Boolean): Boolean;
//#UC START# *4AD59EC20349_4AD58B6C0289_var*
var
 l_Int      : Integer;
 l_ByteBool : _BooleanType_;
 l_Double   : Double;
 l_String   : Il3CString;
 l_Changed  : Boolean;

 function lpGetString(out aValue : Il3CString) : Boolean;
 {* - читает строковое значение. }
 var
  l_String : _IStringType_;
 begin//lpGetString
  Result := f_Settings.GetString(SettingIDtoKeyType(aSettingId), l_String);
  if Result then
  try
   aValue := IStringTypeToIl3CString(l_String);
  finally
   l_String := nil;
  end//try..finally
  else
   aValue := l3CStr('');
 end;//lpGetString

 function lp_GetDouble(out aValue : Double) : Boolean;
 {* - читает значение с плавающей запятой. }
 var
  lValue : Il3CString;
 begin//GetDouble
  Result := lpGetString(lValue);
  if Result then
   aValue := StrToFloat(l3Str(lValue));
 end;//GetDouble

 procedure lp_Load;
 {* - читает значение из настроек. }
 begin//lp_Load
  case aType of
   vtString,
   vtAnsiString:
    Result := lpGetString(l_String);
   vtExtended:
    Result := lp_GetDouble(l_Double);
   vtInteger:
    Result := f_Settings.GetLong(SettingIDtoKeyType(aSettingId), l_Int);
   vtBoolean:
    Result := f_Settings.GetBool(SettingIDtoKeyType(aSettingId), l_ByteBool);
   else
    Assert(False);
  end;//case aType
 end;//lp_Load
 
//#UC END# *4AD59EC20349_4AD58B6C0289_var*
begin
//#UC START# *4AD59EC20349_4AD58B6C0289_impl*
 Result := False;
 // Значение по умолчанию
 case aType of
  vtString:
   Il3CString(aValue) := l3CStr(String(aDefault));
  vtInteger:
   Cardinal(aValue) := Cardinal(aDefault);
  vtBoolean:
   Boolean(aValue) := Boolean(aDefault);
  vtExtended:
   Double(aValue) := Double(aDefault);
  vtAnsiString:
   Il3CString(aValue) := l3CStr(String(aDefault));
  else
   Assert(False);
 end;
 if (f_Settings <> nil) then
 begin
  // восстановим по необходимости
  if aRestoreDefault then
   l_Changed := TryToRestore(aSettingId)
  else
   l_Changed := False;
  // загрузим
  lp_Load;
  // установим если успешно
  if Result then
  begin
   case aType of
    vtString:
     Il3CString(aValue) := l_String;
    vtInteger:
     Cardinal(aValue) := Cardinal(l_Int);
    vtBoolean:
     Boolean(aValue) := Boolean(l_ByteBool);
    vtExtended:
     Double(aValue) := l_Double;
    vtAnsiString:
     Il3CString(aValue) := l_String;
    else
     Assert(False);
   end;//case aType
  end;//Result
  if l_Changed then
   NotifySettingChanged(aSettingId);
 end;//f_Settings <> nil
//#UC END# *4AD59EC20349_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.LoadParam

function _nsAbstractSettingsPrim_.LoadString(const aSettingId: TafwSettingId;
  const aDefault: AnsiString = '';
  aRestoreDefault: Boolean = False): IafwCString;
//#UC START# *4AD59EC6017E_4AD58B6C0289_var*
//#UC END# *4AD59EC6017E_4AD58B6C0289_var*
begin
//#UC START# *4AD59EC6017E_4AD58B6C0289_impl*
 LoadParam(aSettingId, vtString, Result, aDefault, aRestoreDefault);
//#UC END# *4AD59EC6017E_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.LoadString

procedure _nsAbstractSettingsPrim_.SaveBoolean(const aSettingId: TafwSettingId;
  aValue: Boolean;
  aDefault: Boolean = False;
  aSetAsDefault: Boolean = False);
//#UC START# *4AD59ECB0232_4AD58B6C0289_var*
//#UC END# *4AD59ECB0232_4AD58B6C0289_var*
begin
//#UC START# *4AD59ECB0232_4AD58B6C0289_impl*
 SaveParam(aSettingId, vtBoolean, aValue, aDefault, aSetAsDefault);
//#UC END# *4AD59ECB0232_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.SaveBoolean

procedure _nsAbstractSettingsPrim_.SaveInteger(const aSettingId: TafwSettingId;
  aValue: Integer;
  aDefault: Integer = 0;
  aSetAsDefault: Boolean = False);
//#UC START# *4AD59ED10331_4AD58B6C0289_var*
//#UC END# *4AD59ED10331_4AD58B6C0289_var*
begin
//#UC START# *4AD59ED10331_4AD58B6C0289_impl*
 SaveParam(aSettingId, vtInteger, aValue, aDefault, aSetAsDefault);
//#UC END# *4AD59ED10331_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.SaveInteger

procedure _nsAbstractSettingsPrim_.SaveParam(const aSettingId: TafwSettingId;
  aType: byte;
  const aValue;
  const aDefault;
  aSetAsDefault: Boolean);
//#UC START# *4AD59ED60126_4AD58B6C0289_var*
//#UC END# *4AD59ED60126_4AD58B6C0289_var*
begin
//#UC START# *4AD59ED60126_4AD58B6C0289_impl*
 Assert(aSettingId <> '');
 if (f_Settings <> nil) then
  DoSaveParam(f_Settings, aSettingId, aType, aValue, aDefault, aSetAsDefault);
 NotifySettingChanged(aSettingId);
//#UC END# *4AD59ED60126_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.SaveParam

procedure _nsAbstractSettingsPrim_.SaveString(const aSettingId: TafwSettingId;
  const aValue: IafwCString;
  const aDefault: AnsiString = '';
  aSetAsDefault: Boolean = False);
//#UC START# *4AD59EDD0244_4AD58B6C0289_var*
//#UC END# *4AD59EDD0244_4AD58B6C0289_var*
begin
//#UC START# *4AD59EDD0244_4AD58B6C0289_impl*
 SaveParam(aSettingId, vtString, aValue, aDefault, aSetAsDefault);
//#UC END# *4AD59EDD0244_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.SaveString

function _nsAbstractSettingsPrim_.LoadBoolean(const aSettingId: TafwSettingId;
  aDefault: Boolean = False;
  aRestoreDefault: Boolean = False): Boolean;
//#UC START# *4AD5A017034A_4AD58B6C0289_var*
//#UC END# *4AD5A017034A_4AD58B6C0289_var*
begin
//#UC START# *4AD5A017034A_4AD58B6C0289_impl*
 LoadParam(aSettingId, vtBoolean, Result, aDefault, aRestoreDefault);
//#UC END# *4AD5A017034A_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.LoadBoolean

function _nsAbstractSettingsPrim_.LoadStrings(const aSettingId: TafwSettingId;
  aRestoreDefault: Boolean = False): IafwStrings;
//#UC START# *4AD83CCF036F_4AD58B6C0289_var*
var
 l_Delim: Il3CString;
 l_Setting: Il3CString;
 l_Word: Il3CString;
 l_SubWord: Il3CString;
//#UC END# *4AD83CCF036F_4AD58B6C0289_var*
begin
//#UC START# *4AD83CCF036F_4AD58B6C0289_impl*
 Result := Tl3Strings.Make;
 l_Delim := l3CStr(#13#10);
 l_Setting := LoadString(aSettingID, '', aRestoreDefault);
 if not l3IsNil(l_Setting) then
  repeat
   l3Split(l_Setting, l_Delim, l_Word, l_Setting);
   repeat
    l3Split(l_Word, [#13, #10], l_SubWord, l_Word);
    Result.Add(l_SubWord);
   until l3IsNil(l_Word);
  until l3IsNil(l_Setting);
//#UC END# *4AD83CCF036F_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.LoadStrings

procedure _nsAbstractSettingsPrim_.SaveStrings(const aSettingId: TafwSettingId;
  const aValue: IafwStrings;
  aSetAsDefault: Boolean = False);
//#UC START# *4AD83CD703C0_4AD58B6C0289_var*
var
 l_Value: IafwCString;
 l_Idx: Integer;
//#UC END# *4AD83CD703C0_4AD58B6C0289_var*
begin
//#UC START# *4AD83CD703C0_4AD58B6C0289_impl*
 l_Value := nil;
 for l_Idx := 0 to aValue.Count - 1 do
 begin
  if l_Idx > 0 then
   l_Value := l3Cat(l_Value, #13#10);
  l_Value := l3Cat([l_Value, aValue.ItemC[l_Idx]]);
 end;//for l_Idx
 SaveString(aSettingID, l_Value, '', aSetAsDefault);
//#UC END# *4AD83CD703C0_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.SaveStrings

procedure _nsAbstractSettingsPrim_.Cleanup;
//#UC START# *479731C50290_4AD58B6C0289_var*
//#UC END# *479731C50290_4AD58B6C0289_var*
begin
//#UC START# *479731C50290_4AD58B6C0289_impl*
 f_Settings := nil;
 inherited;
//#UC END# *479731C50290_4AD58B6C0289_impl*
end;//_nsAbstractSettingsPrim_.Cleanup

{$EndIf nsAbstractSettingsPrim_imp}
