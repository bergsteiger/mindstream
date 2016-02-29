unit tfwAutoregisteredDiction;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwAutoregisteredDiction.pas"
// Начат: 21.04.2011 20:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwAutoregisteredDiction
//
// Словарь с базовой аксиоматикой
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwDictionaryEx,
  tfwStandardDictionary,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwAutoregisteredDiction = class(TtfwStandardDictionary)
  {* Словарь с базовой аксиоматикой }
 private
 // private fields
   f_AllAxiomaticsDefined : Boolean;
    {* Поле для свойства AllAxiomaticsDefined}
 protected
 // property methods
   procedure pm_SetAllAxiomaticsDefined(aValue: Boolean); virtual;
 protected
 // overridden protected methods
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
   function IsAxiom: Boolean; override;
   function Add(aWord: TtfwKeyWord): Integer; override;
 public
 // public methods
   constructor Create; reintroduce;
   function DictionaryByWord(const aWord: Il3CString): TtfwDictionaryEx;
   function CheckDictionaryByWordAndUse(const aWord: Il3CString): Boolean;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property AllAxiomaticsDefined: Boolean
     read f_AllAxiomaticsDefined
     write pm_SetAllAxiomaticsDefined;
 public
 // singleton factory method
   class function Instance: TtfwAutoregisteredDiction;
    {- возвращает экземпляр синглетона. }
 end;//TtfwAutoregisteredDiction
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  tfwCStringFactory,
  tfwStandardDictionaries,
  l3String,
  SysUtils,
  l3Chars
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwAutoregisteredDiction

var g_TtfwAutoregisteredDiction : TtfwAutoregisteredDiction = nil;

procedure TtfwAutoregisteredDictionFree;
begin
 l3Free(g_TtfwAutoregisteredDiction);
end;

class function TtfwAutoregisteredDiction.Instance: TtfwAutoregisteredDiction;
begin
 if (g_TtfwAutoregisteredDiction = nil) then
 begin
  l3System.AddExitProc(TtfwAutoregisteredDictionFree);
  g_TtfwAutoregisteredDiction := Create;
 end;
 Result := g_TtfwAutoregisteredDiction;
end;


constructor TtfwAutoregisteredDiction.Create;
//#UC START# *559E658901B3_4DB05FF60115_var*
//#UC END# *559E658901B3_4DB05FF60115_var*
begin
//#UC START# *559E658901B3_4DB05FF60115_impl*
 inherited Create(TtfwCStringFactory.C('axiom:axiom'), []);
 TtfwStandardDictionaries.Instance.Add(Self);
//#UC END# *559E658901B3_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.Create

function TtfwAutoregisteredDiction.DictionaryByWord(const aWord: Il3CString): TtfwDictionaryEx;
//#UC START# *55B22CD10358_4DB05FF60115_var*

const
 cDot : AnsiChar = '.';
 
 procedure Split(const aSt: Il3CString; C: AnsiChar; var P, S: Il3CString);
 var
  l_St : Il3CString;
 begin//Split
  l_St := aSt;
  while l3Starts(l3PCharLen(PAnsiChar(@C), 1), l3PCharLen(l_St), true) do
   l3Delete(l_St, 0, 1);
  l3Split(l_St, C, P, S);
  while l3Starts(l3PCharLen(PAnsiChar(@C), 1), l3PCharLen(S), true) do
   l3Delete(S, 0, 1);
  while l3Starts(l3PCharLen(PAnsiChar(@cDot), 1), l3PCharLen(P), true) do
   l3Delete(P, 0, 1);
  while l3Starts(l3PCharLen(PAnsiChar(@cDot), 1), l3PCharLen(S), true) do
   l3Delete(S, 0, 1);
  while not l3IsNil(P) AND not(l3Char(P, 0) in cc_ANSILetter) do
   l3Delete(P, 0, 1);
 end;//Split

const
 cSep : AnsiChar = ':';
