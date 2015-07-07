unit kwVgComboBoxItemIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVgComboBoxItemIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::vg_ComboBox_ItemIndex
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
 TkwVgComboBoxItemIndex = {final} class(_kwVGComboboxWord_)
 protected
 // realized methods
   procedure DoVGComboBox(aCombo: TvgComboBox;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVgComboBoxItemIndex
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

type _Instance_R_ = TkwVgComboBoxItemIndex;

{$Include ..\ScriptEngine\kwVGComboboxWord.imp.pas}

// start class TkwVgComboBoxItemIndex

procedure TkwVgComboBoxItemIndex.DoVGComboBox(aCombo: TvgComboBox;
  const aCtx: TtfwContext);
//#UC START# *538DC0740071_5411BED60376_var*
//#UC END# *538DC0740071_5411BED60376_var*
begin
//#UC START# *538DC0740071_5411BED60376_impl*
 aCtx.rEngine.PushInt(aCombo.ItemIndex);
//#UC END# *538DC0740071_5411BED60376_impl*
end;//TkwVgComboBoxItemIndex.DoVGComboBox

class function TkwVgComboBoxItemIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:ComboBox:ItemIndex';
end;//TkwVgComboBoxItemIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGComboboxWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.