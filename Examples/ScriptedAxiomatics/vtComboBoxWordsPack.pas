unit vtComboBoxWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "vtComboBoxWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtComboBoxWords::vtComboBoxWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  StdCtrls,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  vtComboTree,
  tfwAxiomaticsResNameGetter
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAxiomaticsResNameGetters,
  vtComboBoxQS,
  l3TreeInterfaces,
  l3Filer,
  l3Types,
  l3Interfaces,
  SysUtils,
  TypInfo,
  tfwTypeRegistrator
  ;

type
//#UC START# *D1FD416FEE23ci*
//#UC END# *D1FD416FEE23ci*
 TvtComboBoxWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *D1FD416FEE23publ*
//#UC END# *D1FD416FEE23publ*
 end;//TvtComboBoxWordsPackResNameGetter

// start class TvtComboBoxWordsPackResNameGetter

class function TvtComboBoxWordsPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'vtComboBoxWordsPack';
end;//TvtComboBoxWordsPackResNameGetter.ResName

 {$R vtComboBoxWordsPack.res vtComboBoxWordsPack.rc}

type
 TCustomComboBoxFriend = {abstract} class(TCustomComboBox)
  {* Друг для TCustomComboBox }
 end;//TCustomComboBoxFriend

 TkwPopComboBoxDropDown = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:DropDown
*Пример:*
[code]
 aValue aComboBox pop:ComboBox:DropDown
[code]  }
 private
 // private methods
   procedure DropDown(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    aValue: Boolean);
     {* Реализация слова скрипта pop:ComboBox:DropDown }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxDropDown

// start class TkwPopComboBoxDropDown

procedure TkwPopComboBoxDropDown.DropDown(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox;
  aValue: Boolean);
//#UC START# *D4660B294082_B7676CD1AAB3_var*
//#UC END# *D4660B294082_B7676CD1AAB3_var*
begin
//#UC START# *D4660B294082_B7676CD1AAB3_impl*
 aCombobox.DroppedDown := aValue;
//#UC END# *D4660B294082_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.DropDown

procedure TkwPopComboBoxDropDown.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
 l_aValue : Boolean;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopBool);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DropDown(aCtx, l_aComboBox, l_aValue);
end;//TkwPopComboBoxDropDown.DoDoIt

class function TkwPopComboBoxDropDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:DropDown';
end;//TkwPopComboBoxDropDown.GetWordNameForRegister

function TkwPopComboBoxDropDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboBoxDropDown.GetResultTypeInfo

type
 TkwPopComboBoxGetItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:GetItemIndex
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aComboBox pop:ComboBox:GetItemIndex >>> l_Integer
[code]  }
 private
 // private methods
   function GetItemIndex(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox): Integer;
     {* Реализация слова скрипта pop:ComboBox:GetItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxGetItemIndex

// start class TkwPopComboBoxGetItemIndex

function TkwPopComboBoxGetItemIndex.GetItemIndex(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox): Integer;
//#UC START# *0DE7BD329B92_731890DC5F90_var*
//#UC END# *0DE7BD329B92_731890DC5F90_var*
begin
//#UC START# *0DE7BD329B92_731890DC5F90_impl*
 Result := aCombobox.ItemIndex;
//#UC END# *0DE7BD329B92_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.GetItemIndex

procedure TkwPopComboBoxGetItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetItemIndex(aCtx, l_aComboBox)));
end;//TkwPopComboBoxGetItemIndex.DoDoIt

class function TkwPopComboBoxGetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:GetItemIndex';
end;//TkwPopComboBoxGetItemIndex.GetWordNameForRegister

function TkwPopComboBoxGetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopComboBoxGetItemIndex.GetResultTypeInfo

type
 TkwPopComboBoxIndexOf = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:IndexOf
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aString aComboBox pop:ComboBox:IndexOf >>> l_Integer
[code]  }
 private
 // private methods
   function IndexOf(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aString: AnsiString): Integer;
     {* Реализация слова скрипта pop:ComboBox:IndexOf }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxIndexOf

// start class TkwPopComboBoxIndexOf

