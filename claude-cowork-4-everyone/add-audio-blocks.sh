#!/bin/bash
# Add audio blocks to sections 6-11 in both EN and ES HTML

# Function to add audio block after a section
add_audio_en() {
    local section_id="$1"
    local audio_file="$2"
    local label="$3"
    
    # Find the closing </section> tag for this section and insert audio block before it
    sed -i "/<section class=\"section reveal\" id=\"$section_id\">/,/<\/section>/ {
        /<\/section>/ i\\
  <div class=\"audio-block\">\\
    <div class=\"audio-block-header\">\\
      <span class=\"audio-block-icon\">🎧</span>\\
      <span class=\"audio-block-label\">$label</span>\\
    </div>\\
    <audio controls preload=\"metadata\" src=\"$audio_file\"></audio>\\
  </div>
    }" index.html
}

add_audio_es() {
    local section_id="$1"
    local audio_file="$2"
    local label="$3"
    
    sed -i "/<section class=\"section reveal\" id=\"$section_id\">/,/<\/section>/ {
        /<\/section>/ i\\
  <div class=\"audio-block\">\\
    <div class=\"audio-block-header\">\\
      <span class=\"audio-block-icon\">🎧</span>\\
      <span class=\"audio-block-label\">$label</span>\\
    </div>\\
    <audio controls preload=\"metadata\" src=\"$audio_file\"></audio>\\
  </div>
    }" es/index.html
}

# Add English audio blocks
add_audio_en "memory" "audio-06-memory.mp3" "Listen: How Your Assistant Remembers"
add_audio_en "talking" "audio-07-talking.mp3" "Listen: Talking to Your Assistant"
add_audio_en "connectors" "audio-08-connectors.mp3" "Listen: Connecting Your Tools"
add_audio_en "verify" "audio-09-verify.mp3" "Listen: Trust, but Verify"
add_audio_en "cant" "audio-10-cant-do.mp3" "Listen: What It Can't Do"
add_audio_en "habit" "audio-11-habit.mp3" "Listen: Building the Habit"

# Add Spanish audio blocks
add_audio_es "memory" "../audio-06-es.mp3" "Escucha: Cómo Recuerda Tu Asistente"
add_audio_es "talking" "../audio-07-es.mp3" "Escucha: Hablando con Tu Asistente"
add_audio_es "connectors" "../audio-08-es.mp3" "Escucha: Conectando Tus Herramientas"
add_audio_es "verify" "../audio-09-es.mp3" "Escucha: Confía, pero Verifica"
add_audio_es "cant" "../audio-10-es.mp3" "Escucha: Lo Que No Puede Hacer"
add_audio_es "habit" "../audio-11-es.mp3" "Escucha: Construyendo el Hábito"

echo "✅ Audio blocks added to both EN and ES"
