unit tfwRTTIProperty;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwRTTIProperty.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TtfwRTTIProperty
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwRegisterableWordPrim,
  tfwScriptingInterfaces,
  tfwTypeInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwRTTIProperty = class(TtfwRegisterableWordPrim)
 private
 // private fields
   f_PropType : PTypeInfo;
   f_Class : TClass;
   f_PropName : AnsiString;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 protected
 // overridden protected methods
   class function ReallyNeedRegister: Boolean; override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 public
 // public methods
   class procedure Register(aClass: TClass;
     aPropInfo: PPropInfo);
   constructor Create(aClass: TClass;
     aPropInfo: PPropInfo); reintroduce;
 end;//TtfwRTTIProperty
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwRTTIProperty

class procedure TtfwRTTIProperty.Register(aClass: TClass;
  aPropInfo: PPropInfo);
//#UC START# *55C8626500B1_55C861DE03D5_var*
var
 l_I : TtfwRTTIProperty;
//#UC END# *55C8626500B1_55C861DE03D5_var*
begin
//#UC START# *55C8626500B1_55C861DE03D5_impl*
 if (aPropInfo.PropType^.Kind = tkMethod) then
  Exit;
 l_I := Create(aClass, aPropInfo);
 try
  l_I.RegisterInstance('.' + aClass.ClassName + '.' + aPropInfo.Name);
 finally
  FreeAndNil(l_I);
 end;//try..finally
//#UC END# *55C8626500B1_55C861DE03D5_impl*
end;//TtfwRTTIProperty.Register

constructor TtfwRTTIProperty.Create(aClass: TClass;
  aPropInfo: PPropInfo);
//#UC START# *55C862D0004D_55C861DE03D5_var*
//#UC END# *55C862D0004D_55C861DE03D5_var*
begin
//#UC START# *55C862D0004D_55C861DE03D5_impl*
 inherited Create;
 f_Class := aClass;
 f_PropName := aPropInfo.Name;
 f_PropType := aPropInfo.PropType^;
//#UC END# *55C862D0004D_55C861DE03D5_impl*
end;//TtfwRTTIProperty.Create

procedure TtfwRTTIProperty.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55C861DE03D5_var*
var
 l_O : TObject;
//#UC END# *4DAEEDE10285_55C861DE03D5_var*
begin
//#UC START# *4DAEEDE10285_55C861DE03D5_impl*
 l_O := aCtx.rEngine.PopObjAs(f_Class);
 Case f_PropType.Kind of
  tkInteger:
   aCtx.rEngine.PushInt(GetOrdProp(l_O, f_PropName));
  tkEnumeration:
  begin
   if (f_PropType.Name <> 'Boolean') then
    aCtx.rEngine.PushInt(GetOrdProp(l_O, f_PropName))
   else
    aCtx.rEngine.PushBool(GetOrdProp(l_O, f_PropName) <> 0)
  end;//tkEnumeration
  tkString:
   aCtx.rEngine.PushString(GetStrProp(l_O, f_PropName));
  tkClass:
   aCtx.rEngine.PushObj(TObject(GetOrdProp(l_O, f_PropName)));
  else
   RunnerError('Не знаем что делать с ' + GetEnumName(TypeInfo(TTypeKind), Ord(f_PropType.Kind)), aCtx);
 end;//Case f_PropType.Kind
//#UC END# *4DAEEDE10285_55C861DE03D5_impl*
end;//TtfwRTTIProperty.DoDoIt

class function TtfwRTTIProperty.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_55C861DE03D5_var*
//#UC END# *4DC2E05B03DD_55C861DE03D5_var*
begin
//#UC START# *4DC2E05B03DD_55C861DE03D5_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_55C861DE03D5_impl*
end;//TtfwRTTIProperty.ReallyNeedRegister

function TtfwRTTIProperty.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_55C861DE03D5get_var*
//#UC END# *52CFC11603C8_55C861DE03D5get_var*
begin
//#UC START# *52CFC11603C8_55C861DE03D5get_impl*
 Result := inherited pm_GetResultTypeInfo(aCtx);
//#UC END# *52CFC11603C8_55C861DE03D5get_impl*
end;//TtfwRTTIProperty.pm_GetResultTypeInfo

procedure TtfwRTTIProperty.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_55C861DE03D5_var*
var
 l_O : TObject;
 l_TD : PTypeData;
//#UC END# *52D00B00031A_55C861DE03D5_var*
begin
//#UC START# *52D00B00031A_55C861DE03D5_impl*
 l_O := aCtx.rEngine.PopObjAs(f_Class);
 Case f_PropType.Kind of
  tkInteger:
   SetOrdProp(l_O, f_PropName, aValue.AsInt);
  tkEnumeration:
  begin
   if (f_PropType.Name <> 'Boolean') then
    SetOrdProp(l_O, f_PropName, aValue.AsInt)
   else
    SetOrdProp(l_O, f_PropName, Ord(aValue.AsBoolean));
  end;//tkEnumeration
  tkString:
   SetStrProp(l_O, f_PropName, l3Str(aValue.AsString));
  tkClass:
  begin
   l_TD := GetTypeData(f_PropType);
   Assert(l_TD <> nil);
   SetOrdProp(l_O, f_PropName, Integer(aValue.AsObject(l_TD.ClassType)));
  end;//tkClass
  else
   RunnerError('Не знаем что делать с ' + GetEnumName(TypeInfo(TTypeKind), Ord(f_PropType.Kind)), aCtx);
 end;//Case f_PropType.Kind
//#UC END# *52D00B00031A_55C861DE03D5_impl*
end;//TtfwRTTIProperty.SetValue

function TtfwRTTIProperty.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_55C861DE03D5_var*
//#UC END# *551544E2001A_55C861DE03D5_var*
begin
//#UC START# *551544E2001A_55C861DE03D5_impl*
 Result := f_PropType;
//#UC END# *551544E2001A_55C861DE03D5_impl*
end;//TtfwRTTIProperty.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwRTTIProperty
 TtfwRTTIProperty.RegisterClass;
{$IfEnd} //not NoScripts

end.