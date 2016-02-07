unit afwValueMaps;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces
  ;

function AfwIntegerMapManager: IafwIntegerValueMapManager;
function AfwStringMapManager: IafwStringValueMapManager;

implementation

uses
  l3IntegerValueMapManager,
  l3StringValueMapManager
  ;

// unit methods

function AfwIntegerMapManager: IafwIntegerValueMapManager;
//#UC START# *478E366E03B2_478E36460273_var*
//#UC END# *478E366E03B2_478E36460273_var*
begin
//#UC START# *478E366E03B2_478E36460273_impl*
 Result := l3IntegerMapManager;
//#UC END# *478E366E03B2_478E36460273_impl*
end;//AfwIntegerMapManager

function AfwStringMapManager: IafwStringValueMapManager;
//#UC START# *478E36800176_478E36460273_var*
//#UC END# *478E36800176_478E36460273_var*
begin
//#UC START# *478E36800176_478E36460273_impl*
 Result := l3StringMapManager;
//#UC END# *478E36800176_478E36460273_impl*
end;//AfwStringMapManager

end.