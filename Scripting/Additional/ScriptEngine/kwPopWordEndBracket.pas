unit kwPopWordEndBracket;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopWordEndBracket.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Word_EndBracket
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
 TkwPopWordEndBracket = {final} class(_kwWordFromStackWord_)
 protected
 // realized methods
   procedure DoWord(aWord: TtfwWord;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopWordEndBracket
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

type _Instance_R_ = TkwPopWordEndBracket;

{$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}

// start class TkwPopWordEndBracket

procedure TkwPopWordEndBracket.DoWord(aWord: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F37B07C0042_53DB8EEC01A9_var*
var
 l_B : RtfwWord;
//#UC END# *4F37B07C0042_53DB8EEC01A9_var*
begin
//#UC START# *4F37B07C0042_53DB8EEC01A9_impl*
 try
  if (aWord = nil) then
   l_B := nil
  else
   l_B := aWord.GetEndBracket(aCtx, true);
 except
  l_B := nil;
 end;//try..except
 if (l_B = nil) then
  aCtx.rEngine.PushString('')
 else
  aCtx.rEngine.PushString(aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(l_B.NameForRegister)]);
//#UC END# *4F37B07C0042_53DB8EEC01A9_impl*
end;//TkwPopWordEndBracket.DoWord

class function TkwPopWordEndBracket.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:EndBracket';
end;//TkwPopWordEndBracket.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.