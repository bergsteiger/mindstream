unit kwGeneratorsExecute;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGeneratorsExecute.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::generators_Execute
//
// Берёт со стека имя имя входного файла (EVD) и генератор (или цепочку). Затем делает трубу и
// прогоняет через неё файл.
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwGeneratorsExecute = {final} class(_tfwAutoregisteringWord_)
  {* Берёт со стека имя имя входного файла (EVD) и генератор (или цепочку). Затем делает трубу и прогоняет через неё файл. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGeneratorsExecute
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Variant,
  evEvdRd,
  evdNativeWriter,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGeneratorsExecute;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGeneratorsExecute

procedure TkwGeneratorsExecute.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_505AE7590132_var*
var
 l_Filt: Ik2TagGenerator;
 l_InFN: AnsiString;
 l_OutFN: AnsiString;
 l_Reader: TevEvdReader;
 l_Writer: TevdNativeWriter;
//#UC END# *4DAEEDE10285_505AE7590132_var*
begin
//#UC START# *4DAEEDE10285_505AE7590132_impl*
 Assert(aCtx.rEngine.IsTopString, 'generators:Execute - не задано файла');
 l_InFN := aCtx.rEngine.PopDelphiString;
 l_OutFN := aCtx.rCaller.ResolveOutputFilePath(l_InFN);
 l_InFN := aCtx.rCaller.ResolveInputFilePath(l_InFN);
 Assert(FileExists(l_InFN), Format('generators:Execute - входной файл (%s) не найден', [l_InFN]));
 Assert(aCtx.rEngine.IsTopIntf, 'generators:Execute - на стеке нет фильтра (не интерфейс)');
 Assert(Supports(aCtx.rEngine.PopIntf, Ik2TagGenerator, l_Filt), 'generators:Execute - на стеке нет фильтра (не Ik2TagGenerator)');
 l_Reader := TevEvdReader.Make(l_InFN);
 try
  l_Reader.Generator := l_Filt;
  while l_Filt.NextGenerator <> nil do
   l_Filt := l_Filt.NextGenerator;
  l_Writer := TevdNativeWriter.Make(l_OutFN);
  try
   l_Filt.NextGenerator := l_Writer;
   l_Reader.Execute;
  finally
   FreeAndNil(l_Writer);
  end;
 finally
  FreeAndNil(l_Reader);
 end;
//#UC END# *4DAEEDE10285_505AE7590132_impl*
end;//TkwGeneratorsExecute.DoDoIt

class function TkwGeneratorsExecute.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'generators:Execute';
end;//TkwGeneratorsExecute.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.