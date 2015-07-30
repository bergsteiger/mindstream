unit evParaWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "evParaWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$Everest::ParaWords::evParaWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  l3Variant,
  tfwRegisterableWord,
  l3Types,
  k2Interfaces,
  k2Prim,
  nevBase
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Tags,
  l3Base,
  l3String,
  k2OpMisc,
  k2Facade,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwParaBoolA = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:BoolA
*Тип результата:* Boolean
*Пример:*
[code]
 aTag aPara Para:BoolA
[code]  }
 private
 // private methods
   function BoolA(const aCtx: TtfwContext;
    const aPara: InevPara;
    aTag: Integer): Boolean;
     {* Реализация слова скрипта Para:BoolA }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaBoolA

// start class TkwParaBoolA

function TkwParaBoolA.BoolA(const aCtx: TtfwContext;
  const aPara: InevPara;
  aTag: Integer): Boolean;
//#UC START# *813358A7CF85_73A41501B720_var*
//#UC END# *813358A7CF85_73A41501B720_var*
begin
//#UC START# *813358A7CF85_73A41501B720_impl*
 Result := aPara.AsObject.BoolA[aTag];
//#UC END# *813358A7CF85_73A41501B720_impl*
end;//TkwParaBoolA.BoolA

procedure TkwParaBoolA.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_aTag : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((BoolA(aCtx, l_aPara, l_aTag)));
end;//TkwParaBoolA.DoDoIt

class function TkwParaBoolA.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:BoolA';
end;//TkwParaBoolA.GetWordNameForRegister

function TkwParaBoolA.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwParaBoolA.GetResultTypeInfo

type
 TkwParaBoolW = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:BoolW
*Пример:*
[code]
 aTag aValue anEditor aPara Para:BoolW
[code]  }
 private
 // private methods
   procedure BoolW(const aCtx: TtfwContext;
    const aPara: InevPara;
    anEditor: TevCustomEditorWindow;
    aValue: Boolean;
    aTag: Integer);
     {* Реализация слова скрипта Para:BoolW }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaBoolW

// start class TkwParaBoolW

procedure TkwParaBoolW.BoolW(const aCtx: TtfwContext;
  const aPara: InevPara;
  anEditor: TevCustomEditorWindow;
  aValue: Boolean;
  aTag: Integer);
//#UC START# *FA63F0F0EFEE_7DB044DC9B24_var*
//#UC END# *FA63F0F0EFEE_7DB044DC9B24_var*
begin
//#UC START# *FA63F0F0EFEE_7DB044DC9B24_impl*
 aPara.AsObject.BoolW[aTag, k2StartOp(anEditor.View.Processor)] := aValue;
//#UC END# *FA63F0F0EFEE_7DB044DC9B24_impl*
end;//TkwParaBoolW.BoolW

procedure TkwParaBoolW.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_anEditor : TevCustomEditorWindow;
 l_aValue : Boolean;
 l_aTag : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anEditor := TevCustomEditorWindow(aCtx.rEngine.PopObjAs(TevCustomEditorWindow));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anEditor: TevCustomEditorWindow : ' + E.Message, aCtx);
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
 try
  l_aTag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 BoolW(aCtx, l_aPara, l_anEditor, l_aValue, l_aTag);
end;//TkwParaBoolW.DoDoIt

class function TkwParaBoolW.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:BoolW';
end;//TkwParaBoolW.GetWordNameForRegister

function TkwParaBoolW.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwParaBoolW.GetResultTypeInfo

type
 TkwParaGetParent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:GetParent
*Тип результата:* InevPara
*Пример:*
[code]
 aPara Para:GetParent
