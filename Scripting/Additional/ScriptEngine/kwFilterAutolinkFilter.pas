unit kwFilterAutolinkFilter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFilterAutolinkFilter.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::filter_AutolinkFilter
//
// Создаёт на стеке фильтр TddAutolinkFilter (в виде Ik2TagGenerator).
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
 TkwFilterAutolinkFilter = {final} class(_tfwAutoregisteringWord_)
  {* Создаёт на стеке фильтр TddAutolinkFilter (в виде Ik2TagGenerator). }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFilterAutolinkFilter
{$IfEnd} //Archi AND not NoScripts

implementation

{$If defined(Archi) AND not defined(NoScripts)}
uses
  l3Variant
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

type _Instance_R_ = TkwFilterAutolinkFilter;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFilterAutolinkFilter

procedure TkwFilterAutolinkFilter.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_505AE6880096_var*
var
 l_Filt: Ik2TagGenerator;
//#UC END# *4DAEEDE10285_505AE6880096_var*
begin
//#UC START# *4DAEEDE10285_505AE6880096_impl*
 l_Filt := GetAutolinkFilter;
 aCtx.rEngine.PushIntf(l_Filt);
//#UC END# *4DAEEDE10285_505AE6880096_impl*
end;//TkwFilterAutolinkFilter.DoDoIt

class function TkwFilterAutolinkFilter.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'filter:AutolinkFilter';
end;//TkwFilterAutolinkFilter.GetWordNameForRegister

{$IfEnd} //Archi AND not NoScripts

initialization
{$If defined(Archi) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //Archi AND not NoScripts

end.