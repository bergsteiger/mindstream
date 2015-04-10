unit seWordsInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/seWordsInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::ScriptEngineCore::seWordsInfo
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces
  ;

function GetWordDirectives(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;

// unit methods

function GetWordDirectives(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
//#UC START# *53E10704024E_53E107920007_var*
var
 l_TI : TtfwTypeInfo;
 l_Ms : TtfwWordModifiers;
//#UC END# *53E10704024E_53E107920007_var*
begin
//#UC START# *53E10704024E_53E107920007_impl*
 Result := nil;
 l_TI := aWord.ResultTypeInfo;
 l_Ms := l_TI.Modifiers;
 if (l_Ms <> []) then
 begin
  if (tfw_wmImmediate in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('IMMEDIATE'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmInline in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('INLINE'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmRedefinition in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('REDIFINITION'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmSummoned in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('SUMMONED'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmRealize in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('REALIZE'), TtfwCStringFactory.C(' ')])
  else
  if (tfw_wmOverride in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('OVERRIDE'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmPrivate in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('PRIVATE'), TtfwCStringFactory.C(' ')])
  else
  if (tfw_wmProtected in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('PROTECTED'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmAbstract in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('ABSTRACT'), TtfwCStringFactory.C(' ')])
  else
  if (tfw_wmFinal in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('FINAL'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmLink in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('LINK'), TtfwCStringFactory.C(' ')])
  else
  if (tfw_wmReference in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('REFERENCE'), TtfwCStringFactory.C(' ')]);

  if aWord.IsRightParam(aCtx) then
   Result := l3Cat([Result, TtfwCStringFactory.C('^'), TtfwCStringFactory.C(' ')]);

  if aWord.IsLeftWordRefParam(aCtx) then
   Result := l3Cat([Result, TtfwCStringFactory.C('^@'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmVoid in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('VOID'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmInt in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('INTEGER'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmObj in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('OBJECT'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmStr in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('STRING'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmBool in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('BOOLEAN'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmList in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('ARRAY'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmClass in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('CLASS'), TtfwCStringFactory.C(' ')]);

  if (tfw_wmIntf in l_Ms) then
   Result := l3Cat([Result, TtfwCStringFactory.C('INTERFACE'), TtfwCStringFactory.C(' ')]);
 end;//l_Ms <> []
//#UC END# *53E10704024E_53E107920007_impl*
end;//GetWordDirectives
{$IfEnd} //not NoScripts

end.