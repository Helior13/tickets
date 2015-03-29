program Tickets;

uses
  Vcl.Forms,
  unMain in 'unMain.pas' {fmMain},
  unDB in 'unDB.pas' {DM: TDataModule},
  unPlug in 'unPlug.pas' {fmPlug},
  unAuto in 'unAuto.pas' {fmAuto},
  unMD5 in 'unMD5.pas',
  unUsers in 'unUsers.pas' {fmUsers},
  PassWord in 'PassWord.pas' {PasswordDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := false;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TfmPlug, fmPlug);
  Application.CreateForm(TfmAuto, fmAuto);
  Application.CreateForm(TfmUsers, fmUsers);
  Application.Run;
end.
