unit kwCompiledWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWordWorkerWord
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
  tfwScriptingInterfaces,
  kwCompiledWordWorkerWordRunner,
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord,
  tfwDictionaryPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordWorkerWord = class of TkwCompiledWordWorkerWord;

 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwCompiledWordWorkerWord = class(_tfwWordWorker_)
 private
 // private fields
   f_Compiled : TtfwWord;
    {* Поле для свойства Compiled}
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
   function pm_GetInnerDictionary: TtfwDictionaryPrim; override;
   function pm_GetResultTypeInfo: TtfwTypeInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   class function ReallyNeedRegister: Boolean; override;
   procedure FillCompiledWorker(aWorker: TtfwWord;
     const aContext: TtfwContext); override;
 public
 // overridden public methods
   function IsAnonimous: Boolean; override;
   procedure SetResultTypeInfo(const aValue: TtfwTypeInfo;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   function RunnerClass: RkwCompiledWordWorkerWordRunner; virtual;
 public
 // public methods
   constructor Create(aCompiled: TtfwWord); reintroduce;
 public
 // public properties
   property Compiled: TtfwWord
     read f_Compiled;
 end;//TkwCompiledWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPushWord,
  SysUtils,
  tfwWordRefList,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCompiledWordWorkerWord;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwCompiledWordWorkerWord

constructor TkwCompiledWordWorkerWord.Create(aCompiled: TtfwWord);
//#UC START# *4F219F0F0176_4F21976E01C2_var*
//#UC END# *4F219F0F0176_4F21976E01C2_var*
begin
//#UC START# *4F219F0F0176_4F21976E01C2_impl*
 inherited Create;
 aCompiled.SetRefTo(f_Compiled);
//#UC END# *4F219F0F0176_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.Create

function TkwCompiledWordWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F21976E01C2_var*
//#UC END# *4F3FAC0C0170_4F21976E01C2_var*
begin
//#UC START# *4F3FAC0C0170_4F21976E01C2_impl*
 Result := TkwCompiledWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.RunnerClass

function TkwCompiledWordWorkerWord.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F21976E01C2_var*
//#UC END# *4DCBD67C0362_4F21976E01C2_var*
begin
//#UC START# *4DCBD67C0362_4F21976E01C2_impl*
 Result := RunnerClass;
//#UC END# *4DCBD67C0362_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.CompiledWorkerClass

procedure TkwCompiledWordWorkerWord.Cleanup;
//#UC START# *479731C50290_4F21976E01C2_var*
//#UC END# *479731C50290_4F21976E01C2_var*
begin
//#UC START# *479731C50290_4F21976E01C2_impl*
 FreeAndNil(f_Compiled);
 inherited;
//#UC END# *479731C50290_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.Cleanup

function TkwCompiledWordWorkerWord.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F21976E01C2_var*
//#UC END# *4DB9B446039A_4F21976E01C2_var*
begin
//#UC START# *4DB9B446039A_4F21976E01C2_impl*
 Result := f_Compiled.RightParamsCount(aCtx);
//#UC END# *4DB9B446039A_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.AfterWordMaxCount

class function TkwCompiledWordWorkerWord.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F21976E01C2_var*
//#UC END# *4DC2E05B03DD_4F21976E01C2_var*
begin
//#UC START# *4DC2E05B03DD_4F21976E01C2_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.ReallyNeedRegister

procedure TkwCompiledWordWorkerWord.FillCompiledWorker(aWorker: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4F219FA10268_4F21976E01C2_var*
var
 l_LeftWordRefCount : Integer;
 l_CodeIndex : Integer;
 L_Code : TtfwWordRefList; 
//#UC END# *4F219FA10268_4F21976E01C2_var*
begin
//#UC START# *4F219FA10268_4F21976E01C2_impl*
 //f_Compiled.Key := aWorker.Key;
 f_Compiled.Key := Self.Key;
 (aWorker As TkwCompiledWordWorkerWordRunner).Compiled := f_Compiled;
 
 l_LeftWordRefCount := f_Compiled.LeftWordRefParamsCount(aContext);
 if (l_LeftWordRefCount > 0) then
 begin
  l_CodeIndex := aContext.rWordCompilingNow.CodeCount;
  CompilerAssert(l_LeftWordRefCount <= l_CodeIndex, 'Нужно ' + IntToStr(l_LeftWordRefCount) + ' штук слов перед ' + Self.Key.AsString + ', а их там ' + IntToStr(l_CodeIndex), aContext);
  Dec(l_CodeIndex);
  
  CompilerAssert(aContext.rWordCompilingNow Is TkwCompiledWordPrim, 'Нужно компилируемое слово', aContext);
  l_Code := TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext);
  CompilerAssert(l_Code <> nil, 'Нужно слово перед ' + Self.Key.AsString, aContext);
  
  while (l_LeftWordRefCount > 0) do
  begin
   aWorker.AddLeftWordRefValue(aContext, l_Code.Items[l_CodeIndex]);
   l_Code.Delete(l_CodeIndex);
   Dec(l_LeftWordRefCount);
   Dec(l_CodeIndex);
  end;//l_LeftWordRefCount > 0)
 end;//l_LeftWordRefCount > 0
 inherited;
//#UC END# *4F219FA10268_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.FillCompiledWorker

function TkwCompiledWordWorkerWord.IsAnonimous: Boolean;
//#UC START# *4F3AB3600008_4F21976E01C2_var*
//#UC END# *4F3AB3600008_4F21976E01C2_var*
begin
//#UC START# *4F3AB3600008_4F21976E01C2_impl*
 Result := false;
//#UC END# *4F3AB3600008_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.IsAnonimous

function TkwCompiledWordWorkerWord.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_4F21976E01C2get_var*
//#UC END# *4F43C9A10139_4F21976E01C2get_var*
begin
//#UC START# *4F43C9A10139_4F21976E01C2get_impl*
 //Result := f_WordProducer;
 Result := f_Compiled.WordProducer;
//#UC END# *4F43C9A10139_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetWordProducer

function TkwCompiledWordWorkerWord.pm_GetInnerDictionary: TtfwDictionaryPrim;
//#UC START# *52B43311021D_4F21976E01C2get_var*
//#UC END# *52B43311021D_4F21976E01C2get_var*
begin
//#UC START# *52B43311021D_4F21976E01C2get_impl*
 Result := f_Compiled.InnerDictionary;
//#UC END# *52B43311021D_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetInnerDictionary

function TkwCompiledWordWorkerWord.pm_GetResultTypeInfo: TtfwTypeInfo;
//#UC START# *52CFC11603C8_4F21976E01C2get_var*
//#UC END# *52CFC11603C8_4F21976E01C2get_var*
begin
//#UC START# *52CFC11603C8_4F21976E01C2get_impl*
 if (f_Compiled <> nil) then
  Result := f_Compiled.ResultTypeInfo
 else
  Result := inherited pm_GetResultTypeInfo;
//#UC END# *52CFC11603C8_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetResultTypeInfo

procedure TkwCompiledWordWorkerWord.SetResultTypeInfo(const aValue: TtfwTypeInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F21976E01C2_var*
//#UC END# *52EA6A2C0111_4F21976E01C2_var*
begin
//#UC START# *52EA6A2C0111_4F21976E01C2_impl*
 inherited;
 if (f_Compiled <> nil) then
  f_Compiled.SetResultTypeInfo(aValue, aCtx);
//#UC END# *52EA6A2C0111_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.