unit FileProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "FileProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::FileProcessing::FileProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Types,
  l3Filer,
  l3CProtoObject,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  tfwWordWorkerEx,
  tfwAxiomaticsResNameGetter,
  tfwTypeInfo,
  tfwClassLike
  ;

type
 TtfwFile = class(Tl3CProtoObject, ItfwFile)
 private
 // private fields
   f_Filer : Tl3CustomDosFiler;
 protected
 // realized methods
   function ReadLn: Il3CString;
   procedure WriteLn(const aString: Il3CString);
   procedure WriteChar(aChar: AnsiChar);
   function ReadWStrLn: Tl3WString;
   procedure WriteWStrLn(const aStr: Tl3WString);
   procedure WriteWStr(const aStr: Tl3WString);
   function EOF: Boolean;
 public
 // realized methods
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor CreateRead(const aFileName: AnsiString);
   constructor CreateWrite(const aFileName: AnsiString);
   class function MakeRead(const aFileName: AnsiString): ItfwFile; reintroduce;
     {* Сигнатура фабрики TtfwFile.MakeRead }
   class function MakeWrite(const aFileName: AnsiString): ItfwFile; reintroduce;
     {* Сигнатура фабрики TtfwFile.MakeWrite }
 end;//TtfwFile
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3FileUtils,
  tfwScriptingTypes,
  TypInfo,
  tfwTypeRegistrator
  ;

type
//#UC START# *23408B0EC0B1ci*
//#UC END# *23408B0EC0B1ci*
 TFileProcessingPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *23408B0EC0B1publ*
//#UC END# *23408B0EC0B1publ*
 end;//TFileProcessingPackResNameGetter

// start class TFileProcessingPackResNameGetter

class function TFileProcessingPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'FileProcessingPack';
end;//TFileProcessingPackResNameGetter.ResName

 {$R FileProcessingPack.res}

type
 TkwFileOpenRead = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта File:OpenRead
*Тип результата:* ItfwFile
*Пример:*
[code]
FILE VAR l_ItfwFile
 aName File:OpenRead >>> l_ItfwFile
[code]  }
 private
 // private methods
   function OpenRead(const aCtx: TtfwContext;
    const aName: AnsiString): ItfwFile;
     {* Реализация слова скрипта File:OpenRead }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileOpenRead

// start class TkwFileOpenRead

function TkwFileOpenRead.OpenRead(const aCtx: TtfwContext;
  const aName: AnsiString): ItfwFile;
//#UC START# *1138E576E816_E10DA0D7493D_var*
//#UC END# *1138E576E816_E10DA0D7493D_var*
begin
//#UC START# *1138E576E816_E10DA0D7493D_impl*
 Result := TtfwFile.MakeRead(aCtx.rCaller.ResolveInputFilePath(aName));
//#UC END# *1138E576E816_E10DA0D7493D_impl*
end;//TkwFileOpenRead.OpenRead

procedure TkwFileOpenRead.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushFile((OpenRead(aCtx, l_aName)));
end;//TkwFileOpenRead.DoDoIt

class function TkwFileOpenRead.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:OpenRead';
end;//TkwFileOpenRead.GetWordNameForRegister

function TkwFileOpenRead.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwFile);
end;//TkwFileOpenRead.GetResultTypeInfo

type
 TkwFileOpenWrite = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта File:OpenWrite
*Тип результата:* ItfwFile
*Пример:*
[code]
FILE VAR l_ItfwFile
 aName File:OpenWrite >>> l_ItfwFile
[code]  }
 private
 // private methods
   function OpenWrite(const aCtx: TtfwContext;
    const aName: AnsiString): ItfwFile;
     {* Реализация слова скрипта File:OpenWrite }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileOpenWrite

// start class TkwFileOpenWrite

function TkwFileOpenWrite.OpenWrite(const aCtx: TtfwContext;
  const aName: AnsiString): ItfwFile;
//#UC START# *C3A7BCE24C3B_1CA3472F7177_var*
//#UC END# *C3A7BCE24C3B_1CA3472F7177_var*
begin
//#UC START# *C3A7BCE24C3B_1CA3472F7177_impl*
 Result := TtfwFile.MakeWrite(aCtx.rCaller.ResolveOutputFilePath(aName));
//#UC END# *C3A7BCE24C3B_1CA3472F7177_impl*
end;//TkwFileOpenWrite.OpenWrite

procedure TkwFileOpenWrite.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushFile((OpenWrite(aCtx, l_aName)));
end;//TkwFileOpenWrite.DoDoIt

class function TkwFileOpenWrite.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:OpenWrite';
end;//TkwFileOpenWrite.GetWordNameForRegister

function TkwFileOpenWrite.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwFile);
end;//TkwFileOpenWrite.GetResultTypeInfo

type
 TkwFileEOF = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:EOF
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aFile File:EOF >>> l_Boolean
[code]  }
 private
 // private methods
   function EOF(const aCtx: TtfwContext;
    const aFile: ItfwFile): Boolean;
     {* Реализация слова скрипта File:EOF }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileEOF

// start class TkwFileEOF

function TkwFileEOF.EOF(const aCtx: TtfwContext;
  const aFile: ItfwFile): Boolean;
