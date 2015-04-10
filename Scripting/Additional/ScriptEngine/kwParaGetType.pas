unit kwParaGetType;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaGetType.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CurrentEditorWords::Para_GetType
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
 TkwParaGetType = {final} class(_kwParaFromStackWord_)
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaGetType
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaGetType;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaGetType

procedure TkwParaGetType.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_50D1CCDE0358_var*
//#UC END# *4EB27FB803C2_50D1CCDE0358_var*
begin
//#UC START# *4EB27FB803C2_50D1CCDE0358_impl*
 aCtx.rEngine.PushObj(aPara.AsObject.TagType);
//#UC END# *4EB27FB803C2_50D1CCDE0358_impl*
end;//TkwParaGetType.DoPara

class function TkwParaGetType.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:GetType';
end;//TkwParaGetType.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.