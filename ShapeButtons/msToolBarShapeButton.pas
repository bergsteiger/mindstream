unit msToolBarShapeButton;

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
  private
   f_Shapes: TComboBox;
  protected
   procedure MyClick(Sender: TObject); override;
  public
   constructor Create(AOwner: TComponent;
                      const aShape: MCmsShape;
                      aShapes: TComboBox;
                      aColumn: Integer;
                      aRow: Integer;
                      const aHolder: ImsDiagrammsHolder);
 end;

implementation

uses
 msPaletteShapeCreator
 ;

// TmsShapeButton

constructor TmsToolBarShapeButton.Create(AOwner: TComponent;
                                  const aShape: MCmsShape;
                                  aShapes: TComboBox;
                                  aColumn: Integer;
                                  aRow: Integer;
                                  const aHolder: ImsDiagrammsHolder);
begin
 Assert(aShapes <> nil);
 inherited Create(AOwner, aShape, aHolder);

 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;

 f_Shapes := aShapes;

 Self.Position.X := aColumn * TmsPaletteShapeCreator.ButtonSize;
 Self.Position.Y := aRow * TmsPaletteShapeCreator.ButtonSize;
end;

procedure TmsToolBarShapeButton.MyClick(Sender: TObject);
begin
 if not f_Shape.NullClick(ImsDiagrammsHolder(f_Holder)) then
  f_Shapes.ItemIndex := f_Shapes.Items.IndexOf(f_ShapeClass.Name);
end;

end.