//#UC START# *509E2E3CFD11_2B33C78BBAB9_var*
//#UC END# *509E2E3CFD11_2B33C78BBAB9_var*
begin
//#UC START# *509E2E3CFD11_2B33C78BBAB9_impl*
 Result := aFile.EOF;
//#UC END# *509E2E3CFD11_2B33C78BBAB9_impl*
end;//TkwFileEOF.EOF

procedure TkwFileEOF.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((EOF(aCtx, l_aFile)));
end;//TkwFileEOF.DoDoIt

class function TkwFileEOF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:EOF';
end;//TkwFileEOF.GetWordNameForRegister

function TkwFileEOF.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFileEOF.GetResultTypeInfo

type
 TkwFileReadLn = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:ReadLn
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aFile File:ReadLn >>> l_Il3CString
[code]  }
 private
 // private methods
   function ReadLn(const aCtx: TtfwContext;
    const aFile: ItfwFile): Il3CString;
     {* Реализация слова скрипта File:ReadLn }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileReadLn

// start class TkwFileReadLn

function TkwFileReadLn.ReadLn(const aCtx: TtfwContext;
  const aFile: ItfwFile): Il3CString;
//#UC START# *47F929C35E76_324E0BCF3B98_var*
//#UC END# *47F929C35E76_324E0BCF3B98_var*
begin
//#UC START# *47F929C35E76_324E0BCF3B98_impl*
 Result := aFile.ReadLn;
//#UC END# *47F929C35E76_324E0BCF3B98_impl*
end;//TkwFileReadLn.ReadLn

procedure TkwFileReadLn.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((ReadLn(aCtx, l_aFile)));
end;//TkwFileReadLn.DoDoIt

class function TkwFileReadLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:ReadLn';
end;//TkwFileReadLn.GetWordNameForRegister

function TkwFileReadLn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwFileReadLn.GetResultTypeInfo

type
 TkwFileWriteLn = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:WriteLn
*Пример:*
[code]
 aValue aFile File:WriteLn
[code]  }
 private
 // private methods
   procedure WriteLn(const aCtx: TtfwContext;
    const aFile: ItfwFile;
    const aValue: Il3CString);
     {* Реализация слова скрипта File:WriteLn }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileWriteLn

// start class TkwFileWriteLn

procedure TkwFileWriteLn.WriteLn(const aCtx: TtfwContext;
  const aFile: ItfwFile;
  const aValue: Il3CString);
//#UC START# *7E6964328B7F_D6A86D931B42_var*
//#UC END# *7E6964328B7F_D6A86D931B42_var*
begin
//#UC START# *7E6964328B7F_D6A86D931B42_impl*
 aFile.WriteLn(aValue);
//#UC END# *7E6964328B7F_D6A86D931B42_impl*
end;//TkwFileWriteLn.WriteLn

procedure TkwFileWriteLn.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
 l_aValue : Il3CString;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WriteLn(aCtx, l_aFile, l_aValue);
end;//TkwFileWriteLn.DoDoIt

class function TkwFileWriteLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:WriteLn';
end;//TkwFileWriteLn.GetWordNameForRegister

function TkwFileWriteLn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileWriteLn.GetResultTypeInfo

type
 TkwFileWriteChar = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:WriteChar
*Пример:*
[code]
 aValue aFile File:WriteChar
[code]  }
 private
 // private methods
   procedure WriteChar(const aCtx: TtfwContext;
    const aFile: ItfwFile;
    aValue: AnsiChar);
     {* Реализация слова скрипта File:WriteChar }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileWriteChar

// start class TkwFileWriteChar

procedure TkwFileWriteChar.WriteChar(const aCtx: TtfwContext;
  const aFile: ItfwFile;
  aValue: AnsiChar);
//#UC START# *8B2200CCBE22_B530B64F8857_var*
//#UC END# *8B2200CCBE22_B530B64F8857_var*
begin
//#UC START# *8B2200CCBE22_B530B64F8857_impl*
 aFile.WriteChar(aValue);
//#UC END# *8B2200CCBE22_B530B64F8857_impl*
end;//TkwFileWriteChar.WriteChar

procedure TkwFileWriteChar.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
 l_aValue : AnsiChar;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.PopChar;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: AnsiChar : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WriteChar(aCtx, l_aFile, l_aValue);
end;//TkwFileWriteChar.DoDoIt

class function TkwFileWriteChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:WriteChar';
end;//TkwFileWriteChar.GetWordNameForRegister

function TkwFileWriteChar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileWriteChar.GetResultTypeInfo

type
 TkwFileWriteStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:WriteStr
*Пример:*
[code]
 aValue aFile File:WriteStr
