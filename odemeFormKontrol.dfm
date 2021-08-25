object odemeKontrol: TodemeKontrol
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #214'deme'
  ClientHeight = 152
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 48
    Width = 379
    Height = 23
    Caption = #214'deme i'#351'lemine ge'#231'meyi onayl'#305'yor musunuz?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 115
    Width = 449
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      449
      37)
    object Button1: TButton
      Left = 281
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #214'deme'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 368
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #304'ptal'
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
