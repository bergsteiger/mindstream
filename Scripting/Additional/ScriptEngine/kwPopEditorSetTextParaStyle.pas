unit kwPopEditorSetTextParaStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSetTextParaStyle.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SetTextParaStyle
//
// StyleID textpara:SetStyleByID
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackTextParaWord,
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorSetTextParaStyle = {scriptword} class(TkwEditorFromStackTextParaWord)
  {* StyleID textpara:SetStyleByID }
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetTextParaStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSetTextParaStyle

procedure TkwPopEditorSetTextParaStyle.DoPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0BBD01BF_4E60749A01C2_var*
//#UC END# *50BA0BBD01BF_4E60749A01C2_var*
begin
//#UC START# *50BA0BBD01BF_4E60749A01C2_impl*
 if aCtx.rEngine.IsTopInt then
  anEditor.TextPara.Style.ID := aCtx.rEngine.PopInt
 else
  RunnerError('Не задан ID стиля!', aCtx);
//#UC END# *50BA0BBD01BF_4E60749A01C2_impl*
end;//TkwPopEditorSetTextParaStyle.DoPara

class function TkwPopEditorSetTextParaStyle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'textpara:SetStyleByID';
end;//TkwPopEditorSetTextParaStyle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SetTextParaStyle
 TkwPopEditorSetTextParaStyle.RegisterInEngine;
{$IfEnd} //not NoScripts

end.