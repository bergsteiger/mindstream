{$IfNDef TmsIvalidator_intf}

// interface

{$Define TmsIvalidator_intf}

// uses
 msDiagramm

{$Else TmsIvalidator_intf}

{$IfNDef TmsMixIn_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 TmsIvalidator = class(TmsIvalidatorParent, ImsIvalidator)
 private
  procedure InvalidateDiagramm(aDiagramm: TmsDiagramm);
 protected
  procedure DoInvalidateDiagramm(aDiagramm: TmsDiagramm); virtual; abstract;
 public
  procedure AfterConstruction; override;
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

procedure TmsIvalidator.InvalidateDiagramm(aDiagramm: TmsDiagramm);
begin
 DoInvalidateDiagramm(aDiagramm);
end;

procedure TmsIvalidator.AfterConstruction;
begin
 TmsInvalidators.Subscribe(Self);
 inherited;
end;

destructor TmsIvalidator.Destroy;
begin
 TmsInvalidators.UnSubscribe(Self);
 inherited;
end;

{$EndIf TmsIvalidator_impl}

{$EndIf TmsMixIn_intf}
{$EndIf TmsIvalidator_intf}
