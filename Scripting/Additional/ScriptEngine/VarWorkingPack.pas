unit VarWorkingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "VarWorkingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::VarWorkingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwConst,
  tfwVarWorker
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwVAR,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwCONST = {final scriptword} class(TtfwConst)
  {* Определяет константу.
Пример:
[code]
 CONST cFake1 5
[code] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCONST

// start class TkwCONST

class function TkwCONST.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CONST';
end;//TkwCONST.GetWordNameForRegister

type
 TkwPopPopToVar = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта >>>
*Пример:*
[code]
 aSV >>> aVar
[code]  }
 private
 // private methods
   procedure PopToVar(const aCtx: TtfwContext;
    aVar: TtfwWord;
    const aSV: TtfwStackValue);
     {* Реализация слова скрипта >>> }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPopToVar

// start class TkwPopPopToVar

procedure TkwPopPopToVar.PopToVar(const aCtx: TtfwContext;
  aVar: TtfwWord;
  const aSV: TtfwStackValue);
//#UC START# *0E88370EFEDB_2573EC4F226D_var*
//#UC END# *0E88370EFEDB_2573EC4F226D_var*
begin
//#UC START# *0E88370EFEDB_2573EC4F226D_impl*
 aVar.SetValue(aSV, aCtx);
//#UC END# *0E88370EFEDB_2573EC4F226D_impl*
end;//TkwPopPopToVar.PopToVar

class function TkwPopPopToVar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '>>>';
end;//TkwPopPopToVar.GetWordNameForRegister

procedure TkwPopPopToVar.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
 l_aSV : TtfwStackValue;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PopToVar(aCtx, l_aVar, l_aSV);
end;//TkwPopPopToVar.DoRun

function TkwPopPopToVar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopPopToVar.GetResultTypeInfo

type
 TkwPopPopToVarRef = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта >>>^
*Пример:*
[code]
 aSV >>>^ aVar
[code]  }
 private
 // private methods
   procedure PopToVarRef(const aCtx: TtfwContext;
    aVar: TtfwWord;
    const aSV: TtfwStackValue);
     {* Реализация слова скрипта >>>^ }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopPopToVarRef

// start class TkwPopPopToVarRef

procedure TkwPopPopToVarRef.PopToVarRef(const aCtx: TtfwContext;
  aVar: TtfwWord;
  const aSV: TtfwStackValue);
//#UC START# *28C84BCA8359_D70248C548A5_var*
//#UC END# *28C84BCA8359_D70248C548A5_var*
begin
//#UC START# *28C84BCA8359_D70248C548A5_impl*
 (aVar.GetValue(aCtx).AsObject As TtfwWord).SetValue(aSV, aCtx);
//#UC END# *28C84BCA8359_D70248C548A5_impl*
end;//TkwPopPopToVarRef.PopToVarRef

class function TkwPopPopToVarRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '>>>^';
end;//TkwPopPopToVarRef.GetWordNameForRegister

procedure TkwPopPopToVarRef.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
 l_aSV : TtfwStackValue;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PopToVarRef(aCtx, l_aVar, l_aSV);
end;//TkwPopPopToVarRef.DoRun

function TkwPopPopToVarRef.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopPopToVarRef.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CONST
 TkwCONST.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_PopToVar
 TkwPopPopToVar.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_PopToVarRef
 TkwPopPopToVarRef.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts

end.