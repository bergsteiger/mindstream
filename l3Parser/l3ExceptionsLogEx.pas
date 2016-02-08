unit l3ExceptionsLogEx;
 
{$Include l3Define.inc}

interface

uses
  l3ExceptionsLog
  ;

type
 Tl3ExceptionsLogEx = class(Tl3ExceptionsLog)
 protected
 // overridden protected methods
    {$If defined(_m0USEFORMS1)}
   procedure SetOnException; override;
     {* Сигнатура метода SetOnException }
    {$IfEnd} //_m0USEFORMS1
    {$If defined(_m0USEFORMS1)}
   procedure ResOnException; override;
     {* Сигнатура метода ResOnException }
    {$IfEnd} //_m0USEFORMS1
   function NeedTime: Boolean; override;
 end;//Tl3ExceptionsLogEx

implementation

// start class Tl3ExceptionsLogEx

{$If defined(_m0USEFORMS1)}
procedure Tl3ExceptionsLogEx.SetOnException;
//#UC START# *540EE287029C_540EE27400BE_var*
//#UC END# *540EE287029C_540EE27400BE_var*
begin
//#UC START# *540EE287029C_540EE27400BE_impl*
 // - ничего не делаем
//#UC END# *540EE287029C_540EE27400BE_impl*
end;//Tl3ExceptionsLogEx.SetOnException
{$IfEnd} //_m0USEFORMS1

{$If defined(_m0USEFORMS1)}
procedure Tl3ExceptionsLogEx.ResOnException;
//#UC START# *540EE29A0095_540EE27400BE_var*
//#UC END# *540EE29A0095_540EE27400BE_var*
begin
//#UC START# *540EE29A0095_540EE27400BE_impl*
 // - ничего не делаем
//#UC END# *540EE29A0095_540EE27400BE_impl*
end;//Tl3ExceptionsLogEx.ResOnException
{$IfEnd} //_m0USEFORMS1

function Tl3ExceptionsLogEx.NeedTime: Boolean;
//#UC START# *5422E8FC025D_540EE27400BE_var*
//#UC END# *5422E8FC025D_540EE27400BE_var*
begin
//#UC START# *5422E8FC025D_540EE27400BE_impl*
 Result := true;
//#UC END# *5422E8FC025D_540EE27400BE_impl*
end;//Tl3ExceptionsLogEx.NeedTime

end.