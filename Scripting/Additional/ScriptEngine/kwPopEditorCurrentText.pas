unit kwPopEditorCurrentText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorCurrentText.pas"
// Начат: 20.05.2011 15:01
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_CurrentText
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
 TkwPopEditorCurrentText = {scriptword} class(TkwEditorFromStackTextParaWord)
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCurrentText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Tags,
  l3Base,
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorCurrentText

procedure TkwPopEditorCurrentText.DoPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0BBD01BF_4DD649D40028_var*
//#UC END# *50BA0BBD01BF_4DD649D40028_var*
begin
//#UC START# *50BA0BBD01BF_4DD649D40028_impl*
 aCtx.rEngine.PushString(aPara.AsObject.PCharLenA[k2_tiText]);
//#UC END# *50BA0BBD01BF_4DD649D40028_impl*
end;//TkwPopEditorCurrentText.DoPara

class function TkwPopEditorCurrentText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CurrentText';
end;//TkwPopEditorCurrentText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_CurrentText
 TkwPopEditorCurrentText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.