[code]  }
 private
 // private methods
   procedure WriteStr(const aCtx: TtfwContext;
    const aFile: ItfwFile;
    const aValue: Il3CString);
     {* Реализация слова скрипта File:WriteStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileWriteStr

// start class TkwFileWriteStr

procedure TkwFileWriteStr.WriteStr(const aCtx: TtfwContext;
  const aFile: ItfwFile;
  const aValue: Il3CString);
//#UC START# *BF1D3E215CF5_0016E31D4F5B_var*
//#UC END# *BF1D3E215CF5_0016E31D4F5B_var*
begin
//#UC START# *BF1D3E215CF5_0016E31D4F5B_impl*
 aFile.WriteWStr(l3PCharLen(aValue));
//#UC END# *BF1D3E215CF5_0016E31D4F5B_impl*
end;//TkwFileWriteStr.WriteStr

procedure TkwFileWriteStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
 l_aValue : Il3CString;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WriteStr(aCtx, l_aFile, l_aValue);
end;//TkwFileWriteStr.DoDoIt

class function TkwFileWriteStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:WriteStr';
end;//TkwFileWriteStr.GetWordNameForRegister

function TkwFileWriteStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileWriteStr.GetResultTypeInfo

type
 TkwFileReadLines = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта File:ReadLines
*Пример:*
[code]
 aFile File:ReadLines aWord
[code]  }
 private
 // private methods
   procedure ReadLines(const aCtx: TtfwContext;
    aWord: TtfwWord;
    const aFile: ItfwFile);
     {* Реализация слова скрипта File:ReadLines }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileReadLines

// start class TkwFileReadLines

procedure TkwFileReadLines.ReadLines(const aCtx: TtfwContext;
  aWord: TtfwWord;
  const aFile: ItfwFile);
//#UC START# *B66526463736_4D96B2094588_var*
//#UC END# *B66526463736_4D96B2094588_var*
begin
//#UC START# *B66526463736_4D96B2094588_impl*
 aFile.ForEach(aWord, aCtx);
//#UC END# *B66526463736_4D96B2094588_impl*
end;//TkwFileReadLines.ReadLines

class function TkwFileReadLines.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:ReadLines';
end;//TkwFileReadLines.GetWordNameForRegister

procedure TkwFileReadLines.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_aFile : ItfwFile;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ReadLines(aCtx, l_aWord, l_aFile);
end;//TkwFileReadLines.DoRun

function TkwFileReadLines.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileReadLines.GetResultTypeInfo

type
 TkwFileWriteWStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:WriteWStr
*Пример:*
[code]
 aValue aFile File:WriteWStr
[code]  }
 private
 // private methods
   procedure WriteWStr(const aCtx: TtfwContext;
    const aFile: ItfwFile;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта File:WriteWStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileWriteWStr

// start class TkwFileWriteWStr

procedure TkwFileWriteWStr.WriteWStr(const aCtx: TtfwContext;
  const aFile: ItfwFile;
  const aValue: TtfwStackValue);
//#UC START# *EA5DBDC19650_12D9E8420555_var*
//#UC END# *EA5DBDC19650_12D9E8420555_var*
begin
//#UC START# *EA5DBDC19650_12D9E8420555_impl*
 Case aValue.rType of
  tfw_vtStr:
   aFile.WriteWStr(aValue.AsString.AsWStr);
  tfw_vtWStr:
   aFile.WriteWStr(aValue.AsWString);
  else
   BadValueType(aValue.rType, aCtx);
 end;//Case aValue.rType
//#UC END# *EA5DBDC19650_12D9E8420555_impl*
end;//TkwFileWriteWStr.WriteWStr

procedure TkwFileWriteWStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
 l_aValue : TtfwStackValue;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WriteWStr(aCtx, l_aFile, l_aValue);
end;//TkwFileWriteWStr.DoDoIt

class function TkwFileWriteWStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:WriteWStr';
end;//TkwFileWriteWStr.GetWordNameForRegister

function TkwFileWriteWStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileWriteWStr.GetResultTypeInfo

type
 TkwFileReadWStrLn = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:ReadWStrLn
*Тип результата:* Tl3PCharLen
*Пример:*
[code]
W-STRING VAR l_Tl3PCharLen
 aFile File:ReadWStrLn >>> l_Tl3PCharLen
[code]  }
 private
 // private methods
   function ReadWStrLn(const aCtx: TtfwContext;
    const aFile: ItfwFile): Tl3PCharLen;
     {* Реализация слова скрипта File:ReadWStrLn }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileReadWStrLn

// start class TkwFileReadWStrLn

function TkwFileReadWStrLn.ReadWStrLn(const aCtx: TtfwContext;
  const aFile: ItfwFile): Tl3PCharLen;
//#UC START# *062B42A458F5_6F89E50D4B41_var*
//#UC END# *062B42A458F5_6F89E50D4B41_var*
begin
//#UC START# *062B42A458F5_6F89E50D4B41_impl*
 Result := Tl3PCharLen(aFile.ReadWStrLn);
//#UC END# *062B42A458F5_6F89E50D4B41_impl*
end;//TkwFileReadWStrLn.ReadWStrLn

procedure TkwFileReadWStrLn.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushWStr((ReadWStrLn(aCtx, l_aFile)));
end;//TkwFileReadWStrLn.DoDoIt

class function TkwFileReadWStrLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:ReadWStrLn';
end;//TkwFileReadWStrLn.GetWordNameForRegister

function TkwFileReadWStrLn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiWString;
end;//TkwFileReadWStrLn.GetResultTypeInfo

type
 TkwFileWriteWStrLn = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта File:WriteWStrLn
*Пример:*
[code]
 aValue aFile File:WriteWStrLn
[code]  }
 private
 // private methods
   procedure WriteWStrLn(const aCtx: TtfwContext;
    const aFile: ItfwFile;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта File:WriteWStrLn }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFileWriteWStrLn

