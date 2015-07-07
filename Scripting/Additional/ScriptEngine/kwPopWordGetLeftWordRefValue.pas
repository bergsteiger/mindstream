unit kwPopWordGetLeftWordRefValue;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopWordGetLeftWordRefValue.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Word_GetLeftWordRefValue
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
 TkwPopWordGetLeftWordRefValue = {final} class(_kwWordFromStackWord_)
 protected
 // realized methods
   procedure DoWord(aWord: TtfwWord;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopWordGetLeftWordRefValue
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

type _Instance_R_ = TkwPopWordGetLeftWordRefValue;

{$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}

// start class TkwPopWordGetLeftWordRefValue

procedure TkwPopWordGetLeftWordRefValue.DoWord(aWord: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F37B07C0042_53E4A37303BC_var*
var
 l_Index : Integer;
//#UC END# *4F37B07C0042_53E4A37303BC_var*
begin
//#UC START# *4F37B07C0042_53E4A37303BC_impl*
 l_Index := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushObj(aWord.GetLeftWordRefValue(aCtx, l_Index));
//#UC END# *4F37B07C0042_53E4A37303BC_impl*
end;//TkwPopWordGetLeftWordRefValue.DoWord

class function TkwPopWordGetLeftWordRefValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:GetLeftWordRefValue';
end;//TkwPopWordGetLeftWordRefValue.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.