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
                      const aMCShape: MCmsShape;
                      const aHolder: ImsDiagrammsHolder;
                      const aShape: ImsShape);
 end;

implementation

uses
 msPaletteShapeCreator
 ;
{ TmsToolBarShapeButton }

constructor TmsScrollBarShapeButton.Create(AOwner: TComponent;
                                         const aMCShape: MCmsShape;
                                         const aHolder: ImsDiagrammsHolder;
                                         const aShape: ImsShape);
begin
 inherited Create(AOwner, aMCShape, aHolder);

 f_Shape := aShape;
 // Пока так
 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;

 //
end;

procedure TmsScrollBarShapeButton.MyClick(Sender: TObject);
begin
  inherited;

end;

end.