function TkwPopComboBoxIndexOf.IndexOf(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox;
  const aString: AnsiString): Integer;
//#UC START# *56A99D643C95_697C86093610_var*
//#UC END# *56A99D643C95_697C86093610_var*
begin
//#UC START# *56A99D643C95_697C86093610_impl*
 Result := aCombobox.Items.IndexOf(aString);
//#UC END# *56A99D643C95_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.IndexOf

procedure TkwPopComboBoxIndexOf.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
 l_aString : AnsiString;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((IndexOf(aCtx, l_aComboBox, l_aString)));
end;//TkwPopComboBoxIndexOf.DoDoIt

class function TkwPopComboBoxIndexOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:IndexOf';
end;//TkwPopComboBoxIndexOf.GetWordNameForRegister

function TkwPopComboBoxIndexOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopComboBoxIndexOf.GetResultTypeInfo

type
 TkwPopComboBoxSelectItem = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:SelectItem
*Пример:*
[code]
 aString aComboBox pop:ComboBox:SelectItem
[code]  }
 private
 // private methods
   procedure SelectItem(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aString: AnsiString);
     {* Реализация слова скрипта pop:ComboBox:SelectItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxSelectItem

// start class TkwPopComboBoxSelectItem

procedure TkwPopComboBoxSelectItem.SelectItem(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox;
  const aString: AnsiString);
//#UC START# *BC0BF0E96B69_E94AE4FC3D32_var*
//#UC END# *BC0BF0E96B69_E94AE4FC3D32_var*
begin
//#UC START# *BC0BF0E96B69_E94AE4FC3D32_impl*
 TCustomComboBoxFriend(aCombobox).SelectItem(aString);
//#UC END# *BC0BF0E96B69_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.SelectItem

procedure TkwPopComboBoxSelectItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
 l_aString : AnsiString;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SelectItem(aCtx, l_aComboBox, l_aString);
end;//TkwPopComboBoxSelectItem.DoDoIt

class function TkwPopComboBoxSelectItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SelectItem';
end;//TkwPopComboBoxSelectItem.GetWordNameForRegister

function TkwPopComboBoxSelectItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboBoxSelectItem.GetResultTypeInfo

type
 TkwPopComboBoxSetItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:SetItemIndex
*Пример:*
[code]
 anIndex aComboBox pop:ComboBox:SetItemIndex
[code]  }
 private
 // private methods
   procedure SetItemIndex(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    anIndex: Integer);
     {* Реализация слова скрипта pop:ComboBox:SetItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxSetItemIndex

// start class TkwPopComboBoxSetItemIndex

procedure TkwPopComboBoxSetItemIndex.SetItemIndex(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox;
  anIndex: Integer);
//#UC START# *589DC0B1C0D3_DF10F6F55A61_var*
//#UC END# *589DC0B1C0D3_DF10F6F55A61_var*
begin
//#UC START# *589DC0B1C0D3_DF10F6F55A61_impl*
 aCombobox.ItemIndex := anIndex;
 TCustomComboBoxFriend(aCombobox).Select;
//#UC END# *589DC0B1C0D3_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.SetItemIndex

procedure TkwPopComboBoxSetItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
 l_anIndex : Integer;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetItemIndex(aCtx, l_aComboBox, l_anIndex);
end;//TkwPopComboBoxSetItemIndex.DoDoIt

class function TkwPopComboBoxSetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SetItemIndex';
end;//TkwPopComboBoxSetItemIndex.GetWordNameForRegister

function TkwPopComboBoxSetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboBoxSetItemIndex.GetResultTypeInfo

type
 TkwPopComboBoxSaveItems = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboBox:SaveItems
[panel]*Формат:* имя_файла  контрол pop:ComboBox:SaveItems 
*Описание:* Сохраняет все пункты выпадающего списка (задается параметром контрол) в файл (задается параметром имя_файла)  и сравнивает с эталоном.
*Пример:*
[code]
'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
[code] 
*Результат:* Сохраняет содержимое комбобокса 'StyleComboBox' в  файл  'MyList.cmbx' и сравнивает с эталоном.[panel]
*Пример:*
[code]
 aFileName aComboBox pop:ComboBox:SaveItems
[code]  }
 private
 // private methods
   procedure SaveItems(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aFileName: AnsiString);
     {* Реализация слова скрипта pop:ComboBox:SaveItems }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboBoxSaveItems

