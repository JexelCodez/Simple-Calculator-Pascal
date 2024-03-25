unit unitCalculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button0: TButton;
    ButtonEqual: TButton;
    ButtonDivide: TButton;
    ButtonMultiply: TButton;
    ButtonSubtract: TButton;
    ButtonAdd: TButton;
    ButtonClear: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    EditDisplay: TEdit;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
    procedure ButtonEqualClick(Sender: TObject);
    procedure ButtonMultiplyClick(Sender: TObject);
    procedure ButtonSubtractClick(Sender: TObject);
    procedure NumberButtonClick(Sender: TObject);
  private
    FFirstNumber: Double;
    FSecondNumber: Double;
    FOperator: Char;
    FClearDisplay: Boolean;
    procedure AppendNumber(Number: Integer);
    procedure ApplyOperator;
    procedure ClearDisplay;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.AppendNumber(Number: Integer);
begin
  if FClearDisplay then
  begin
    EditDisplay.Text := IntToStr(Number);
    FClearDisplay := False;
  end
  else
    EditDisplay.Text := EditDisplay.Text + IntToStr(Number);
end;

procedure TForm1.ApplyOperator;
begin
  FFirstNumber := StrToFloat(EditDisplay.Text);
  FClearDisplay := True;
end;

procedure TForm1.ClearDisplay;
begin
  EditDisplay.Clear;
  FClearDisplay := True;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  ClearDisplay;
end;

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  ApplyOperator;
  FOperator := '+';
end;

procedure TForm1.ButtonSubtractClick(Sender: TObject);
begin
  ApplyOperator;
  FOperator := '-';
end;

procedure TForm1.ButtonMultiplyClick(Sender: TObject);
begin
  ApplyOperator;
  FOperator := '*';
end;

procedure TForm1.ButtonDivideClick(Sender: TObject);
begin
  ApplyOperator;
  FOperator := '/';
end;

procedure TForm1.ButtonEqualClick(Sender: TObject);
begin
  if not FClearDisplay then
  begin
    FSecondNumber := StrToFloat(EditDisplay.Text);
    case FOperator of
      '+': EditDisplay.Text := FloatToStr(FFirstNumber + FSecondNumber);
      '-': EditDisplay.Text := FloatToStr(FFirstNumber - FSecondNumber);
      '*': EditDisplay.Text := FloatToStr(FFirstNumber * FSecondNumber);
      '/':
        if FSecondNumber <> 0 then
          EditDisplay.Text := FloatToStr(FFirstNumber / FSecondNumber)
        else
          EditDisplay.Text := 'Error: Division by zero';
    end;
    FClearDisplay := True;
  end;
end;

procedure TForm1.NumberButtonClick(Sender: TObject);
begin
  if Length(EditDisplay.Text) < 10 then // Limit the number of digits displayed
    AppendNumber(StrToInt(TButton(Sender).Caption));
end;

end.

