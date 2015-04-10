unit StandartWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/StandartWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::StandartWordsPack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwROT,
  kwPICK,
  kwInvertROT,
  kwSWAP2,
  kwOVER2,
  kwDUP2,
  kwDROP2,
  kwNIP,
  kwTUCK,
  kwOVER,
  kwROLL,
  kwDROP,
  kwDUP,
  kwDUPIfNotZero,
  kwSWAP,
  kwNotEquals,
  kwGreaterThan,
  kwLessThan,
  kwEquals,
  kwAND,
  kwAdd,
  kwDec,
  kwEqualZero,
  kwNotZero,
  kwOR,
  kwSub,
  kwNot,
  kwLessThenZero,
  kwGreaterThenZero,
  kwInc,
  kwBeginImmediate,
  kwCurrentExceptionClassName,
  kwCurrentExceptionMessage,
  kwBitAnd,
  kwBitOr,
  kwBitNot,
  kwDIV,
  kwDiv2,
  kwDivizion,
  kwMOD,
  kwMult2,
  kwMultyDiv,
  kwMultiply,
  kwCurrentExceptionClass,
  tfwClassRef,
  Classes,
  SysUtils,
  kwCurrentException
  ;

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53E0F3140266*
 TtfwClassRef.Register(EStreamError);
 TtfwClassRef.Register(EFileStreamError);
 TtfwClassRef.Register(EFCreateError);
 TtfwClassRef.Register(EFOpenError);
 TtfwClassRef.Register(EFilerError);
 TtfwClassRef.Register(EReadError);
 TtfwClassRef.Register(EWriteError);
 TtfwClassRef.Register(EClassNotFound);
 TtfwClassRef.Register(EMethodNotFound);
 TtfwClassRef.Register(EInvalidImage);
 TtfwClassRef.Register(EResNotFound);
 TtfwClassRef.Register(EListError);
 TtfwClassRef.Register(EBitsError);
 TtfwClassRef.Register(EStringListError);
 TtfwClassRef.Register(EComponentError);
 TtfwClassRef.Register(EParserError);
 TtfwClassRef.Register(EOutOfResources);
 TtfwClassRef.Register(EInvalidOperation);

 TtfwClassRef.Register(EAssertionFailed);
 TtfwClassRef.Register(EAccessViolation);
 
 TtfwClassRef.Register(ERangeError);

 TtfwClassRef.Register(EZeroDivide);
 
 TtfwClassRef.Register(EExternalException);
 TtfwClassRef.Register(EIntError);
 TtfwClassRef.Register(EDivByZero);
 TtfwClassRef.Register(EIntOverflow);

 TtfwClassRef.Register(EInvalidOp);
 TtfwClassRef.Register(EOverflow);
 TtfwClassRef.Register(EUnderflow);
 TtfwClassRef.Register(EInvalidPointer);
 TtfwClassRef.Register(EInvalidCast);
 
 TtfwClassRef.Register(EConvertError);
 TtfwClassRef.Register(EPrivilege);
 TtfwClassRef.Register(EStackOverflow);
 
 TtfwClassRef.Register(EControlC);
 
 TtfwClassRef.Register(EIntfCastError);
 
 TtfwClassRef.Register(EOSError);
//#UC END# *53E0F3140266*
{$IfEnd} //not NoScripts

end.