// start class TkwFileWriteWStrLn

procedure TkwFileWriteWStrLn.WriteWStrLn(const aCtx: TtfwContext;
  const aFile: ItfwFile;
  const aValue: TtfwStackValue);
//#UC START# *5BB0C2B29FB4_2C287EC9B0C3_var*
//#UC END# *5BB0C2B29FB4_2C287EC9B0C3_var*
begin
//#UC START# *5BB0C2B29FB4_2C287EC9B0C3_impl*
 Case aValue.rType of
  tfw_vtStr:
   aFile.WriteWStrLn(aValue.AsString.AsWStr);
  tfw_vtWStr:
   aFile.WriteWStrLn(aValue.AsWString);
  else
   BadValueType(aValue.rType, aCtx);
 end;//Case aValue.rType
//#UC END# *5BB0C2B29FB4_2C287EC9B0C3_impl*
end;//TkwFileWriteWStrLn.WriteWStrLn

procedure TkwFileWriteWStrLn.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFile : ItfwFile;
 l_aValue : TtfwStackValue;
begin
 try
  l_aFile := aCtx.rEngine.PopFile;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFile: ItfwFile : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WriteWStrLn(aCtx, l_aFile, l_aValue);
end;//TkwFileWriteWStrLn.DoDoIt

class function TkwFileWriteWStrLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'File:WriteWStrLn';
end;//TkwFileWriteWStrLn.GetWordNameForRegister

function TkwFileWriteWStrLn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwFileWriteWStrLn.GetResultTypeInfo

type
 TkwDeleteFile = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DeleteFile
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aName DeleteFile >>> l_Boolean
[code]  }
 private
 // private methods
   function DeleteFile(const aCtx: TtfwContext;
    const aName: AnsiString): Boolean;
     {* Реализация слова скрипта DeleteFile }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDeleteFile

// start class TkwDeleteFile

function TkwDeleteFile.DeleteFile(const aCtx: TtfwContext;
  const aName: AnsiString): Boolean;
//#UC START# *8A54E0B1468F_01A4D246A0C9_var*
//#UC END# *8A54E0B1468F_01A4D246A0C9_var*
begin
//#UC START# *8A54E0B1468F_01A4D246A0C9_impl*
 Result := SysUtils.DeleteFile(aName);
//#UC END# *8A54E0B1468F_01A4D246A0C9_impl*
end;//TkwDeleteFile.DeleteFile

procedure TkwDeleteFile.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((DeleteFile(aCtx, l_aName)));
end;//TkwDeleteFile.DoDoIt

class function TkwDeleteFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DeleteFile';
end;//TkwDeleteFile.GetWordNameForRegister

function TkwDeleteFile.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwDeleteFile.GetResultTypeInfo

type
 TkwRenameFile = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта RenameFile
[panel]RenameFile - переименовывает файл.
*Формат:* aOldFileName aNewFileName RenameFile
* aNewFileName - новое имя файла.
* aOldFileName - старое имя файла.
В стек помещается результат операции: true - если успешно, false - если переименование не получилось.[panel]
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 anOldName aNewName RenameFile >>> l_Boolean
[code]  }
 private
 // private methods
   function RenameFile(const aCtx: TtfwContext;
    const aNewName: AnsiString;
    const anOldName: AnsiString): Boolean;
     {* Реализация слова скрипта RenameFile }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwRenameFile

// start class TkwRenameFile

function TkwRenameFile.RenameFile(const aCtx: TtfwContext;
  const aNewName: AnsiString;
  const anOldName: AnsiString): Boolean;
//#UC START# *4B30612C1E84_269C162F0F47_var*
//#UC END# *4B30612C1E84_269C162F0F47_var*
begin
//#UC START# *4B30612C1E84_269C162F0F47_impl*
 Result := SysUtils.RenameFile(anOldName, aNewName);
//#UC END# *4B30612C1E84_269C162F0F47_impl*
end;//TkwRenameFile.RenameFile

procedure TkwRenameFile.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aNewName : AnsiString;
 l_anOldName : AnsiString;
begin
 try
  l_aNewName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNewName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOldName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOldName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((RenameFile(aCtx, l_aNewName, l_anOldName)));
end;//TkwRenameFile.DoDoIt

class function TkwRenameFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'RenameFile';
end;//TkwRenameFile.GetWordNameForRegister

function TkwRenameFile.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwRenameFile.GetResultTypeInfo

type
 TkwCopyFilesByMask = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CopyFilesByMask
[panel]CopyFilesByMask- копирует файлы по маске..
*Формат:* 
[code]
 aFileMask aDestDir aSourceDir  CopyFilesByMask
[code]
* aSourceDir - директория откуда копируем.
* aDestDir - директория куда копируем.
* aFileMask - маска, по которой копируем файлы.
Результат слово не возвращает. Если появляется ошибка, то будет Exception[panel]
*Пример:*
[code]
 aFileMask aDestDir aSourceDir CopyFilesByMask
[code]  }
 private
 // private methods
   procedure CopyFilesByMask(const aCtx: TtfwContext;
    const aSourceDir: AnsiString;
    const aDestDir: AnsiString;
    const aFileMask: AnsiString);
     {* Реализация слова скрипта CopyFilesByMask }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCopyFilesByMask

