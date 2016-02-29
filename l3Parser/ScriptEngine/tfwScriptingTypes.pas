unit tfwScriptingTypes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwScriptingTypes.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: InternalInterfaces::Category Shared Delphi Low Level::ScriptEngine$Core::tfwScriptingTypes
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwScriptingExceptions,
  tfwTypeInfo,
  l3Interfaces,
  tfwValueTypes
  ;

type
 TtfwValueTypes = tfwValueTypes.TtfwValueTypes;

const
  { TypeInfoExt }
 tfw_tiVoid : TTypeInfo = (Kind : tkUnknown; Name : 'VOID');
 tfw_tiClassRef : TTypeInfo = (Kind : tkUnknown; Name : 'TClass');
 tfw_tiStruct : TTypeInfo = (Kind : tkUnknown; Name : 'Struct');
 tfw_tiString : TTypeInfo = (Kind : tkUnknown; Name : 'STRING');
 tfw_tiWString : TTypeInfo = (Kind : tkUnknown; Name : 'W-STRING');
 tfw_tiNil : TTypeInfo = (Kind : tkUnknown; Name : 'NIL');
 tfw_tiBracket : TTypeInfo = (Kind : tkUnknown; Name : '()');
 tfw_tiAny : TTypeInfo = (Kind : tkUnknown; Name : 'ANY');

type
 TtfwWordModifier = (
   tfw_wmVirtual
 , tfw_wmAbstract
 , tfw_wmFinal
 , tfw_wmSummoned
 , tfw_wmOverride
 , tfw_wmRealize
 , tfw_wmRedefinition
 , tfw_wmRedefineable
 , tfw_wmSealed
 , tfw_wmCanBeMerged // Одноимённые слова с одинаковыми стереотипами МОГУТ склеиваться в одно, как например %CHILDREN.
 , tfw_wmRightWordRef
 , tfw_wmLeftWordRef
 , tfw_wmImmediate
 , tfw_wmInline
 , tfw_wmTreatUnknownAsString
 , tfw_wmCaller
 );//TtfwWordModifier

 TtfwWordModifiers = set of TtfwWordModifier;

 TtfwAccessType = (
   tfw_atNone
 , tfw_atPrivate
 , tfw_atProtected
 , tfw_atPublic
 );//TtfwAccessType

 TtfwLinkType = (
   tfw_ltNone
 , tfw_ltAggregation
 , tfw_ltLink
 , tfw_ltReference
 );//TtfwLinkType

 TtfwWordInfoRec = {$IfDef XE4}record{$Else}object{$EndIf}
  {* Информация о типе }
 public
   rAccessType : TtfwAccessType;
   rModifiers : TtfwWordModifiers;
   rTypeModifiers : TtfwValueTypes;
   rLinkType : TtfwLinkType;
 public
    function Empty: Boolean;
    function Has(aModifier: TtfwWordModifier): Boolean; overload; 
    function Compare(const anOther: TtfwWordInfoRec): Integer;
    function Has(aType: TtfwValueType): Boolean; overload; 
    function Has(anAccess: TtfwAccessType): Boolean; overload; 
    function TypeName: Il3CString;
    function Has(aLinkType: TtfwLinkType): Boolean; overload; 
 end;//TtfwWordInfoRec

 PtfwWordInfoRec = ^TtfwWordInfoRec;


function TtfwWordInfoRec_E: TtfwWordInfoRec;
function TtfwWordInfoRec_C(aTypes: TtfwValueTypes;
     aModifiers: TtfwWordModifiers;
     anAccess: TtfwAccessType;
     aLinkType: TtfwLinkType): TtfwWordInfoRec;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3String,
  tfwScriptingInterfaces
  ;


function TtfwWordInfoRec_E: TtfwWordInfoRec;
//#UC START# *52C1617803A0_52C15D690329_var*
//#UC END# *52C1617803A0_52C15D690329_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *52C1617803A0_52C15D690329_impl*
 Result := TtfwWordInfoRec_C(nil, [], tfw_atNone, tfw_ltNone);
//#UC END# *52C1617803A0_52C15D690329_impl*
end;//TtfwWordInfoRec.E

// start class TtfwWordInfoRec

function TtfwWordInfoRec.Empty: Boolean;
//#UC START# *55716CAC0395_52C15D690329_var*
//#UC END# *55716CAC0395_52C15D690329_var*
begin
//#UC START# *55716CAC0395_52C15D690329_impl*
 Result := (rModifiers = []) AND
           rTypeModifiers.Empty AND
           (rAccessType = tfw_atNone) AND
           (rLinkType = tfw_ltNone);
//#UC END# *55716CAC0395_52C15D690329_impl*
end;//TtfwWordInfoRec.Empty

