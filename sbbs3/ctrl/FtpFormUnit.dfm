object FtpForm: TFtpForm
  Left = 322
  Top = 143
  Width = 350
  Height = 150
  Caption = 'FTP Server'
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 342
    Height = 25
    Caption = 'ToolBar'
    EdgeBorders = []
    EdgeInner = esLowered
    Flat = True
    Images = MainForm.ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object StartButton: TToolButton
      Left = 0
      Top = 0
      Action = MainForm.FtpStart
    end
    object StopButton: TToolButton
      Left = 23
      Top = 0
      Action = MainForm.FtpStop
    end
    object ToolButton1: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ConfigureButton: TToolButton
      Left = 54
      Top = 0
      Action = MainForm.FtpConfigure
    end
    object ToolButton2: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object Status: TStaticText
      Left = 85
      Top = 0
      Width = 150
      Height = 22
      Hint = 'FTP Server Status'
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Status'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolButton3: TToolButton
      Left = 235
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ProgressBar: TProgressBar
      Left = 243
      Top = 0
      Width = 75
      Height = 22
      Hint = 'FTP Server Utilization'
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 1
    end
  end
  object Log: TMemo
    Left = 0
    Top = 25
    Width = 342
    Height = 98
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