// start class TkwCopyFilesByMask

procedure TkwCopyFilesByMask.CopyFilesByMask(const aCtx: TtfwContext;
  const aSourceDir: AnsiString;
  const aDestDir: AnsiString;
  const aFileMask: AnsiString);
//#UC START# *B545E742BFBB_5478B1531C0E_var*
//#UC END# *B545E742BFBB_5478B1531C0E_var*
begin
//#UC START# *B545E742BFBB_5478B1531C0E_impl*
 l3FileUtils.CopyFilesByMask(aSourceDir, aDestDir, aFileMask);
//#UC END# *B545E742BFBB_5478B1531C0E_impl*
end;//TkwCopyFilesByMask.CopyFilesByMask

procedure TkwCopyFilesByMask.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSourceDir : AnsiString;
 l_aDestDir : AnsiString;
 l_aFileMask : AnsiString;
begin
 try
  l_aSourceDir := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSourceDir: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDestDir := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDestDir: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileMask := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileMask: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CopyFilesByMask(aCtx, l_aSourceDir, l_aDestDir, l_aFileMask);
end;//TkwCopyFilesByMask.DoDoIt

class function TkwCopyFilesByMask.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CopyFilesByMask';
end;//TkwCopyFilesByMask.GetWordNameForRegister

function TkwCopyFilesByMask.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCopyFilesByMask.GetResultTypeInfo

type
 TkwCopyFile = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CopyFile
[panel]CopyFile - копирует файл.
*Формат:*  aCopyMode aDestFile aSourceFile CopyFile
* aSourceFile - имя исходного файла
* aDestFile - имя файла, куда копируем
* aCopyMode - режим копирования файла.
Результат слово не возвращает. Если появляется ошибка, то будет Exception[panel]
*Пример:*
[code]
 aCopyMode aDestFile aSourceFile CopyFile
[code]  }
 private
 // private methods
   procedure CopyFile(const aCtx: TtfwContext;
    const aSourceFile: AnsiString;
    const aDestFile: AnsiString;
    aCopyMode: Integer);
     {* Реализация слова скрипта CopyFile }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCopyFile

// start class TkwCopyFile

procedure TkwCopyFile.CopyFile(const aCtx: TtfwContext;
  const aSourceFile: AnsiString;
  const aDestFile: AnsiString;
  aCopyMode: Integer);
//#UC START# *7B442954EEE8_C4E46637B80B_var*
//#UC END# *7B442954EEE8_C4E46637B80B_var*
begin
//#UC START# *7B442954EEE8_C4E46637B80B_impl*
 l3FileUtils.CopyFile(aSourceFile, aDestFile, aCopyMode);
//#UC END# *7B442954EEE8_C4E46637B80B_impl*
end;//TkwCopyFile.CopyFile

procedure TkwCopyFile.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSourceFile : AnsiString;
 l_aDestFile : AnsiString;
 l_aCopyMode : Integer;
begin
 try
  l_aSourceFile := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSourceFile: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDestFile := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDestFile: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aCopyMode := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCopyMode: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CopyFile(aCtx, l_aSourceFile, l_aDestFile, l_aCopyMode);
end;//TkwCopyFile.DoDoIt

class function TkwCopyFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CopyFile';
end;//TkwCopyFile.GetWordNameForRegister

function TkwCopyFile.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCopyFile.GetResultTypeInfo

type
 TkwPureDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта PureDir
[panel]PureDir - очищает директорию.
*Формат:* aDirName PureDir
* aDirName  - имя директории.[panel]
*Пример:*
[code]
 aName PureDir
[code]  }
 private
 // private methods
   procedure PureDir(const aCtx: TtfwContext;
    const aName: AnsiString);
     {* Реализация слова скрипта PureDir }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPureDir

// start class TkwPureDir

procedure TkwPureDir.PureDir(const aCtx: TtfwContext;
  const aName: AnsiString);
//#UC START# *4475F8181332_C77B92459A8E_var*
//#UC END# *4475F8181332_C77B92459A8E_var*
begin
//#UC START# *4475F8181332_C77B92459A8E_impl*
 l3FileUtils.PureDir(aName);
//#UC END# *4475F8181332_C77B92459A8E_impl*
end;//TkwPureDir.PureDir

procedure TkwPureDir.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PureDir(aCtx, l_aName);
end;//TkwPureDir.DoDoIt

class function TkwPureDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PureDir';
end;//TkwPureDir.GetWordNameForRegister

function TkwPureDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPureDir.GetResultTypeInfo

type
 TkwDeleteFilesByMask = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DeleteFilesByMask
[panel]DeleteFilesByMask - очищает директорию.
*Формат:* aMask aDirName DeleteFilesByMask
* aDirName  - имя директории.
* aMask - маска, по которой отбираются файлы.[panel]
*Пример:*
[code]
 aMask aDirName DeleteFilesByMask
[code]  }
 private
 // private methods
   procedure DeleteFilesByMask(const aCtx: TtfwContext;
    const aDirName: AnsiString;
    const aMask: AnsiString);
     {* Реализация слова скрипта DeleteFilesByMask }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDeleteFilesByMask

// start class TkwDeleteFilesByMask

