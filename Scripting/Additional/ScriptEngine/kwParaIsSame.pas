unit kwParaIsSame;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaIsSame.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CurrentEditorWords::Para_IsSame
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
 TkwParaIsSame = {final} class(_kwParaFromStackWord_)
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaIsSame
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaIsSame;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaIsSame

procedure TkwParaIsSame.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_512AEAAB01AA_var*
var
 l_Intf: IInterface;
 l_Para: InevPara;
//#UC END# *4EB27FB803C2_512AEAAB01AA_var*
begin
//#UC START# *4EB27FB803C2_512AEAAB01AA_impl*
 RunnerAssert(aCtx.rEngine.IsTopIntf, 'Нужен второй параграф', aCtx);
 l_Intf := aCtx.rEngine.PopIntf;
 RunnerAssert(Supports(l_Intf, InevPara, l_Para), 'Переданный интерфейс не является параграфом', aCtx);
 aCtx.rEngine.PushBool(l_Para.AsObject.IsSame(aPara.AsObject));
//#UC END# *4EB27FB803C2_512AEAAB01AA_impl*
end;//TkwParaIsSame.DoPara

class function TkwParaIsSame.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:IsSame';
end;//TkwParaIsSame.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.