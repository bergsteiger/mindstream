unit kwVgControlHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVgControlHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::vg_control_Height
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  vgVisualObject,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}
type
 {$Include ..\ScriptEngine\kwVGVisualObjectWord.imp.pas}
 TkwVgControlHeight = {final} class(_kwVGVisualObjectWord_)
 protected
 // realized methods
   procedure DoVisualObject(anObject: TvgVisualObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVgControlHeight
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  vg_controls,
  vg_listbox,
  vg_scene
  {$If not defined(NoVCM)}
  ,
  vcmForm
  {$IfEnd} //not NoVCM
  ,
  afwFacade,
  Controls,
  Windows,
  Forms,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}

type _Instance_R_ = TkwVgControlHeight;

{$Include ..\ScriptEngine\kwVGVisualObjectWord.imp.pas}

// start class TkwVgControlHeight

procedure TkwVgControlHeight.DoVisualObject(anObject: TvgVisualObject;
  const aCtx: TtfwContext);
//#UC START# *4EE605B00380_538DCBBE031A_var*
//#UC END# *4EE605B00380_538DCBBE031A_var*
begin
//#UC START# *4EE605B00380_538DCBBE031A_impl*
 aCtx.rEngine.PushInt(Round(anObject.Height));
//#UC END# *4EE605B00380_538DCBBE031A_impl*
end;//TkwVgControlHeight.DoVisualObject

class function TkwVgControlHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:Height';
end;//TkwVgControlHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGVisualObjectWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.