unit kwForwardDeclaration;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwForwardDeclaration.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TkwForwardDeclaration
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwForwardDeclaration = class(TtfwWord)
 private
 // private fields
   f_RealWord : TtfwWord;
    {* Поле для свойства RealWord}
 protected
 // property methods
   procedure pm_SetRealWord(aValue: TtfwWord);
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
   procedure pm_SetWordProducer(aValue: TtfwWord); override;
   function pm_GetInnerDictionary: TtfwDictionaryPrim; override;
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   function IsForwardDeclaration: Boolean; override;
   function MakeRefForCompile(const aCtx: TtfwContext;
     aSNI: TtfwSuppressNextImmediate): TtfwWord; override;
 public
 // public properties
   property RealWord: TtfwWord
     read f_RealWord
     write pm_SetRealWord;
 end;//TkwForwardDeclaration
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwClassRef,
  kwForwardDeclarationHolder
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwForwardDeclaration

procedure TkwForwardDeclaration.pm_SetRealWord(aValue: TtfwWord);
//#UC START# *4F4BB75C021E_4F4BB70D0144set_var*
//#UC END# *4F4BB75C021E_4F4BB70D0144set_var*
begin
//#UC START# *4F4BB75C021E_4F4BB70D0144set_impl*
 aValue.SetRefTo(f_RealWord);
//#UC END# *4F4BB75C021E_4F4BB70D0144set_impl*
end;//TkwForwardDeclaration.pm_SetRealWord

procedure TkwForwardDeclaration.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4BB70D0144_var*
//#UC END# *4DAEEDE10285_4F4BB70D0144_var*
begin
//#UC START# *4DAEEDE10285_4F4BB70D0144_impl*
 RunnerAssert(f_RealWord <> nil,
              'Предварительное определение слова не было завершено',
              aCtx);
 f_RealWord.DoIt(aCtx);
//#UC END# *4DAEEDE10285_4F4BB70D0144_impl*
end;//TkwForwardDeclaration.DoDoIt

procedure TkwForwardDeclaration.Cleanup;
//#UC START# *479731C50290_4F4BB70D0144_var*
//#UC END# *479731C50290_4F4BB70D0144_var*
begin
//#UC START# *479731C50290_4F4BB70D0144_impl*
 FreeAndNil(f_RealWord);
 inherited;
//#UC END# *479731C50290_4F4BB70D0144_impl*
end;//TkwForwardDeclaration.Cleanup

function TkwForwardDeclaration.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_4F4BB70D0144get_var*
//#UC END# *4F43C9A10139_4F4BB70D0144get_var*
begin
//#UC START# *4F43C9A10139_4F4BB70D0144get_impl*
 if (f_RealWord = nil) then
  Result := nil
 else
  Result := f_RealWord.WordProducer;
//#UC END# *4F43C9A10139_4F4BB70D0144get_impl*
end;//TkwForwardDeclaration.pm_GetWordProducer

procedure TkwForwardDeclaration.pm_SetWordProducer(aValue: TtfwWord);
//#UC START# *4F43C9A10139_4F4BB70D0144set_var*
//#UC END# *4F43C9A10139_4F4BB70D0144set_var*
begin
//#UC START# *4F43C9A10139_4F4BB70D0144set_impl*
 f_RealWord.WordProducer := aValue;
//#UC END# *4F43C9A10139_4F4BB70D0144set_impl*
end;//TkwForwardDeclaration.pm_SetWordProducer

function TkwForwardDeclaration.IsForwardDeclaration: Boolean;
//#UC START# *4F4BB6CD0359_4F4BB70D0144_var*
//#UC END# *4F4BB6CD0359_4F4BB70D0144_var*
begin
//#UC START# *4F4BB6CD0359_4F4BB70D0144_impl*
 Result := true;
//#UC END# *4F4BB6CD0359_4F4BB70D0144_impl*
end;//TkwForwardDeclaration.IsForwardDeclaration

function TkwForwardDeclaration.pm_GetInnerDictionary: TtfwDictionaryPrim;
//#UC START# *52B43311021D_4F4BB70D0144get_var*
//#UC END# *52B43311021D_4F4BB70D0144get_var*
begin
//#UC START# *52B43311021D_4F4BB70D0144get_impl*
 if (f_RealWord = nil) then
  Result := nil
 else
  Result := f_RealWord.InnerDictionary;
//#UC END# *52B43311021D_4F4BB70D0144get_impl*
end;//TkwForwardDeclaration.pm_GetInnerDictionary

function TkwForwardDeclaration.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_4F4BB70D0144get_var*
//#UC END# *52CFC11603C8_4F4BB70D0144get_var*
begin
//#UC START# *52CFC11603C8_4F4BB70D0144get_impl*
 if (f_RealWord = nil) then
  Result := inherited pm_GetResultTypeInfo(aCtx)
 else
  Result := f_RealWord.ResultTypeInfo[aCtx];
//#UC END# *52CFC11603C8_4F4BB70D0144get_impl*
end;//TkwForwardDeclaration.pm_GetResultTypeInfo

function TkwForwardDeclaration.MakeRefForCompile(const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate): TtfwWord;
//#UC START# *55CB5B8C004E_4F4BB70D0144_var*
//#UC END# *55CB5B8C004E_4F4BB70D0144_var*
begin
//#UC START# *55CB5B8C004E_4F4BB70D0144_impl*
 Result := TkwForwardDeclarationHolder.Create(Self);
//#UC END# *55CB5B8C004E_4F4BB70D0144_impl*
end;//TkwForwardDeclaration.MakeRefForCompile

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwForwardDeclaration
 TkwForwardDeclaration.RegisterClass;
{$IfEnd} //not NoScripts

end.