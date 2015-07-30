unit tb97WordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$tb97"
// Модуль: "tb97WordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$tb97::tb97Words::tb97WordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tb97Ctls,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopTB97ButtonGetIsDown = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:TB97Button:GetIsDown
*Тип результата:* Boolean
*Пример:*
[code]
 aTB97Button pop:TB97Button:GetIsDown
[code]  }
 private
 // private methods
   function PopTB97ButtonGetIsDown(const aCtx: TtfwContext;
    aTB97Button: TCustomToolbarButton97): Boolean;
     {* Реализация слова скрипта pop:TB97Button:GetIsDown }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopTB97ButtonGetIsDown

// start class TkwPopTB97ButtonGetIsDown

function TkwPopTB97ButtonGetIsDown.PopTB97ButtonGetIsDown(const aCtx: TtfwContext;
  aTB97Button: TCustomToolbarButton97): Boolean;
//#UC START# *44009E4D337D_00BDB7CC2A2E_var*
//#UC END# *44009E4D337D_00BDB7CC2A2E_var*
begin
//#UC START# *44009E4D337D_00BDB7CC2A2E_impl*
 Result := aTB97Button.Down;
//#UC END# *44009E4D337D_00BDB7CC2A2E_impl*
end;//TkwPopTB97ButtonGetIsDown.PopTB97ButtonGetIsDown

procedure TkwPopTB97ButtonGetIsDown.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTB97Button : TCustomToolbarButton97;
begin
 try
  l_aTB97Button := TCustomToolbarButton97(aCtx.rEngine.PopObjAs(TCustomToolbarButton97));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTB97Button: TCustomToolbarButton97 : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((PopTB97ButtonGetIsDown(aCtx, l_aTB97Button)));
end;//TkwPopTB97ButtonGetIsDown.DoDoIt

class function TkwPopTB97ButtonGetIsDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TB97Button:GetIsDown';
end;//TkwPopTB97ButtonGetIsDown.GetWordNameForRegister

function TkwPopTB97ButtonGetIsDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopTB97ButtonGetIsDown.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_TB97Button_GetIsDown
 TkwPopTB97ButtonGetIsDown.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TCustomToolbarButton97
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCustomToolbarButton97));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts

end.