// start class TkwPopComboBoxSaveItems

procedure TkwPopComboBoxSaveItems.SaveItems(const aCtx: TtfwContext;
  aComboBox: TCustomComboBox;
  const aFileName: AnsiString);
//#UC START# *414096239FD4_F4F78563FAA5_var*
var
 l_S: AnsiString;
 l_Filer : Tl3CustomDosFiler;
 I: Integer;
 l_Count: Integer;
//#UC END# *414096239FD4_F4F78563FAA5_var*
begin
//#UC START# *414096239FD4_F4F78563FAA5_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aFileName);
 l_S := ChangeFileExt(l_S, '.cmbx');
 l_Filer := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_Filer.Open;
  try
   l_Count := aCombobox.Items.Count;
   for I := 0 to l_Count - 1 do
    l_Filer.WriteLn(aCombobox.Items[I]);
  finally
   l_Filer.Close;
  end;
 finally
  FreeAndNil(l_Filer);
 end;//try..finally
//#UC END# *414096239FD4_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.SaveItems

procedure TkwPopComboBoxSaveItems.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TCustomComboBox;
 l_aFileName : AnsiString;
begin
 try
  l_aComboBox := TCustomComboBox(aCtx.rEngine.PopObjAs(TCustomComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TCustomComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SaveItems(aCtx, l_aComboBox, l_aFileName);
end;//TkwPopComboBoxSaveItems.DoDoIt

class function TkwPopComboBoxSaveItems.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboBox:SaveItems';
end;//TkwPopComboBoxSaveItems.GetWordNameForRegister

function TkwPopComboBoxSaveItems.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboBoxSaveItems.GetResultTypeInfo

type
 TkwPopComboTreeDropDown = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:DropDown
*Пример:*
[code]
 aValue aComboTree pop:ComboTree:DropDown
[code]  }
 private
 // private methods
   procedure DropDown(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    aValue: Boolean);
     {* Реализация слова скрипта pop:ComboTree:DropDown }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeDropDown

// start class TkwPopComboTreeDropDown

procedure TkwPopComboTreeDropDown.DropDown(const aCtx: TtfwContext;
  aComboTree: TvtComboTree;
  aValue: Boolean);
//#UC START# *BB9DD9C656EE_CBB40EABEDB6_var*
//#UC END# *BB9DD9C656EE_CBB40EABEDB6_var*
begin
//#UC START# *BB9DD9C656EE_CBB40EABEDB6_impl*
 aComboTree.Dropped := aValue;
//#UC END# *BB9DD9C656EE_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.DropDown

procedure TkwPopComboTreeDropDown.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
 l_aValue : Boolean;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopBool);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DropDown(aCtx, l_aComboTree, l_aValue);
end;//TkwPopComboTreeDropDown.DoDoIt

class function TkwPopComboTreeDropDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:DropDown';
end;//TkwPopComboTreeDropDown.GetWordNameForRegister

function TkwPopComboTreeDropDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboTreeDropDown.GetResultTypeInfo

