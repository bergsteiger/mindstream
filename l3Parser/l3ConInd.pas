unit l3ConInd;
{* Прогресс-индикатор выводящий информацию на консоль. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3ConInd - прогресс-индикатор выводящий информацию на консоль}
{ Начат: 12.04.1999 16:27 }
{ $Id: l3ConInd.pas,v 1.5 2014/02/04 09:14:12 fireton Exp $ }

// $Log: l3ConInd.pas,v $
// Revision 1.5  2014/02/04 09:14:12  fireton
// - добавляем everest2nsrc в автосборку
//
// Revision 1.4  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.3  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  l3Types,
  l3Base,
  l3Prg,
  l3Interfaces
  ;

type
  Tl3ConsoleIndicator = class(Tl3ProgressIndicator)
   {* Прогресс-индикатор выводящий информацию на консоль. }
    private
    {internal fields}
      f_MaxValue : Int64;
    protected
    {internal methods}
      procedure DoProgressProc(aState: Byte; aValue: Int64; const aMsg: Il3CString);
        override;
        {-}
  end;{TConsoleIndicator}

implementation

procedure Tl3ConsoleIndicator.DoProgressProc(aState: Byte; aValue: Int64; const aMsg: Il3CString);
  {override;}
  {-}
begin
 case aState of
  piStart   : f_MaxValue := aValue;
  piCurrent : begin
   Write(l3System.ObjectCount, ' objects ',
         l3System.LocalMemUsed, ' local ',
         l3System.GlobalMemUsed, ' global ');
   Write(aValue * 100 div f_MaxValue, '%', #13);
  end;{piCurrent}
  piEnd     : f_MaxValue := 0;
 end;{Case aState}
end;

end.

