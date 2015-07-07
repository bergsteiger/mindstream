unit kwPopWordName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopWordName.pas"
// Начат: 12.02.2012 23:19
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Word_Name
//
// Имя слова скрипта
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
 TkwPopWordName = {final} class(_kwWordFromStackWord_)
  {* Имя слова скрипта }
 protected
 // realized methods
   procedure DoWord(aWord: TtfwWord;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopWordName
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

type _Instance_R_ = TkwPopWordName;

{$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}

// start class TkwPopWordName

procedure TkwPopWordName.DoWord(aWord: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F37B07C0042_4F38107300B1_var*
//#UC END# *4F37B07C0042_4F38107300B1_var*
begin
//#UC START# *4F37B07C0042_4F38107300B1_impl*
 if (aWord = nil) then
  aCtx.rEngine.PushString('??? Unexisting word ???')
 else
 if (aWord.Key = nil) then
  aCtx.rEngine.PushString('??? Unexisting word ??? ' + aWord.ClassName)
 else
  aCtx.rEngine.PushString(aWord.Key.AsCStr);
//#UC END# *4F37B07C0042_4F38107300B1_impl*
end;//TkwPopWordName.DoWord

class function TkwPopWordName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Name';
end;//TkwPopWordName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.