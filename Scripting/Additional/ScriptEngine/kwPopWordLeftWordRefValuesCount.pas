unit kwPopWordLeftWordRefValuesCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopWordLeftWordRefValuesCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Word_LeftWordRefValuesCount
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
 TkwPopWordLeftWordRefValuesCount = {final} class(_kwWordFromStackWord_)
 protected
 // realized methods
   procedure DoWord(aWord: TtfwWord;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopWordLeftWordRefValuesCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopWordLeftWordRefValuesCount;

{$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}

// start class TkwPopWordLeftWordRefValuesCount

procedure TkwPopWordLeftWordRefValuesCount.DoWord(aWord: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F37B07C0042_53E4A30F0248_var*
//#UC END# *4F37B07C0042_53E4A30F0248_var*
begin
//#UC START# *4F37B07C0042_53E4A30F0248_impl*
 aCtx.rEngine.PushInt(aWord.LeftWordRefValuesCount(aCtx));
//#UC END# *4F37B07C0042_53E4A30F0248_impl*
end;//TkwPopWordLeftWordRefValuesCount.DoWord

class function TkwPopWordLeftWordRefValuesCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:LeftWordRefValuesCount';
end;//TkwPopWordLeftWordRefValuesCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.