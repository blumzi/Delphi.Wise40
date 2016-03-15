unit WiseMM;

interface
Type
  EventType =(
    SndFailure=0, SndEndExpose=1, SndEndObsCycle=2, SndEndObsSeq=3,
    SndSockConnect=4, SndSockDisconnect=5

  );



 procedure SoundAlert(Event: EventType);

implementation
  uses
  MMSystem, Types;

procedure SoundAlert(Event: EventType);
begin
   case Event of
      SndFailure : PlaySound('PromptSnd', HInstance, snd_ASync or snd_Memory or snd_Resource);
      SndSockDisconnect : PlaySound('NotifySnd', HInstance, snd_ASync or snd_Memory or snd_Resource);
      SndSockConnect    : PlaySound('SockSnd', HInstance, snd_ASync or snd_Memory or snd_Resource);
      SndEndExpose      : PlaySound(PCHAR('c:\camera.wav'), HInstance, snd_ASync);
      SndEndObsCycle    : PlaySound('ReminderSnd', HInstance, snd_ASync or snd_Memory or snd_Resource);

   end;
end;
//

//As default for endimage, take: Common Files\Symantec Shared\NIMClick


(*
function GetWaveVolume(var LVol: DWORD; var RVol: DWORD): Boolean;
var 
  WaveOutCaps: TWAVEOUTCAPS; 
  Volume: DWORD; 
begin 
  Result := False; 
  if WaveOutGetDevCaps(WAVE_MAPPER, @WaveOutCaps, SizeOf(WaveOutCaps)) = MMSYSERR_NOERROR then 
    if WaveOutCaps.dwSupport and WAVECAPS_VOLUME = WAVECAPS_VOLUME then 
    begin
      Result := WaveOutGetVolume(WAVE_MAPPER, @Volume) = MMSYSERR_NOERROR;
      LVol   := LoWord(Volume);
      RVol   := HiWord(Volume);
    end; 
end; 


{ 
  The waveOutGetDevCaps function retrieves the capabilities of
  a given waveform-audio output device. 

  The waveOutGetVolume function retrieves the current volume level 
  of the specified waveform-audio output device. 
}


function SetWaveVolume(const AVolume: DWORD): Boolean; 
var 
  WaveOutCaps: TWAVEOUTCAPS; 
begin
  Result := False; 
  if WaveOutGetDevCaps(WAVE_MAPPER, @WaveOutCaps, SizeOf(WaveOutCaps)) = MMSYSERR_NOERROR then 
    if WaveOutCaps.dwSupport and WAVECAPS_VOLUME = WAVECAPS_VOLUME then 
      Result := WaveOutSetVolume(WAVE_MAPPER, AVolume) = MMSYSERR_NOERROR; 
end; 

{ 
  AVolume: 
  The low-order word contains the left-channel volume setting, 
  and the high-order word contains the right-channel setting. 
  A value of 65535 represents full volume, and a value of 0000 is silence. 
  If a device does not support both left and right volume control, 
  the low-order word of dwVolume specifies the volume level, 
  and the high-order word is ignored. 
}


{ *** How to Use: ***} 

// SetWaveVolume:

procedure TForm1.Button1Click(Sender: TObject);
var
  LVol: Word;
  RVol: Word;
begin
  LVol := SpinEdit1.Value;  // max. is 65535
  RVol := SpinEdit2.Value;  // max. is 65535
  SetWaveVolume(MakeLong(LVol, RVol));
end;


// GetWaveVolume:

procedure TForm1.Button2Click(Sender: TObject);
var
  LVol: DWORD;
  RVol: DWORD;
begin
  if GetWaveVolume(LVol, RVol) then
  begin
    SpinEdit1.Value := LVol;
    SpinEdit2.Value := RVol;
  end;
end





 //        PlaySound('PromptSnd', HInstance, snd_ASync or snd_Memory or snd_Resource);
*)
end.