function TtfwWordInfoRec.Has(aModifier: TtfwWordModifier): Boolean;
//#UC START# *559137130242_52C15D690329_var*
//#UC END# *559137130242_52C15D690329_var*
begin
//#UC START# *559137130242_52C15D690329_impl*
 Result := (aModifier in rModifiers);
//#UC END# *559137130242_52C15D690329_impl*
end;//TtfwWordInfoRec.Has

function TtfwWordInfoRec.Compare(const anOther: TtfwWordInfoRec): Integer;
//#UC START# *55B253BE0033_52C15D690329_var*
var
 l_A : Word;
 l_B : Word;
//#UC END# *55B253BE0033_52C15D690329_var*
begin
//#UC START# *55B253BE0033_52C15D690329_impl*
 Result := Ord(Self.rAccessType) - Ord(anOther.rAccessType);

 if (Result <> 0) then
  Exit;

 Result := Ord(Self.rLinkType) - Ord(anOther.rLinkType);

 if (Result <> 0) then
  Exit;

 Result := Self.rTypeModifiers.Compare(anOther.rTypeModifiers);
  
 if (Result <> 0) then
  Exit;

 l_A := 0;
 l_B := 0;
 Assert(SizeOf(Self.rModifiers) <= SizeOf(l_A));
 l3Move(Self.rModifiers, l_A, SizeOf(Self.rModifiers));

 Assert(SizeOf(anOther.rModifiers) <= SizeOf(l_B));
 l3Move(anOther.rModifiers, l_B, SizeOf(anOther.rModifiers));

 if (l_A < l_B) then
  Result := -1
 else
 if (l_A > l_B) then
  Result := +1
 else
  Result := 0;
  
//#UC END# *55B253BE0033_52C15D690329_impl*
end;//TtfwWordInfoRec.Compare

function TtfwWordInfoRec_C(aTypes: TtfwValueTypes;
       aModifiers: TtfwWordModifiers;
       anAccess: TtfwAccessType;
       aLinkType: TtfwLinkType): TtfwWordInfoRec;
//#UC START# *55B265FD0005_52C15D690329_var*
//#UC END# *55B265FD0005_52C15D690329_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55B265FD0005_52C15D690329_impl*
 Result.rModifiers := aModifiers;
 Result.rAccessType := anAccess;
 Result.rLinkType := aLinkType;

 if Result.Has(tfw_wmRightWordRef) OR
    Result.Has(tfw_wmLeftWordRef) then
  Result.rTypeModifiers := TtfwValueTypes.Make(TypeInfo(TtfwWord))
  // - незачем тут ничего складывать
 else
  Result.rTypeModifiers := aTypes;
//#UC END# *55B265FD0005_52C15D690329_impl*
end;//TtfwWordInfoRec.C

// start class TtfwWordInfoRec

function TtfwWordInfoRec.Has(aType: TtfwValueType): Boolean;
//#UC START# *55B26BCB01BA_52C15D690329_var*
//#UC END# *55B26BCB01BA_52C15D690329_var*
begin
//#UC START# *55B26BCB01BA_52C15D690329_impl*
 Result := rTypeModifiers.Has(aType);
//#UC END# *55B26BCB01BA_52C15D690329_impl*
end;//TtfwWordInfoRec.Has

function TtfwWordInfoRec.Has(anAccess: TtfwAccessType): Boolean;
//#UC START# *55BA4C430110_52C15D690329_var*
//#UC END# *55BA4C430110_52C15D690329_var*
begin
//#UC START# *55BA4C430110_52C15D690329_impl*
 Result := (Self.rAccessType = anAccess);
//#UC END# *55BA4C430110_52C15D690329_impl*
end;//TtfwWordInfoRec.Has

function TtfwWordInfoRec.TypeName: Il3CString;
//#UC START# *55BEFF3A0168_52C15D690329_var*
//#UC END# *55BEFF3A0168_52C15D690329_var*
begin
//#UC START# *55BEFF3A0168_52C15D690329_impl*
 Result := rTypeModifiers.Name;
//#UC END# *55BEFF3A0168_52C15D690329_impl*
end;//TtfwWordInfoRec.TypeName

function TtfwWordInfoRec.Has(aLinkType: TtfwLinkType): Boolean;
//#UC START# *55C23DA10124_52C15D690329_var*
//#UC END# *55C23DA10124_52C15D690329_var*
begin
//#UC START# *55C23DA10124_52C15D690329_impl*
 Result := (Self.rLinkType = aLinkType);
//#UC END# *55C23DA10124_52C15D690329_impl*
end;//TtfwWordInfoRec.Has
{$IfEnd} //not NoScripts


end.