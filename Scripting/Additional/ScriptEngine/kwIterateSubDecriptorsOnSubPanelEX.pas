unit kwIterateSubDecriptorsOnSubPanelEX;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIterateSubDecriptorsOnSubPanelEX.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::IterateSubDecriptorsOnSubPanelEX
//
// Перебирает все SubDescriptot на SubPanel, которые *могут быть* отрисованы (!). Т.е. проверка на
// Visible не производится. Если это нужно, то можно реализвать в скриптах.
// Формат:
// {code}
// @ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanelEX
// {code}
// aLayerID - слой, в котором производится итерация
// aSubPanel - контрол сабпанели.
// aWord - функция для обработки вида:
// {code}
// PROCEDURE CheckDescription OBJECT IN aSubDescription OBJECT IN aSubPanelSub
// // А здесь обрабатываем полученный aSubDescription
// ;
// {code}
// Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType
// и т.п.
// aSubPanelSub - визуальное представление метки.
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
  kwIterateSubDecriptorsOnSubPanel,
  evSubPanelSub,
  tfwScriptingInterfaces,
  evSubPn
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIterateSubDecriptorsOnSubPanelEX = {final} class(TkwIterateSubDecriptorsOnSubPanel)
  {* Перебирает все SubDescriptot на SubPanel, которые *могут быть* отрисованы (!). Т.е. проверка на Visible не производится. Если это нужно, то можно реализвать в скриптах. 
Формат:
[code]
@ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanelEX
[code]
aLayerID - слой, в котором производится итерация
aSubPanel - контрол сабпанели.
aWord - функция для обработки вида:
[code]
PROCEDURE CheckDescription OBJECT IN aSubDescription OBJECT IN aSubPanelSub
 // А здесь обрабатываем полученный aSubDescription
;
[code]
Для извлечения нужной инфорации из aSubDescription есть набор функций: subdescriptor:GetDrawType и т.п.
aSubPanelSub - визуальное представление метки. }
 protected
 // overridden protected methods
   procedure PushObjData(const aCtx: TtfwContext;
     aSubDescription: TevSubDescriptor;
     aSubPanelSub: TevSubPanelSub); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIterateSubDecriptorsOnSubPanelEX
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evSubPanelSubArray,
  evSubPanelSubCollection
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIterateSubDecriptorsOnSubPanelEX

class function TkwIterateSubDecriptorsOnSubPanelEX.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateSubDecriptorsOnSubPanelEX';
end;//TkwIterateSubDecriptorsOnSubPanelEX.GetWordNameForRegister

procedure TkwIterateSubDecriptorsOnSubPanelEX.PushObjData(const aCtx: TtfwContext;
  aSubDescription: TevSubDescriptor;
  aSubPanelSub: TevSubPanelSub);
//#UC START# *53EDFA0401B8_53EDF0A20129_var*
//#UC END# *53EDFA0401B8_53EDF0A20129_var*
begin
//#UC START# *53EDFA0401B8_53EDF0A20129_impl*
 aCtx.rEngine.PushObj(aSubDescription);
 aCtx.rEngine.PushObj(aSubPanelSub);
//#UC END# *53EDFA0401B8_53EDF0A20129_impl*
end;//TkwIterateSubDecriptorsOnSubPanelEX.PushObjData

{$IfEnd} //not NoScripts

end.