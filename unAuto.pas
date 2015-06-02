unit unAuto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmAuto = class(TForm)
    edAuto_name: TLabeledEdit;
    mmComment: TMemo;
    dtDate: TDateTimePicker;
    lbDate: TLabel;
    lbComment: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    edCounter: TEdit;
    lbCounter: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fmType_add: boolean;
  end;

var
  fmAuto: TfmAuto;

implementation

{$R *.dfm}

procedure TfmAuto.FormShow(Sender: TObject);
begin
if fmType_add then
  begin
  dtDate.DateTime := Date;
  Caption := 'Создание нового автомата';
  edCounter.Enabled := True;
  dtDate.Enabled := True;
  edAuto_name.Text := '';
  edCounter.Text := '';
  mmComment.Clear;
  end
    else
      begin
      Caption := 'Редактирование автомата';
      edCounter.Enabled := False;
      dtDate.Enabled := False;
      end;
end;

end.
