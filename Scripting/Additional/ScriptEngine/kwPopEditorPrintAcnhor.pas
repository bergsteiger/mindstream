unit kwPopEditorPrintAcnhor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorPrintAcnhor.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_PrintAcnhor
//
// *Формат:* aTopAnchor anEditorControl pop:editor:PrintAcnhor
// *Описание:* Печатает текущее значение якоря, включая дочерние, позицию, PID параграф и т.п.
// aTopAnchor - true - верхния якорь, false - нижний якорь.
// *Пример:*
// {code}
// true focused:control:push pop:editor:PrintAcnhor
// {code}
// *Результат:* В засимости от значения поля в будет напечатано значение "true" или "false"
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  kwEditorFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorPrintAcnhor = {final scriptword} class(TkwEditorFromStackWord)
  {* *Формат:* aTopAnchor anEditorControl pop:editor:PrintAcnhor
*Описание:* Печатает текущее значение якоря, включая дочерние, позицию, PID параграф и т.п. aTopAnchor - true - верхния якорь, false - нижний якорь.
*Пример:*
[code] 
true focused:control:push pop:editor:PrintAcnhor
[code] 
*Результат:* В засимости от значения поля в будет напечатано значение "true" или "false" }
 private
 // private methods
   procedure SaveAnchor(const aCtx: TtfwContext;
     const anAnchor: InevBasePoint;
     anEditor: TevCustomEditorWindow);
   function CheckBaseLine(const aCtx: TtfwContext;
     const anAnchor: InevBasePoint;
     anEditor: TevCustomEditorWindow): Boolean;
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPrintAcnhor
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorPrintAcnhor

procedure TkwPopEditorPrintAcnhor.SaveAnchor(const aCtx: TtfwContext;
  const anAnchor: InevBasePoint;
  anEditor: TevCustomEditorWindow);
//#UC START# *500925030215_5009071C00FF_var*
var
 l_Anchor : InevBasePoint;
//#UC END# *500925030215_5009071C00FF_var*
begin
//#UC START# *500925030215_5009071C00FF_impl*
 l_Anchor := anAnchor;
 while l_Anchor <> nil do
 begin
  aCtx.rCaller.Print(l3CStr(Format('TagName = %s PID =  %d Position = %d', [l_Anchor.Obj^.AsObject.TagType.AsString, l_Anchor.Obj.PID, l_Anchor.Position])));
  if l_Anchor.Obj.IsVertical then
   aCtx.rCaller.Print(l3CStr(Format('VertPosition = %d', [l_Anchor.VertPosition(anEditor.View, anEditor.View.FormatInfoByPoint(l_Anchor))])));
  aCtx.rCaller.Print(l3CStr(Format('AtStart = %s AtEnd = %s AfterEnd = %s', [BoolToStr(l_Anchor.AtStart, True), BoolToStr(l_Anchor.AtEnd(anEditor.View), True), BoolToStr(l_Anchor.AfterEnd, True)])));
  if l_Anchor.AsLeaf <> nil then
   aCtx.rCaller.Print(l3CStr(l_Anchor.Obj^.Text));
  if CheckBaseLine(aCtx, l_Anchor, anEditor) then Break;
  l_Anchor := l_Anchor.Inner;
 end; // while l_Anchor <> nil do
//#UC END# *500925030215_5009071C00FF_impl*
end;//TkwPopEditorPrintAcnhor.SaveAnchor

function TkwPopEditorPrintAcnhor.CheckBaseLine(const aCtx: TtfwContext;
  const anAnchor: InevBasePoint;
  anEditor: TevCustomEditorWindow): Boolean;
//#UC START# *5009264E0377_5009071C00FF_var*
var
 i       : Integer;
 l_Head  : InevBasePoint;
 l_Inner : InevBasePoint;
//#UC END# *5009264E0377_5009071C00FF_var*
begin
//#UC START# *5009264E0377_5009071C00FF_impl*
 Result := anAnchor.HasBaseLine;
 if Result then
 begin
  aCtx.rCaller.Print(l3CStr('--------------'));
  for i := 0 to anAnchor.Obj^.AsObject.ChildrenCount - 1 do
  begin
   aCtx.rCaller.Print(l3CStr('----'));
   l_Inner := anAnchor.InnerFor(anAnchor.Obj^.ToList[i], l_Head);
   if l_Inner <> nil then
   begin
    SaveAnchor(aCtx, l_Inner, anEditor);
    aCtx.rCaller.Print(l3CStr(Format('Merge Type = %d', [Ord(l_Inner.Obj^.OverlapType)])));
   end; // if l_Inner <> nil then
   if l_Head <> nil then
   begin
    SaveAnchor(aCtx, l_Head, anEditor);
    aCtx.rCaller.Print(l3CStr(Format('Merge Type = %d', [Ord(l_Head.Obj^.OverlapType)])));
   end; // if l_Head <> nil then
   aCtx.rCaller.Print(l3CStr('----'));
  end; // for i := 0 to anAnchor.Obj^.ChildrenCount - 1 do
  aCtx.rCaller.Print(l3CStr('--------------'));
 end; // if anAnchor.HasBaseLine then
//#UC END# *5009264E0377_5009071C00FF_impl*
end;//TkwPopEditorPrintAcnhor.CheckBaseLine

procedure TkwPopEditorPrintAcnhor.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_5009071C00FF_var*
var
 l_Top: Boolean;
//#UC END# *4F4CB81200CA_5009071C00FF_var*
begin
//#UC START# *4F4CB81200CA_5009071C00FF_impl*
 if aCtx.rEngine.IsTopBool then
  l_Top := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задано, какой якорь печатать.');
 if l_Top then
  SaveAnchor(aCtx, anEditor.View.TopAnchor, anEditor)
 else
  SaveAnchor(aCtx, anEditor.View.BottomAnchor(False), anEditor);
  //SaveAnchor(aCtx, anEditor.View.ExperimentalAnchor, anEditor{anEditor.View.BottomAnchor});
//#UC END# *4F4CB81200CA_5009071C00FF_impl*
end;//TkwPopEditorPrintAcnhor.DoWithEditor

class function TkwPopEditorPrintAcnhor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PrintAcnhor';
end;//TkwPopEditorPrintAcnhor.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_PrintAcnhor
 TkwPopEditorPrintAcnhor.RegisterInEngine;
{$IfEnd} //not NoScripts

end.