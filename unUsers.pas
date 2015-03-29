unit unUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfmUsers = class(TForm)
    edUser: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    cbLevel: TComboBox;
    lbName: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUsers: TfmUsers;

implementation

{$R *.dfm}

end.
