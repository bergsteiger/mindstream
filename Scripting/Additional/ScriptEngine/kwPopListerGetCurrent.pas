unit kwPopListerGetCurrent;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopListerGetCurrent.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_Lister_GetCurrent
//
// *Формат:*
// {code}
// pop:Lister:GetCurrent
// {code}
// *Описание:* Помещает в стек индекс текущего элемента.
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
  vtLister,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}
 TkwPopListerGetCurrent = {final} class(_kwVTCustomListerFromStackWords_)
  {* *Формат:*
[code]
pop:Lister:GetCurrent
[code]
*Описание:* Помещает в стек индекс текущего элемента. }
 protected
 // realized methods
   procedure DoVTCustomListner(const aCtx: TtfwContext;
     const aLister: TvtCustomLister); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopListerGetCurrent
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopListerGetCurrent;

{$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}

// start class TkwPopListerGetCurrent

procedure TkwPopListerGetCurrent.DoVTCustomListner(const aCtx: TtfwContext;
  const aLister: TvtCustomLister);
//#UC START# *4F86A33F0013_4F86A39F002B_var*
//#UC END# *4F86A33F0013_4F86A39F002B_var*
begin
//#UC START# *4F86A33F0013_4F86A39F002B_impl*
 aCtx.rEngine.PushInt(aLister.Current);
//#UC END# *4F86A33F0013_4F86A39F002B_impl*
end;//TkwPopListerGetCurrent.DoVTCustomListner

class function TkwPopListerGetCurrent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Lister:GetCurrent';
end;//TkwPopListerGetCurrent.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}
{$IfEnd} //not NoScripts

end.