type
 TkwPopComboTreeGetItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:GetItemIndex
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aComboTree pop:ComboTree:GetItemIndex >>> l_Integer
[code]  }
 private
 // private methods
   function GetItemIndex(const aCtx: TtfwContext;
    aComboTree: TvtComboTree): Integer;
     {* Реализация слова скрипта pop:ComboTree:GetItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeGetItemIndex

// start class TkwPopComboTreeGetItemIndex

function TkwPopComboTreeGetItemIndex.GetItemIndex(const aCtx: TtfwContext;
  aComboTree: TvtComboTree): Integer;
//#UC START# *1C4FCF6402FE_FDB2008A1DAA_var*
//#UC END# *1C4FCF6402FE_FDB2008A1DAA_var*
begin
//#UC START# *1C4FCF6402FE_FDB2008A1DAA_impl*
 if Assigned(aComboTree.ChoosenValue) then
  Result := aComboTree.FindIndexOf(aComboTree.ChoosenValue)
 else
  Result := aComboTree.ItemIndex;
//#UC END# *1C4FCF6402FE_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.GetItemIndex

procedure TkwPopComboTreeGetItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((GetItemIndex(aCtx, l_aComboTree)));
end;//TkwPopComboTreeGetItemIndex.DoDoIt

class function TkwPopComboTreeGetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:GetItemIndex';
end;//TkwPopComboTreeGetItemIndex.GetWordNameForRegister

function TkwPopComboTreeGetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopComboTreeGetItemIndex.GetResultTypeInfo

type
 TkwPopComboTreeIndexOf = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:IndexOf
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aString aComboTree pop:ComboTree:IndexOf >>> l_Integer
[code]  }
 private
 // private methods
   function IndexOf(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aString: AnsiString): Integer;
     {* Реализация слова скрипта pop:ComboTree:IndexOf }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeIndexOf

// start class TkwPopComboTreeIndexOf

function TkwPopComboTreeIndexOf.IndexOf(const aCtx: TtfwContext;
  aComboTree: TvtComboTree;
  const aString: AnsiString): Integer;
//#UC START# *6E676C6B7B53_C0C842FB1A8C_var*
//#UC END# *6E676C6B7B53_C0C842FB1A8C_var*
begin
//#UC START# *6E676C6B7B53_C0C842FB1A8C_impl*
 Result := aComboTree.Items.IndexOf(aString);
//#UC END# *6E676C6B7B53_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.IndexOf

procedure TkwPopComboTreeIndexOf.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
 l_aString : AnsiString;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((IndexOf(aCtx, l_aComboTree, l_aString)));
end;//TkwPopComboTreeIndexOf.DoDoIt

class function TkwPopComboTreeIndexOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:IndexOf';
end;//TkwPopComboTreeIndexOf.GetWordNameForRegister

function TkwPopComboTreeIndexOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopComboTreeIndexOf.GetResultTypeInfo

type
 TkwPopComboTreeSelectItem = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:SelectItem
*Пример:*
[code]
 aString aComboTree pop:ComboTree:SelectItem
[code]  }
 private
 // private methods
   procedure SelectItem(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aString: AnsiString);
     {* Реализация слова скрипта pop:ComboTree:SelectItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeSelectItem

// start class TkwPopComboTreeSelectItem

procedure TkwPopComboTreeSelectItem.SelectItem(const aCtx: TtfwContext;
  aComboTree: TvtComboTree;
  const aString: AnsiString);
//#UC START# *8E1C1B564723_B5A21C7BEE37_var*
//#UC END# *8E1C1B564723_B5A21C7BEE37_var*
begin
//#UC START# *8E1C1B564723_B5A21C7BEE37_impl*
 aComboTree.ItemIndex := aComboTree.Items.IndexOf(aString);
//#UC END# *8E1C1B564723_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.SelectItem

procedure TkwPopComboTreeSelectItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
 l_aString : AnsiString;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SelectItem(aCtx, l_aComboTree, l_aString);
end;//TkwPopComboTreeSelectItem.DoDoIt

class function TkwPopComboTreeSelectItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:SelectItem';
end;//TkwPopComboTreeSelectItem.GetWordNameForRegister

function TkwPopComboTreeSelectItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboTreeSelectItem.GetResultTypeInfo

type
 TkwPopComboTreeSetItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:SetItemIndex
*Пример:*
[code]
 anIndex aComboTree pop:ComboTree:SetItemIndex
[code]  }
 private
 // private methods
   procedure SetItemIndex(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    anIndex: Integer);
     {* Реализация слова скрипта pop:ComboTree:SetItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeSetItemIndex

// start class TkwPopComboTreeSetItemIndex

procedure TkwPopComboTreeSetItemIndex.SetItemIndex(const aCtx: TtfwContext;
  aComboTree: TvtComboTree;
  anIndex: Integer);
//#UC START# *6A72CBA7686D_8C448529271A_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *6A72CBA7686D_8C448529271A_var*
begin
//#UC START# *6A72CBA7686D_8C448529271A_impl*
 if (aComboTree is TvtComboBoxQS) then //561950536
  aComboTree.ItemIndex := anIndex
 else
 begin
  l_Node := aComboTree.Tree.GetNode(anIndex);
  aComboTree.Tree.GotoOnNode(l_Node);
  aComboTree.ShowNode(l_Node, True);
 end;//aComboTree is TvtComboBoxQS
//#UC END# *6A72CBA7686D_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.SetItemIndex

procedure TkwPopComboTreeSetItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
 l_anIndex : Integer;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetItemIndex(aCtx, l_aComboTree, l_anIndex);
end;//TkwPopComboTreeSetItemIndex.DoDoIt

class function TkwPopComboTreeSetItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:SetItemIndex';
end;//TkwPopComboTreeSetItemIndex.GetWordNameForRegister

function TkwPopComboTreeSetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboTreeSetItemIndex.GetResultTypeInfo

type
 TkwPopComboTreeSaveItems = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:SaveItems
[panel]*Формат:* имя_файла  контрол pop:ComboBox:SaveItems 
*Описание:* Сохраняет все пункты выпадающего списка (задается параметром контрол) в файл (задается параметром имя_файла)  и сравнивает с эталоном.
*Пример:*
[code]
'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
[code] 
*Результат:* Сохраняет содержимое комбобокса 'StyleComboBox' в  файл  'MyList.cmbx' и сравнивает с эталоном.[panel]
*Пример:*
[code]
 aFileName aComboTree pop:ComboTree:SaveItems
[code]  }
 private
 // private methods
   procedure SaveItems(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aFileName: AnsiString);
     {* Реализация слова скрипта pop:ComboTree:SaveItems }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeSaveItems

