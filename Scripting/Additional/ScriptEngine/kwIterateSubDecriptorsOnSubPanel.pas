unit kwIterateSubDecriptorsOnSubPanel;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIterateSubDecriptorsOnSubPanel.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::IterateSubDecriptorsOnSubPanel
//
// Перебирает все SubDescriptot на SubPanel, которые *могут быть* отрисованы (!). Т.е. проверка на
// Visible не производится. Если это нужно, то можно реализвать в скриптах.
// Формат:
// {code}
// @ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanel
// {code}
// aLayerID - слой, в котором производится итерация
// aSubPanel - контрол сабпанели.
// aWord - функция для обработки вида:
// {code}
// PROCEDURE CheckDescription OBJECT IN aSubDescription INTEGER IN aHandle
// // А здесь обрабатываем полученный aSubDescription
// ;
// {code}
// Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType
// и т.п.
// aHandle - номер саба, к которому рисуется метка.
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
  evSubPanelSub,
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
 TkwIterateSubDecriptorsOnSubPanel = {final} class(_kwSubPanelFromStackWord_)
  {* Перебирает все SubDescriptot на SubPanel, которые *могут быть* отрисованы (!). Т.е. проверка на Visible не производится. Если это нужно, то можно реализвать в скриптах. 
Формат:
[code]
@ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanel
[code]
aLayerID - слой, в котором производится итерация
aSubPanel - контрол сабпанели.
aWord - функция для обработки вида:
[code]
PROCEDURE CheckDescription OBJECT IN aSubDescription INTEGER IN aHandle
 // А здесь обрабатываем полученный aSubDescription
;
[code]
Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType и т.п.
aHandle - номер саба, к которому рисуется метка. }
 protected
 // realized methods
   procedure DoWithSubPanel(aControl: TevCustomSubPanel;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 protected
 // protected methods
   procedure PushObjData(const aCtx: TtfwContext;
     aSubDescription: TevSubDescriptor;
     aSubPanelSub: TevSubPanelSub); virtual;
 end;//TkwIterateSubDecriptorsOnSubPanel
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evSubPanelSubCollection,
  evSubPanelSubArray,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIterateSubDecriptorsOnSubPanel;

{$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}

// start class TkwIterateSubDecriptorsOnSubPanel

procedure TkwIterateSubDecriptorsOnSubPanel.PushObjData(const aCtx: TtfwContext;
  aSubDescription: TevSubDescriptor;
  aSubPanelSub: TevSubPanelSub);
//#UC START# *53EDFA0401B8_52D78486017B_var*
//#UC END# *53EDFA0401B8_52D78486017B_var*
begin
//#UC START# *53EDFA0401B8_52D78486017B_impl*
 aCtx.rEngine.PushObj(aSubDescription);
 aCtx.rEngine.PushInt(aSubPanelSub.Handle);
//#UC END# *53EDFA0401B8_52D78486017B_impl*
end;//TkwIterateSubDecriptorsOnSubPanel.PushObjData

procedure TkwIterateSubDecriptorsOnSubPanel.DoWithSubPanel(aControl: TevCustomSubPanel;
  const aCtx: TtfwContext);
//#UC START# *52D6471802DC_52D78486017B_var*
var
 i               : Integer;
 k               : Integer;
 l_Obj           : TObject;
 l_Lambda        : TtfwWord;
 l_SubArray      : TevSubPanelSubArray;
 l_Collection    : TevSubPanelSubCollection;
 l_SubDescriptor : TevSubDescriptor;
//#UC END# *52D6471802DC_52D78486017B_var*
begin
//#UC START# *52D6471802DC_52D78486017B_impl*
 RunnerAssert(aCtx.rEngine.IsTopObj, 'В итератор не передано слово.', aCtx);
 l_Obj := aCtx.rEngine.PopObj;
 RunnerAssert(l_Obj is TtfwWord, 'В итератор не передано слово.', aCtx);

 l_Lambda := l_Obj as TtfwWord;
 l_Collection := aControl.GetSubPanelSubCollection;
 for i := 0 to l_Collection.Count - 1 do
 try
  l_SubArray := l_Collection.Items[i];
  {$IFDEF NoScripts}
  l_SubDescriptor := nil;
  {$ELSE}
  l_SubDescriptor := aControl.SubDescriptors[l_SubArray.Handle];
  {$ENDIF NoScripts}
  if l_SubDescriptor <> nil then
   for k := 0 to l_SubArray.Count - 1 do
   begin
    PushObjData(aCtx, l_SubDescriptor, l_SubArray.Items[k]);
    l_Lambda.DoIt(aCtx);
   end; // for k := 0 to l_SubArray.Count - 1 do
 except
  on EtfwBreakIterator do
   Exit;
 end;//try..except
//#UC END# *52D6471802DC_52D78486017B_impl*
end;//TkwIterateSubDecriptorsOnSubPanel.DoWithSubPanel

class function TkwIterateSubDecriptorsOnSubPanel.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateSubDecriptorsOnSubPanel';
end;//TkwIterateSubDecriptorsOnSubPanel.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSubPanelFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.