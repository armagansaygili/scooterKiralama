object kDuzenleForm: TkDuzenleForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Kredi Kart'#305' D'#252'zenle'
  ClientHeight = 342
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 81
    Top = 17
    Width = 64
    Height = 13
    Caption = 'Kart Sahibi:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 366
    Top = 17
    Width = 83
    Height = 13
    Caption = 'Kart Numaras'#305':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 366
    Top = 65
    Width = 24
    Height = 13
    Caption = 'CVV:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 81
    Top = 65
    Width = 55
    Height = 13
    Caption = 'Kart '#304'smi:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 455
    Top = 101
    Width = 130
    Height = 25
    Caption = 'G'#220'NCELLE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 81
    Top = 156
    Width = 505
    Height = 158
    BiDiMode = bdLeftToRight
    Ctl3D = True
    DataSource = DataSource1
    DragCursor = crDefault
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Orientation = 1
    TitleFont.Style = [fsBold]
    Touch.ParentTabletOptions = False
    Touch.TabletOptions = [toPressAndHold]
    Columns = <
      item
        Expanded = False
        FieldName = 'kk_isim'
        Title.Caption = 'Kart '#304'smi'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kk_ad_sad'
        Title.Alignment = taCenter
        Title.Caption = 'Ad-Soyad'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kk_numara'
        Title.Alignment = taCenter
        Title.Caption = 'Kart Numaras'#305
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kk_cvv'
        Title.Alignment = taCenter
        Title.Caption = 'CVV'
        Width = 92
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 151
    Top = 14
    Width = 130
    Height = 21
    DataField = 'kk_ad_sad'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 455
    Top = 14
    Width = 130
    Height = 21
    DataField = 'kk_numara'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 455
    Top = 62
    Width = 130
    Height = 21
    DataField = 'kk_cvv'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 151
    Top = 62
    Width = 130
    Height = 21
    DataField = 'kk_isim'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 336
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 'C:\Users\armsa\Desktop\scooterKiralama\veritabani.mdb'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 336
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select kk_ad_sad, kk_numara, kk_cvv,kk_isim from kredi_karti')
    Left = 144
    Top = 336
    object ADOQuery1kk_ad_sad: TWideStringField
      FieldName = 'kk_ad_sad'
      Size = 255
    end
    object ADOQuery1kk_numara: TWideStringField
      FieldName = 'kk_numara'
      Size = 16
    end
    object ADOQuery1kk_cvv: TWideStringField
      FieldName = 'kk_cvv'
      Size = 3
    end
    object ADOQuery1kk_isim: TWideStringField
      FieldName = 'kk_isim'
      Size = 50
    end
  end
end
