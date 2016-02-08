{$IfNDef l3CheckStamp_imp}
 
{$Define l3CheckStamp_imp}
 _l3CheckStamp_ = {mixin} class(_l3CheckStamp_Parent_)
 public
 // realized methods
   function CheckStamp(const aGUID: TGUID): Boolean;
     {* Проверяет метку реализации интерфейса. Например для того, чтобы узнать, что реализация наша "родная". }
 end;//_l3CheckStamp_

{$Else l3CheckStamp_imp}

// start class _l3CheckStamp_

function _l3CheckStamp_.CheckStamp(const aGUID: TGUID): Boolean;
//#UC START# *467813E40207_4BE42D490361_var*
//#UC END# *467813E40207_4BE42D490361_var*
begin
//#UC START# *467813E40207_4BE42D490361_impl*
 Result := false;
//#UC END# *467813E40207_4BE42D490361_impl*
end;//_l3CheckStamp_.CheckStamp

{$EndIf l3CheckStamp_imp}
