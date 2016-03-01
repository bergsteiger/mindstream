unit kwLeftParam;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwLeftParam.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwLeftParam
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoObject,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  tfwTypeInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwObjRefParam = {abstract} class(TkwCompiledWordPrim)
 private
 // private fields
   f_Value : TtfwStackValue;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
    const aCtx: TtfwContext;
    aNeedCheckType: Boolean = true); override;
   function GetValue(const aCtx: TtfwContext): PtfwStackValue; override;
   function IsVarLike: Boolean; override;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
   function CanClearInRecursiveCalls: Boolean; override;
   function IsInParam: Boolean; override;
 end;//TkwObjRefParam

 TkwRefParam = {abstract} class(TkwObjRefParam)
 public
 // overridden public methods
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
   function CanClearInRecursiveCalls: Boolean; override;
 end;//TkwRefParam

 TkwRightParam = class(TkwRefParam)
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   function IsRightParam(const aCtx: TtfwContext): Boolean; override;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
 end;//TkwRightParam

 TkwRightLiteralParam = class(TkwRightParam)
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
 end;//TkwRightLiteralParam

 TkwRightParamEx = class(TkwRightParam)
 private
 // private fields
   f_TypeInfo : TtfwWordInfo;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
 end;//TkwRightParamEx

 TkwLeftWordRefParam = class(TkwRefParam)
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
   function IsLeftWordRefParam(const aCtx: TtfwContext): Boolean; override;
 end;//TkwLeftWordRefParam

 TtfwRefParamWordInfo = {abstract} class(Tl3ProtoObject)
 private
 // private fields
   f_WordInfo : TtfwWordInfo;
 protected
 // protected methods
   function GetWordInfo: TtfwWordInfo; virtual; abstract;
 public
 // public methods
   function WI: TtfwWordInfo;
 end;//TtfwRefParamWordInfo

 TkwObjRefParamWordInfo = class(TtfwRefParamWordInfo)
 protected
 // realized methods
   function GetWordInfo: TtfwWordInfo; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwObjRefParamWordInfo;
    {- возвращает экземпляр синглетона. }
 end;//TkwObjRefParamWordInfo

 TkwLeftWordRefParamWordInfo = class(TtfwRefParamWordInfo)
 protected
 // realized methods
   function GetWordInfo: TtfwWordInfo; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwLeftWordRefParamWordInfo;
    {- возвращает экземпляр синглетона. }
 end;//TkwLeftWordRefParamWordInfo

 TkwRightParamWordInfo = class(TtfwRefParamWordInfo)
 protected
 // realized methods
   function GetWordInfo: TtfwWordInfo; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwRightParamWordInfo;
    {- возвращает экземпляр синглетона. }
 end;//TkwRightParamWordInfo

 TkwRightLiteralParamWordInfo = class(TtfwRefParamWordInfo)
 protected
 // realized methods
   function GetWordInfo: TtfwWordInfo; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwRightLiteralParamWordInfo;
    {- возвращает экземпляр синглетона. }
 end;//TkwRightLiteralParamWordInfo

 _kwCompiledVar_Parent_ = TkwCompiledWordPrim;
 {$Include kwCompiledVar.imp.pas}
 TkwLeftParam = class(_kwCompiledVar_)
 public
 // overridden public methods
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
   function IsInParam: Boolean; override;
 public
 // public methods
   class function ClassForCreate(aTypeInfo: TtfwWordInfo;
     const aCtx: TtfwContext): RkwCompiledWordPrim;
 end;//TkwLeftParam
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwValueTypes,
  l3Base {a},
  TypInfo,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include kwCompiledVar.imp.pas}

// start class TkwLeftParam

