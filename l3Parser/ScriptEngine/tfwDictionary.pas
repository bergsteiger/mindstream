unit tfwDictionary;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwDictionary.pas"
// Начат: 20.04.2011 18:25
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionary
//
// Словарь
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwDictionaryPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDictionary = class(TtfwDictionaryPrim)
  {* Словарь }
 protected
 // property methods
   function pm_GetDRbyCName(const aName: Il3CString): TtfwKeyWord;
 public
 // realized methods
   function CheckWord(const aName: Il3CString): TtfwKeyWord;
 protected
 // overridden protected methods
   procedure InitFields; override;
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 protected
 // protected methods
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; virtual;
   function DoGetDRbyCName(const aName: Il3CString): TtfwKeyWord; virtual;
   function IsAxiom: Boolean; virtual;
   function Add(aWord: TtfwKeyWord): Integer; virtual;
 public
 // public methods
   function AddWord(const aWordName: AnsiString;
     aWordClass: RtfwWord): Boolean; overload; 
   function AddWord(const aWordName: AnsiString;
     aWord: TtfwWord): Boolean; overload; 
   constructor Create; reintroduce;
   function OwnDRbyCName(const aName: Il3CString): TtfwKeyWord;
   function IsMain: Boolean; virtual;
 public
 // public properties
   property DRbyCName[const aName: Il3CString]: TtfwKeyWord
     read pm_GetDRbyCName;
     {* Элемент словаря по его имени }
 end;//TtfwDictionary
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Types,
  l3String,
  Math,
  tfwDictionaryWordsPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwDictionary

function TtfwDictionary.AddWord(const aWordName: AnsiString;
  aWordClass: RtfwWord): Boolean;
//#UC START# *4DAEEDA301CD_4DAEECD90016_var*
var
 l_W : TtfwWord;
 l_KW : TtfwKeyWord;
//#UC END# *4DAEEDA301CD_4DAEECD90016_var*
begin
//#UC START# *4DAEEDA301CD_4DAEECD90016_impl*
 l_W := aWordClass.Create;
 try
  l_KW := TtfwKeyWord.Create(Self, aWordName, l_W);
  try
   Result := Self.Add(l_KW) >= 0;
  finally
   FreeAndNil(l_KW);
  end;//try..finally
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDA301CD_4DAEECD90016_impl*
end;//TtfwDictionary.AddWord

function TtfwDictionary.AddWord(const aWordName: AnsiString;
  aWord: TtfwWord): Boolean;
//#UC START# *4DB5781B0086_4DAEECD90016_var*
var
 l_W : TtfwKeyWord;
//#UC END# *4DB5781B0086_4DAEECD90016_var*
begin
//#UC START# *4DB5781B0086_4DAEECD90016_impl*
 l_W := TtfwKeyWord.Create(Self, aWordName, aWord);
 try
  Result := Self.Add(l_W) >= 0;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DB5781B0086_4DAEECD90016_impl*
end;//TtfwDictionary.AddWord

function TtfwDictionary.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F465D580021_4DAEECD90016_var*
var
 i : Integer;
 l_W : TtfwKeyWord;
//#UC END# *4F465D580021_4DAEECD90016_var*
begin
//#UC START# *4F465D580021_4DAEECD90016_impl*
 if FindData(l3PCharLen(aName), i, SortIndex) then
  Result := TtfwKeyWord(Items[i])
 else
 begin
  l_W := TtfwKeyWord.Create(Self, aName);
  try
   DirectInsert(i, l_W);
   Result := l_W;
  finally
   FreeAndNil(l_W);
  end;//try..finally
 end;//FindData...
//#UC END# *4F465D580021_4DAEECD90016_impl*
end;//TtfwDictionary.DoCheckWord

constructor TtfwDictionary.Create;
//#UC START# *559E655B0290_4DAEECD90016_var*
//#UC END# *559E655B0290_4DAEECD90016_var*
begin
//#UC START# *559E655B0290_4DAEECD90016_impl*
 inherited Create;