var
 l_P : Il3CString;
 l_S : Il3CString;
 l_D : TtfwStandardDictionary;
//#UC END# *55B22CD10358_4DB05FF60115_var*
begin
//#UC START# *55B22CD10358_4DB05FF60115_impl*
 Result := Self;
 Split(aWord, cSep, l_P, l_S);
 if not l3IsNil(l_P) AND not l3IsNil(l_S) then
 begin
  if l3Same(l_P, l3PCharLen('pop'), true)
     OR l3Same(l_P, l3PCharLen('current'), true)
     OR l3Same(l_P, l3PCharLen('focused'), true)
     OR l3Same(l_P, l3PCharLen('byname'), true)
     then
  begin
   Split(l_S, cSep, l_P, l_S);
  end;//l3Same(l_P, l3PCharLen('pop'), true)
  if not l3IsNil(l_P) AND not l3IsNil(l_S) then
  begin
   if not l3Starts(l3PCharLen(cSep), l3PCharLen(l_S), true) then
   begin
    l_D := TtfwStandardDictionaries.Instance.CheckDictionary(TtfwCStringFactory.C(l3Cat('axiom:', l_P)));
    Assert(l_D <> nil);
    //if not l3Same(l_P, l3PCharLen('^'), true) then
    //if not l3Same(l_P, l3PCharLen('='), true) then
    if not l3Same(l_P, l3PCharLen('class'), true) then
    if not l3Same(l_P, l3PCharLen('guid'), true) then
    if not l3Same(l_P, l3PCharLen('object'), true) then
    if not l3Same(l_P, l3PCharLen('interface'), true) then
    if not l3Same(l_P, l3PCharLen('string'), true) then
    if not l3Same(l_P, l3PCharLen('strings'), true) then
    if not l3Same(l_P, l3PCharLen('w-string'), true) then
    if not l3Same(l_P, l3PCharLen('wstring'), true) then
    if not l3Same(l_P, l3PCharLen('text'), true) then
    if not l3Same(l_P, l3PCharLen('file'), true) then
    if not l3Same(l_P, l3PCharLen('integer'), true) then
    if not l3Same(l_P, l3PCharLen('array'), true) then
    if not l3Same(l_P, l3PCharLen('exception'), true) then
    if not l3Same(l_P, l3PCharLen('char'), true) then
    begin
     Result := l_D;
    end;//not l3Same(l_P, l3PCharLen('class'), true)..
   end;//not l3Starts(l3PCharLen(cSep), l3PCharLen(l_S), true)
  end;//not l3IsNil(l_S)
 end//not l3IsNil(l_S)
 else
 begin
  Split(aWord, cDot, l_P, l_S);
  if not l3IsNil(l_P) AND not l3IsNil(l_S) then
  begin
   l_D := TtfwStandardDictionaries.Instance.CheckDictionary(TtfwCStringFactory.C(l3Cat('axiom:', l_P)));
   Result := l_D;
  end;//not l3IsNil(l_P) AND not l3IsNil(l_S)
 end;//not l3IsNil(l_P) AND not l3IsNil(l_S)
 Assert(Result <> nil);
//#UC END# *55B22CD10358_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.DictionaryByWord

function TtfwAutoregisteredDiction.CheckDictionaryByWordAndUse(const aWord: Il3CString): Boolean;
//#UC START# *55B22D3C019E_4DB05FF60115_var*
var
 l_DtoAdd : TtfwDictionaryEx;
//#UC END# *55B22D3C019E_4DB05FF60115_var*
begin
//#UC START# *55B22D3C019E_4DB05FF60115_impl*
 Result := false;
 if (Self.DRbyCName[aWord] <> nil) then
  Result := true
 else
 begin
  l_DtoAdd := DictionaryByWord(aWord);
  if (l_DtoAdd <> nil) then
  begin
   if (l_DtoAdd <> Self) then
   begin
    if (l_DtoAdd.DRbyCName[aWord] <> nil) then
    begin
     Result := true;
     Self.UseDictionary(l_DtoAdd);
     Self.ExportDictionary(l_DtoAdd);
    end;//l_DtoAdd.DRbyCName[aWord] <> nil
   end;//l_DtoAdd <> Self
  end;//l_DtoAdd <> nil
 end;//Self.DRbyCName[aWord] <> nil
