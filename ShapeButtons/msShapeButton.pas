unit msShapeButton;

interface

uses
 msShape,
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
 System.Types,
 msInterfaces
 ;

type TmsShapeButton = class(TButton)
private
 f_Shape: ImsShape;
protected
 procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
public
 constructor Create(aShape: ImsShape);
end;

implementation

{ TmsShapeButton }
constructor TmsShapeButton.Create(aShape: ImsShape);
begin
 f_Shape := aShape;

 inherited

 OnPaint := MyPaint;
end;

procedure TmsShapeButton.MyPaint(Sender: TObject;
                               Canvas: TCanvas;
                               const ARect: TRectF);
begin
 f_Shape.DrawTo(TmsDrawContext.Create(Canvas));
end;

end.
