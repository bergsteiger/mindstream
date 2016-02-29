unit l3Except;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$Domain"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3Except.pas"
// Начат: 22.04.1998 11:18
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> Shared Delphi Требования к низкоуровневым библиотекам::L3$Domain::l3Except
//
// Базовые исключения L3.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  SysUtils
  ;

type
 El3Exception = class(Exception)
 end;//El3Exception

 El3CannotModify = class(El3Exception)
 end;//El3CannotModify

 El3Error = class(El3Exception)
 end;//El3Error

 El3Warning = class(El3Exception)
 end;//El3Warning

 El3NotFound = class(El3Error)
 end;//El3NotFound

 El3Abort = class(El3Error)
 end;//El3Abort

 El3AbortLoad = class(El3Abort)
 end;//El3AbortLoad

 El3FilerError = class(El3Error)
 end;//El3FilerError

 El3ReadError = class(El3FilerError)
 end;//El3ReadError

 El3NoLoggedException = class(El3Exception)
  {* предок ошибок, которые в лог не попадают (см. l3ExceptionsLog) }
 end;//El3NoLoggedException

 El3InfoException = class(El3Exception)
  {* предок ошибок для информационных целей (внутренее использование) }
 end;//El3InfoException

 El3DuplicateItem = class(El3Exception)
  {* дублирование элемента в списке }
 end;//El3DuplicateItem

 El3ConvertError = class(El3Exception)
 end;//El3ConvertError

const
  { Сообщения об ошибках. }
 l3_excAbortLoad = 'Прервана загрузка документа.';

type
 El3BadPictureFormat = class(El3Error)
 end;//El3BadPictureFormat

 El3AbortLoadFilter = class(El3AbortLoad)
 end;//El3AbortLoadFilter

 El3BadDataInPara = class(El3Exception)
 end;//El3BadDataInPara

implementation

end.