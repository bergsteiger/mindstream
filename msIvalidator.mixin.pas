{$IfNDef TmsIvalidator_intf}

// interface

{$Define TmsIvalidator_intf}

// uses
 msDiagramm

{$Else TmsIvalidator_intf}

{$IfNDef TmsMixIn_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 TmsIvalidator = class abstract(TmsIvalidatorParent, ImsIvalidator)
 protected
  procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm);
 protected
  procedure DoInvalidateDiagramm(const aDiagramm: ImsDiagramm); virtual; abstract;
  procedure DoDiagrammAdded(const aDiagramm: ImsDiagramm); virtual; abstract;
 public
  class function NewInstance: TObject; override;
  destructor Destroy; override;
 end;//TmsIvalidator

{$Define TmsMixIn_intf}

{$Else TmsMixIn_intf}

// implementation

{$IfNDef TmsIvalidator_impl}

// uses
 msInvalidators

{$Define TmsIvalidator_impl}

{$Else TmsIvalidator_impl}

// TmsIvalidator

procedure TmsIvalidator.InvalidateDiagramm(const aDiagramm: ImsDiagramm);
begin
 DoInvalidateDiagramm(aDiagramm);
end;

procedure TmsIvalidator.DiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 DoDiagrammAdded(aDiagramm);
end;

class function TmsIvalidator.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsInvalidators.Subscribe(TmsIvalidator(Result));
end;

destructor TmsIvalidator.Destroy;
begin
 TmsInvalidators.UnSubscribe(Self);
 inherited;
end;

{$EndIf TmsIvalidator_impl}

{$EndIf TmsMixIn_intf}
{$EndIf TmsIvalidator_intf}
