{$IfNDef kwCompiledVar_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledVar.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::kwCompiledVar
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCompiledVar_imp}
{$If not defined(NoScripts)}
 _kwCompiledVar_ = {abstract mixin} class(_kwCompiledVar_Parent_)
 private
 // private fields
   f_Value : TtfwStackValue;
   f_TypeInfo : TtfwTypeInfo;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwTypeInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function GetValue(const aCtx: TtfwContext): TtfwStackValue; override;
   function IsVarLike: Boolean; override;
   procedure SetResultTypeInfo(const aValue: TtfwTypeInfo;
     const aCtx: TtfwContext); override;
 end;//_kwCompiledVar_
{$Else}

 _kwCompiledVar_ = _kwCompiledVar_Parent_;

{$IfEnd} //not NoScripts

{$Else kwCompiledVar_imp}

{$If not defined(NoScripts)}

// start class _kwCompiledVar_

procedure _kwCompiledVar_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D3E2EE0244_var*
//#UC END# *4DAEEDE10285_52D3E2EE0244_var*
begin
//#UC START# *4DAEEDE10285_52D3E2EE0244_impl*
 aCtx.rEngine.Push(f_Value);
//#UC END# *4DAEEDE10285_52D3E2EE0244_impl*
end;//_kwCompiledVar_.DoDoIt

procedure _kwCompiledVar_.Cleanup;
//#UC START# *479731C50290_52D3E2EE0244_var*
//#UC END# *479731C50290_52D3E2EE0244_var*
begin
//#UC START# *479731C50290_52D3E2EE0244_impl*
 Finalize(f_Value);
 l3FillChar(f_Value, SizeOf(f_Value));
 f_TypeInfo.Clear;
 inherited;
//#UC END# *479731C50290_52D3E2EE0244_impl*
end;//_kwCompiledVar_.Cleanup

function _kwCompiledVar_.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwTypeInfo;
//#UC START# *52CFC11603C8_52D3E2EE0244get_var*
//#UC END# *52CFC11603C8_52D3E2EE0244get_var*
begin
//#UC START# *52CFC11603C8_52D3E2EE0244get_impl*
 Result := f_TypeInfo;
//#UC END# *52CFC11603C8_52D3E2EE0244get_impl*
end;//_kwCompiledVar_.pm_GetResultTypeInfo

procedure _kwCompiledVar_.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_52D3E2EE0244_var*

 function cBadModifier: String;
 begin//cBadModifier
  Result := 'Неверный тип значения: ' + GetEnumName(TypeInfo(TtfwStackValueType), Ord(aValue.rType));
 end;//cBadModifier

var
 l_TM : TtfwWordModifiers; 
//#UC END# *52D00B00031A_52D3E2EE0244_var*
begin
//#UC START# *52D00B00031A_52D3E2EE0244_impl*
 if aNeedCheckType then
 begin
  l_TM := f_TypeInfo.TypeModifiers;
  if (l_TM <> []) then
  begin
   Case aValue.rType of
    tfw_svtNil:
     RunnerAssert((tfw_wmObj in l_TM) OR
            (tfw_wmFile in l_TM) OR
            (tfw_wmIntf in l_TM) OR
            (tfw_wmClass in l_TM) OR
 //           (tfw_svtList in l_TM) OR
            (tfw_wmStr in l_TM), cBadModifier, aCtx);
    tfw_svtInt:
     RunnerAssert(tfw_wmInt in l_TM, cBadModifier, aCtx);
    tfw_svtStr:
     RunnerAssert(tfw_wmStr in l_TM, cBadModifier, aCtx);
    tfw_svtObj:
     RunnerAssert((tfw_wmRightWordRef in l_TM) OR
                  (tfw_wmLeftWordRef in l_TM) OR
                  (tfw_wmObj in l_TM), cBadModifier, aCtx);
    tfw_svtIntf:
     RunnerAssert(tfw_wmIntf in l_TM, cBadModifier, aCtx);
    tfw_svtList:
     RunnerAssert(tfw_wmList in l_TM, cBadModifier, aCtx);
    tfw_svtFile:
     RunnerAssert(tfw_wmFile in l_TM, cBadModifier, aCtx);
    tfw_svtChar:
     RunnerAssert(tfw_wmChar in l_TM, cBadModifier, aCtx);
    tfw_svtWStr:
    begin
     if not (tfw_wmWStr in l_TM) then
     begin
      if (tfw_wmStr in l_TM) then
      begin
       f_Value := TtfwStackValue_C(TtfwCStringFactory.C(aValue.AsWString));
       Exit;
      end//tfw_svtStr in l_TM
      else
       BadValueType(aValue.rType, aCtx);
     end;//not (tfw_wmWStr in l_TM)
    end;//tfw_svtWStr
    tfw_svtBool:
     RunnerAssert(tfw_wmBool in l_TM, cBadModifier, aCtx);
    tfw_svtClass:
     RunnerAssert(tfw_wmClass in l_TM, cBadModifier, aCtx);
    else
     RunnerError(cBadModifier, aCtx);
   end;//Case aValue.rType
  end;//l_TM <> []
 end;//aNeedCheckType
 f_Value := aValue;
//#UC END# *52D00B00031A_52D3E2EE0244_impl*
end;//_kwCompiledVar_.SetValue

function _kwCompiledVar_.GetValue(const aCtx: TtfwContext): TtfwStackValue;
//#UC START# *52D399A00173_52D3E2EE0244_var*
//#UC END# *52D399A00173_52D3E2EE0244_var*
begin
//#UC START# *52D399A00173_52D3E2EE0244_impl*
 Result := f_Value;
//#UC END# *52D399A00173_52D3E2EE0244_impl*
end;//_kwCompiledVar_.GetValue

function _kwCompiledVar_.IsVarLike: Boolean;
//#UC START# *52D399D40140_52D3E2EE0244_var*
//#UC END# *52D399D40140_52D3E2EE0244_var*
begin
//#UC START# *52D399D40140_52D3E2EE0244_impl*
 Result := true;
//#UC END# *52D399D40140_52D3E2EE0244_impl*
end;//_kwCompiledVar_.IsVarLike

procedure _kwCompiledVar_.SetResultTypeInfo(const aValue: TtfwTypeInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_52D3E2EE0244_var*
//#UC END# *52EA6A2C0111_52D3E2EE0244_var*
begin
//#UC START# *52EA6A2C0111_52D3E2EE0244_impl*
 f_TypeInfo := aValue;
//#UC END# *52EA6A2C0111_52D3E2EE0244_impl*
end;//_kwCompiledVar_.SetResultTypeInfo

{$IfEnd} //not NoScripts

{$EndIf kwCompiledVar_imp}
