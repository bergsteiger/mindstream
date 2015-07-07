unit kwParaBoolW;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaBoolW.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CurrentEditorWords::Para_BoolW
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
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
 TkwParaBoolW = {final} class(_kwParaFromStackWord_)
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaBoolW
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evCustomEditorWindow,
  k2OpMisc,
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaBoolW;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaBoolW

procedure TkwParaBoolW.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_4F88296A0203_var*
var
 l_Value : Boolean;
 l_Editor: TevCustomEditorWindow;
//#UC END# *4EB27FB803C2_4F88296A0203_var*
begin
//#UC START# *4EB27FB803C2_4F88296A0203_impl*
 if aCtx.rEngine.IsTopObj then
  l_Editor := aCtx.rEngine.PopObj as TevCustomEditorWindow
 else
  Assert(False, 'Не задан редактор!');
 if aCtx.rEngine.IsTopBool then
  l_Value := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задано значение флага!');
 aPara.AsObject.BoolW[aCtx.rEngine.PopInt, k2StartOp(l_Editor.View.Processor)] := l_Value;
//#UC END# *4EB27FB803C2_4F88296A0203_impl*
end;//TkwParaBoolW.DoPara

class function TkwParaBoolW.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:BoolW';
end;//TkwParaBoolW.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.