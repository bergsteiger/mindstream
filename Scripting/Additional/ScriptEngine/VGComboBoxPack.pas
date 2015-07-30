unit VGComboBoxPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VG"
// Модуль: "VGComboBoxPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VG::VGSceneWords::VGComboBoxPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  vg_listbox,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwVgComboBoxGetText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:ComboBox:GetText
*Тип результата:* String
*Пример:*
[code]
 aComboBox vg:ComboBox:GetText
[code]  }
 private
 // private methods
   function VgComboBoxGetText(const aCtx: TtfwContext;
    aComboBox: TvgComboBox): AnsiString;
     {* Реализация слова скрипта vg:ComboBox:GetText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgComboBoxGetText

// start class TkwVgComboBoxGetText

function TkwVgComboBoxGetText.VgComboBoxGetText(const aCtx: TtfwContext;
  aComboBox: TvgComboBox): AnsiString;
//#UC START# *E6AB0BAEC690_3D1B97A2F7D1_var*
//#UC END# *E6AB0BAEC690_3D1B97A2F7D1_var*
begin
//#UC START# *E6AB0BAEC690_3D1B97A2F7D1_impl*
 Result := aComboBox.ListBox.Selected.Binding['text'];
//#UC END# *E6AB0BAEC690_3D1B97A2F7D1_impl*
end;//TkwVgComboBoxGetText.VgComboBoxGetText

procedure TkwVgComboBoxGetText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TvgComboBox;
begin
 try
  l_aComboBox := TvgComboBox(aCtx.rEngine.PopObjAs(TvgComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TvgComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((VgComboBoxGetText(aCtx, l_aComboBox)));
end;//TkwVgComboBoxGetText.DoDoIt

class function TkwVgComboBoxGetText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:GetText';
end;//TkwVgComboBoxGetText.GetWordNameForRegister

function TkwVgComboBoxGetText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwVgComboBoxGetText.GetResultTypeInfo

type
 TkwVgComboBoxItemHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:ComboBox:ItemHeight
*Тип результата:* Integer
*Пример:*
[code]
 aComboBox vg:ComboBox:ItemHeight
[code]  }
 private
 // private methods
   function VgComboBoxItemHeight(const aCtx: TtfwContext;
    aComboBox: TvgComboBox): Integer;
     {* Реализация слова скрипта vg:ComboBox:ItemHeight }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgComboBoxItemHeight

// start class TkwVgComboBoxItemHeight

function TkwVgComboBoxItemHeight.VgComboBoxItemHeight(const aCtx: TtfwContext;
  aComboBox: TvgComboBox): Integer;
//#UC START# *3D92BC0DA86C_6AF76187796E_var*
//#UC END# *3D92BC0DA86C_6AF76187796E_var*
begin
//#UC START# *3D92BC0DA86C_6AF76187796E_impl*
 Result := Round(aComboBox.ItemHeight);
//#UC END# *3D92BC0DA86C_6AF76187796E_impl*
end;//TkwVgComboBoxItemHeight.VgComboBoxItemHeight

procedure TkwVgComboBoxItemHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TvgComboBox;
begin
 try
  l_aComboBox := TvgComboBox(aCtx.rEngine.PopObjAs(TvgComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TvgComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgComboBoxItemHeight(aCtx, l_aComboBox)));
end;//TkwVgComboBoxItemHeight.DoDoIt

class function TkwVgComboBoxItemHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:ItemHeight';
end;//TkwVgComboBoxItemHeight.GetWordNameForRegister

function TkwVgComboBoxItemHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgComboBoxItemHeight.GetResultTypeInfo

type
 TkwVgComboBoxItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:ComboBox:ItemIndex
*Тип результата:* Integer
*Пример:*
[code]
 aComboBox vg:ComboBox:ItemIndex
[code]  }
 private
 // private methods
   function VgComboBoxItemIndex(const aCtx: TtfwContext;
    aComboBox: TvgComboBox): Integer;
     {* Реализация слова скрипта vg:ComboBox:ItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgComboBoxItemIndex

// start class TkwVgComboBoxItemIndex

function TkwVgComboBoxItemIndex.VgComboBoxItemIndex(const aCtx: TtfwContext;
  aComboBox: TvgComboBox): Integer;
//#UC START# *FD2233CED588_E6401AA7CFD9_var*
//#UC END# *FD2233CED588_E6401AA7CFD9_var*
begin
//#UC START# *FD2233CED588_E6401AA7CFD9_impl*
 Result := aComboBox.ItemIndex;
//#UC END# *FD2233CED588_E6401AA7CFD9_impl*
end;//TkwVgComboBoxItemIndex.VgComboBoxItemIndex

procedure TkwVgComboBoxItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TvgComboBox;
begin
 try
  l_aComboBox := TvgComboBox(aCtx.rEngine.PopObjAs(TvgComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TvgComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgComboBoxItemIndex(aCtx, l_aComboBox)));
end;//TkwVgComboBoxItemIndex.DoDoIt

class function TkwVgComboBoxItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:ItemIndex';
end;//TkwVgComboBoxItemIndex.GetWordNameForRegister

function TkwVgComboBoxItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgComboBoxItemIndex.GetResultTypeInfo

type
 TkwVgComboBoxGetItem = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:ComboBox:GetItem
*Тип результата:* String
*Пример:*
[code]
 anIndex aComboBox vg:ComboBox:GetItem
[code]  }
 private
 // private methods
   function VgComboBoxGetItem(const aCtx: TtfwContext;
    aComboBox: TvgComboBox;
    anIndex: Integer): AnsiString;
     {* Реализация слова скрипта vg:ComboBox:GetItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgComboBoxGetItem

// start class TkwVgComboBoxGetItem

function TkwVgComboBoxGetItem.VgComboBoxGetItem(const aCtx: TtfwContext;
  aComboBox: TvgComboBox;
  anIndex: Integer): AnsiString;
//#UC START# *543B6C62927E_F404139FE541_var*
//#UC END# *543B6C62927E_F404139FE541_var*
begin
//#UC START# *543B6C62927E_F404139FE541_impl*
 Result := aComboBox.ListBox.Items[anIndex].Binding['text'];
//#UC END# *543B6C62927E_F404139FE541_impl*
end;//TkwVgComboBoxGetItem.VgComboBoxGetItem

procedure TkwVgComboBoxGetItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TvgComboBox;
 l_anIndex : Integer;
begin
 try
  l_aComboBox := TvgComboBox(aCtx.rEngine.PopObjAs(TvgComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TvgComboBox : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushString((VgComboBoxGetItem(aCtx, l_aComboBox, l_anIndex)));
end;//TkwVgComboBoxGetItem.DoDoIt

class function TkwVgComboBoxGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:GetItem';
end;//TkwVgComboBoxGetItem.GetWordNameForRegister

function TkwVgComboBoxGetItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwVgComboBoxGetItem.GetResultTypeInfo

type
 TkwVgComboBoxGetHighLightItemIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта vg:ComboBox:GetHighLightItemIndex
*Тип результата:* Integer
*Пример:*
[code]
 aComboBox vg:ComboBox:GetHighLightItemIndex
[code]  }
 private
 // private methods
   function VgComboBoxGetHighLightItemIndex(const aCtx: TtfwContext;
    aComboBox: TvgComboBox): Integer;
     {* Реализация слова скрипта vg:ComboBox:GetHighLightItemIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVgComboBoxGetHighLightItemIndex

// start class TkwVgComboBoxGetHighLightItemIndex

function TkwVgComboBoxGetHighLightItemIndex.VgComboBoxGetHighLightItemIndex(const aCtx: TtfwContext;
  aComboBox: TvgComboBox): Integer;
//#UC START# *7E4219389025_4E17F992CC09_var*
var
 l_Item: TvgListBoxItem;
//#UC END# *7E4219389025_4E17F992CC09_var*
begin
//#UC START# *7E4219389025_4E17F992CC09_impl*
 l_Item := aComboBox.ListBox.HighlightItem;
 if Assigned(l_Item) 
  then Result := l_Item.Index
  else Result := -1;
//#UC END# *7E4219389025_4E17F992CC09_impl*
end;//TkwVgComboBoxGetHighLightItemIndex.VgComboBoxGetHighLightItemIndex

procedure TkwVgComboBoxGetHighLightItemIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboBox : TvgComboBox;
begin
 try
  l_aComboBox := TvgComboBox(aCtx.rEngine.PopObjAs(TvgComboBox));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboBox: TvgComboBox : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((VgComboBoxGetHighLightItemIndex(aCtx, l_aComboBox)));
end;//TkwVgComboBoxGetHighLightItemIndex.DoDoIt

class function TkwVgComboBoxGetHighLightItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:GetHighLightItemIndex';
end;//TkwVgComboBoxGetHighLightItemIndex.GetWordNameForRegister

function TkwVgComboBoxGetHighLightItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwVgComboBoxGetHighLightItemIndex.GetResultTypeInfo
{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_ComboBox_GetText
 TkwVgComboBoxGetText.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_ComboBox_ItemHeight
 TkwVgComboBoxItemHeight.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_ComboBox_ItemIndex
 TkwVgComboBoxItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_ComboBox_GetItem
 TkwVgComboBoxGetItem.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация vg_ComboBox_GetHighLightItemIndex
 TkwVgComboBoxGetHighLightItemIndex.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа TvgComboBox
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvgComboBox));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts AND not NoVGScene
{$If not defined(NoScripts) AND not defined(NoVGScene)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts AND not NoVGScene

end.