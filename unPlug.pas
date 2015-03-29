unit unPlug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

const
  //тип внесение билетов в автомат
  ftPlug = 0;
  //тип изменение счетчика
  ftCounter = 1;
  //тип внесение выручки в базу
  ftTake = 2;

type
  TfmPlug = class(TForm)
    lbAutoName: TLabel;
    edPlug: TLabeledEdit;
    btnOK: TButton;
    btnCancel: TButton;
    dtDate: TDateTimePicker;
    lbDate: TLabel;
    lbComment: TLabel;
    mmComment: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fmType: integer;
  end;


var
  fmPlug: TfmPlug;


implementation

{$R *.dfm}

procedure TfmPlug.FormShow(Sender: TObject);
begin
dtDate.Date := Date;
mmComment.Text := '';
case fmType of
  0:begin
    Caption := 'Приход';
    edPlug.EditLabel.Caption := 'Приход';
    Color := clBtnFace;
    end;
  1:begin
    Caption := 'Показания счетчика';
    edPlug.EditLabel.Caption := 'Счетчик';
    Color := clBtnShadow;
    end;
  2:begin
    Caption := 'Выручка';
    edPlug.EditLabel.Caption := 'Выручка';
    Color := clBtnFace;
    end;
  end;
end;


end.
