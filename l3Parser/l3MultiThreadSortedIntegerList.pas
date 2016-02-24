unit l3MultiThreadSortedIntegerList;
 
{$Include l3Define.inc}

interface

uses
  l3MultiThreadIntegerList
  ;

type
 Tl3MultiThreadSortedIntegerList = class(Tl3MultiThreadIntegerList)
 protected
 // overridden protected methods
   function NeedSort: Boolean; override;
 end;//Tl3MultiThreadSortedIntegerList

implementation

// start class Tl3MultiThreadSortedIntegerList

function Tl3MultiThreadSortedIntegerList.NeedSort: Boolean;
//#UC START# *53A2C90A0344_53A2C9290311_var*
//#UC END# *53A2C90A0344_53A2C9290311_var*
begin
//#UC START# *53A2C90A0344_53A2C9290311_impl*
 Result := true;
//#UC END# *53A2C90A0344_53A2C9290311_impl*
end;//Tl3MultiThreadSortedIntegerList.NeedSort

end.