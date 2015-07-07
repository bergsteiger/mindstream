unit kwPopListerGetSelected;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopListerGetSelected.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_Lister_GetSelected
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
 TkwPopListerGetSelected = {final} class(_kwVTCustomListerFromStackWords_)
 protected
 // realized methods
   procedure DoVTCustomListner(const aCtx: TtfwContext;
     const aLister: TvtCustomLister); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopListerGetSelected
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

type _Instance_R_ = TkwPopListerGetSelected;

{$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}

// start class TkwPopListerGetSelected

procedure TkwPopListerGetSelected.DoVTCustomListner(const aCtx: TtfwContext;
  const aLister: TvtCustomLister);
//#UC START# *4F86A33F0013_51EF8B5C03B2_var*
var
 l_Index: Integer;
//#UC END# *4F86A33F0013_51EF8B5C03B2_var*
begin
//#UC START# *4F86A33F0013_51EF8B5C03B2_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Нужен индекс элемента списка. ', aCtx);
 l_Index := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushBool(aLister.Selected[l_Index]);
//#UC END# *4F86A33F0013_51EF8B5C03B2_impl*
end;//TkwPopListerGetSelected.DoVTCustomListner

class function TkwPopListerGetSelected.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Lister:GetSelected';
end;//TkwPopListerGetSelected.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwVTCustomListerFromStackWords.imp.pas}
{$IfEnd} //not NoScripts

end.