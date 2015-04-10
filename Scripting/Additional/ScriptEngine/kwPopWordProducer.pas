unit kwPopWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopWordProducer.pas"
// Начат: 12.02.2012 19:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Word_Producer
//
// Слово, которое породило при компиляции данное. Таким образом можно узнавать "стереотип"
// заданного слова
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
 TkwPopWordProducer = {final} class(_kwWordFromStackWord_)
  {* Слово, которое породило при компиляции данное. Таким образом можно узнавать "стереотип" заданного слова }
 protected
 // realized methods
   procedure DoWord(aWord: TtfwWord;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWord,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopWordProducer;

{$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}

// start class TkwPopWordProducer

procedure TkwPopWordProducer.DoWord(aWord: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F37B07C0042_4F37D52D0079_var*
//#UC END# *4F37B07C0042_4F37D52D0079_var*
begin
//#UC START# *4F37B07C0042_4F37D52D0079_impl*
 if (aWord = nil) then
  aCtx.rEngine.Push(TtfwStackValue_NULL)
 else
  aCtx.rEngine.Push(TtfwStackValue_C(aWord.WordProducer));
//#UC END# *4F37B07C0042_4F37D52D0079_impl*
end;//TkwPopWordProducer.DoWord

class function TkwPopWordProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Producer';
end;//TkwPopWordProducer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.