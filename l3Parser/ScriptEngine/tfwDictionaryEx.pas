unit tfwDictionaryEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryEx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryEx
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwDictionary,
  tfwScriptingInterfaces,
  tfwStreamFactory,
  tfwDictionaryPtrList,
  tfwDictionaryExPrim,
  tfwInitedDictionariesList,
  tfwInitCodeWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDictionaryEx = class(TtfwDictionaryExPrim)
 private
 // private fields
   f_UsedDictionaries : TtfwDictionaryPtrList;
    {* Поле для свойства UsedDictionaries}
   f_FileName : Il3CString;
    {* Поле для свойства FileName}
   f_FileDateTime : TDateTime;
    {* Поле для свойства FileDateTime}
   f_Stream : TtfwStreamFactory;
    {* Поле для свойства Stream}
   f_InitCode : TtfwInitCodeWord;
    {* Поле для свойства InitCode}
   f_ExportedDictionaries : TtfwDictionaryPtrList;
    {* Поле для свойства ExportedDictionaries}
 public
 // realized methods
   procedure AddCodePart(aWord: TtfwWord;
    const aCtx: TtfwContext;
    aSNI: TtfwSuppressNextImmediate);
     {* Добавляет скомпилированный код к текущему компилируемуму слову }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
   function DoGetDRbyCName(const aName: Il3CString): TtfwKeyWord; override;
 public
 // overridden public methods
   function IsValidCode: Boolean; override;
   function UsesDictionary(anOther: TtfwDictionaryExPrim): Boolean; override;
 protected
 // protected methods
   function FindInUsedDictionary(anOther: TtfwDictionary;
     const aName: Il3CString): TtfwKeyWord; virtual;
 public
 // public methods
   procedure RunInitCode(aRunned: TtfwInitedDictionariesList;
     const aCtx: TtfwContext); virtual;
   procedure EnterCode(const aCtx: TtfwContext);
   procedure LeaveCode(const aCtx: TtfwContext);
   procedure UseDictionary(aDictionary: TtfwDictionaryEx);
   constructor Create(aFile: TtfwStreamFactory;
     const aUsed: array of TtfwDictionaryEx); reintroduce; overload; 
   procedure ExportDictionary(aDictionary: TtfwDictionaryEx);
   constructor Create(const aFileName: Il3CString;
     const aUsed: array of TtfwDictionaryEx); overload; 
 public
 // public properties
   property UsedDictionaries: TtfwDictionaryPtrList
     read f_UsedDictionaries;
   property FileName: Il3CString
     read f_FileName;
   property FileDateTime: TDateTime
     read f_FileDateTime;
   property Stream: TtfwStreamFactory
     read f_Stream;
   property InitCode: TtfwInitCodeWord
     read f_InitCode;
   property ExportedDictionaries: TtfwDictionaryPtrList
     read f_ExportedDictionaries;
 end;//TtfwDictionaryEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  Math,
  tfwAutoregisteredDiction,
  l3String,
  tfwDictionaryExWordsPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwDictionaryEx

