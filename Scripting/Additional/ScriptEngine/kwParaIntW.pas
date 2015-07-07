unit kwParaIntW;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaIntW.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CurrentEditorWords::Para_IntW
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
 TkwParaIntW = {final} class(_kwParaFromStackWord_)
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaIntW
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2OpMisc,
  evCustomEditorWindow,
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaIntW;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaIntW

procedure TkwParaIntW.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_4FBC9EAF027B_var*
var
 l_Value  : Integer;
 l_Editor : TevCustomEditorWindow;
//#UC END# *4EB27FB803C2_4FBC9EAF027B_var*
begin
//#UC START# *4EB27FB803C2_4FBC9EAF027B_impl*
 if aCtx.rEngine.IsTopObj then
  l_Editor := aCtx.rEngine.PopObj as TevCustomEditorWindow
 else
  Assert(False, 'Не задан редактор!');
 if aCtx.rEngine.IsTopInt then
  l_Value := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задано значение флага!');
 aPara.AsObject.IntW[aCtx.rEngine.PopInt, k2StartOp(l_Editor.View.Processor)] := l_Value;
//#UC END# *4EB27FB803C2_4FBC9EAF027B_impl*
end;//TkwParaIntW.DoPara

class function TkwParaIntW.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:IntW';
end;//TkwParaIntW.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.