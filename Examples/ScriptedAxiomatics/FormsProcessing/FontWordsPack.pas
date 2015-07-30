unit FontWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$L3"
// Модуль: "FontWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$L3::FontKeywords::FontWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Core,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwFontColor = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:Color
*Тип результата:* Tl3Color
*Пример:*
[code]
INTEGER VAR l_Tl3Color
 aFont Font:Color >>> l_Tl3Color
[code]  }
 private
 // private methods
   function Color(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Tl3Color;
     {* Реализация слова скрипта Font:Color }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontColor

// start class TkwFontColor

function TkwFontColor.Color(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Tl3Color;
//#UC START# *7040B1F6FD7B_B42B6353E972_var*
//#UC END# *7040B1F6FD7B_B42B6353E972_var*
begin
//#UC START# *7040B1F6FD7B_B42B6353E972_impl*
 Result := aFont.ForeColor;
//#UC END# *7040B1F6FD7B_B42B6353E972_impl*
end;//TkwFontColor.Color

procedure TkwFontColor.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Integer(Color(aCtx, l_aFont)));
end;//TkwFontColor.DoDoIt

class function TkwFontColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:Color';
end;//TkwFontColor.GetWordNameForRegister

function TkwFontColor.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Tl3Color);
end;//TkwFontColor.GetResultTypeInfo

type
 TkwFontBackColor = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:BackColor
*Тип результата:* Tl3Color
*Пример:*
[code]
INTEGER VAR l_Tl3Color
 aFont Font:BackColor >>> l_Tl3Color
[code]  }
 private
 // private methods
   function BackColor(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Tl3Color;
     {* Реализация слова скрипта Font:BackColor }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontBackColor

// start class TkwFontBackColor

function TkwFontBackColor.BackColor(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Tl3Color;
//#UC START# *85B9473C71C2_ADDA8C159EED_var*
//#UC END# *85B9473C71C2_ADDA8C159EED_var*
begin
//#UC START# *85B9473C71C2_ADDA8C159EED_impl*
 Result := aFont.BackColor;
//#UC END# *85B9473C71C2_ADDA8C159EED_impl*
end;//TkwFontBackColor.BackColor

procedure TkwFontBackColor.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Integer(BackColor(aCtx, l_aFont)));
end;//TkwFontBackColor.DoDoIt

class function TkwFontBackColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:BackColor';
end;//TkwFontBackColor.GetWordNameForRegister

function TkwFontBackColor.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Tl3Color);
end;//TkwFontBackColor.GetResultTypeInfo

type
 TkwFontIsBold = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:IsBold
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aFont Font:IsBold >>> l_Boolean
[code]  }
 private
 // private methods
   function IsBold(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Boolean;
     {* Реализация слова скрипта Font:IsBold }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontIsBold

// start class TkwFontIsBold

function TkwFontIsBold.IsBold(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Boolean;
//#UC START# *F4864359618B_6426AF77D4E5_var*
//#UC END# *F4864359618B_6426AF77D4E5_var*
begin
//#UC START# *F4864359618B_6426AF77D4E5_impl*
 Result := aFont.Bold;
//#UC END# *F4864359618B_6426AF77D4E5_impl*
end;//TkwFontIsBold.IsBold

procedure TkwFontIsBold.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsBold(aCtx, l_aFont)));
end;//TkwFontIsBold.DoDoIt

class function TkwFontIsBold.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:IsBold';
end;//TkwFontIsBold.GetWordNameForRegister

function TkwFontIsBold.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFontIsBold.GetResultTypeInfo

type
 TkwFontIsItalic = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:IsItalic
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aFont Font:IsItalic >>> l_Boolean
[code]  }
 private
 // private methods
   function IsItalic(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Boolean;
     {* Реализация слова скрипта Font:IsItalic }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontIsItalic

// start class TkwFontIsItalic

function TkwFontIsItalic.IsItalic(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Boolean;
//#UC START# *3EC3A4D3FAB3_FAD60EB55765_var*
//#UC END# *3EC3A4D3FAB3_FAD60EB55765_var*
begin
//#UC START# *3EC3A4D3FAB3_FAD60EB55765_impl*
 Result := aFont.Italic;
//#UC END# *3EC3A4D3FAB3_FAD60EB55765_impl*
end;//TkwFontIsItalic.IsItalic

procedure TkwFontIsItalic.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsItalic(aCtx, l_aFont)));
end;//TkwFontIsItalic.DoDoIt

class function TkwFontIsItalic.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:IsItalic';
end;//TkwFontIsItalic.GetWordNameForRegister

function TkwFontIsItalic.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFontIsItalic.GetResultTypeInfo