procedure TkwDeleteFilesByMask.DeleteFilesByMask(const aCtx: TtfwContext;
  const aDirName: AnsiString;
  const aMask: AnsiString);
//#UC START# *4757446F5D1B_E5B04DD6635F_var*
//#UC END# *4757446F5D1B_E5B04DD6635F_var*
begin
//#UC START# *4757446F5D1B_E5B04DD6635F_impl*
 l3FileUtils.DeleteFilesByMask(aDirName, aMask);
//#UC END# *4757446F5D1B_E5B04DD6635F_impl*
end;//TkwDeleteFilesByMask.DeleteFilesByMask

procedure TkwDeleteFilesByMask.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDirName : AnsiString;
 l_aMask : AnsiString;
begin
 try
  l_aDirName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDirName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMask := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMask: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DeleteFilesByMask(aCtx, l_aDirName, l_aMask);
end;//TkwDeleteFilesByMask.DoDoIt

class function TkwDeleteFilesByMask.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DeleteFilesByMask';
end;//TkwDeleteFilesByMask.GetWordNameForRegister

function TkwDeleteFilesByMask.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDeleteFilesByMask.GetResultTypeInfo

type
 TkwProcessFilesWithMask = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ProcessFilesWithMask
[panel]ProcessFilesWithMask - перебирает файлы по маске в заданной директории и вызывает для каждого найденного функцию.
*Формат:*
aProc aFileMask aDirName ProcessFilesWithMask
* aProc - функция, которая вызывается для каждого файла. В стек при вызове помещается имя файла.
* aFileMask - маска, по которой отбираются файлы, например '*.script'
* aDirName - путь, по которому ищутся файлы.
*Пример:*
[code]
: PrintFileName
 .
;

@ PrintFileName '*.script' 'w:\archi\source\projects\Archi\TestSet\Scripts\' ProcessFilesWithMask
[code]
В результате будет создан файл с имя_скрипта.prn с именами файлов с полными путями.
*Примечание:* Если ни один файл не найден, то функция не будет вызвана ни разу. Ни дирректории, ни ссылки на файлы, ни имена дисков в поиск не попадают. Поиск во вложенных директориях не прозводится. Имя файла передается с полным путем.[panel]
*Пример:*
[code]
 aProc aFileMask aDirName ProcessFilesWithMask
[code]  }
 private
 // private methods
   procedure ProcessFilesWithMask(const aCtx: TtfwContext;
    const aDirName: AnsiString;
    const aFileMask: AnsiString;
    aProc: TtfwWord);
     {* Реализация слова скрипта ProcessFilesWithMask }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwProcessFilesWithMask

// start class TkwProcessFilesWithMask

procedure TkwProcessFilesWithMask.ProcessFilesWithMask(const aCtx: TtfwContext;
  const aDirName: AnsiString;
  const aFileMask: AnsiString;
  aProc: TtfwWord);
//#UC START# *332776E818ED_F43FC392309A_var*
var
 l_SearchRec  : TSearchRec;
 l_FindResult : Integer;
//#UC END# *332776E818ED_F43FC392309A_var*
begin
//#UC START# *332776E818ED_F43FC392309A_impl*
 if not DirectoryExists(aDirName) then
 begin
  Assert(False, Format('Директория %s не существует', [aDirName]));
  Exit;
 end; // if not DirectoryExists(aDirName) then
 l_FindResult := FindFirst(ConcatDirName(aDirName, aFileMask),
                           faAnyFile,
                           l_SearchRec);
 try
  while (l_FindResult = 0) do
  begin
   if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
   begin
    aCtx.rEngine.PushString(ConcatDirName(aDirName, l_SearchRec.Name));
    aProc.DoIt(aCtx);
   end; // if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
   l_FindResult := FindNext(l_SearchRec);
  end; // while l_FindResult = 0 do
 finally
  SysUtils.FindClose(l_SearchRec);
 end;//try..finally
//#UC END# *332776E818ED_F43FC392309A_impl*
end;//TkwProcessFilesWithMask.ProcessFilesWithMask

procedure TkwProcessFilesWithMask.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDirName : AnsiString;
 l_aFileMask : AnsiString;
 l_aProc : TtfwWord;
begin
 try
  l_aDirName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDirName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileMask := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileMask: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aProc := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aProc: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ProcessFilesWithMask(aCtx, l_aDirName, l_aFileMask, l_aProc);
end;//TkwProcessFilesWithMask.DoDoIt

class function TkwProcessFilesWithMask.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessFilesWithMask';
end;//TkwProcessFilesWithMask.GetWordNameForRegister

function TkwProcessFilesWithMask.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwProcessFilesWithMask.GetResultTypeInfo

type
 TkwProcessSubDirs = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ProcessSubDirs
[panel]ProcessSubDirs - перебирает директории в заданной директории и вызывает для каждого найденного функцию.
*Формат:*
aProc aDirName ProcessSubDirs
* aProc - функция, которая вызывается для каждой директории. В стек при вызове помещается имя директории.
* aDirName - путь, по которому ищутся директории.
*Пример:*
[code]
: PrintFileName
 .
;

