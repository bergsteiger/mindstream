unit l3StringPtr;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Variant,
  l3Types
  ;

type
 Tl3StringPtr = class(Tl3PrimString)
  {* Строка, не владеющая своими данными }
 private
 // private fields
   f_Str : Tl3WString;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
 public
 // public methods
   constructor Create(const aStr: Tl3WString); reintroduce;
 end;//Tl3StringPtr

implementation

uses
  l3String
  ;

// start class Tl3StringPtr

constructor Tl3StringPtr.Create(const aStr: Tl3WString);
//#UC START# *4ABB5C98013B_4ABB5B2603B1_var*
//#UC END# *4ABB5C98013B_4ABB5B2603B1_var*
begin
//#UC START# *4ABB5C98013B_4ABB5B2603B1_impl*
 inherited Create;
 f_Str := aStr;
//#UC END# *4ABB5C98013B_4ABB5B2603B1_impl*
end;//Tl3StringPtr.Create

procedure Tl3StringPtr.Cleanup;
//#UC START# *479731C50290_4ABB5B2603B1_var*
//#UC END# *479731C50290_4ABB5B2603B1_var*
begin
//#UC START# *479731C50290_4ABB5B2603B1_impl*
 l3AssignNil(f_Str);
 inherited;
//#UC END# *479731C50290_4ABB5B2603B1_impl*
end;//Tl3StringPtr.Cleanup

{$If not defined(DesignTimeLibrary)}
class function Tl3StringPtr.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4ABB5B2603B1_var*
//#UC END# *47A6FEE600FC_4ABB5B2603B1_var*
begin
//#UC START# *47A6FEE600FC_4ABB5B2603B1_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4ABB5B2603B1_impl*
end;//Tl3StringPtr.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function Tl3StringPtr.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4ABB5B2603B1_var*
//#UC END# *47A869BB02DE_4ABB5B2603B1_var*
begin
//#UC START# *47A869BB02DE_4ABB5B2603B1_impl*
 Result := f_Str;
//#UC END# *47A869BB02DE_4ABB5B2603B1_impl*
end;//Tl3StringPtr.GetAsPCharLen

procedure Tl3StringPtr.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4ABB5B2603B1_var*
//#UC END# *47A869D10074_4ABB5B2603B1_var*
begin
//#UC START# *47A869D10074_4ABB5B2603B1_impl*
 f_Str := Value;
//#UC END# *47A869D10074_4ABB5B2603B1_impl*
end;//Tl3StringPtr.DoSetAsPCharLen

end.