[code]  }
 private
 // private methods
   function GetParent(const aCtx: TtfwContext;
    const aPara: InevPara): InevPara;
     {* Реализация слова скрипта Para:GetParent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaGetParent

// start class TkwParaGetParent

function TkwParaGetParent.GetParent(const aCtx: TtfwContext;
  const aPara: InevPara): InevPara;
//#UC START# *CDCE3FA90D6B_8E4CB03D8918_var*
//#UC END# *CDCE3FA90D6B_8E4CB03D8918_var*
begin
//#UC START# *CDCE3FA90D6B_8E4CB03D8918_impl*
 Result := aPara.OwnerObj.AsPara;
//#UC END# *CDCE3FA90D6B_8E4CB03D8918_impl*
end;//TkwParaGetParent.GetParent

procedure TkwParaGetParent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushIntf((GetParent(aCtx, l_aPara)));
end;//TkwParaGetParent.DoDoIt

class function TkwParaGetParent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:GetParent';
end;//TkwParaGetParent.GetWordNameForRegister

function TkwParaGetParent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(InevPara);
end;//TkwParaGetParent.GetResultTypeInfo

type
 TkwParaGetType = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:GetType
*Тип результата:* Tl3VariantDef
*Пример:*
[code]
 aPara Para:GetType
[code]  }
 private
 // private methods
   function GetType(const aCtx: TtfwContext;
    const aPara: InevPara): Tl3VariantDef;
     {* Реализация слова скрипта Para:GetType }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaGetType

// start class TkwParaGetType

function TkwParaGetType.GetType(const aCtx: TtfwContext;
  const aPara: InevPara): Tl3VariantDef;
//#UC START# *45DC1815EB7A_1F1556695E5E_var*
//#UC END# *45DC1815EB7A_1F1556695E5E_var*
begin
//#UC START# *45DC1815EB7A_1F1556695E5E_impl*
 Result := aPara.AsObject.TagType;
//#UC END# *45DC1815EB7A_1F1556695E5E_impl*
end;//TkwParaGetType.GetType

procedure TkwParaGetType.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetType(aCtx, l_aPara)));
end;//TkwParaGetType.DoDoIt

class function TkwParaGetType.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:GetType';
end;//TkwParaGetType.GetWordNameForRegister

function TkwParaGetType.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Tl3VariantDef);
end;//TkwParaGetType.GetResultTypeInfo

type
 TkwParaIntA = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:IntA
*Тип результата:* Integer
*Пример:*
[code]
 aTag aPara Para:IntA
[code]  }
 private
 // private methods
   function IntA(const aCtx: TtfwContext;
    const aPara: InevPara;
    aTag: Integer): Integer;
     {* Реализация слова скрипта Para:IntA }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaIntA

// start class TkwParaIntA

function TkwParaIntA.IntA(const aCtx: TtfwContext;
  const aPara: InevPara;
  aTag: Integer): Integer;
//#UC START# *F1D0FBBB4A2A_87CE9706F506_var*
//#UC END# *F1D0FBBB4A2A_87CE9706F506_var*
begin
//#UC START# *F1D0FBBB4A2A_87CE9706F506_impl*
 Result := aPara.AsObject.IntA[aTag];
//#UC END# *F1D0FBBB4A2A_87CE9706F506_impl*
end;//TkwParaIntA.IntA

procedure TkwParaIntA.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_aTag : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((IntA(aCtx, l_aPara, l_aTag)));
end;//TkwParaIntA.DoDoIt

class function TkwParaIntA.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:IntA';
end;//TkwParaIntA.GetWordNameForRegister

function TkwParaIntA.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwParaIntA.GetResultTypeInfo

type
 TkwParaIntW = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:IntW
*Пример:*
[code]
 aTag aValue anEditor aPara Para:IntW
[code]  }
 private
 // private methods
   procedure IntW(const aCtx: TtfwContext;
    const aPara: InevPara;
    anEditor: TevCustomEditorWindow;
    aValue: Integer;
    aTag: Integer);
     {* Реализация слова скрипта Para:IntW }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaIntW

// start class TkwParaIntW

procedure TkwParaIntW.IntW(const aCtx: TtfwContext;
  const aPara: InevPara;
  anEditor: TevCustomEditorWindow;
  aValue: Integer;
  aTag: Integer);
//#UC START# *79467BAD33FB_9C157259C948_var*
//#UC END# *79467BAD33FB_9C157259C948_var*
begin
//#UC START# *79467BAD33FB_9C157259C948_impl*
 aPara.AsObject.IntW[aTag, k2StartOp(anEditor.View.Processor)] := aValue;
