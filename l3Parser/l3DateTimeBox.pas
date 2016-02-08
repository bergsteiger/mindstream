unit l3DateTimeBox;

{ $Id: l3DateTimeBox.pas,v 1.3 2011/11/23 12:23:44 fireton Exp $ }

// $Log: l3DateTimeBox.pas,v $
// Revision 1.3  2011/11/23 12:23:44  fireton
// - не падаем при неправильной дате, а просто возвращаем нулевую
//
// Revision 1.2  2011/07/22 12:25:03  fireton
// - доработка
//
// Revision 1.1  2011/07/12 13:51:02  fireton
// - работа с TDateTimeBox (интеграция с MDP)
//

interface
uses
 IOUnit,
 l3Date;

procedure l3DateTimeToBox(const aDateTime: TDateTime; out theBox: TDateTimeBox);
function  l3BoxToDateTime(const aBox: TDateTimeBox): TDateTime;
procedure l3StDateToBox(const aDate: TStDate; out theBox: TDateTimeBox);
function  l3BoxToStDate(const aBox: TDateTimeBox): TStDate;

implementation
uses
 DateUtils;

procedure l3DateTimeToBox(const aDateTime: TDateTime; out theBox: TDateTimeBox);
begin
 with theBox do
  DecodeDateTime(aDateTime, Word(rYear), Word(rMounth), Word(rDay), Word(rHour), Word(rMinute),
      Word(rSecond), Word(rMillisecond));
end;

function  l3BoxToDateTime(const aBox: TDateTimeBox): TDateTime;
begin
 with aBox do
  if not TryEncodeDateTime(rYear, rMounth, rDay, rHour, rMinute, rSecond, rMillisecond, Result) then
   Result := NullDate;
end;

procedure l3StDateToBox(const aDate: TStDate; out theBox: TDateTimeBox);
begin
 l3DateTimeToBox(StDateToDateTime(aDate), theBox);
end;

function  l3BoxToStDate(const aBox: TDateTimeBox): TStDate;
begin
 Result := DateTimeToStDate(l3BoxToDateTime(aBox));
end;

end.