@ PrintFileName 'w:\archi\source\projects\Archi\TestSet\' ProcessSubDirs
[code]
В результате будет создан файл с имя_скрипта.prn с именами директорий с полными путями.
*Примечание:* Если ни одна директория  не найдена, то функция не будет вызвана ни разу.[panel]
*Пример:*
[code]
 aProc aDirName ProcessSubDirs
[code]  }
 private
 // private methods
   procedure ProcessSubDirs(const aCtx: TtfwContext;
    const aDirName: AnsiString;
    aProc: TtfwWord);
     {* Реализация слова скрипта ProcessSubDirs }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwProcessSubDirs

// start class TkwProcessSubDirs

procedure TkwProcessSubDirs.ProcessSubDirs(const aCtx: TtfwContext;
  const aDirName: AnsiString;
  aProc: TtfwWord);
//#UC START# *3A2CA042D20F_4D6340E72B1A_var*
var
 l_SearchRec : TSearchRec;
 l_FindResult: Integer;
//#UC END# *3A2CA042D20F_4D6340E72B1A_var*
begin
//#UC START# *3A2CA042D20F_4D6340E72B1A_impl*
 if not DirectoryExists(aDirName) then
 begin
  Assert(False, Format('Директория %s не существует', [aDirName]));
  Exit;
 end; // if not DirectoryExists(l_DirName) then
 l_FindResult := FindFirst(ConcatDirName(aDirName, '*.*'),
                           faDirectory ,
                           l_SearchRec);
 try
  while (l_FindResult = 0) do
  begin
   if ((l_SearchRec.Attr and faDirectory) <> 0) and (l_SearchRec.Name <> '.') and (l_SearchRec.Name <> '..') then
   begin
    aCtx.rEngine.PushString(ConcatDirName(aDirName, l_SearchRec.Name));
    aProc.DoIt(aCtx);
   end; // if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
   l_FindResult := FindNext(l_SearchRec);
  end; // while l_FindResult = 0 do
 finally
  SysUtils.FindClose(l_SearchRec);
 end;//try..finally
//#UC END# *3A2CA042D20F_4D6340E72B1A_impl*
end;//TkwProcessSubDirs.ProcessSubDirs

procedure TkwProcessSubDirs.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDirName : AnsiString;
 l_aProc : TtfwWord;
begin
 try
  l_aDirName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDirName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aProc := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aProc: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ProcessSubDirs(aCtx, l_aDirName, l_aProc);
end;//TkwProcessSubDirs.DoDoIt

class function TkwProcessSubDirs.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessSubDirs';
end;//TkwProcessSubDirs.GetWordNameForRegister

function TkwProcessSubDirs.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwProcessSubDirs.GetResultTypeInfo
// start class TtfwFile

constructor TtfwFile.CreateRead(const aFileName: AnsiString);
//#UC START# *4F4FD849026C_4F4FD77B03CC_var*
//#UC END# *4F4FD849026C_4F4FD77B03CC_var*
begin
//#UC START# *4F4FD849026C_4F4FD77B03CC_impl*
 inherited Create;
 f_Filer := Tl3CustomDosFiler.Make(aFileName, l3_fmRead, false, 1000);
 f_Filer.Open;
//#UC END# *4F4FD849026C_4F4FD77B03CC_impl*
end;//TtfwFile.CreateRead

constructor TtfwFile.CreateWrite(const aFileName: AnsiString);
//#UC START# *4F4FD85F033A_4F4FD77B03CC_var*
//#UC END# *4F4FD85F033A_4F4FD77B03CC_var*
begin
//#UC START# *4F4FD85F033A_4F4FD77B03CC_impl*
 inherited Create;
 f_Filer := Tl3CustomDosFiler.Make(aFileName, l3_fmWrite, false, 1000);
 f_Filer.Open;
//#UC END# *4F4FD85F033A_4F4FD77B03CC_impl*
end;//TtfwFile.CreateWrite

class function TtfwFile.MakeRead(const aFileName: AnsiString): ItfwFile;
var
 l_Inst : TtfwFile;
begin
 l_Inst := CreateRead(aFileName);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

class function TtfwFile.MakeWrite(const aFileName: AnsiString): ItfwFile;
var
 l_Inst : TtfwFile;
begin
 l_Inst := CreateWrite(aFileName);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TtfwFile.ReadLn: Il3CString;
//#UC START# *4F4E4E7E0350_4F4FD77B03CC_var*
//#UC END# *4F4E4E7E0350_4F4FD77B03CC_var*
begin
//#UC START# *4F4E4E7E0350_4F4FD77B03CC_impl*
 Result := TtfwCStringFactory.C(f_Filer.ReadLn);
//#UC END# *4F4E4E7E0350_4F4FD77B03CC_impl*
end;//TtfwFile.ReadLn

procedure TtfwFile.WriteLn(const aString: Il3CString);
//#UC START# *4F4E4EA7007D_4F4FD77B03CC_var*
//#UC END# *4F4E4EA7007D_4F4FD77B03CC_var*
begin
//#UC START# *4F4E4EA7007D_4F4FD77B03CC_impl*
 f_Filer.WriteLn(l3PCharLen(aString));
//#UC END# *4F4E4EA7007D_4F4FD77B03CC_impl*
end;//TtfwFile.WriteLn

