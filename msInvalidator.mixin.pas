{$IfNDef TmsInvalidator_intf}

// interface

{$Define TmsInvalidator_intf}

// uses
 msDiagramm

{$Else TmsInvalidator_intf}

{$IfNDef TmsMixIn_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 TmsInvalidator = class abstract(TmsInvalidatorParent, ImsInvalidator)
 protected
  procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  procedure DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
 protected
  procedure DoInvalidateDiagramm(const aDiagramm: ImsDiagramm); virtual; abstract;
  procedure DoDiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm); virtual; abstract;
  procedure InstanceAllocated; override;
  procedure InstanceWillBeDestroyed; override;
 end;//TmsInvalidator

{$Define TmsMixIn_intf}

{$Else TmsMixIn_intf}

// implementation

{$IfNDef TmsInvalidator_impl}

// uses
 msInvalidators

{$Define TmsInvalidator_impl}

{$Else TmsInvalidator_impl}

// TmsInvalidator

procedure TmsInvalidator.InvalidateDiagramm(const aDiagramm: ImsDiagramm);
begin
 DoInvalidateDiagramm(aDiagramm);
end;

procedure TmsInvalidator.DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
begin
 DoDiagrammAdded(aDiagramms, aDiagramm);
end;

procedure TmsInvalidator.InstanceAllocated;
begin
 inherited;
 TmsInvalidators.Subscribe(Self);
end;

procedure TmsInvalidator.InstanceWillBeDestroyed;
begin
 TmsInvalidators.UnSubscribe(Self);
 inherited;
end;

{$EndIf TmsInvalidator_impl}

{$EndIf TmsMixIn_intf}
{$EndIf TmsInvalidator_intf}
