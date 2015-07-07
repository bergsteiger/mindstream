unit kwCheckVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCheckVar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::MembersWorkingPack::CheckVar
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
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwCheckVarPrim.imp.pas}
 TkwCheckVar = {final} class(_kwCheckVarPrim_)
 protected
 // overridden protected methods
   procedure UnknownWord(var aContext: TtfwContext); override;
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
   procedure DoKeyword(var aContext: TtfwContext;
     aWord: TtfwWord;
     const aFinder: Il3KeywordFinder;
     const aPrevContext: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCheckVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCheckVar,
  kwCompiledCheckVarByRef,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCheckVar;

{$Include ..\ScriptEngine\kwCheckVarPrim.imp.pas}

// start class TkwCheckVar

class function TkwCheckVar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '->';
end;//TkwCheckVar.GetWordNameForRegister

procedure TkwCheckVar.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4F3F9B9A0382_var*
//#UC END# *4DB6F2760023_4F3F9B9A0382_var*
begin
//#UC START# *4DB6F2760023_4F3F9B9A0382_impl*
 DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString);
//#UC END# *4DB6F2760023_4F3F9B9A0382_impl*
end;//TkwCheckVar.UnknownWord

function TkwCheckVar.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F3F9B9A0382_var*
//#UC END# *4DCBD67C0362_4F3F9B9A0382_var*
begin
//#UC START# *4DCBD67C0362_4F3F9B9A0382_impl*
 Result := TkwCompiledCheckVar;
//#UC END# *4DCBD67C0362_4F3F9B9A0382_impl*
end;//TkwCheckVar.CompiledWorkerClass

procedure TkwCheckVar.DoKeyword(var aContext: TtfwContext;
  aWord: TtfwWord;
  const aFinder: Il3KeywordFinder;
  const aPrevContext: TtfwContext);
//#UC START# *53E21481021D_4F3F9B9A0382_var*
//#UC END# *53E21481021D_4F3F9B9A0382_var*
begin
//#UC START# *53E21481021D_4F3F9B9A0382_impl*
 DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString);
//#UC END# *53E21481021D_4F3F9B9A0382_impl*
end;//TkwCheckVar.DoKeyword

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCheckVarPrim.imp.pas}
{$IfEnd} //not NoScripts

end.