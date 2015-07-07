unit kwPopListerFooterCaption;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopListerFooterCaption.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_Lister_FooterCaption
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
 TkwPopListerFooterCaption = {final} class(_kwVTCustomListerFromStackWords_)
 protected
 // realized methods
   procedure DoVTCustomListner(const aCtx: TtfwContext;
     const aLister: TvtCustomLister); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopListerFooterCaption
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

type _Instance_R_ = TkwPopListerFooterCaption;

{$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}

// start class TkwPopListerFooterCaption

procedure TkwPopListerFooterCaption.DoVTCustomListner(const aCtx: TtfwContext;
  const aLister: TvtCustomLister);
//#UC START# *4F86A33F0013_4F88186D0273_var*
//#UC END# *4F86A33F0013_4F88186D0273_var*
begin
//#UC START# *4F86A33F0013_4F88186D0273_impl*
 aCtx.rEngine.PushString(TvtCustomListerHack(aLister).FooterCaption);
//#UC END# *4F86A33F0013_4F88186D0273_impl*
end;//TkwPopListerFooterCaption.DoVTCustomListner

class function TkwPopListerFooterCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Lister:FooterCaption';
end;//TkwPopListerFooterCaption.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}
{$IfEnd} //not NoScripts

end.