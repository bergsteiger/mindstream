unit afwTypes;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}
 
{$Include ..\AFW\afwDefine.inc}

interface

type
 TafwPrintPage = record
  {* инфо для печати страницы документа }
   rNumber : Integer; // номер страницы начиная с 0
 end;//TafwPrintPage

 TafwPrintPagesArray = array of TafwPrintPage;
  {* Массив страниц preview. }

 TafwPagesInterval = (
  {* Интервал печати. }
   afw_piAll
 , afw_piOdd
 , afw_piEven
 );//TafwPagesInterval

 TafwCommands = array of AnsiString;

implementation

end.