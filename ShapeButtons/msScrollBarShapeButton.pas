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
 TmsScrollBarShapeButton= class(TmsShapeButtonPrim)
  protected
   procedure MyClick(Sender: TObject); override;
  public
   constructor Create(AOwner: TComponent;
                      const aShape: MCmsShape;
                      const aHolder: ImsDiagrammsHolder);
 end;

implementation

uses
 msPaletteShapeCreator
 ;
{ TmsToolBarShapeButton }

constructor TmsScrollBarShapeButton.Create(AOwner: TComponent;
                                         const aShape: MCmsShape;
                                         const aHolder: ImsDiagrammsHolder);
begin
 inherited Create(AOwner, aShape, aHolder);

 // Пока так
 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;
end;

procedure TmsScrollBarShapeButton.MyClick(Sender: TObject);
begin
  inherited;

end;

end.
