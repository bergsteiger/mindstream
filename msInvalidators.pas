unit msInvalidators;

interface

uses
 Generics.Collections,
 msInterfaces
 ;

type
 TmsInvalidatorsList = TList<Pointer>;
 // - подписчики - ВСЕГДА - СЛАБЫЕ (https://ru.wikipedia.org/wiki/%D0%A1%D0%BB%D0%B0%D0%B1%D0%B0%D1%8F_%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B0) ссылки
 // https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D0%B1%D0%BB%D1%8E%D0%B4%D0%B0%D1%82%D0%B5%D0%BB%D1%8C_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
 (*
  Наблюдатель (англ. Observer) — поведенческий шаблон проектирования. Также известен как «подчинённые» (Dependents), «издатель-подписчик» (Publisher-Subscriber). Создает механизм у класса, который позволяет получать экземпляру объекта этого класса оповещения от других объектов об изменении их состояния, тем самым наблюдая за ними[2].
 *)

 TmsInvalidatorLambda = reference to procedure (const anItem: ImsIvalidator);

 TmsInvalidators = class
 strict private
  class var f_Subscribers : TmsInvalidatorsList;
 public
  class destructor Fini;
 private
  class procedure DoItems(aLambda: TmsInvalidatorLambda);
 public
  class procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  class procedure DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
  class procedure Subscribe(const anInvalidator: ImsIvalidator);
  // - подписываемся
  class procedure UnSubscribe(const anInvalidator: ImsIvalidator);
  // - отписываемся
 end;//TmsInvalidators

implementation

uses
 SysUtils
 ;

// TmsInvalidators

class destructor TmsInvalidators.Fini;
begin
 FreeAndNil(f_Subscribers);
end;

class procedure TmsInvalidators.DoItems(aLambda: TmsInvalidatorLambda);
var
 l_Subscriber : Pointer;
begin
 if (f_Subscribers <> nil) then
  for l_Subscriber in f_Subscribers do
   aLambda(ImsIvalidator(l_Subscriber));
end;

class procedure TmsInvalidators.InvalidateDiagramm(const aDiagramm: ImsDiagramm);
begin
 DoItems(
  procedure (const anItem: ImsIvalidator)
  begin
   anItem.InvalidateDiagramm(aDiagramm)
  end
 );
end;

class procedure TmsInvalidators.DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
begin
 DoItems(
  procedure (const anItem: ImsIvalidator)
  begin
   anItem.DiagrammAdded(aDiagramms, aDiagramm)
  end
 );
end;

class procedure TmsInvalidators.Subscribe(const anInvalidator: ImsIvalidator);
// - подписываемся
begin
 if (f_Subscribers = nil) then
  f_Subscribers := TmsInvalidatorsList.Create;
 if (f_Subscribers.IndexOf(Pointer(anInvalidator)) < 0) then
  f_Subscribers.Add(Pointer(anInvalidator));
end;

class procedure TmsInvalidators.UnSubscribe(const anInvalidator: ImsIvalidator);
// - отписываемся
begin
 if (f_Subscribers <> nil) then
  f_Subscribers.Remove(Pointer(anInvalidator));
end;

end.
