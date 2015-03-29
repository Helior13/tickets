unit unPlug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

const
  //��� �������� ������� � �������
  ftPlug = 0;
  //��� ��������� ��������
  ftCounter = 1;
  //��� �������� ������� � ����
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
    Caption := '������';
    edPlug.EditLabel.Caption := '������';
    Color := clBtnFace;
    end;
  1:begin
    Caption := '��������� ��������';
    edPlug.EditLabel.Caption := '�������';
    Color := clBtnShadow;
    end;
  2:begin
    Caption := '�������';
    edPlug.EditLabel.Caption := '�������';
    Color := clBtnFace;
    end;
  end;
end;


end.