procedure TtfwFile.WriteChar(aChar: AnsiChar);
//#UC START# *4F4FDC540264_4F4FD77B03CC_var*
//#UC END# *4F4FDC540264_4F4FD77B03CC_var*
begin
//#UC START# *4F4FDC540264_4F4FD77B03CC_impl*
 f_Filer.Write(aChar);
//#UC END# *4F4FDC540264_4F4FD77B03CC_impl*
end;//TtfwFile.WriteChar

function TtfwFile.ReadWStrLn: Tl3WString;
//#UC START# *4F4FE16A0269_4F4FD77B03CC_var*
//#UC END# *4F4FE16A0269_4F4FD77B03CC_var*
begin
//#UC START# *4F4FE16A0269_4F4FD77B03CC_impl*
 Result := f_Filer.ReadLn;
//#UC END# *4F4FE16A0269_4F4FD77B03CC_impl*
end;//TtfwFile.ReadWStrLn

procedure TtfwFile.WriteWStrLn(const aStr: Tl3WString);
//#UC START# *4F4FE19301A1_4F4FD77B03CC_var*
//#UC END# *4F4FE19301A1_4F4FD77B03CC_var*
begin
//#UC START# *4F4FE19301A1_4F4FD77B03CC_impl*
 f_Filer.WriteLn(aStr);
//#UC END# *4F4FE19301A1_4F4FD77B03CC_impl*
end;//TtfwFile.WriteWStrLn

procedure TtfwFile.WriteWStr(const aStr: Tl3WString);
//#UC START# *4F4FE1B40314_4F4FD77B03CC_var*
//#UC END# *4F4FE1B40314_4F4FD77B03CC_var*
begin
//#UC START# *4F4FE1B40314_4F4FD77B03CC_impl*
 f_Filer.Write(aStr);
//#UC END# *4F4FE1B40314_4F4FD77B03CC_impl*
end;//TtfwFile.WriteWStr

function TtfwFile.EOF: Boolean;
//#UC START# *4F50821201E7_4F4FD77B03CC_var*
//#UC END# *4F50821201E7_4F4FD77B03CC_var*
begin
//#UC START# *4F50821201E7_4F4FD77B03CC_impl*
 Result := f_Filer.EOF;
//#UC END# *4F50821201E7_4F4FD77B03CC_impl*
end;//TtfwFile.EOF

procedure TtfwFile.ForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23B7A00EC_4F4FD77B03CC_var*
var
 l_S : Tl3WString;
//#UC END# *52E23B7A00EC_4F4FD77B03CC_var*
begin
//#UC START# *52E23B7A00EC_4F4FD77B03CC_impl*
 while not f_Filer.EOF do
 begin
  l_S := f_Filer.ReadLn;
  if not l3IsNil(l_S) OR not f_Filer.EOF then
  begin
  // - это чтобы не размножались пустые строки в конце файлов
   aCtx.rEngine.Push(TtfwStackValue_C(l_S));
   try
    aLambda.DoIt(aCtx);
   except
    on EtfwBreakIterator do
     break;
    on EtfwBreak do
     break;
    on EtfwContinue do
     continue;
   end;//try..except
  end;//  
 end;//not f_Filer.EOF
//#UC END# *52E23B7A00EC_4F4FD77B03CC_impl*
end;//TtfwFile.ForEach

procedure TtfwFile.ForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E23BB102FA_4F4FD77B03CC_var*
//#UC END# *52E23BB102FA_4F4FD77B03CC_var*
begin
//#UC START# *52E23BB102FA_4F4FD77B03CC_impl*
 TtfwWord(aLambda).RunnerError('Перебор строк от конца файла, не реализован', aCtx);
//#UC END# *52E23BB102FA_4F4FD77B03CC_impl*
end;//TtfwFile.ForEachBack

procedure TtfwFile.Cleanup;
//#UC START# *479731C50290_4F4FD77B03CC_var*
//#UC END# *479731C50290_4F4FD77B03CC_var*
begin
//#UC START# *479731C50290_4F4FD77B03CC_impl*
 f_Filer.Close;
 FreeAndNil(f_Filer);
 inherited;
//#UC END# *479731C50290_4F4FD77B03CC_impl*
end;//TtfwFile.Cleanup
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TFileProcessingPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_OpenRead
 TkwFileOpenRead.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_OpenWrite
 TkwFileOpenWrite.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_EOF
 TkwFileEOF.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_ReadLn
 TkwFileReadLn.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_WriteLn
 TkwFileWriteLn.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_WriteChar
 TkwFileWriteChar.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_WriteStr
 TkwFileWriteStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_ReadLines
 TkwFileReadLines.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_WriteWStr
 TkwFileWriteWStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_ReadWStrLn
 TkwFileReadWStrLn.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация File_WriteWStrLn
 TkwFileWriteWStrLn.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DeleteFile
 TkwDeleteFile.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация RenameFile
 TkwRenameFile.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CopyFilesByMask
 TkwCopyFilesByMask.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CopyFile
 TkwCopyFile.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация PureDir
 TkwPureDir.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DeleteFilesByMask
 TkwDeleteFilesByMask.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ProcessFilesWithMask
 TkwProcessFilesWithMask.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ProcessSubDirs
 TkwProcessSubDirs.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwFile
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwFile));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Char
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiChar));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3PCharLen
 TtfwTypeRegistrator.RegisterType(@tfw_tiWString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.