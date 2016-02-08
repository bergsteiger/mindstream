unit afwOvrCaretType;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwCustomCaretType
  ;

type
//#UC START# *480DD2B200D2ci*
//#UC END# *480DD2B200D2ci*
 TafwOvrCaretType = class(TafwCustomCaretType)
 public
 // overridden public methods
   constructor Create; override;
//#UC START# *480DD2B200D2publ*
 published
 // published properties
   property Shape
    default csBlock;
    {* - форма курсора. }
//#UC END# *480DD2B200D2publ*
 end;//TafwOvrCaretType

implementation

// start class TafwOvrCaretType

constructor TafwOvrCaretType.Create;
//#UC START# *480DCA5C03B7_480DD2B200D2_var*
//#UC END# *480DCA5C03B7_480DD2B200D2_var*
begin
//#UC START# *480DCA5C03B7_480DD2B200D2_impl*
 inherited;
 Shape := csBlock;
//#UC END# *480DCA5C03B7_480DD2B200D2_impl*
end;//TafwOvrCaretType.Create

//#UC START# *480DD2B200D2impl*
//#UC END# *480DD2B200D2impl*

end.