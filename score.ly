\version "2.22.0"

trumpetMusic = \relative c' {
  \clef treble
  \key d \minor
  \time 3/4

  r2. | r2. |
  r2. | r2. |

  % Drums in
  r2. | r2. |
  r2. | r2 r16 c d e |

  % Trumpet in
  f e d g f e g8 f e16 c |

  d8 e16 f8 d16 e8 f a16 g | % 10

  a f'16 e a, e' a, d a c g bes f | % 11

  e f g c,8.~2 % 12
}

organMusic = \relative c' {
  \clef treble
  \key d \minor
  \time 3/4

  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |
  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |

  % Drums in
  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |
  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |

  % Trumpet in
  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |
  <a d f>2. | <c e g>2. | <bes d f>2. | <c e g>2. |
}

bassMusic = \relative c {
  \clef bass
  \key d \minor
  \time 3/4

  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |

  % Drums in
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |

  % Trumpet in
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
  d,8 d'8 d,16 d'16 d,16 d'16 r16 d,16 c'8 |
}

% The actual music
beatMusic = \drummode {
  \time 3/4

  r2. | r2. |
  r2. | r4 r8 r16 sn16 sn sn sn sn | % Drumroll

  % Drums in
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |

  % Trumpet in
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |
  bd8 sn bd sn bd16 bd sn8 |
}

% Utility functions
showBarNums = \override Score.BarNumber.break-visibility = ##(#t #t #t)

% Score
\score {
  <<
    % Trumpet
    \new Staff \with { 
      instrumentName = "Trumpet" 
      midiInstrument = "trumpet"
      midiMinimumVolume = #1
      midiMaximumVolume = #2
    } {
      \showBarNums
      \trumpetMusic
    }

    % Organ
    \new Staff \with { 
      instrumentName = "Organ" 
      midiInstrument = "rock organ"
    } {
      \organMusic
    }

    % Bass
    \new Staff \with { 
      instrumentName = "Bass" 
      midiInstrument = "slap bass 2"
    } {
      \bassMusic
    }

    % Beat
    \new DrumStaff \with { 
      instrumentName = "Beat" 
    } {
      \beatMusic
    }
  >>

  \layout { }

  \midi {
    \tempo 4 = 128
  }
}