//#UC END# *79467BAD33FB_9C157259C948_impl*
end;//TkwParaIntW.IntW

procedure TkwParaIntW.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_anEditor : TevCustomEditorWindow;
 l_aValue : Integer;
 l_aTag : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anEditor := TevCustomEditorWindow(aCtx.rEngine.PopObjAs(TevCustomEditorWindow));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anEditor: TevCustomEditorWindow : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 IntW(aCtx, l_aPara, l_anEditor, l_aValue, l_aTag);
end;//TkwParaIntW.DoDoIt

class function TkwParaIntW.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:IntW';
end;//TkwParaIntW.GetWordNameForRegister

function TkwParaIntW.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwParaIntW.GetResultTypeInfo

type
 TkwParaIsSame = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:IsSame
*Тип результата:* Boolean
*Пример:*
[code]
 anOther aPara Para:IsSame
[code]  }
 private
 // private methods
   function IsSame(const aCtx: TtfwContext;
    const aPara: InevPara;
    const anOther: InevPara): Boolean;
     {* Реализация слова скрипта Para:IsSame }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaIsSame

// start class TkwParaIsSame

function TkwParaIsSame.IsSame(const aCtx: TtfwContext;
  const aPara: InevPara;
  const anOther: InevPara): Boolean;
//#UC START# *135EE191EC2B_FD4CFCA9A1DA_var*
//#UC END# *135EE191EC2B_FD4CFCA9A1DA_var*
begin
//#UC START# *135EE191EC2B_FD4CFCA9A1DA_impl*
 Result := anOther.AsObject.IsSame(aPara.AsObject);
//#UC END# *135EE191EC2B_FD4CFCA9A1DA_impl*
end;//TkwParaIsSame.IsSame

procedure TkwParaIsSame.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_anOther : InevPara;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsSame(aCtx, l_aPara, l_anOther)));
end;//TkwParaIsSame.DoDoIt

class function TkwParaIsSame.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:IsSame';
end;//TkwParaIsSame.GetWordNameForRegister

function TkwParaIsSame.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwParaIsSame.GetResultTypeInfo

type
 TkwParaStrA = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:StrA
*Тип результата:* Tl3WString
*Пример:*
[code]
 aTag aPara Para:StrA
[code]  }
 private
 // private methods
   function StrA(const aCtx: TtfwContext;
    const aPara: InevPara;
    aTag: Integer): Tl3WString;
     {* Реализация слова скрипта Para:StrA }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaStrA

// start class TkwParaStrA

function TkwParaStrA.StrA(const aCtx: TtfwContext;
  const aPara: InevPara;
  aTag: Integer): Tl3WString;
//#UC START# *B475DB5CB51E_A38F9F2F9E00_var*
//#UC END# *B475DB5CB51E_A38F9F2F9E00_var*
begin
//#UC START# *B475DB5CB51E_A38F9F2F9E00_impl*
 Result := aPara.AsObject.PCharLenA[aTag];
//#UC END# *B475DB5CB51E_A38F9F2F9E00_impl*
end;//TkwParaStrA.StrA

procedure TkwParaStrA.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_aTag : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((StrA(aCtx, l_aPara, l_aTag)));
end;//TkwParaStrA.DoDoIt

class function TkwParaStrA.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:StrA';
end;//TkwParaStrA.GetWordNameForRegister

function TkwParaStrA.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwParaStrA.GetResultTypeInfo

type
 TkwParaStyleName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:StyleName
*Тип результата:* Tl3WString
*Пример:*
[code]
 aPara Para:StyleName
