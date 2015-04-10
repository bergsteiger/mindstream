unit kwFilterCleanAutolinkFilter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFilterCleanAutolinkFilter.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::filter_CleanAutolinkFilter
//
// Поскольку TddAutolinkFilter создаётся один на всё приложение, от него нужно отрезать Generator
// после использования. А иначе цепочка сохранится и будет мешать другим тестам.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Archi) AND not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //Archi AND not NoScripts

{$If defined(Archi) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwFilterCleanAutolinkFilter = {final} class(_tfwAutoregisteringWord_)
  {* Поскольку TddAutolinkFilter создаётся один на всё приложение, от него нужно отрезать Generator после использования. А иначе цепочка сохранится и будет мешать другим тестам. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFilterCleanAutolinkFilter
{$IfEnd} //Archi AND not NoScripts

implementation

{$If defined(Archi) AND not defined(NoScripts)}
uses
  Classes
  {$If defined(Archi) AND not defined(Nemesis)}
  ,
  ddAutoLinkFilter
  {$IfEnd} //Archi AND not Nemesis
  ,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //Archi AND not NoScripts

{$If defined(Archi) AND not defined(NoScripts)}

type _Instance_R_ = TkwFilterCleanAutolinkFilter;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFilterCleanAutolinkFilter

procedure TkwFilterCleanAutolinkFilter.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_505C0AD5032A_var*
//#UC END# *4DAEEDE10285_505C0AD5032A_var*
begin
//#UC START# *4DAEEDE10285_505C0AD5032A_impl*
 CleanAutolinkFilter;
//#UC END# *4DAEEDE10285_505C0AD5032A_impl*
end;//TkwFilterCleanAutolinkFilter.DoDoIt

class function TkwFilterCleanAutolinkFilter.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'filter:CleanAutolinkFilter';
end;//TkwFilterCleanAutolinkFilter.GetWordNameForRegister

{$IfEnd} //Archi AND not NoScripts

initialization
{$If defined(Archi) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //Archi AND not NoScripts

end.