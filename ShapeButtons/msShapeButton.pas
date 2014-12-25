unit msShapeButton;

interface

uses
 msShape,
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
 System.Types,
 msInterfaces,
 System.Classes
 ;

type TmsShapeButton = class(TButton)
private
 f_Shape: ImsShape;
protected
 procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
public
 constructor Create(AOwner: TComponent; aShape: ImsShape);
end;

 TmsShapeCustomButton = class(TButton)
  constructor Create(AOwner: TComponent); override;
 end;

implementation

{ TmsShapeButton }
constructor TmsShapeButton.Create(AOwner: TComponent; aShape: ImsShape);
begin
 inherited Create(AOwner);

 f_Shape := aShape;
 OnPaint := MyPaint;
end;

procedure TmsShapeButton.MyPaint(Sender: TObject;
                               Canvas: TCanvas;
                               const ARect: TRectF);
begin
 f_Shape.DrawTo(TmsDrawContext.Create(Canvas));
end;

{ TmsShapeCustomButton }

constructor TmsShapeCustomButton.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