[code]  }
 private
 // private methods
   function StyleName(const aCtx: TtfwContext;
    const aPara: InevPara): Tl3WString;
     {* Реализация слова скрипта Para:StyleName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaStyleName

// start class TkwParaStyleName

function TkwParaStyleName.StyleName(const aCtx: TtfwContext;
  const aPara: InevPara): Tl3WString;
//#UC START# *6DC250CE244B_6834305B1C71_var*
//#UC END# *6DC250CE244B_6834305B1C71_var*
begin
//#UC START# *6DC250CE244B_6834305B1C71_impl*
 Result := aPara.AsObject.PCharLenA[k2_tiStyle];
//#UC END# *6DC250CE244B_6834305B1C71_impl*
end;//TkwParaStyleName.StyleName

procedure TkwParaStyleName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((StyleName(aCtx, l_aPara)));
end;//TkwParaStyleName.DoDoIt

class function TkwParaStyleName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:StyleName';
end;//TkwParaStyleName.GetWordNameForRegister

function TkwParaStyleName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwParaStyleName.GetResultTypeInfo

type
 TkwParaText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:Text
*Тип результата:* Tl3WString
*Пример:*
[code]
 aPara Para:Text
[code]  }
 private
 // private methods
   function Text(const aCtx: TtfwContext;
    const aPara: InevPara): Tl3WString;
     {* Реализация слова скрипта Para:Text }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaText

// start class TkwParaText

function TkwParaText.Text(const aCtx: TtfwContext;
  const aPara: InevPara): Tl3WString;
//#UC START# *AF0DB87C1E22_742EC299532F_var*
//#UC END# *AF0DB87C1E22_742EC299532F_var*
begin
//#UC START# *AF0DB87C1E22_742EC299532F_impl*
 Result := aPara.AsObject.PCharLenA[k2_tiText];
//#UC END# *AF0DB87C1E22_742EC299532F_impl*
end;//TkwParaText.Text

procedure TkwParaText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Text(aCtx, l_aPara)));
end;//TkwParaText.DoDoIt

class function TkwParaText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:Text';
end;//TkwParaText.GetWordNameForRegister

function TkwParaText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwParaText.GetResultTypeInfo

type
 TkwParaTypeInherits = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Para:Type:Inherits
*Тип результата:* Boolean
*Пример:*
[code]
 aTypeID aPara Para:Type:Inherits
[code]  }
 private
 // private methods
   function TypeInherits(const aCtx: TtfwContext;
    const aPara: InevPara;
    aTypeID: Integer): Boolean;
     {* Реализация слова скрипта Para:Type:Inherits }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwParaTypeInherits

// start class TkwParaTypeInherits

function TkwParaTypeInherits.TypeInherits(const aCtx: TtfwContext;
  const aPara: InevPara;
  aTypeID: Integer): Boolean;
//#UC START# *E7A7AF07EE52_E16D3A553EA8_var*
//#UC END# *E7A7AF07EE52_E16D3A553EA8_var*
begin
//#UC START# *E7A7AF07EE52_E16D3A553EA8_impl*
 Result := aPara.AsObject.IsKindOf(k2.TypeTable.TypeByHandle[aCtx.rEngine.PopInt]);
//#UC END# *E7A7AF07EE52_E16D3A553EA8_impl*
end;//TkwParaTypeInherits.TypeInherits

procedure TkwParaTypeInherits.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPara : InevPara;
 l_aTypeID : Integer;
begin
 try
  l_aPara := InevPara(aCtx.rEngine.PopIntf(InevPara));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPara: InevPara : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aTypeID := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTypeID: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((TypeInherits(aCtx, l_aPara, l_aTypeID)));
end;//TkwParaTypeInherits.DoDoIt

class function TkwParaTypeInherits.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:Type:Inherits';
end;//TkwParaTypeInherits.GetWordNameForRegister

function TkwParaTypeInherits.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwParaTypeInherits.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Para_BoolA
 TkwParaBoolA.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_BoolW
 TkwParaBoolW.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_GetParent
 TkwParaGetParent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_GetType
 TkwParaGetType.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_IntA
 TkwParaIntA.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_IntW
 TkwParaIntW.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_IsSame
 TkwParaIsSame.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_StrA
 TkwParaStrA.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_StyleName
 TkwParaStyleName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_Text
 TkwParaText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Para_Type_Inherits
 TkwParaTypeInherits.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа InevPara
 TtfwTypeRegistrator.RegisterType(TypeInfo(InevPara));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TevCustomEditorWindow
 TtfwTypeRegistrator.RegisterType(TypeInfo(TevCustomEditorWindow));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3VariantDef
 TtfwTypeRegistrator.RegisterType(TypeInfo(Tl3VariantDef));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3WString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts

end.