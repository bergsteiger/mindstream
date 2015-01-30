unit msToolBarShapeButton;

interface

uses
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
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
 System.Math.Vectors,
 FMX.Dialogs,
 System.SysUtils,
 msPaletteShapeCreator,
 msShapesForToolbar,
 Math,
 System.UITypes,
 FMX.Types
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
 Assert(aShape <> nil);
 Assert(aHolder <> nil);
 inherited Create(AOwner);
 f_Holder := aHolder;

 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;

 f_ShapeClass := aShape;
 f_Shape := TmsPaletteShapeCreator.Create(aShape).CreateShape
                                     (TmsMakeShapeContext.Create
                                      (TPointF.Create
                                       (0{TmsPaletteShapeCreator.ButtonSize / 2},
                                        0{TmsPaletteShapeCreator.ButtonSize / 2}),
                                        nil,
                                        nil)
                                      );
 f_Shapes := aShapes;
 OnPaint := MyPaint;
 OnClick := MyClick;

 Assert(f_Shape <> nil);

 Self.Position.X := aColumn * TmsPaletteShapeCreator.ButtonSize;
 Self.Position.Y := aRow * TmsPaletteShapeCreator.ButtonSize;

end;

procedure TmsToolBarShapeButton.MyClick(Sender: TObject);
begin
 if not f_Shape.NullClick(ImsDiagrammsHolder(f_Holder)) then
  f_Shapes.ItemIndex := f_Shapes.Items.IndexOf(f_ShapeClass.Name);
end;

end.
