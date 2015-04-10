unit kwVgComboBoxItemHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVgComboBoxItemHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::vg_ComboBox_ItemHeight
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
  vg_listbox,
  tfwScriptingInterfaces,
  vg_scene,
  vgVisualObject,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVGScene

{$If not defined(NoScripts) AND not defined(NoVGScene)}
type
 {$Include ..\ScriptEngine\kwVGComboboxWord.imp.pas}
 TkwVgComboBoxItemHeight = {final} class(_kwVGComboboxWord_)
 protected
 // realized methods
   procedure DoVGComboBox(aCombo: TvgComboBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVgComboBoxItemHeight
{$IfEnd} //not NoScripts AND not NoVGScene

implementation

{$If not defined(NoScripts) AND not defined(NoVGScene)}
uses
  vg_controls
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

type _Instance_R_ = TkwVgComboBoxItemHeight;

{$Include ..\ScriptEngine\kwVGComboboxWord.imp.pas}

// start class TkwVgComboBoxItemHeight

procedure TkwVgComboBoxItemHeight.DoVGComboBox(aCombo: TvgComboBox;
  const aCtx: TtfwContext);
//#UC START# *538DC0740071_538DC0A602C9_var*
//#UC END# *538DC0740071_538DC0A602C9_var*
begin
//#UC START# *538DC0740071_538DC0A602C9_impl*
 aCtx.rEngine.PushInt(Round(aCombo.ItemHeight))
//#UC END# *538DC0740071_538DC0A602C9_impl*
end;//TkwVgComboBoxItemHeight.DoVGComboBox

class function TkwVgComboBoxItemHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:ItemHeight';
end;//TkwVgComboBoxItemHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGComboboxWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.