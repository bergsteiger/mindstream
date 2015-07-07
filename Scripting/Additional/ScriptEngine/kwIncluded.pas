unit kwIncluded;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIncluded.pas"
// Начат: 05.05.2011 21:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::IncludesAndUses::TkwIncluded
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
  tfwStreamFactory,
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwIncluded = class of TkwIncluded;

 {$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}
 TkwIncluded = class(_kwIncludedPrim_)
 private
 // private fields
   f_FileName : AnsiString;
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   procedure UnknownWord(var aContext: TtfwContext); override;
 public
 // public methods
   constructor Create(const aFileName: AnsiString); reintroduce;
 end;//TkwIncluded
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Parser,
  SysUtils,
  l3Filer,
  l3Types,
  l3Chars,
  kwCompiledIncluded,
  l3Base,
  tfwFileStreamFactory,
  tfwParser,
  tfwParserInterfaces,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIncluded;

{$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}

// start class TkwIncluded

constructor TkwIncluded.Create(const aFileName: AnsiString);
//#UC START# *4DC2E00703AA_4DC2DF5D0167_var*
//#UC END# *4DC2E00703AA_4DC2DF5D0167_var*
begin
//#UC START# *4DC2E00703AA_4DC2DF5D0167_impl*
 Assert(aFileName <> '');
 inherited Create;
 f_FileName := aFileName;
//#UC END# *4DC2E00703AA_4DC2DF5D0167_impl*
end;//TkwIncluded.Create

procedure TkwIncluded.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DC2DF5D0167_var*
var
 l_F : TtfwFileStreamFactory;
//#UC END# *4DAEEDE10285_4DC2DF5D0167_var*
begin
//#UC START# *4DAEEDE10285_4DC2DF5D0167_impl*
 l_F := TtfwFileStreamFactory.Create(f_FileName);
 try
  DoFiler(l_F, aCtx);
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *4DAEEDE10285_4DC2DF5D0167_impl*
end;//TkwIncluded.DoDoIt

function TkwIncluded.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DC2DF5D0167_var*
//#UC END# *4DB6C99F026E_4DC2DF5D0167_var*
begin
//#UC START# *4DB6C99F026E_4DC2DF5D0167_impl*
 Result := nil;
 //Assert(false);
//#UC END# *4DB6C99F026E_4DC2DF5D0167_impl*
end;//TkwIncluded.EndBracket

procedure TkwIncluded.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4DC2DF5D0167_var*
//#UC END# *4DB6F2760023_4DC2DF5D0167_var*
begin
//#UC START# *4DB6F2760023_4DC2DF5D0167_impl*
 try
  inherited;
 except
  on E : Exception do
   l3System.Exception2Log(E);
 end;//try..except
//#UC END# *4DB6F2760023_4DC2DF5D0167_impl*
end;//TkwIncluded.UnknownWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}
{$IfEnd} //not NoScripts

end.