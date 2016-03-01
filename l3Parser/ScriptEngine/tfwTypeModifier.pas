unit tfwTypeModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwTypeModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TtfwTypeModifier
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  kwModifier,
  tfwTypeInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwClassModifier = class(TkwModifier)
 private
 // private fields
   f_Class : TClass;
 protected
 // realized methods
   function pm_GetModifier: TtfwTypeInfo; override;
 protected
 // overridden protected methods
   class function ReallyNeedRegister: Boolean; override;
 public
 // public methods
   constructor Create(aClass: TClass); reintroduce;
 end;//TtfwClassModifier

 TtfwTypeModifier = class(TkwModifier)
 private
 // private fields
   f_TypeInfo : PTypeInfo;
 protected
 // realized methods
   function pm_GetModifier: TtfwTypeInfo; override;
 protected
 // overridden protected methods
   class function ReallyNeedRegister: Boolean; override;
 public
 // public methods
   class function RegisterTypeModifier(aTypeInfo: PTypeInfo): Boolean; overload; 
   constructor Create(aTypeInfo: PTypeInfo); reintroduce;
   class function RegisterTypeModifier(aClass: TClass): Boolean; overload; 
 end;//TtfwTypeModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwTypeModifier

class function TtfwTypeModifier.RegisterTypeModifier(aTypeInfo: PTypeInfo): Boolean;
//#UC START# *5571B1010311_5571AC8301BE_var*
var
 l_W : TtfwTypeModifier;
//#UC END# *5571B1010311_5571AC8301BE_var*
begin
//#UC START# *5571B1010311_5571AC8301BE_impl*
 Result := false;
 if (aTypeInfo = nil) then
  Exit;
 l_W := Create(aTypeInfo);
 try
  Result := l_W.RegisterInstance(aTypeInfo.Name);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *5571B1010311_5571AC8301BE_impl*
end;//TtfwTypeModifier.RegisterTypeModifier

constructor TtfwTypeModifier.Create(aTypeInfo: PTypeInfo);
//#UC START# *5571B317010B_5571AC8301BE_var*
//#UC END# *5571B317010B_5571AC8301BE_var*
begin
//#UC START# *5571B317010B_5571AC8301BE_impl*
 inherited Create;
 f_TypeInfo := aTypeInfo;
//#UC END# *5571B317010B_5571AC8301BE_impl*
end;//TtfwTypeModifier.Create

class function TtfwTypeModifier.RegisterTypeModifier(aClass: TClass): Boolean;
//#UC START# *5575557101EC_5571AC8301BE_var*
var
 l_CI : PTypeInfo;
 l_CM : TtfwClassModifier;
//#UC END# *5575557101EC_5571AC8301BE_var*
begin
//#UC START# *5575557101EC_5571AC8301BE_impl*
 l_CI := aClass.ClassInfo;
 if (l_CI <> nil) then
  Result := RegisterTypeModifier(l_CI)
 else
 begin
  l_CM := TtfwClassModifier.Create(aClass);
  try
   Result := l_CM.RegisterInstance(aClass.ClassName);
  finally
   FreeAndNil(l_CM);
  end;//try..finally
 end;//l_CI <> nil
//#UC END# *5575557101EC_5571AC8301BE_impl*
end;//TtfwTypeModifier.RegisterTypeModifier
// start class TtfwClassModifier

constructor TtfwClassModifier.Create(aClass: TClass);
//#UC START# *557555A801C1_55755516000B_var*
//#UC END# *557555A801C1_55755516000B_var*
begin
//#UC START# *557555A801C1_55755516000B_impl*
 inherited Create;
 f_Class := aClass;
//#UC END# *557555A801C1_55755516000B_impl*
end;//TtfwClassModifier.Create

function TtfwClassModifier.pm_GetModifier: TtfwTypeInfo;
//#UC START# *4DCACED80361_55755516000Bget_var*
//#UC END# *4DCACED80361_55755516000Bget_var*
begin
//#UC START# *4DCACED80361_55755516000Bget_impl*
 {$IfDef seTypeCheck}
 Result := TtfwTypeInfo_C(f_Class);
 {$Else  seTypeCheck}
 Result := TtfwTypeInfo_C(TypeInfo(TObject));
 {$EndIf seTypeCheck}
//#UC END# *4DCACED80361_55755516000Bget_impl*
end;//TtfwClassModifier.pm_GetModifier

class function TtfwClassModifier.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_55755516000B_var*
//#UC END# *4DC2E05B03DD_55755516000B_var*
begin
//#UC START# *4DC2E05B03DD_55755516000B_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_55755516000B_impl*
end;//TtfwClassModifier.ReallyNeedRegister

function TtfwTypeModifier.pm_GetModifier: TtfwTypeInfo;
//#UC START# *4DCACED80361_5571AC8301BEget_var*
//#UC END# *4DCACED80361_5571AC8301BEget_var*
begin
//#UC START# *4DCACED80361_5571AC8301BEget_impl*
 Assert(f_TypeInfo <> nil);
 Result := TtfwTypeInfo_C(f_TypeInfo);
//#UC END# *4DCACED80361_5571AC8301BEget_impl*
end;//TtfwTypeModifier.pm_GetModifier

class function TtfwTypeModifier.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_5571AC8301BE_var*
//#UC END# *4DC2E05B03DD_5571AC8301BE_var*
begin
//#UC START# *4DC2E05B03DD_5571AC8301BE_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_5571AC8301BE_impl*
end;//TtfwTypeModifier.ReallyNeedRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwClassModifier
 TtfwClassModifier.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TtfwTypeModifier
 TtfwTypeModifier.RegisterInEngine;
{$IfEnd} //not NoScripts

end.