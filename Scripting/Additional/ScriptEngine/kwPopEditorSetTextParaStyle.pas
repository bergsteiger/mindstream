unit kwPopEditorSetTextParaStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSetTextParaStyle.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SetTextParaStyle
//
// StyleID textpara:SetStyleByID
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
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}
 TkwPopEditorSetTextParaStyle = class(_kwEditorFromStackTextParaWord_)
  {* StyleID textpara:SetStyleByID }
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetTextParaStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  LeafPara_Const,
  TextPara_Const,
  CommentPara_Const,
  Windows,
  evParaTools,
  evOp,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorSetTextParaStyle;

{$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}

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
  RunnerAssert(False, 'Не задан ID стиля!', aCtx);
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
 {$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}
{$IfEnd} //not NoScripts

end.