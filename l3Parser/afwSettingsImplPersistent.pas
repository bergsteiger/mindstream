unit afwSettingsImplPersistent;
 
{$Include afwDefine.inc}

interface

uses
  afwSettingsImpl
  ;

type
 TafwSettingsImplPersistent = class(TafwSettingsImpl)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
   procedure BeforeRelease; override;
 protected
 // protected methods
   procedure Load;
   procedure Save;
   function FileName: AnsiString;
 end;//TafwSettingsImplPersistent

implementation

uses
  SysUtils,
  l3Filer,
  l3Types,
  l3Base,
  l3String,
  l3InterfacedString,
  l3Interfaces,
  afwSettingsImplPrimPrim
  ;

// start class TafwSettingsImplPersistent

procedure TafwSettingsImplPersistent.Load;
//#UC START# *4F6C9DF8028F_4F6C9DBE03CF_var*
var
 l_F : Tl3CustomDOSFiler;

 function LoadString: Il3CString;
 var
  l_W : Tl3WString;
  l_S : Tl3InterfacedString;
 begin//LoadString
  Result := nil;
  l_F.Read(@l_W.SLen, SizeOf(l_W.SLen));
  l_F.Read(@l_W.SCodePage, SizeOf(l_W.SCodePage));
  Assert(l_W.SCodePage <> CP_Unicode);
  if (l_W.SLen > 0) then
  begin
   l_S := Tl3InterfacedString.Create;
   try
    l_S.CodePage := l_W.SCodePage;
    l_S.Len := l_W.SLen;
    l_F.Read(l_S.St, l_W.SLen);
    Result := l_S;
   finally
    FreeAndNil(l_S);
   end;//try..finally
  end;//l_W.SLen > 0
 end;//LoadString

var
 l_KV : TafwKeyValue;
//#UC END# *4F6C9DF8028F_4F6C9DBE03CF_var*
begin
//#UC START# *4F6C9DF8028F_4F6C9DBE03CF_impl*
 if not FileExists(FileName) then
  Exit;
 l_F := Tl3CustomDOSFiler.Make(FileName, l3_fmRead);
 try
  l_F.Open;
  try
   while not l_F.EOF do
   begin
    l_KV.rKey := LoadString;
    l_KV.rValue := LoadString;
    Add(l_KV);
    Finalize(l_KV);
   end;//while not l_F.EOF
  finally
   l_F.Close;
  end;//try..finally
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *4F6C9DF8028F_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.Load

procedure TafwSettingsImplPersistent.Save;
//#UC START# *4F6C9E0E011D_4F6C9DBE03CF_var*
var
 l_F : Tl3CustomDOSFiler;

 procedure SaveString(const aString : Il3CString);
 var
  l_W : Tl3WString;
 begin//SaveString
  l_W := l3PCharLen(aString);
  Assert(l_W.SCodePage <> CP_Unicode);
  l_F.Write(@l_W.SLen, SizeOf(l_W.SLen));
  l_F.Write(@l_W.SCodePage, SizeOf(l_W.SCodePage));
  if (l_W.SLen > 0) then
   l_F.Write(l_W.S, l_W.SLen);
 end;//SaveString

 procedure SaveKey(const aKey : Il3CString);
 begin//SaveKey
  SaveString(aKey);
 end;//SaveKey

 procedure SaveValue(const aValue : Il3CString);
 begin//SaveKey
  SaveString(aValue);
 end;//SaveKey

var
 l_Index : Integer;
//#UC END# *4F6C9E0E011D_4F6C9DBE03CF_var*
begin
//#UC START# *4F6C9E0E011D_4F6C9DBE03CF_impl*
 if not Empty then
 begin
  l_F := Tl3CustomDOSFiler.Make(FileName, l3_fmWrite);
  try
   l_F.Open;
   try
    for l_Index := 0 to Pred(Count) do
    begin
     with ItemSlot(l_Index)^ do
     begin
      SaveKey(rKey);
      SaveValue(rValue);
     end;//with ItemSlot(l_Index)^
    end;//for l_Index
   finally
    l_F.Close;
   end;//try..finally
  finally
   FreeAndNil(l_F);
  end;//try..finally
 end;//not Empty
//#UC END# *4F6C9E0E011D_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.Save

function TafwSettingsImplPersistent.FileName: AnsiString;
//#UC START# *4F6C9E1C0308_4F6C9DBE03CF_var*
//#UC END# *4F6C9E1C0308_4F6C9DBE03CF_var*
begin
//#UC START# *4F6C9E1C0308_4F6C9DBE03CF_impl*
 Result := ParamStr(0) + '.settings';
//#UC END# *4F6C9E1C0308_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.FileName

procedure TafwSettingsImplPersistent.Cleanup;
//#UC START# *479731C50290_4F6C9DBE03CF_var*
//#UC END# *479731C50290_4F6C9DBE03CF_var*
begin
//#UC START# *479731C50290_4F6C9DBE03CF_impl*
 inherited;
//#UC END# *479731C50290_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.Cleanup

procedure TafwSettingsImplPersistent.InitFields;
//#UC START# *47A042E100E2_4F6C9DBE03CF_var*
//#UC END# *47A042E100E2_4F6C9DBE03CF_var*
begin
//#UC START# *47A042E100E2_4F6C9DBE03CF_impl*
 inherited;
 Load;
//#UC END# *47A042E100E2_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.InitFields

procedure TafwSettingsImplPersistent.BeforeRelease;
//#UC START# *49BFC98902FF_4F6C9DBE03CF_var*
//#UC END# *49BFC98902FF_4F6C9DBE03CF_var*
begin
//#UC START# *49BFC98902FF_4F6C9DBE03CF_impl*
 inherited;
 Save;
//#UC END# *49BFC98902FF_4F6C9DBE03CF_impl*
end;//TafwSettingsImplPersistent.BeforeRelease

end.