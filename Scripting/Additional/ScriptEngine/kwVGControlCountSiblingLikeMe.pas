unit kwVgControlCountSiblingLikeMe;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVgControlCountSiblingLikeMe.pas"
// Начат: 13.12.2011 18:59
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::vg_control_CountSiblingLikeMe
//
// Считает количество соседей, таких же как мы
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
 TkwVgControlCountSiblingLikeMe = class(_kwVGVisualObjectWord_)
  {* Считает количество соседей, таких же как мы }
 protected
 // realized methods
   procedure DoVisualObject(anObject: TvgVisualObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVgControlCountSiblingLikeMe
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

type _Instance_R_ = TkwVgControlCountSiblingLikeMe;

{$Include ..\ScriptEngine\kwVGVisualObjectWord.imp.pas}

// start class TkwVgControlCountSiblingLikeMe

procedure TkwVgControlCountSiblingLikeMe.DoVisualObject(anObject: TvgVisualObject;
  const aCtx: TtfwContext);
//#UC START# *4EE605B00380_4EE768070088_var*
var
 l_Count : Integer;
 l_Index : Integer;
 l_Ow    : TComponent;
 l_C     : TComponent;
//#UC END# *4EE605B00380_4EE768070088_var*
begin
//#UC START# *4EE605B00380_4EE768070088_impl*
 l_Count := 0;
 l_Ow := anObject.Owner;
 for l_Index := 0 to Pred(l_Ow.ComponentCount) do
 begin
  l_C := l_Ow.Components[l_Index];
  if l_C.InheritsFrom(anObject.ClassType) then
   Inc(l_Count);
 end;//for l_Index
 aCtx.rEngine.PushInt(l_Count);
//#UC END# *4EE605B00380_4EE768070088_impl*
end;//TkwVgControlCountSiblingLikeMe.DoVisualObject

class function TkwVgControlCountSiblingLikeMe.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vg:control:CountSiblingLikeMe';
end;//TkwVgControlCountSiblingLikeMe.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVGScene

initialization
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGVisualObjectWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

end.