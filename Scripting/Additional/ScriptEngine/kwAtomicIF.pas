unit kwAtomicIF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAtomicIF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwAtomicIF
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
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwAtomicIF = class(_tfwWordWorker_)
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAtomicIF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledIF,
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

type _Instance_R_ = TkwAtomicIF;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwAtomicIF

function TkwAtomicIF.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F2176FF03D3_var*
//#UC END# *4DCBD67C0362_4F2176FF03D3_var*
begin
//#UC START# *4DCBD67C0362_4F2176FF03D3_impl*
 Assert(false, 'Не должны сюда попадать');
 Result := nil;
 //Result := TkwCompiledAtomicIF;
//#UC END# *4DCBD67C0362_4F2176FF03D3_impl*
end;//TkwAtomicIF.CompiledWorkerClass

class function TkwAtomicIF.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F2176FF03D3_var*
//#UC END# *4DB0614603C8_4F2176FF03D3_var*
begin
//#UC START# *4DB0614603C8_4F2176FF03D3_impl*
 Result := '?';
//#UC END# *4DB0614603C8_4F2176FF03D3_impl*
end;//TkwAtomicIF.GetWordNameForRegister

function TkwAtomicIF.MakeCompiledWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_4F2176FF03D3_var*
//#UC END# *5284D8180211_4F2176FF03D3_var*
begin
//#UC START# *5284D8180211_4F2176FF03D3_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Допустим только один параметр после слова',
                aContext);
 Result := TkwCompiledIF.Create(aCompiled.GetCode(aContext)[0], nil);
//#UC END# *5284D8180211_4F2176FF03D3_impl*
end;//TkwAtomicIF.MakeCompiledWordWorker

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.