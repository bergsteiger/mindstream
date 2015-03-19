unit Testing.Engine;

interface

{$IfNDef NoTesting}
uses
 System.Classes,
 Core.Obj
 ;

type
 TtestSocket = record
  {* - контрольная точка }
  private
   rClass: TClass;
   rMethod: String;
  public
   constructor Create(anObject: TObject; const aMethod: String);
    {* - Создаёт экземпляр контрольной точки. }
   function EQ(const anOther: TtestSocket): Boolean;
    {* - Определяет тот факт, что контрольные точки - одтинаковые }
 end;//TtestSocket

 TtestValueType = (test_vtChar, test_vtString);
  {* - Возможные типы измеряемых значений }

 TtestValue = record
  {* - Измеряемое значение }
  private
   rType : TtestValueType;
    {* - Тип конкретного измеряемого значения. }
   rAsString : AnsiString;
   rAsChar : AnsiChar;
  public
   constructor CreateAsChar(aChar: AnsiChar);
   constructor CreateAsString(const aString: AnsiString);
 end;//TtestValue

 TtestMetricValues = record
  {* - Набор значений для метрики. }
  private
   f_Stream : TStream;
    {* Собственно место куда записываются значения метрики. }
  public
   procedure Init(const aTestName: String; const aSocket: TtestSocket);
    {* - Инициализирует набор значений для метрики }
   procedure FlushAndClear;
    {* - Записывает набор на постоянный носитель и освобождает его. }
   procedure PutValue(const aValue: TtestValue);
    {* - Записывает текущее значение в набор значений для метрики }
 end;//TtestMetricValues

 TtestSocketMetric = record
  {* - Измеряемая метрика. }
  private
   rSocket : TtestSocket;
    {* - контрольная точка в которой снимается метрика }
   rValues : TtestMetricValues;
    {* - текущий набор значений, который снят с контрольной точки }
  public
   constructor Create(const aTestName: String; const aSocket: TtestSocket);
   function EQ(const anOther: TtestSocket): Boolean;
    {* - Проверяет тот факт, что метрика снимается с данной контрольной точки }
   procedure FlushAndClear;
    {* - Записывает метрику на постоянный носитель и освобождает её. }
   procedure PutValue(const aValue: TtestValue); overload;
    {* - Записывает текущее значение в набор значений для метрики }
   procedure PutValue(const aValue: String); overload;
    {* - Записывает текущее значение в набор значений для метрики }
   procedure PutValue(const aValue: AnsiChar); overload;
    {* - Записывает текущее значение в набор значений для метрики }
 end;//TtestSocketMetric
 PtestMetric = ^TtestSocketMetric;

 TtestMetrics = array of TtestSocketMetric;
  {* - ВСЕ метрики снимаемые в КОНКРЕТНОМ эксперименте }

 TtestInstance = class(TCoreObject)
  {* - Эксперимент }
  private
   f_TestName : String;
   f_Metrics : TtestMetrics;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aTestName: String);
   function SocketMetric(const aSocket: TtestSocket): PtestMetric;
    {* - Возвращает экземпляр текущей метрики для данной "контрольной точки", для дальнеёшей работы с ней }
 end;//TtestInstance

 TtestEngine = class
  {* - Прибор для тестирования }
  public
   class function StartTest(const aTestName: String): TtestInstance;
    {* - Начинает тест (эксперимент) }
   class procedure StopTest;
    {* - Завершает текущий эксперимент }
   class function CurrentTest: TtestInstance;
    {* - Текущий проводимый эксперимент }
 end;
{$EndIf NoTesting}

implementation

{$IfNDef NoTesting}

uses
 System.SysUtils
 ;

var
 g_CurrentTest : TtestInstance = nil;

constructor TtestValue.CreateAsChar(aChar: AnsiChar);
begin
 inherited;
 rType := test_vtChar;
 rAsChar := aChar;
end;

constructor TtestValue.CreateAsString(const aString: AnsiString);
begin
 inherited;
 rType := test_vtString;
 rAsString := aString;
end;

constructor TtestSocket.Create(anObject: TObject; const aMethod: String);
begin
 inherited;
 rClass := anObject.ClassType;
 rMethod := aMethod;
end;

function TtestSocket.EQ(const anOther: TtestSocket): Boolean;
 {* - Определяет тот факт, что контрольные точки - одтинаковые }
begin
 Result := (Self.rClass = anOther.rClass) AND (Self.rMethod = anOther.rMethod);
end;

constructor TtestSocketMetric.Create(const aTestName: String; const aSocket: TtestSocket);
begin
 inherited;
 rSocket := aSocket;
 rValues.Init(aTestName, aSocket);