// start class TkwPopComboTreeSaveItems

procedure TkwPopComboTreeSaveItems.SaveItems(const aCtx: TtfwContext;
  aComboTree: TvtComboTree;
  const aFileName: AnsiString);
//#UC START# *1F4D33D465E4_957FA5E0E3AB_var*
var
 l_S: AnsiString;
 l_Filer : Tl3CustomDosFiler;
//#UC END# *1F4D33D465E4_957FA5E0E3AB_var*
begin
//#UC START# *1F4D33D465E4_957FA5E0E3AB_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aFileName);
 l_S := ChangeFileExt(l_S, '.cmbx');
 l_Filer := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_Filer.Open;
  try
   l_Filer.WriteLn((aComboTree.Items as Il3Strings).Items.Text);
  finally
   l_Filer.Close;
  end;
 finally
  FreeAndNil(l_Filer);
 end;//try..finally
//#UC END# *1F4D33D465E4_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.SaveItems

procedure TkwPopComboTreeSaveItems.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
 l_aFileName : AnsiString;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SaveItems(aCtx, l_aComboTree, l_aFileName);
end;//TkwPopComboTreeSaveItems.DoDoIt

class function TkwPopComboTreeSaveItems.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:SaveItems';
end;//TkwPopComboTreeSaveItems.GetWordNameForRegister

function TkwPopComboTreeSaveItems.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopComboTreeSaveItems.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TvtComboBoxWordsPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_DropDown
 TkwPopComboBoxDropDown.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_GetItemIndex
 TkwPopComboBoxGetItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_IndexOf
 TkwPopComboBoxIndexOf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_SelectItem
 TkwPopComboBoxSelectItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_SetItemIndex
 TkwPopComboBoxSetItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboBox_SaveItems
 TkwPopComboBoxSaveItems.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_DropDown
 TkwPopComboTreeDropDown.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_GetItemIndex
 TkwPopComboTreeGetItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_IndexOf
 TkwPopComboTreeIndexOf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_SelectItem
 TkwPopComboTreeSelectItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_SetItemIndex
 TkwPopComboTreeSetItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_SaveItems
 TkwPopComboTreeSaveItems.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TCustomComboBox
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCustomComboBox));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TvtComboTree
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtComboTree));
{$IfEnd} //not NoScripts

end.