function TtfwDictionaryEx.FindInUsedDictionary(anOther: TtfwDictionary;
  const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A3A1E7038F_559E8B2E0385_var*
//#UC END# *55A3A1E7038F_559E8B2E0385_var*
begin
//#UC START# *55A3A1E7038F_559E8B2E0385_impl*
 Result := anOther.OwnDRbyCName(aName);
//#UC END# *55A3A1E7038F_559E8B2E0385_impl*
end;//TtfwDictionaryEx.FindInUsedDictionary

procedure TtfwDictionaryEx.RunInitCode(aRunned: TtfwInitedDictionariesList;
  const aCtx: TtfwContext);
//#UC START# *55A3BF0502F8_559E8B2E0385_var*
var
 l_Index : Integer;
 l_D : TtfwDictionary;
 l_KW : TtfwKeyWord;
 l_W : TtfwWord;
//#UC END# *55A3BF0502F8_559E8B2E0385_var*
begin
//#UC START# *55A3BF0502F8_559E8B2E0385_impl*
 if (aRunned.IndexOf(Self) < 0) then
 begin
  aCtx.rStoredValuesStack.StoreDictionary(Self, aCtx);
  // - сохраняем значения переменных
  aRunned.Add(Self);
  // Сначала ЧИСТИМ СВОИ переменные
  for l_Index := 0 to Pred(Self.Count) do
  begin
   l_KW := TtfwKeyWord(Self.Items[l_Index]);
   if (l_KW.Dictionary = Self) then
   begin
    l_W := l_KW.Word;
    if l_W.IsVarLike then
     l_W.InitValue(aCtx);
   end;//l_KW.Dictionary = Self
  end;//for l_Index
  // Потом вызываем других
  if (f_UsedDictionaries <> nil) then
   for l_Index := 0 to Pred(f_UsedDictionaries.Count) do
   begin
    l_D := f_UsedDictionaries.Items[l_Index];
    if (l_D Is TtfwDictionaryEx) then
     TtfwDictionaryEx(l_D).RunInitCode(aRunned, aCtx);
   end;//for l_Index
  if (f_InitCode <> nil) then
   f_InitCode.DoIt(aCtx);
 end;//aRunned.IndexOf(Self) < 0
//#UC END# *55A3BF0502F8_559E8B2E0385_impl*
end;//TtfwDictionaryEx.RunInitCode

procedure TtfwDictionaryEx.EnterCode(const aCtx: TtfwContext);
//#UC START# *55A5294A01E9_559E8B2E0385_var*
//#UC END# *55A5294A01E9_559E8B2E0385_var*
begin
//#UC START# *55A5294A01E9_559E8B2E0385_impl*
 Assert(false, 'Недоделано');
//#UC END# *55A5294A01E9_559E8B2E0385_impl*
end;//TtfwDictionaryEx.EnterCode

procedure TtfwDictionaryEx.LeaveCode(const aCtx: TtfwContext);
//#UC START# *55A5295C02AD_559E8B2E0385_var*
//#UC END# *55A5295C02AD_559E8B2E0385_var*
begin
//#UC START# *55A5295C02AD_559E8B2E0385_impl*
 Assert(false, 'Недоделано');
//#UC END# *55A5295C02AD_559E8B2E0385_impl*
end;//TtfwDictionaryEx.LeaveCode

procedure TtfwDictionaryEx.UseDictionary(aDictionary: TtfwDictionaryEx);
//#UC START# *559F5EBA0249_559E8B2E0385_var*
var
 l_Index : Integer;
 l_D : TtfwDictionaryEx;
//#UC END# *559F5EBA0249_559E8B2E0385_var*
begin
//#UC START# *559F5EBA0249_559E8B2E0385_impl*
 if (aDictionary = Self) then
  Exit;

 Assert(not aDictionary.IsMain);

 if (f_UsedDictionaries = nil) then
  f_UsedDictionaries := TtfwDictionaryPtrList.Create;
  
 if (f_UsedDictionaries.IndexOf(aDictionary) < 0) then
  f_UsedDictionaries.Add(aDictionary);

 if (aDictionary.ExportedDictionaries <> nil) then
  for l_Index := 0 to Pred(aDictionary.ExportedDictionaries.Count) do
  begin
   l_D := aDictionary.ExportedDictionaries.Items[l_Index] As TtfwDictionaryEx;
   if (f_UsedDictionaries.IndexOf(l_D) < 0) then
    f_UsedDictionaries.Add(l_D);
  end;//for l_Index
//#UC END# *559F5EBA0249_559E8B2E0385_impl*
end;//TtfwDictionaryEx.UseDictionary

constructor TtfwDictionaryEx.Create(aFile: TtfwStreamFactory;
  const aUsed: array of TtfwDictionaryEx);
//#UC START# *55A54B4C03BC_559E8B2E0385_var*
//#UC END# *55A54B4C03BC_559E8B2E0385_var*
begin
//#UC START# *55A54B4C03BC_559E8B2E0385_impl*
 Assert(aFile <> nil);
 aFile.SetRefTo(f_Stream);
 Create(TtfwCStringFactory.C(f_Stream.FileName), aUsed);
 if (f_Stream <> nil) then
  f_FileDateTime := f_Stream.FileDateTime;
//#UC END# *55A54B4C03BC_559E8B2E0385_impl*
end;//TtfwDictionaryEx.Create

procedure TtfwDictionaryEx.ExportDictionary(aDictionary: TtfwDictionaryEx);
//#UC START# *55AE59580215_559E8B2E0385_var*
//#UC END# *55AE59580215_559E8B2E0385_var*
begin
//#UC START# *55AE59580215_559E8B2E0385_impl*
 if (aDictionary = Self) then
  Exit;

 Assert(not aDictionary.IsMain);

 if (f_ExportedDictionaries = nil) then
  f_ExportedDictionaries := TtfwDictionaryPtrList.Create;
 if (f_ExportedDictionaries.IndexOf(aDictionary) < 0) then
 begin
  f_ExportedDictionaries.Add(aDictionary);
 end;//f_ExportedDictionaries.IndexOf(aDictionary) < 0
//#UC END# *55AE59580215_559E8B2E0385_impl*
end;//TtfwDictionaryEx.ExportDictionary

constructor TtfwDictionaryEx.Create(const aFileName: Il3CString;
  const aUsed: array of TtfwDictionaryEx);
//#UC START# *55B0E69B0385_559E8B2E0385_var*
var
 l_Index : Integer;
//#UC END# *55B0E69B0385_559E8B2E0385_var*
begin
//#UC START# *55B0E69B0385_559E8B2E0385_impl*
 f_FileName := aFileName;
 f_FileDateTime := 0;
 for l_Index := Low(aUsed) to High(aUsed) do
  UseDictionary(aUsed[l_Index]);
 if (f_InitCode = nil) then
  f_InitCode := TtfwInitCodeWord.Create(Self);
  inherited Create;
//#UC END# *55B0E69B0385_559E8B2E0385_impl*
end;//TtfwDictionaryEx.Create

procedure TtfwDictionaryEx.AddCodePart(aWord: TtfwWord;
  const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate);
//#UC START# *4DB6E3090290_559E8B2E0385_var*
//#UC END# *4DB6E3090290_559E8B2E0385_var*
begin
//#UC START# *4DB6E3090290_559E8B2E0385_impl*
 if (f_InitCode = nil) then
  f_InitCode := TtfwInitCodeWord.Create(Self);
 f_InitCode.AddCodePart(aWord, aCtx, aSNI);
//#UC END# *4DB6E3090290_559E8B2E0385_impl*
end;//TtfwDictionaryEx.AddCodePart

procedure TtfwDictionaryEx.Cleanup;
//#UC START# *479731C50290_559E8B2E0385_var*
//#UC END# *479731C50290_559E8B2E0385_var*
begin
//#UC START# *479731C50290_559E8B2E0385_impl*
 FreeAndNil(f_UsedDictionaries);
 FreeAndNil(f_ExportedDictionaries);
 FreeAndNil(f_InitCode);
 FreeAndNil(f_Stream);
 inherited;
//#UC END# *479731C50290_559E8B2E0385_impl*
end;//TtfwDictionaryEx.Cleanup

function TtfwDictionaryEx.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F465D580021_559E8B2E0385_var*
(*var
 i : Integer;
 l_KW : TTfwKeyWord;*)
//#UC END# *4F465D580021_559E8B2E0385_var*
begin
//#UC START# *4F465D580021_559E8B2E0385_impl*
(* if not IsAxiom then
 begin
  if TtfwAutoregisteredDiction.Instance.FindData(l3PCharLen(aName), i) then
  begin
   l_KW := TtfwAutoregisteredDiction.Instance.Items[i] As TTfwKeyWord;
   Assert((l_KW.Word = nil) OR l_KW.Word.IsForwardDeclaration,
          Format('Слово %s уже существует в базовой аксиоматике', [l3Str(aName)]));
  end;//TtfwAutoregisteredDiction.Instance.FindData(l3PCharLen(aName), i)
 end;//not IsAxiom*)
 Result := inherited DoCheckWord(aName);
//#UC END# *4F465D580021_559E8B2E0385_impl*
end;//TtfwDictionaryEx.DoCheckWord

procedure TtfwDictionaryEx.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_FileName := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwDictionaryEx.ClearFields

function TtfwDictionaryEx.DoGetDRbyCName(const aName: Il3CString): TtfwKeyWord;
//#UC START# *559FF0210296_559E8B2E0385_var*
var
 l_Index : Integer;
//#UC END# *559FF0210296_559E8B2E0385_var*
begin
//#UC START# *559FF0210296_559E8B2E0385_impl*
 Result := inherited DoGetDRbyCName(aName);
 if (Result = nil) then
  if (f_UsedDictionaries <> nil) then
   for l_Index := Pred(f_UsedDictionaries.Count) downto 0 do
   begin
    Result := FindInUsedDictionary(f_UsedDictionaries.Items[l_Index], aName);
    if (Result <> nil) then
     Exit;
   end;//for l_Index
//#UC END# *559FF0210296_559E8B2E0385_impl*
end;//TtfwDictionaryEx.DoGetDRbyCName

function TtfwDictionaryEx.IsValidCode: Boolean;
//#UC START# *55A3E53A00A8_559E8B2E0385_var*
//#UC END# *55A3E53A00A8_559E8B2E0385_var*
begin
//#UC START# *55A3E53A00A8_559E8B2E0385_impl*
 Result := inherited IsValidCode;
 if Result then
  if (f_Stream <> nil) then
   Result := SameValue(f_FileDateTime, f_Stream.FileDateTime);
//#UC END# *55A3E53A00A8_559E8B2E0385_impl*
end;//TtfwDictionaryEx.IsValidCode

function TtfwDictionaryEx.UsesDictionary(anOther: TtfwDictionaryExPrim): Boolean;
//#UC START# *55A4FD6401D3_559E8B2E0385_var*
var
 l_Index : Integer;
//#UC END# *55A4FD6401D3_559E8B2E0385_var*
begin
//#UC START# *55A4FD6401D3_559E8B2E0385_impl*
 Result := inherited UsesDictionary(anOther);
 if not Result then
  if (f_UsedDictionaries <> nil) then
   for l_Index := 0 to Pred(f_UsedDictionaries.Count) do
    if (anOther = f_UsedDictionaries[l_Index]) then
    begin
     Result := true;
     Exit;
    end;//anOther = f_UsedDictionaries[l_Index]
//#UC END# *55A4FD6401D3_559E8B2E0385_impl*
end;//TtfwDictionaryEx.UsesDictionary

{$IfEnd} //not NoScripts

end.