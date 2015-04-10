unit kwItarateSubDescriptors;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwItarateSubDescriptors.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::ItarateSubDescriptors
//
// Перебирает все SubDescriptot на SubPanel, которые могут быть использованы (!). Такой список
// задается на этапе проектирвоания/изменения компонета. И не зависит от вида отображения.
// Формат:
// {code}
// @ aWord aLayerID aSubPanel ItarateSubDescriptors
// {code}
// aLayerID - слой, в котором производится итерация
// aSubPanel - контрол сабпанели.
// aWord - функция для обработки вида:
// {code}
// PROCEDURE CheckDescription OBJECT IN aSubDescription
// // А здесь обрабатываем полученный aSubDescription
// ;
// {code}
// Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType
// и т.п.
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
  tfwScriptingInterfaces,
  evSubPn,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}
 TkwItarateSubDescriptors = {final} class(_kwSubPanelFromStackWord_)
  {* Перебирает все SubDescriptot на SubPanel, которые могут быть использованы (!). Такой список задается на этапе проектирвоания/изменения компонета. И не зависит от вида отображения.
Формат:
[code]
@ aWord aLayerID aSubPanel ItarateSubDescriptors
[code]
aLayerID - слой, в котором производится итерация
aSubPanel - контрол сабпанели.
aWord - функция для обработки вида:
[code]
PROCEDURE CheckDescription OBJECT IN aSubDescription
 // А здесь обрабатываем полученный aSubDescription
;
[code]
Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType и т.п. }
 protected
 // realized methods
   procedure DoWithSubPanel(aControl: TevCustomSubPanel;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwItarateSubDescriptors
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

type _Instance_R_ = TkwItarateSubDescriptors;

{$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}

// start class TkwItarateSubDescriptors

procedure TkwItarateSubDescriptors.DoWithSubPanel(aControl: TevCustomSubPanel;
  const aCtx: TtfwContext);
//#UC START# *52D6471802DC_52D643C100A8_var*
var
 i        : Integer;
 l_Obj    : TObject;
 l_Layer  : TevSubLayerDescriptor;
 l_Lambda : TtfwWord;
 l_LayerID: Integer;
//#UC END# *52D6471802DC_52D643C100A8_var*
begin
//#UC START# *52D6471802DC_52D643C100A8_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Слой меток не задан.', aCtx);
 l_LayerID := aCtx.rEngine.PopInt;
 RunnerAssert(l_LayerID = 0, 'Не существующее слово.', aCtx);
 
 RunnerAssert(aCtx.rEngine.IsTopObj, 'В итератор не передано слово.', aCtx);
 l_Obj := aCtx.rEngine.PopObj;
 RunnerAssert(l_Obj is TtfwWord, 'В итератор не передано слово.', aCtx);

 l_Lambda := l_Obj as TtfwWord;
 l_Layer := TevSubLayerDescriptor(aControl.SubDescriptors[l_LayerID]);
 RunnerAssert(l_Layer <> nil, 'Нет такого слоя меток.', aCtx);
 for i := 0 to 7 do
 try
  aCtx.rEngine.PushObj(l_Layer.Flags[i]);
  l_Lambda.DoIt(aCtx);
 except
  on EtfwBreakIterator do
   Exit;
 end;//try..except
//#UC END# *52D6471802DC_52D643C100A8_impl*
end;//TkwItarateSubDescriptors.DoWithSubPanel

class function TkwItarateSubDescriptors.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ItarateSubDescriptors';
end;//TkwItarateSubDescriptors.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.