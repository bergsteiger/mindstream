unit kwCompiledInitedVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledInitedVarProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::TkwCompiledInitedVarProducer
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
  kwCompiledVarProducer,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledInitedVarProducer = class of TkwCompiledInitedVarProducer;

 TkwCompiledInitedVarProducer = class(TkwCompiledVarProducer)
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function AcceptsKeyWordAfter: Boolean; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 protected
 // protected methods
   function CanBeVoid: Boolean; virtual;
 end;//TkwCompiledInitedVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar,
  kwCompiledInitableVar,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledInitedVarProducer

function TkwCompiledInitedVarProducer.CanBeVoid: Boolean;
//#UC START# *4F44BBD400AC_4F3D32ED0065_var*
//#UC END# *4F44BBD400AC_4F3D32ED0065_var*
begin
//#UC START# *4F44BBD400AC_4F3D32ED0065_impl*
 Result := true;
//#UC END# *4F44BBD400AC_4F3D32ED0065_impl*
end;//TkwCompiledInitedVarProducer.CanBeVoid

function TkwCompiledInitedVarProducer.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F3D32ED0065_var*
//#UC END# *4DB9B446039A_4F3D32ED0065_var*
begin
//#UC START# *4DB9B446039A_4F3D32ED0065_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4F3D32ED0065_impl*
end;//TkwCompiledInitedVarProducer.AfterWordMaxCount

function TkwCompiledInitedVarProducer.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4F3D32ED0065_var*
//#UC END# *4DB9B502013D_4F3D32ED0065_var*
begin
//#UC START# *4DB9B502013D_4F3D32ED0065_impl*
 Result := true;
//#UC END# *4DB9B502013D_4F3D32ED0065_impl*
end;//TkwCompiledInitedVarProducer.AcceptsKeyWordAfter

function TkwCompiledInitedVarProducer.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3D32ED0065_var*
//#UC END# *4DBAEE0D028D_4F3D32ED0065_var*
begin
//#UC START# *4DBAEE0D028D_4F3D32ED0065_impl*
 Result := TkwCompiledInitableVar; 
//#UC END# *4DBAEE0D028D_4F3D32ED0065_impl*
end;//TkwCompiledInitedVarProducer.CompiledWordClass

procedure TkwCompiledInitedVarProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F3D32ED0065_var*
var
 l_C : TtfwWord;
 l_VC  : Integer;
 l_VC1 : Integer;
 l_V : TtfwStackValue;
 l_Key : TtfwKeyWord;
//#UC END# *4F219629036A_4F3D32ED0065_var*
begin
//#UC START# *4F219629036A_4F3D32ED0065_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Не найдено значение переменной',
                aContext);
 l_VC := aContext.rEngine.ValuesCount;
 l_C := aCompiled.GetCode(aContext)[0];
 l_C.DoIt(aContext);
 l_VC1 := aContext.rEngine.ValuesCount;
 CompilerAssert(l_VC1 >= l_VC,
                Format('Слово %s для инициализации переменной %s понизило уровень стека',
                       [
                        l_C.Key.AsString,
                        aCompiled.Key.AsString
                       ]),
                aContext);
 CompilerAssert(l_VC1 <= l_VC + 1,
                Format('Слово %s для инициализации переменной %s повысило уровень стека более чем на одно значение',
                       [
                        l_C.Key.AsString,
                        aCompiled.Key.AsString
                       ]),
                aContext);
 if (l_VC1 > l_VC) then
 begin
  l_V := aContext.rEngine.Pop;
  try
   if (l_V.rType = tfw_svtVoid) AND not CanBeVoid then
   // - тут создаём автоматическую ссылку
   begin
    l_Key := TtfwKeyWord(l_C.Key);
    try
     aWordToFinish.Word := l_C;
     // - регистрируем алиас слова в словаре
    finally
     l_C.Key := l_Key;
     // - восстанавливаем слову предыдущее значение ключа
    end;//try..finally
   end//(l_V.rType = tfw_svtVoid) AND not CanBeVoid
   else
    aCompiled.SetValue(l_V, aContext);
  finally
   Finalize(l_V);
  end;//try..finally
 end//l_VC1 > l_VC
 else
  CompilerAssert(CanBeVoid, 'Переменная не может быть инициализирована пустым значением', aContext);
 aCompiled.ClearCode(aContext);
 inherited;
//#UC END# *4F219629036A_4F3D32ED0065_impl*
end;//TkwCompiledInitedVarProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

end.