//#UC END# *55B22D3C019E_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.CheckDictionaryByWordAndUse

procedure TtfwAutoregisteredDiction.pm_SetAllAxiomaticsDefined(aValue: Boolean);
//#UC START# *52EF85600031_4DB05FF60115set_var*
//#UC END# *52EF85600031_4DB05FF60115set_var*
begin
//#UC START# *52EF85600031_4DB05FF60115set_impl*
 Assert(not f_AllAxiomaticsDefined OR aValue);
 f_AllAxiomaticsDefined := aValue;
//#UC END# *52EF85600031_4DB05FF60115set_impl*
end;//TtfwAutoregisteredDiction.pm_SetAllAxiomaticsDefined

class function TtfwAutoregisteredDiction.Exists: Boolean;
 {-}
begin
 Result := g_TtfwAutoregisteredDiction <> nil;
end;//TtfwAutoregisteredDiction.Exists

function TtfwAutoregisteredDiction.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F465D580021_4DB05FF60115_var*
var
 i : Integer;
 l_W : TtfwKeyWord;
 l_DtoAdd : TtfwDictionaryEx;
//#UC END# *4F465D580021_4DB05FF60115_var*
begin
//#UC START# *4F465D580021_4DB05FF60115_impl*
 l_DtoAdd := DictionaryByWord(aName);
 if l_DtoAdd.FindData(l3PCharLen(aName), i, l_DtoAdd.SortIndex) then
  Result := TtfwKeyWord(l_DtoAdd.Items[i])
 else
 begin
  l_W := TtfwKeyWord.Create(l_DtoAdd, aName);
  try
   //l_DtoAdd.DirectInsert(i, l_W);
   l_DtoAdd.Insert(i, l_W);
   Result := l_W;
  finally
   FreeAndNil(l_W);
  end;//try..finally
 end;//FindData...
//#UC END# *4F465D580021_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.DoCheckWord

procedure TtfwAutoregisteredDiction.ClearFields;
//#UC START# *5000565C019C_4DB05FF60115_var*
//#UC END# *5000565C019C_4DB05FF60115_var*
begin
//#UC START# *5000565C019C_4DB05FF60115_impl*
 inherited;
 f_AllAxiomaticsDefined := false;
//#UC END# *5000565C019C_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.ClearFields

function TtfwAutoregisteredDiction.IsAxiom: Boolean;
//#UC START# *55A7ECD8020D_4DB05FF60115_var*
//#UC END# *55A7ECD8020D_4DB05FF60115_var*
begin
//#UC START# *55A7ECD8020D_4DB05FF60115_impl*
 Result := true;
//#UC END# *55A7ECD8020D_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.IsAxiom

function TtfwAutoregisteredDiction.Add(aWord: TtfwKeyWord): Integer;
//#UC START# *55B0E87401FA_4DB05FF60115_var*
var
 l_DtoAdd : TtfwDictionaryEx;
//#UC END# *55B0E87401FA_4DB05FF60115_var*
begin
//#UC START# *55B0E87401FA_4DB05FF60115_impl*
 l_DtoAdd := DictionaryByWord(aWord.AsCStr);
 Assert(l_DtoAdd <> nil);
 if (l_DtoAdd = Self) then
  Result := inherited Add(aWord)
 else
 begin
  aWord.ChangeDictionary(l_DtoAdd);
  Result := l_DtoAdd.Add(aWord);
 end;//l_D = Self
//#UC END# *55B0E87401FA_4DB05FF60115_impl*
end;//TtfwAutoregisteredDiction.Add

{$IfEnd} //not NoScripts

end.