//#UC END# *559E655B0290_4DAEECD90016_impl*
end;//TtfwDictionary.Create

function TtfwDictionary.OwnDRbyCName(const aName: Il3CString): TtfwKeyWord;
//#UC START# *559FEFE603D4_4DAEECD90016_var*
var
 i : Integer;
//#UC END# *559FEFE603D4_4DAEECD90016_var*
begin
//#UC START# *559FEFE603D4_4DAEECD90016_impl*
 if FindData(l3PCharLen(aName), i, SortIndex) then
  Result := TtfwKeyWord(Items[i])
 else
  Result := nil;
//#UC END# *559FEFE603D4_4DAEECD90016_impl*
end;//TtfwDictionary.OwnDRbyCName

function TtfwDictionary.DoGetDRbyCName(const aName: Il3CString): TtfwKeyWord;
//#UC START# *559FF0210296_4DAEECD90016_var*
//#UC END# *559FF0210296_4DAEECD90016_var*
begin
//#UC START# *559FF0210296_4DAEECD90016_impl*
 Result := OwnDRbyCName(aName);
//#UC END# *559FF0210296_4DAEECD90016_impl*
end;//TtfwDictionary.DoGetDRbyCName

function TtfwDictionary.IsMain: Boolean;
//#UC START# *55A531FA016A_4DAEECD90016_var*
//#UC END# *55A531FA016A_4DAEECD90016_var*
begin
//#UC START# *55A531FA016A_4DAEECD90016_impl*
 Result := false;
//#UC END# *55A531FA016A_4DAEECD90016_impl*
end;//TtfwDictionary.IsMain

function TtfwDictionary.IsAxiom: Boolean;
//#UC START# *55A7ECD8020D_4DAEECD90016_var*
//#UC END# *55A7ECD8020D_4DAEECD90016_var*
begin
//#UC START# *55A7ECD8020D_4DAEECD90016_impl*
 Result := false;
//#UC END# *55A7ECD8020D_4DAEECD90016_impl*
end;//TtfwDictionary.IsAxiom

function TtfwDictionary.Add(aWord: TtfwKeyWord): Integer;
//#UC START# *55B0E87401FA_4DAEECD90016_var*
//#UC END# *55B0E87401FA_4DAEECD90016_var*
begin
//#UC START# *55B0E87401FA_4DAEECD90016_impl*
 Result := inherited Add(aWord);
//#UC END# *55B0E87401FA_4DAEECD90016_impl*
end;//TtfwDictionary.Add

function TtfwDictionary.pm_GetDRbyCName(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F465A710399_4DAEECD90016get_var*
//#UC END# *4F465A710399_4DAEECD90016get_var*
begin
//#UC START# *4F465A710399_4DAEECD90016get_impl*
 Result := DoGetDRbyCName(aName);
//#UC END# *4F465A710399_4DAEECD90016get_impl*
end;//TtfwDictionary.pm_GetDRbyCName

function TtfwDictionary.CheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F46588B021E_4DAEECD90016_var*
//#UC END# *4F46588B021E_4DAEECD90016_var*
begin
//#UC START# *4F46588B021E_4DAEECD90016_impl*
 Result := DoCheckWord(aName);
//#UC END# *4F46588B021E_4DAEECD90016_impl*
end;//TtfwDictionary.CheckWord

procedure TtfwDictionary.InitFields;
//#UC START# *47A042E100E2_4DAEECD90016_var*
//#UC END# *47A042E100E2_4DAEECD90016_var*
begin
//#UC START# *47A042E100E2_4DAEECD90016_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4DAEECD90016_impl*
end;//TtfwDictionary.InitFields

{$If not defined(DesignTimeLibrary)}
class function TtfwDictionary.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4DAEECD90016_var*
//#UC END# *47A6FEE600FC_4DAEECD90016_var*
begin
//#UC START# *47A6FEE600FC_4DAEECD90016_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4DAEECD90016_impl*
end;//TtfwDictionary.IsCacheable
{$IfEnd} //not DesignTimeLibrary

{$IfEnd} //not NoScripts

end.