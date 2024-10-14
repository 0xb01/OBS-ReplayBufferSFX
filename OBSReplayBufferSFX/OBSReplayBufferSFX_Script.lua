-- required calls
local obs = obslua
local ffi = require("ffi")
local winmm = ffi.load("Winmm")
local bit = require("bit")
-- define audios
AUDIO_FILE_SAVE = script_path() .. "replay_saved.wav"
AUDIO_FILE_START = script_path() .. "replay_start.wav"
AUDIO_FILE_STOP = script_path() .. "replay_stopped.wav"
AUDIO_FILE_ERROR = script_path() .. "replay_error.wav"
AUDIO_VOLUME = 0.6 -- set between 0.0 to 1.0
-- call PlaySound
ffi.cdef[[
    bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound);
    int waveOutSetVolume(void *hwo, uint32_t dwVolume);
]]
-- set the volume of the audio output
function set_volume(volume)
    local left = math.floor(volume * 0xFFFF)
    local right = left
    local combined = bit.bor(bit.lshift(right, 16), left)
    winmm.waveOutSetVolume(nil, combined)
end
-- set the volume of the audio output
function playsound(filepath)
    set_volume(AUDIO_VOLUME)
    winmm.PlaySound(filepath, nil, 0x00020000)
end
-- handle OBS frontend events
function on_event(event)
    if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
        -- save replay
        playsound(AUDIO_FILE_SAVE)
    elseif event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STARTING then
        -- startup replay buffer
        playsound(AUDIO_FILE_START)
    elseif event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STOPPING then
        -- stopped replay buffer
        playsound(AUDIO_FILE_STOP)
    elseif event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_ERROR then
        -- error on replay buffer
        playsound(AUDIO_FILE_ERROR)
    end
end
-- load the script and add event callback
function script_load(settings)
    obs.obs_frontend_add_event_callback(on_event)
end