type
 TkwFontIsUnderline = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:IsUnderline
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aFont Font:IsUnderline >>> l_Boolean
[code]  }
 private
 // private methods
   function IsUnderline(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Boolean;
     {* Реализация слова скрипта Font:IsUnderline }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontIsUnderline

// start class TkwFontIsUnderline

function TkwFontIsUnderline.IsUnderline(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Boolean;
//#UC START# *F84904DE8371_0A56585439B0_var*
//#UC END# *F84904DE8371_0A56585439B0_var*
begin
//#UC START# *F84904DE8371_0A56585439B0_impl*
 Result := aFont.Underline;
//#UC END# *F84904DE8371_0A56585439B0_impl*
end;//TkwFontIsUnderline.IsUnderline

procedure TkwFontIsUnderline.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsUnderline(aCtx, l_aFont)));
end;//TkwFontIsUnderline.DoDoIt

class function TkwFontIsUnderline.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:IsUnderline';
end;//TkwFontIsUnderline.GetWordNameForRegister

function TkwFontIsUnderline.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFontIsUnderline.GetResultTypeInfo

type
 TkwFontIsStrikeOut = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:IsStrikeOut
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aFont Font:IsStrikeOut >>> l_Boolean
[code]  }
 private
 // private methods
   function IsStrikeOut(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Boolean;
     {* Реализация слова скрипта Font:IsStrikeOut }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontIsStrikeOut

// start class TkwFontIsStrikeOut

function TkwFontIsStrikeOut.IsStrikeOut(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Boolean;
//#UC START# *56B18ED23F7B_48690441DF69_var*
//#UC END# *56B18ED23F7B_48690441DF69_var*
begin
//#UC START# *56B18ED23F7B_48690441DF69_impl*
 Result := aFont.Strikeout;
//#UC END# *56B18ED23F7B_48690441DF69_impl*
end;//TkwFontIsStrikeOut.IsStrikeOut

procedure TkwFontIsStrikeOut.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsStrikeOut(aCtx, l_aFont)));
end;//TkwFontIsStrikeOut.DoDoIt

class function TkwFontIsStrikeOut.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:IsStrikeOut';
end;//TkwFontIsStrikeOut.GetWordNameForRegister

function TkwFontIsStrikeOut.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFontIsStrikeOut.GetResultTypeInfo

type
 TkwFontName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:Name
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aFont Font:Name >>> l_String
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): AnsiString;
     {* Реализация слова скрипта Font:Name }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontName

// start class TkwFontName

function TkwFontName.Name(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): AnsiString;
//#UC START# *5822CA56AAFA_7A73CF636A32_var*
//#UC END# *5822CA56AAFA_7A73CF636A32_var*
begin
//#UC START# *5822CA56AAFA_7A73CF636A32_impl*
 Result := aFont.Name;
//#UC END# *5822CA56AAFA_7A73CF636A32_impl*
end;//TkwFontName.Name

procedure TkwFontName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aFont)));
end;//TkwFontName.DoDoIt

class function TkwFontName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:Name';
end;//TkwFontName.GetWordNameForRegister

function TkwFontName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwFontName.GetResultTypeInfo

type
 TkwFontSize = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Font:Size
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aFont Font:Size >>> l_Integer
[code]  }
 private
 // private methods
   function Size(const aCtx: TtfwContext;
    const aFont: Il3FontInfo): Integer;
     {* Реализация слова скрипта Font:Size }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFontSize

// start class TkwFontSize

function TkwFontSize.Size(const aCtx: TtfwContext;
  const aFont: Il3FontInfo): Integer;
//#UC START# *88C29661A1A9_F76B0EA46A07_var*
//#UC END# *88C29661A1A9_F76B0EA46A07_var*
begin
//#UC START# *88C29661A1A9_F76B0EA46A07_impl*
 Result := aFont.Size;
//#UC END# *88C29661A1A9_F76B0EA46A07_impl*
end;//TkwFontSize.Size

procedure TkwFontSize.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFont : Il3FontInfo;
begin
 try
  l_aFont := Il3FontInfo(aCtx.rEngine.PopIntf(Il3FontInfo));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFont: Il3FontInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Size(aCtx, l_aFont)));
end;//TkwFontSize.DoDoIt

class function TkwFontSize.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Font:Size';
end;//TkwFontSize.GetWordNameForRegister

function TkwFontSize.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwFontSize.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Font_Color
 TkwFontColor.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_BackColor
 TkwFontBackColor.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_IsBold
 TkwFontIsBold.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_IsItalic
 TkwFontIsItalic.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_IsUnderline
 TkwFontIsUnderline.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_IsStrikeOut
 TkwFontIsStrikeOut.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_Name
 TkwFontName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Font_Size
 TkwFontSize.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3FontInfo
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3FontInfo));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3Color
 TtfwTypeRegistrator.RegisterType(TypeInfo(Tl3Color));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.