class function TkwLeftParam.ClassForCreate(aTypeInfo: TtfwWordInfo;
  const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *559A72E202EB_4F4158EB01D9_var*
//#UC END# *559A72E202EB_4F4158EB01D9_var*
begin
//#UC START# *559A72E202EB_4F4158EB01D9_impl*
 if aTypeInfo.Has(tfw_wmRightWordRef) then
 begin
  if aTypeInfo.EQwm([tfw_wmTreatUnknownAsString, tfw_wmRightWordRef]) then
   Result := TkwRightLiteralParam
  else
  if aTypeInfo.EQwm([tfw_wmRightWordRef]) AND
     (aTypeInfo.LinkType = tfw_ltNone) then
   Result := TkwRightParam
  else
   Result := TkwRightParamEx;
 end//tfw_wmRightWordRef in aTypeInfo.Modifiers
 else
 if aTypeInfo.Has(tfw_wmLeftWordRef) then
 begin
  if aTypeInfo.EQwm([tfw_wmLeftWordRef]) then
   Result := TkwLeftWordRefParam
  else
  begin
   Assert(false, 'Неверный список модификаторов');
   Result := nil;
  end;//else
 end//tfw_wmLeftWordRef in aTypeInfo.Modifiers
 else
 begin
  if aTypeInfo.ValueTypes.EQ(TypeInfo(TObject)) then
   Result := TkwObjRefParam
  else
   Result := TkwLeftParam;
 end;//else
//#UC END# *559A72E202EB_4F4158EB01D9_impl*
end;//TkwLeftParam.ClassForCreate
// start class TkwObjRefParam

procedure TkwObjRefParam.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_558D7FFE0092_var*
//#UC END# *4DAEEDE10285_558D7FFE0092_var*
begin
//#UC START# *4DAEEDE10285_558D7FFE0092_impl*
 aCtx.rEngine.Push(f_Value);
//#UC END# *4DAEEDE10285_558D7FFE0092_impl*
end;//TkwObjRefParam.DoDoIt

function TkwObjRefParam.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_558D7FFE0092get_var*
//#UC END# *52CFC11603C8_558D7FFE0092get_var*
begin
//#UC START# *52CFC11603C8_558D7FFE0092get_impl*
 Result := TkwObjRefParamWordInfo.Instance.WI;
//#UC END# *52CFC11603C8_558D7FFE0092get_impl*
end;//TkwObjRefParam.pm_GetResultTypeInfo

procedure TkwObjRefParam.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_558D7FFE0092_var*
//#UC END# *52D00B00031A_558D7FFE0092_var*
begin
//#UC START# *52D00B00031A_558D7FFE0092_impl*
 Case aValue.rType of
  tfw_vtVoid:
   f_Value := aValue;
  tfw_vtNil:
   f_Value := aValue;
  tfw_vtObj:
   f_Value := aValue;
  else
   RunnerAssert(false, 'Требуется объект', aCtx);
 end;//aValue.rType
//#UC END# *52D00B00031A_558D7FFE0092_impl*
end;//TkwObjRefParam.SetValue

function TkwObjRefParam.GetValue(const aCtx: TtfwContext): PtfwStackValue;
//#UC START# *52D399A00173_558D7FFE0092_var*
//#UC END# *52D399A00173_558D7FFE0092_var*
begin
//#UC START# *52D399A00173_558D7FFE0092_impl*
 Result := @f_Value;
//#UC END# *52D399A00173_558D7FFE0092_impl*
end;//TkwObjRefParam.GetValue

function TkwObjRefParam.IsVarLike: Boolean;
//#UC START# *52D399D40140_558D7FFE0092_var*
//#UC END# *52D399D40140_558D7FFE0092_var*
begin
//#UC START# *52D399D40140_558D7FFE0092_impl*
 Result := true;
//#UC END# *52D399D40140_558D7FFE0092_impl*
end;//TkwObjRefParam.IsVarLike

procedure TkwObjRefParam.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_558D7FFE0092_var*
//#UC END# *52EA6A2C0111_558D7FFE0092_var*
begin
//#UC START# *52EA6A2C0111_558D7FFE0092_impl*
 RunnerAssert(aValue.ValueTypes.EQ(TypeInfo(TObject)), 'Неверный список модификаторов', aCtx);
//#UC END# *52EA6A2C0111_558D7FFE0092_impl*
end;//TkwObjRefParam.SetResultTypeInfo

function TkwObjRefParam.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_558D7FFE0092_var*
//#UC END# *558D2BCA0324_558D7FFE0092_var*
begin
//#UC START# *558D2BCA0324_558D7FFE0092_impl*
(* Result := f_Value As TtfwWord;
 Result := Result.GetRef(aCtx);*)
 Result := inherited GetRef(aCtx);
//#UC END# *558D2BCA0324_558D7FFE0092_impl*
end;//TkwObjRefParam.GetRef

function TkwObjRefParam.CanClearInRecursiveCalls: Boolean;
//#UC START# *559A470F0288_558D7FFE0092_var*
//#UC END# *559A470F0288_558D7FFE0092_var*
begin
//#UC START# *559A470F0288_558D7FFE0092_impl*
 Result := true;
//#UC END# *559A470F0288_558D7FFE0092_impl*
end;//TkwObjRefParam.CanClearInRecursiveCalls

function TkwObjRefParam.IsInParam: Boolean;
//#UC START# *559A4C5801D8_558D7FFE0092_var*
//#UC END# *559A4C5801D8_558D7FFE0092_var*
begin
//#UC START# *559A4C5801D8_558D7FFE0092_impl*
 Result := true;
//#UC END# *559A4C5801D8_558D7FFE0092_impl*
end;//TkwObjRefParam.IsInParam
// start class TkwRefParam

function TkwRefParam.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_559AA1BE0237_var*
//#UC END# *558D2BCA0324_559AA1BE0237_var*
begin
//#UC START# *558D2BCA0324_559AA1BE0237_impl*
 Result := f_Value.AsObject As TtfwWord;
 Result := Result.GetRef(aCtx);
//#UC END# *558D2BCA0324_559AA1BE0237_impl*
end;//TkwRefParam.GetRef

function TkwRefParam.CanClearInRecursiveCalls: Boolean;
//#UC START# *559A470F0288_559AA1BE0237_var*
//#UC END# *559A470F0288_559AA1BE0237_var*
begin
//#UC START# *559A470F0288_559AA1BE0237_impl*
 Result := false;
//#UC END# *559A470F0288_559AA1BE0237_impl*
end;//TkwRefParam.CanClearInRecursiveCalls
// start class TkwRightParam

function TkwRightParam.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_52E91D6202F4get_var*
//#UC END# *52CFC11603C8_52E91D6202F4get_var*
begin
//#UC START# *52CFC11603C8_52E91D6202F4get_impl*
 Result := TkwRightParamWordInfo.Instance.WI;
//#UC END# *52CFC11603C8_52E91D6202F4get_impl*
end;//TkwRightParam.pm_GetResultTypeInfo

function TkwRightParam.IsRightParam(const aCtx: TtfwContext): Boolean;
//#UC START# *52E91D9D0024_52E91D6202F4_var*
//#UC END# *52E91D9D0024_52E91D6202F4_var*
begin
//#UC START# *52E91D9D0024_52E91D6202F4_impl*
 Result := true;
//#UC END# *52E91D9D0024_52E91D6202F4_impl*
end;//TkwRightParam.IsRightParam

procedure TkwRightParam.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_52E91D6202F4_var*
//#UC END# *52EA6A2C0111_52E91D6202F4_var*
begin
//#UC START# *52EA6A2C0111_52E91D6202F4_impl*
 RunnerAssert(aValue.EQwm([tfw_wmRightWordRef]), 'Неверный список модификаторов', aCtx);
//#UC END# *52EA6A2C0111_52E91D6202F4_impl*
end;//TkwRightParam.SetResultTypeInfo
// start class TkwRightLiteralParam

function TkwRightLiteralParam.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_559A730E020Eget_var*
//#UC END# *52CFC11603C8_559A730E020Eget_var*
begin
//#UC START# *52CFC11603C8_559A730E020Eget_impl*
 Result := TkwRightLiteralParamWordInfo.Instance.WI;
//#UC END# *52CFC11603C8_559A730E020Eget_impl*
end;//TkwRightLiteralParam.pm_GetResultTypeInfo

procedure TkwRightLiteralParam.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_559A730E020E_var*
//#UC END# *52EA6A2C0111_559A730E020E_var*
begin
//#UC START# *52EA6A2C0111_559A730E020E_impl*
 RunnerAssert(aValue.EQwm([tfw_wmRightWordRef, tfw_wmTreatUnknownAsString]), 'Неверный список модификаторов', aCtx);
//#UC END# *52EA6A2C0111_559A730E020E_impl*
end;//TkwRightLiteralParam.SetResultTypeInfo
// start class TkwRightParamEx

function TkwRightParamEx.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_559A7B3C014Eget_var*
//#UC END# *52CFC11603C8_559A7B3C014Eget_var*
begin
//#UC START# *52CFC11603C8_559A7B3C014Eget_impl*
 if (f_TypeInfo = nil) then
  Result := TtfwWordInfoE.Instance
 else
  Result := f_TypeInfo;
//#UC END# *52CFC11603C8_559A7B3C014Eget_impl*
end;//TkwRightParamEx.pm_GetResultTypeInfo

procedure TkwRightParamEx.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_559A7B3C014E_var*
//#UC END# *52EA6A2C0111_559A7B3C014E_var*
begin
//#UC START# *52EA6A2C0111_559A7B3C014E_impl*
 f_TypeInfo := aValue.Clone;
//#UC END# *52EA6A2C0111_559A7B3C014E_impl*
end;//TkwRightParamEx.SetResultTypeInfo
// start class TkwLeftWordRefParam

function TkwLeftWordRefParam.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_53E377040339get_var*
//#UC END# *52CFC11603C8_53E377040339get_var*
begin
//#UC START# *52CFC11603C8_53E377040339get_impl*
 Result := TkwLeftWordRefParamWordInfo.Instance.WI;
//#UC END# *52CFC11603C8_53E377040339get_impl*
end;//TkwLeftWordRefParam.pm_GetResultTypeInfo

procedure TkwLeftWordRefParam.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_53E377040339_var*
//#UC END# *52EA6A2C0111_53E377040339_var*
begin
//#UC START# *52EA6A2C0111_53E377040339_impl*
 RunnerAssert(aValue.EQwm([tfw_wmLeftWordRef]), 'Неверный список модификаторов', aCtx);
//#UC END# *52EA6A2C0111_53E377040339_impl*
end;//TkwLeftWordRefParam.SetResultTypeInfo

function TkwLeftWordRefParam.IsLeftWordRefParam(const aCtx: TtfwContext): Boolean;
//#UC START# *53E389100169_53E377040339_var*
//#UC END# *53E389100169_53E377040339_var*
begin
//#UC START# *53E389100169_53E377040339_impl*
 Result := true;
//#UC END# *53E389100169_53E377040339_impl*
end;//TkwLeftWordRefParam.IsLeftWordRefParam
// start class TtfwRefParamWordInfo

function TtfwRefParamWordInfo.WI: TtfwWordInfo;
//#UC START# *55EF0D4E0363_55EF0C53018A_var*
//#UC END# *55EF0D4E0363_55EF0C53018A_var*
begin
//#UC START# *55EF0D4E0363_55EF0C53018A_impl*
 if (f_WordInfo = nil) then
  f_WordInfo := GetWordInfo;
 Result := f_WordInfo; 
//#UC END# *55EF0D4E0363_55EF0C53018A_impl*
end;//TtfwRefParamWordInfo.WI

// start class TkwObjRefParamWordInfo

var g_TkwObjRefParamWordInfo : TkwObjRefParamWordInfo = nil;

procedure TkwObjRefParamWordInfoFree;
begin
 l3Free(g_TkwObjRefParamWordInfo);
end;

class function TkwObjRefParamWordInfo.Instance: TkwObjRefParamWordInfo;
begin
 if (g_TkwObjRefParamWordInfo = nil) then
 begin
  l3System.AddExitProc(TkwObjRefParamWordInfoFree);
  g_TkwObjRefParamWordInfo := Create;
 end;
 Result := g_TkwObjRefParamWordInfo;
end;


class function TkwObjRefParamWordInfo.Exists: Boolean;
 {-}
begin
 Result := g_TkwObjRefParamWordInfo <> nil;
end;//TkwObjRefParamWordInfo.Exists

function TkwObjRefParamWordInfo.GetWordInfo: TtfwWordInfo;
//#UC START# *55EF0D710242_55EF0CD701A0_var*
//#UC END# *55EF0D710242_55EF0CD701A0_var*
begin
//#UC START# *55EF0D710242_55EF0CD701A0_impl*
 Result := TtfwWordInfo.Make(TtfwValueTypes.Make(TypeInfo(TObject)), [], tfw_atNone, tfw_ltNone);
//#UC END# *55EF0D710242_55EF0CD701A0_impl*
end;//TkwObjRefParamWordInfo.GetWordInfo

// start class TkwLeftWordRefParamWordInfo

var g_TkwLeftWordRefParamWordInfo : TkwLeftWordRefParamWordInfo = nil;

procedure TkwLeftWordRefParamWordInfoFree;
begin
 l3Free(g_TkwLeftWordRefParamWordInfo);
end;

class function TkwLeftWordRefParamWordInfo.Instance: TkwLeftWordRefParamWordInfo;
begin
 if (g_TkwLeftWordRefParamWordInfo = nil) then
 begin
  l3System.AddExitProc(TkwLeftWordRefParamWordInfoFree);
  g_TkwLeftWordRefParamWordInfo := Create;
 end;
 Result := g_TkwLeftWordRefParamWordInfo;
end;


class function TkwLeftWordRefParamWordInfo.Exists: Boolean;
 {-}
begin
 Result := g_TkwLeftWordRefParamWordInfo <> nil;
end;//TkwLeftWordRefParamWordInfo.Exists

function TkwLeftWordRefParamWordInfo.GetWordInfo: TtfwWordInfo;
//#UC START# *55EF0D710242_55EF0CF00017_var*
//#UC END# *55EF0D710242_55EF0CF00017_var*
begin
//#UC START# *55EF0D710242_55EF0CF00017_impl*
 Result := TtfwWordInfo.Make(nil, [tfw_wmLeftWordRef], tfw_atNone, tfw_ltNone);
//#UC END# *55EF0D710242_55EF0CF00017_impl*
end;//TkwLeftWordRefParamWordInfo.GetWordInfo

// start class TkwRightParamWordInfo

var g_TkwRightParamWordInfo : TkwRightParamWordInfo = nil;

procedure TkwRightParamWordInfoFree;
begin
 l3Free(g_TkwRightParamWordInfo);
end;

class function TkwRightParamWordInfo.Instance: TkwRightParamWordInfo;
begin
 if (g_TkwRightParamWordInfo = nil) then
 begin
  l3System.AddExitProc(TkwRightParamWordInfoFree);
  g_TkwRightParamWordInfo := Create;
 end;
 Result := g_TkwRightParamWordInfo;
end;


class function TkwRightParamWordInfo.Exists: Boolean;
 {-}
begin
 Result := g_TkwRightParamWordInfo <> nil;
end;//TkwRightParamWordInfo.Exists

function TkwRightParamWordInfo.GetWordInfo: TtfwWordInfo;
//#UC START# *55EF0D710242_55EF0D18027B_var*
//#UC END# *55EF0D710242_55EF0D18027B_var*
begin
//#UC START# *55EF0D710242_55EF0D18027B_impl*
 Result := TtfwWordInfo.Make(nil, [tfw_wmRightWordRef], tfw_atNone, tfw_ltNone);
//#UC END# *55EF0D710242_55EF0D18027B_impl*
end;//TkwRightParamWordInfo.GetWordInfo

// start class TkwRightLiteralParamWordInfo

var g_TkwRightLiteralParamWordInfo : TkwRightLiteralParamWordInfo = nil;

procedure TkwRightLiteralParamWordInfoFree;
begin
 l3Free(g_TkwRightLiteralParamWordInfo);
end;

class function TkwRightLiteralParamWordInfo.Instance: TkwRightLiteralParamWordInfo;
begin
 if (g_TkwRightLiteralParamWordInfo = nil) then
 begin
  l3System.AddExitProc(TkwRightLiteralParamWordInfoFree);
  g_TkwRightLiteralParamWordInfo := Create;
 end;
 Result := g_TkwRightLiteralParamWordInfo;
end;


class function TkwRightLiteralParamWordInfo.Exists: Boolean;
 {-}
begin
 Result := g_TkwRightLiteralParamWordInfo <> nil;
end;//TkwRightLiteralParamWordInfo.Exists

function TkwRightLiteralParamWordInfo.GetWordInfo: TtfwWordInfo;
//#UC START# *55EF0D710242_55EF1501024E_var*
//#UC END# *55EF0D710242_55EF1501024E_var*
begin
//#UC START# *55EF0D710242_55EF1501024E_impl*
 Result := TtfwWordInfo.Make(nil, [tfw_wmRightWordRef, tfw_wmTreatUnknownAsString], tfw_atNone, tfw_ltNone);
//#UC END# *55EF0D710242_55EF1501024E_impl*
end;//TkwRightLiteralParamWordInfo.GetWordInfo

function TkwLeftParam.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_4F4158EB01D9_var*
//#UC END# *558D2BCA0324_4F4158EB01D9_var*
begin
//#UC START# *558D2BCA0324_4F4158EB01D9_impl*
(* Result := GetValue(aCtx).AsObject As TtfwWord;
 if (Result <> nil) then
  Result := Result.GetRef(aCtx);*)
 Result := inherited GetRef(aCtx);
//#UC END# *558D2BCA0324_4F4158EB01D9_impl*
end;//TkwLeftParam.GetRef

function TkwLeftParam.IsInParam: Boolean;
//#UC START# *559A4C5801D8_4F4158EB01D9_var*
//#UC END# *559A4C5801D8_4F4158EB01D9_var*
begin
//#UC START# *559A4C5801D8_4F4158EB01D9_impl*
 Result := true;
//#UC END# *559A4C5801D8_4F4158EB01D9_impl*
end;//TkwLeftParam.IsInParam

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwObjRefParam
 TkwObjRefParam.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwRefParam
 TkwRefParam.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwRightParam
 TkwRightParam.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwRightLiteralParam
 TkwRightLiteralParam.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwRightParamEx
 TkwRightParamEx.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwLeftWordRefParam
 TkwLeftWordRefParam.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwLeftParam
 TkwLeftParam.RegisterClass;
{$IfEnd} //not NoScripts

end.