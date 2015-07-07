unit kwPopEditorCurrentText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorCurrentText.pas"
// Начат: 20.05.2011 15:01
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_CurrentText
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
 TkwPopEditorCurrentText = class(_kwEditorFromStackTextParaWord_)
 protected
 // realized methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCurrentText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Tags,
  l3Base,
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

type _Instance_R_ = TkwPopEditorCurrentText;

{$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackTextParaWord.imp.pas}
{$IfEnd} //not NoScripts

end.