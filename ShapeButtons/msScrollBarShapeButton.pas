unit msScrollBarShapeButton;

interface

uses
 FMX.ListBox,
 System.Types,
 System.Classes,
 msShape,
 msInterfaces,
 msShapeButtonPrim
 ;

type
 TmsToolBarShapeButton = class(TmsShapeButtonPrim)
  protected
   procedure MyClick(Sender: TObject); override;
  public
   constructor Create(AOwner: TComponent;
                      const aShape: MCmsShape;
                      const aHolder: ImsDiagrammsHolder);
 end;

implementation

{ TmsToolBarShapeButton }

constructor TmsToolBarShapeButton.Create(AOwner: TComponent;
  const aShape: MCmsShape; const aHolder: ImsDiagrammsHolder);
begin

end;

procedure TmsToolBarShapeButton.MyClick(Sender: TObject);
begin
  inherited;

end;

end.