end;

function TtestSocketMetric.EQ(const anOther: TtestSocket): Boolean;
 {* - Проверяет тот факт, что метрика снимается с данной контрольной точки }
begin
 Result := Self.rSocket.EQ(anOther);
end;

procedure TtestSocketMetric.FlushAndClear;
 {* - Записывает метрику на постоянный носитель и освобождает её. }
begin
 Self.rValues.FlushAndClear;
end;

procedure TtestSocketMetric.PutValue(const aValue: TtestValue);
 {* - Записывает текущее значение в набор значений для метрики }
begin
 Self.rValues.PutValue(aValue);
end;

procedure TtestSocketMetric.PutValue(const aValue: String);
 {* - Записывает текущее значение в набор значений для метрики }
begin
 if (@Self = nil) then
  Exit;
 Self.rValues.PutValue(TtestValue.CreateAsString(aValue));
end;

procedure  TtestSocketMetric.PutValue(const aValue: AnsiChar);
 {* - Записывает текущее значение в набор значений для метрики }
begin
 if (@Self = nil) then
  Exit;
 Self.rValues.PutValue(TtestValue.CreateAsChar(aValue));
end;

procedure TtestMetricValues.Init(const aTestName: String; const aSocket: TtestSocket);
 {* - Инициализирует набор значений для метрики }
begin
 f_Stream := TFileStream.Create(ExtractFilePath(ParamStr(0)) + '\' +
                                ExtractFileName(ParamStr(0)) + '.' +
                                ExtractFileName(aTestName) +
                                '.' + aSocket.rClass.ClassName +
                                '.' + aSocket.rMethod +
                                '.out', fmCreate);
end;

procedure TtestMetricValues.FlushAndClear;
 {* - Записывает набор на постоянный носитель и освобождает его. }
begin
 FreeAndNil(f_Stream);
end;

procedure TtestMetricValues.PutValue(const aValue: TtestValue);
 {* - Записывает текущее значение в набор значений для метрики }
const
 cEOL : AnsiString = #13#10;
begin
 if (@Self = nil) then
  Exit;
 Assert(f_Stream <> nil, 'Файл для записи значений метрики не открыт');
 case aValue.rType of
  test_vtChar:
   f_Stream.Write(@aValue.rAsChar, SizeOf(aValue.rAsChar));
  test_vtString:
  begin
   f_Stream.Write(@aValue.rAsString[1], Length(aValue.rAsString));
   f_Stream.Write(@cEOL[1], Length(cEOL));
  end;//test_vtString
  else
   Assert(false, 'Неизвестный тип значения метрики');
 end;
end;

constructor TtestInstance.Create(const aTestName: String);
begin
 Assert(g_CurrentTest = nil, 'Вложенные эксперименты не поддерживаются');
 f_TestName := aTestName;
 inherited Create;
 g_CurrentTest := Self;
end;

procedure TtestInstance.Cleanup;
var
 l_Index : Integer;
begin
 for l_Index := Low(f_Metrics) to High(f_Metrics) do
  f_Metrics[l_Index].FlushAndClear;
 Finalize(f_Metrics);
 inherited;
end;

function TtestInstance.SocketMetric(const aSocket: TtestSocket): PtestMetric;
 {* - Возвращает экземпляр текущей метрики для данной "контрольной точки", для дальнеёшей работы с ней }
var
 l_Index : Integer;
begin
 if (Self = nil) then
 begin
  Result := nil;
  Exit;
 end;//Self = nil
 for l_Index := Low(f_Metrics) to High(f_Metrics) do
  if f_Metrics[l_Index].EQ(aSocket) then
  begin
   Result := @f_Metrics[l_Index];
   Exit;
  end;//f_Metrics[l_Index].EQ(aSocket)
 SetLength(f_Metrics, Succ(Length(f_Metrics)));
 f_Metrics[High(f_Metrics)] := TtestSocketMetric.Create(f_TestName, aSocket);
 Result := @f_Metrics[High(f_Metrics)];
end;

class function TtestEngine.StartTest(const aTestName: String): TtestInstance;
 {* - Начинает тест (эксперимент)}
begin
 Result := TtestInstance.Create(aTestName);
end;

class procedure TtestEngine.StopTest;
 {* - Завершает текущий эксперимент }
begin
 Assert(g_CurrentTest <> nil, 'Что-то пошло не так. Нет текущего эксперимента');
 FreeAndNil(g_CurrentTest);
end;

class function TtestEngine.CurrentTest: TtestInstance;
 {* - Текущий проводимый эксперимент}
begin
 Result := g_CurrentTest;
end;
{$EndIf  NoTesting}

end.
