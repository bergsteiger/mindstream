unit kwPopPageControlGetAllPageCaptions;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopPageControlGetAllPageCaptions.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_PageControl_GetAllPageCaptions
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  ElPgCtl,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}
 TkwPopPageControlGetAllPageCaptions = {final} class(_kwPageControlFromStackWord_)
 protected
 // realized methods
   procedure DoPageControl(aControl: TElCustomPageControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopPageControlGetAllPageCaptions
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  l3String,
  l3Interfaces,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}

type _Instance_R_ = TkwPopPageControlGetAllPageCaptions;

{$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}

// start class TkwPopPageControlGetAllPageCaptions

procedure TkwPopPageControlGetAllPageCaptions.DoPageControl(aControl: TElCustomPageControl;
  const aCtx: TtfwContext);
//#UC START# *500014A6023D_500015A40240_var*
var
 l_Captions: AnsiString;
 I: Integer;
//#UC END# *500014A6023D_500015A40240_var*
begin
//#UC START# *500014A6023D_500015A40240_impl*
 l_Captions := '';
 for I := 0 to aControl.PageCount - 1 do
  if aControl.Pages[I].TabVisible then
   if Length(l_Captions) > 0
    then l_Captions := l_Captions + ' | ' + l3Str(aControl.Pages[I].Caption)
    else l_Captions := l3Str(aControl.Pages[I].Caption);

 aCtx.rEngine.PushString(l_Captions);
//#UC END# *500014A6023D_500015A40240_impl*
end;//TkwPopPageControlGetAllPageCaptions.DoPageControl

class function TkwPopPageControlGetAllPageCaptions.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:PageControl:GetAllPageCaptions';
end;//TkwPopPageControlGetAllPageCaptions.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwPageControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.