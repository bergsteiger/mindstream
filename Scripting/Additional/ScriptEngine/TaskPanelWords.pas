unit TaskPanelWords;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$F1"
// Модуль: "TaskPanelWords.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi For F1::ScriptEngine$F1::TaskPanelWords::TaskPanelWords
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  Classes
  {$If defined(Nemesis)}
  ,
  nscTasksPanelView
  {$IfEnd} //Nemesis
  ,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopTaskPanelGetHideField = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:TaskPanel:GetHideField
*Тип результата:* TnscTasksPanelHideField
*Пример:*
[code]
 anIndex aTaskPanel pop:TaskPanel:GetHideField
[code]  }
 private
 // private methods
   function GetHideField(const aCtx: TtfwContext;
    aTaskPanel: TnscTasksPanelView;
    anIndex: Integer): TnscTasksPanelHideField;
     {* Реализация слова скрипта pop:TaskPanel:GetHideField }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopTaskPanelGetHideField

// start class TkwPopTaskPanelGetHideField

function TkwPopTaskPanelGetHideField.GetHideField(const aCtx: TtfwContext;
  aTaskPanel: TnscTasksPanelView;
  anIndex: Integer): TnscTasksPanelHideField;
//#UC START# *E1A1A40AC939_C357835C3D1B_var*
//#UC END# *E1A1A40AC939_C357835C3D1B_var*
begin
//#UC START# *E1A1A40AC939_C357835C3D1B_impl*
 Result := aTaskPanel.HideField[anIndex];
//#UC END# *E1A1A40AC939_C357835C3D1B_impl*
end;//TkwPopTaskPanelGetHideField.GetHideField

procedure TkwPopTaskPanelGetHideField.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTaskPanel : TnscTasksPanelView;
 l_anIndex : Integer;
begin
 try
  l_aTaskPanel := TnscTasksPanelView(aCtx.rEngine.PopObjAs(TnscTasksPanelView));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTaskPanel: TnscTasksPanelView : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetHideField(aCtx, l_aTaskPanel, l_anIndex)));
end;//TkwPopTaskPanelGetHideField.DoDoIt

class function TkwPopTaskPanelGetHideField.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TaskPanel:GetHideField';
end;//TkwPopTaskPanelGetHideField.GetWordNameForRegister

function TkwPopTaskPanelGetHideField.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TnscTasksPanelHideField);
end;//TkwPopTaskPanelGetHideField.GetResultTypeInfo

type
 TkwPopTaskPanelCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:TaskPanel:Count
*Тип результата:* Integer
*Пример:*
[code]
 aTaskPanel pop:TaskPanel:Count
[code]  }
 private
 // private methods
   function Count(const aCtx: TtfwContext;
    aTaskPanel: TnscTasksPanelView): Integer;
     {* Реализация слова скрипта pop:TaskPanel:Count }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopTaskPanelCount

// start class TkwPopTaskPanelCount

function TkwPopTaskPanelCount.Count(const aCtx: TtfwContext;
  aTaskPanel: TnscTasksPanelView): Integer;
 {-}
begin
 Result := aTaskPanel.Count;
end;//TkwPopTaskPanelCount.Count

procedure TkwPopTaskPanelCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTaskPanel : TnscTasksPanelView;
begin
 try
  l_aTaskPanel := TnscTasksPanelView(aCtx.rEngine.PopObjAs(TnscTasksPanelView));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTaskPanel: TnscTasksPanelView : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Count(aCtx, l_aTaskPanel)));
end;//TkwPopTaskPanelCount.DoDoIt

class function TkwPopTaskPanelCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TaskPanel:Count';
end;//TkwPopTaskPanelCount.GetWordNameForRegister

function TkwPopTaskPanelCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopTaskPanelCount.GetResultTypeInfo
{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация pop_TaskPanel_GetHideField
 TkwPopTaskPanelGetHideField.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCM
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация pop_TaskPanel_Count
 TkwPopTaskPanelCount.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCM
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts AND not NoVCM
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация типа TnscTasksPanelView
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscTasksPanelView));
{$IfEnd} //not NoScripts AND not NoVCM
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts AND not NoVCM
{$If not defined(NoScripts) AND not defined(NoVCM)}
// Регистрация типа TnscTasksPanelHideField
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscTasksPanelHideField));
{$IfEnd} //not NoScripts AND not NoVCM

end.